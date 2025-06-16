<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Master extends MY_controller
{
    function __construct()
    {

        parent::__construct();
        $this->load->model("master_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function department(){
    	$department = $this->master_model->get_department();
    	$data["department"] = $department;
        $data["no_data_message"] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No department data found..!</div>';
        $data["company_details"] = $this->master_model->get_companies();
        $data["selected_company"] = getCompanyId();
        $this->smarty->view("department.tpl", $data);
    }
    public function add_update_department(){
    	
        $post_data = $this->input->post();
        $success = 0;
        $message = "Some thing went wrong!";
        if($post_data['mode'] == "Add"){

            $inser_arr = ["departmen_name"=>$post_data['department_name'],"department_code"=>$post_data['department_code'],"company_id"=>$post_data["company_id"],"added_by"=>$_SESSION["employee_id"],"added_date"=>date("Y-m-d H:i:s")];
            $insert_id = $this->master_model->insert_department($inser_arr);
            if($insert_id > 0){
                $success = 1;
                $message = "Department added successfully.";
            }
        }else if($post_data['mode'] == "Update"){
            $update_arr = ["departmen_name"=>$post_data['department_name'],"updated_by"=>$_SESSION["employee_id"],"updated_date"=>date("Y-m-d H:i:s")];
            $afftected_row = $this->master_model->update_department($update_arr,$post_data['department_id']);
            if($afftected_row > 0){
                $success = 1;
                $message = "Department updated successfully.";
            }
            
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();        
    }
    public function check_department_code()
    {
        $department_code = $this->input->post("department_code");
        $company_id = $this->input->post("company_id");
        $valid = $this->master_model->check_department_code($department_code,$company_id);

        if ($valid == "Yes") {
            echo "false";
        } else {
            echo "true";
        }
        exit();
    }

    /* holiday and designation */
    public function designation()
    {
        $data["no_data_message"] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No designation data found..!</div>';
        $data["grads_data"] = [["id"=>"I","val"=>"I"],["id"=>"II","val"=>"II"],["id"=>"III","val"=>"III"]];
        $data["designation"] = $this->master_model->get_designation();
        $data["departmen"] = $this->master_model->get_department_list();
        // pr($data,1);
        $this->smarty->view("designation.tpl", $data);
    }

    public function get_designation_details()
    {
        $data["data"] = [];
        if (isset($_POST["edit"])) {
            $id = $this->input->post("edit");
            $designation_details = $this->master_model->get_designation_details(
                $id
            );
            $data["data"] = $designation_details[0];
        }
        echo json_encode($data);
        exit();
    }
    public function designation_action()
    {
        if (isset($_POST["id"])) {
            $id = $this->input->post("id");
        } else {
            $id = "";
        }
        
        
        if ($id == "") {
            $data = [
                "designation_name" => $this->input->post("designation_name"),
                "department_id"=>$this->input->post("department"),
                "grads" => $this->input->post("grads"),
                "created_by" => 0,
                "created_on" => date("Y-m-d H:i:s"),
            ];
        } else {
            $data = [
                "id" => $this->input->post("id"),
                "designation_name" => $this->input->post("designation_name"),
                "department_id"=>$this->input->post("department"),
                "grads" => $this->input->post("grads"),
                "updated_by" => 0,
                "updated_on" => date("Y-m-d H:i:s"),
            ];
        }
        $result = $this->master_model->designation_action($data);
        if ($result < 0) {
            $success = -1;
            $message = "Designation configration already exits.";
        } elseif ($result == "update") {
            $success = 1;
            $message = "Designation updated successfully!";
        } elseif ($result > 0) {
            $success = 1;
            $message = "Designation added successfully!";
        } else {
            $success = 0;
            $message = "Error add data.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
    }
    public function delete_designation()
    {
        $id = $this->input->post("id");

        $result = $this->master_model->delete_designation($id);

        if ($result) {
            $success = 1;
            $message = "Designation Delete successfully!";
        } else {
            $success = 0;
            $message = "An error occurred. Please try again.!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    public function update_user_password()
    {
        
        $new_pass = $this->input->post("new_pass");
        $old_pass = $this->input->post("old_pass");

        $affected_row = 0;
        if($new_pass != "" && $old_pass != ''){
            $employee_id = $_SESSION['employee_id'];
            $new_pass = md5($new_pass);
            $old_pass = md5($old_pass);
            $affected_row = $this->master_model->update_password($old_pass,$new_pass,$employee_id);
        }
        

        if ($affected_row > 0)  {
            $success = 1;
            $message = "Password reset successfully!";
        } else if($affected_row == -1){
            $success = 0;
            $message = "Please enter the correct old password!";
        }else {
            $success = 0;
            $message = "something went wrong!.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    public function update_user_attendance_pin()
    {
        
        $new_attendance_pin = $this->input->post("new_attendance_pin");

        $affected_row = 0;
        if($new_attendance_pin != ""){
            $employee_id = $_SESSION['employee_id'];
            $affected_row = $this->master_model->update_attendance_pin($new_attendance_pin,$employee_id);
        }
        

        if ($affected_row > 0)  {
            $success = 1;
            $message = "Attendance pin reset successfully!";
        } else {
            $success = 0;
            $message = "something went wrong!.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    /* company config */

    public function company_config()
    {
        $data['company_id'] = $this->session->userdata("company_id");
        $data['company_config'] = $this->master_model->get_company_config($this->session->userdata("company_id"));
        
        $this->smarty->view("company_config.tpl",$data);
    }

    public function update_company_config()
    {
        
        $update_arr = $this->input->post("config_arr");
        $affected_row = $this->master_model->update_config($update_arr);
         if ($affected_row > -1)  {
            $success = 1;
            $message = "Company settings updated successfully!";
            foreach ($update_arr as $key => $value) {
                $this->config->set_item($value['name'], $value['value']);
            }
        } else {
            $success = 0;
            $message = "something went wrong!.";
        }
        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
        
        
    }

}