<?php
class Company_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function get_config()
    {
        pr("ok",1);
        // $this->db->select("*");
        // $result_obj = $this->db->get("tbl_country_master");
        // $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // return $ret_data;
    }

    public function get_country()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("tbl_country_master");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_state()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("state_master");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function getCompanies($id = 0,$search_param = []){
        $filter_where = $this->prepareCompanyFilter($search_param);
        $this->db->select("*");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        $result_obj = $this->db->get("companies");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function prepareCompanyFilter($search_param = []){
        if(!is_valid_array($search_param)){
            return [];
        }
        
    }

    public function getCompanydetails($id = 0){
        $this->db->select("c.*,tc.country_code");
        $this->db->from('companies c');
        $this->db->join('tbl_country_master tc','c.contact_number_code = tc.telephone_prefix');
        $this->db->where('c.company_id',$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    
    }

    public function getBankData($id){
        $this->db->select('*');
        $this->db->from('bank_master');
        $this->db->where('entity_type','Company');
        $this->db->where('entity_id',$id);
        $query = $this->db->get();
        $data = is_object($query) ? $query->result_array() : [];
        // pr($this->db->last_query());
        return $data;
    }

    public function updateCompanyData($ret_arr = []){
        // pr($ret_arr,1);
        $company_data = $ret_arr['company_insert_arr'];
        $bank_insert = $ret_arr['bank_insert_arr'];
        $company_id = $ret_arr['company_id'];
        $bank_update = $ret_arr['bank_update_arr'];
        $delete_ids = $ret_arr['delete_ids'];

        if(is_valid_array($delete_ids)){
            $this->db->where_in('id', $delete_ids);
            $this->db->delete('bank_master');
        }

        if(is_valid_array($company_data)){
            $this->db->where('company_id', $company_id);
            $this->db->update('companies', $company_data);
        }
        if(is_valid_array($bank_insert)){
            $this->db->insert_batch('bank_master', $bank_insert);

        }
        // pr($this->db->last_query());
        if(is_valid_array($bank_update)){
            $this->db->update_batch('bank_master',$bank_update, 'id'); 
        }
        // pr($this->db->last_query());
    }

    public function getCompanydetailsView($id = 0){
        $this->db->select("c.*,tc.country_name,sm.vState");
        $this->db->from('companies c');
        $this->db->join('tbl_country_master tc','c.country = tc.id');
        $this->db->join('state_master sm','c.state = sm.iStateId');
        $this->db->where('c.company_id',$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    
    }

    public function bankIds($company_id = 0){
        if($company_id == 0 || $company_id == ''){
            return [];
        }
        $ids = [];
        $this->db->select('id');
        $this->db->from('bank_master');
        $this->db->where('entity_type','Company');
        $this->db->where('entity_id',$company_id);
        $query = $this->db->get();
        $data = is_object($query) ? $query->result_array() : [];
        if(is_valid_array($data)){
            $ids = array_column($data,'id');
        }
        return $ids;
    }

    public function insertIntoCompanyConfig($config_data = []){
        
        if(is_valid_array($config_data)){
            $this->db->insert_batch('company_variables', $config_data);
        }
    }

    public function getEmailCount($email = '',$id  = ''){
        $this->db->select('count(c.company_id) as email_count');
        $this->db->from('companies c');
        $this->db->where('c.company_email',$email);
        if($id != ''){
            $this->db->where('c.company_id<>',$id);
        }
        $query = $this->db->get();
        $data = is_object($query) ? $query->row_array() : [];
        return $data['email_count'];
    }

}

