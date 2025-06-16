<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Company extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('company_model');
        
    }

    public function index(){
        $company_data = $this->company_model->getCompanies();
        $render_arr['data'] = $company_data;
        $render_arr['no_data_message'] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No company data found..!</div>';
        $render_arr['role'] = $this->session->userdata('role');
        $this->smarty->view("companies.tpl",$render_arr);
    }

    public function add($mode= '',$id = ''){
        $params = $this->input->post_get(null,true);
        $bank_data = [];
        $company_data = [];
        $mode = 'Add';
        
        if(isset($params['id']) && $params['id'] > 0){
            $id = $params['id'];
            $company_data = $this->company_model->getCompanydetails($id);
            $company_data = $company_data[0];
            $bank_data = $this->company_model->getBankData($id);
            $company_data['log_url'] = $this->config->item('base_url').$this->config->item('company_logo_path');
            $mode = 'Update';
        }
        $render_arr["back_url"] = "company.html";
        $render_arr['mode'] = $mode;
        $render_arr['company_data'] = $company_data;
        $render_arr['bank_data'] = $bank_data;
        $render_arr["country"] = $this->company_model->get_country();
        $render_arr["state"] = $this->company_model->get_state();
        $render_arr['index'] = 0;
        $render_arr['default_company'] = $this->config->item("default_company");
        // pr($render_arr,1);
        $this->smarty->view("add_company.tpl",$render_arr);
    }

    public function getAddress(){
        $parms = $this->input->get_post(null,true);
        $data['index'] =$parms['index'];
        $data['bank_data']  = [];
        $add_html = $this->smarty->fetch('address.tpl',$data);
        $render_arr['html'] = $add_html;
        echo json_encode($render_arr);
    }
    // below fucntion is used to insert the data in companies
    public function addAction(){
        try {
            $post_data = $this->input->get_post(null,true); 
            if(!is_valid_array($post_data)){
                return 0;
            }
            //Email validation stars.
            $company_id = array_key_exists('company_id',$post_data) ? $post_data['company_id'] : ''; 
            $email_count = $this->company_model->getEmailCount($post_data['company_email'],$company_id);
            // if($email_count > 0){
            //     throw new Exception('Email already Exits.');
            // }
            // Email validation ends.
            if(is_valid_array($_FILES) && $_FILES['company_logo']['name'] != ''){
                $upload_data = $this->uplaodFile();
                if(array_key_exists('errors',$upload_data) && $upload_data['errors']  == 1){
                    $render_arr['message'] = 'File extention is not supported';
                    $render_arr['success'] = 0;
                    echo json_encode($render_arr);
                    return 0;
                }
            }  
            
            $mode = $post_data['mode'];
            if($mode == 'Add'){
                $company_insert_arr = [];
                $company_insert_arr = array(
                'company_name' => $post_data['company_name'],
                'company_code' =>  $post_data['company_code'],
                'company_email' =>  $post_data['company_email'],
                'company_logo' =>  is_valid_array($_FILES) ? $upload_data['file_name']: '',
                'company_address' =>  $post_data['address'],
                'contact_number_code' => $post_data['phone_code'],
                'city' =>  $post_data['city'],
                'state' =>  $post_data['state'],
                'country' =>  $post_data['country'],
                'zip_code' =>  $post_data['zipcode'],
                'website' =>  $post_data['website'],
                'date_founded' =>  mysqlFormat($post_data['founding_date']),
                'description' =>  $post_data['description'],
                'pan_number' =>  $post_data['pan_number'],
                'contact_number' =>  $post_data['contact_number'],
                'contact_person' =>  $post_data['contact_person'],
                'gst_number' =>  $post_data['gst_number'],
                'tan_number' =>  $post_data['tan_number'],
                'added_by' => $this->session->userData('employee_id'),
                'added_on' => date("Y-m-d H:i:s")
    
            );
            // Company variable data insertion code starts here.
            $company_config['pin'] = $post_data['attendance_pin'];
            $company_config['prefix'] = $post_data['company_prefix'];
            $this->db->insert('companies',$company_insert_arr);
            $company_id = $this->db->insert_id();
            $this->prepareCompanyConfig($company_config,$company_id);
            $this->insertIntoBankMaster($post_data,$company_id);
            $render_arr['success'] = 1;
            $render_arr['message'] = 'Company added succesfully.';
            }
            else{
                $this->updateAction($post_data);
                $render_arr['success'] = 1;
                $render_arr['message'] = 'Company Updated succesfully.';
            }
            
            
        }
        catch (Exception $e){
            $render_arr['success'] = 0;
            $render_arr['message'] = $e->getMessage();
        }
        echo json_encode($render_arr);
    }

    public function insertIntoBankMaster($data = [],$company_id = 0){
        if(!is_valid_array($data) || $company_id == 0){
            return 0;
        }
        $insert_arr = [];
        foreach($data['bank_name'] as $key=>$val){
            $insert_arr[] = array(
                'bank_name' => $val,
                'branch_address' => $data['bank_address'][$key] ,
                'ifsc_code' => $data['ifsc_code'][$key] ,
                'account_type' => $data['acc_type'][$key], 
                'account_no' => $data['acc_numner'][$key] ,
                'account_holder_name' => $data['acc_holder'][$key], 
                'default_bank' => array_key_exists($key,$data['mark_as_default']) ? $data['mark_as_default'][$key]:'No', 
                'entity_type' => 'Company' ,
                'entity_id' => $company_id,
                'added_by' => $this->session->userData('employee_id'),
                'added_on' => date("Y-m-d H:i:s"),
                'status' => 'Active'
            );
        }
        if(is_valid_array($insert_arr)){
            $this->db->insert_batch("bank_master", $insert_arr);
        }
    }

    public function uplaodFile(){
        $profileImageData =
            $_FILES["company_logo"]["name"] != ""
                ? $_FILES["company_logo"]
                : [];
        $config["upload_path"] = "public/img/uploads/company_logo/";
        $config["allowed_types"] = "gif|jpg|jpeg|png";
        $this->load->library("upload", $config);
        $upload_data = [];
        $upload_error = 0;
        $upload_error_msg = "";
        if (!empty($profileImageData)) {
            if (!$this->upload->do_upload("company_logo")) {
                $upload_error_msg = $error = [
                    "error" => $this->upload->display_errors(),
                ];
                $upload_error = 1;
                $upload_data['errors'] = $upload_error;
                $upload_data['msg'] = $upload_error_msg;
            } else {
                $upload_data = $this->upload->data();
            }
        }
        return $upload_data;
    }

    // below function is used to update the company details.
    public function updateAction($post_data = []){
        
        $company_update_arr  = $bank_insert_arr = $bank_update_arr = [];
        $company_id = $post_data['company_id'];
        $delete_ids = [];
        $company_insert_arr = array(
            'company_name' => $post_data['company_name'],
            'company_code' =>  $post_data['company_code'],
            'company_email' =>  $post_data['company_email'],
            'company_address' =>  $post_data['address'],
            'contact_number_code' => $post_data['phone_code'],
            'city' =>  $post_data['city'],
            'state' =>  $post_data['state'],
            'country' =>  $post_data['country'],
            'zip_code' =>  $post_data['zipcode'],
            'website' =>  $post_data['website'],
            'date_founded' =>  mysqlFormat($post_data['founding_date']),
            'description' =>  $post_data['description'],
            'pan_number' =>  $post_data['pan_number'],
            'contact_number' =>  $post_data['contact_number'],
            'contact_person' =>  $post_data['contact_person'],
            'gst_number' =>  $post_data['gst_number'],
            'tan_number' =>  $post_data['tan_number'],
            'added_by' => $this->session->userData('employee_id'),
            'added_on' => date("Y-m-d H:i:s")

        );
        if(is_valid_array($_FILES) &&  $_FILES['company_logo']['name']  != ''){
            $company_insert_arr['company_logo'] = $_FILES['company_logo']['name'] ;
        }
        $bank_ids  = $this->company_model->bankIds($company_id);
        foreach($bank_ids as $key => $val){
            if(!in_array($val,$post_data['bank_id'])){
                $delete_ids[] = $val;
            };
        }
        
        foreach($post_data['bank_name'] as $key=>$val){
            if(!array_key_exists($key,$post_data['bank_id'])){
                $bank_insert_arr[] = array(
                    'bank_name' => $val,
                    'branch_address' => $post_data['bank_address'][$key] ,
                    'ifsc_code' => $post_data['ifsc_code'][$key] ,
                    'account_type' => $post_data['acc_type'][$key], 
                    'account_no' => $post_data['acc_numner'][$key] ,
                    'account_holder_name' => $post_data['acc_holder'][$key], 
                    'default_bank' => array_key_exists($key,$post_data['mark_as_default']) ? $post_data['mark_as_default'][$key]:'No', 
                    'entity_type' => 'Company' ,
                    'entity_id' => $company_id,
                    'added_by' => $this->session->userData('employee_id'),
                    'added_on' => date("Y-m-d H:i:s"),
                    'status' => 'Active'
                );
            }else{
                $bank_update_arr[] = array(
                    'bank_name' => $val,
                    'branch_address' => $post_data['bank_address'][$key] ,
                    'ifsc_code' => $post_data['ifsc_code'][$key] ,
                    'account_type' => $post_data['acc_type'][$key], 
                    'account_no' => $post_data['acc_numner'][$key] ,
                    'account_holder_name' => $post_data['acc_holder'][$key], 
                    'default_bank' => array_key_exists($key,$post_data['mark_as_default']) ? $post_data['mark_as_default'][$key]:'No', 
                    'entity_type' => 'Company' ,
                    'entity_id' => $company_id,
                    'updated_by' => $this->session->userData('employee_id'),
                    'updated_on' => date("Y-m-d H:i:s"),
                    'status' => 'Active',
                    'id' => $post_data['bank_id'][$key]
                );
                
            }
        }
        $ret_arr['company_insert_arr'] = $company_insert_arr;
        $ret_arr['company_id'] = $company_id;
        $ret_arr['bank_insert_arr'] = $bank_insert_arr;
        $ret_arr['bank_update_arr'] = $bank_update_arr;
        $ret_arr['delete_ids'] = $delete_ids;
        $this->company_model->updateCompanyData($ret_arr);        
    }
    
    public function showViewPage(){
        $params = $this->input->post_get(null,true);
        $id = $params['id'];
        if($id == 0 || !is_numeric($id)){
            return 0;
        }
        $company_data = $this->company_model->getCompanydetailsView($id);
        $bank_data = $this->company_model->getBankData($id);
        if(!is_valid_array($bank_data) && !is_valid_array($company_data)){
            return 0;
        }
        $render_data['company_data'] = $company_data[0];
        $render_data['bank_data'] = $bank_data;
        $render_data['id'] = $id;
        $this->smarty->view('company_view.tpl',$render_data);
    }

    public function prepareCompanyConfig($company_config = [],$company_id =""){
        $default_config = $this->config->item('company_cofigs');
       
        foreach($default_config as $key => $config){
            $default_config[$key]['company_id'] = $company_id;
        }
        $default_config[] = array ('name'=>'attendance_pin','title'=>'Attendence pin','value' => $company_config['pin'],'description'=>'This use for set default attendance pin for employee','type'=>'input','company_id'=>$company_id);
        $default_config[] = array('name'=>'company_prefix','title'=>'Company prefix','value' => $company_config['prefix'],'description'=>'This is company prefix','type'=>'input','company_id'=>$company_id);
        $this->company_model->insertIntoCompanyConfig($default_config);
    }


}


