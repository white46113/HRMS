<?php
class Master_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        // $this->load->database();
    }
    // CONCAT(em.first_name," ",uem.last_name) as added_by_name,CONCAT(eum.first_name," ",eum.last_name) as updated_by_name

    public function get_department()
    {
        $this->db->select("dm.*,CONCAT(em.first_name,' ',em.last_name) as added_by_name,CONCAT(eum.first_name,' ',eum.last_name) as updated_by_name");
        $this->db->from("department_master as dm");
        $this->db->join("employee_master as em","em.employee_id = dm.added_by","left");
        $this->db->join("employee_master as eum","eum.employee_id = dm.updated_by","left");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("dm.company_id", $company_id);
        }

        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_companies()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("companies");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function insert_department($data = [])
    {
        
        $this->db->insert("department_master", $data);
        $insert_id = $this->db->insert_id();
        return  $insert_id;
    }
    public function update_department($data = array(),$department_id='')
    {
        $affected_row = 0;
        if ($department_id > 0 && is_array($data)) {
            $this->db->where("department_id", $department_id);
            $result = $this->db->update("department_master", $data);
            $affected_row = $this->db->affected_rows();
        }
        return $affected_row;
    }
    public function check_department_code($department_code = '',$company_id = '')
    {

        $this->db->select("*");
        $this->db->from("department_master");
        $this->db->where("department_code", $department_code);
        $this->db->where("company_id", $company_id);
        

        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        $return = "No";
        if (count($ret_data) > 0) {
            $return = "Yes";
        }

        return $return;
    }

    /* holiday and designation */
    public function get_designation()
    {
        $this->db->select("dm.*,dp.*");
        $this->db->from("designation_master as dm");
        $this->db->join("department_master as dp","dp.department_id = dm.department_id","left");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("dp.company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_designation_details($id = [])
    {
        $this->db->select("*");
        $this->db->from("designation_master");
        $this->db->where("id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function designation_action($data = [])
    {

        $this->db->select("*");
        $this->db->from("designation_master");
        $this->db->where("designation_name", $data["designation_name"]);
        $this->db->where("department_id", $data["department_id"]);
        $this->db->where("grads", $data["grads"]);
        if (!empty($data["id"])) {
             $this->db->where("id !=", $data["id"]);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        if (empty($data["id"])) {
            if (count($ret_data) > 0) {
                $insert_id = -1;
            } else {
                $this->db->insert("designation_master", $data);
                $insert_id = $this->db->insert_id();
            }

            return $insert_id;
        } else {
            if (count($ret_data) > 0) {
                $updateData = -1;
            }else{
                $this->db->set("designation_name",$data["designation_name"]);
                $this->db->where("id", $data["id"]);
                $result = $this->db->update("designation_master");
                if ($result == 1) {
                    $updateData = "update";
                } else {
                    $updateData = "Not update";
                }
            }
            
            return $updateData;
        }
    }

    public function delete_designation($id = '')
    {
        $this->db->where("id", $id);
        $result = $this->db->delete("designation_master");
        return $result;
    }


    /* department */
    public function get_department_list()
    {
        $this->db->select("*");
        $this->db->from("department_master");
        // $this->db->where("employee_master.employee_id", $id);
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }

    /* password */
    public function update_password($old_pass = '',$password = '',$employee_id='')
    {
        $this->db->select("*");
        $this->db->from("employee_master");
        $this->db->where("password", $old_pass);
        $this->db->where("employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        $affected_row = 0;
        if ($employee_id > 0 && isset($ret_data['employee_id'])) {
            $this->db->set("password",$password);
            $this->db->where("employee_id", $employee_id);
            $result = $this->db->update("employee_master");
            $affected_row = $this->db->affected_rows();
            $affected_row = $affected_row == 0 ? 1 : $affected_row;
        }else{
            $affected_row = -1;
        }
        return $affected_row;
    }
    public function update_attendance_pin($new_attendance_pin = '',$employee_id='')
    {
        $affected_row = 0;
        if ($employee_id > 0) {
            $this->db->set("attendance_pin",$new_attendance_pin);
            $this->db->where("employee_id", $employee_id);
            $result = $this->db->update("employee_master");
            $affected_row = $this->db->affected_rows();
            $affected_row = $affected_row == 0 ? 1 : $affected_row;
        }
        return $affected_row;
    }

    /* company config */
    public function get_company_config($company_id = '')
    {
        $this->db->select("*");
        $this->db->from("company_variables");
        // $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function update_config($update_arr = array())
    {
        $affected_row = 0;
        if (count($update_arr) > 0 && is_array($update_arr)) {
            $this->db->update_batch('company_variables',$update_arr, 'id'); 
            $affected_row = $this->db->affected_rows();
        }
        return $affected_row;
    }



}