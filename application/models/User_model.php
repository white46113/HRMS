<?php
class User_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    public function get_company_config($company_id = ''){
        $this->db->select("cv.*");
        $this->db->from("company_variables as cv");
        $this->db->where("cv.company_id", $company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function get_cat()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("category");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function get_country()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("tbl_country_master");
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

    public function get_country_code($telephone_prefix = "")
    {
        $ret_data = '';
        if($telephone_prefix != ""){
          $this->db->select("c.country_code");
            $this->db->from("tbl_country_master as c");
            $this->db->where("c.telephone_prefix", $telephone_prefix);
            $result_obj = $this->db->get();
            $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
            if(count($ret_data) > 0){
                $ret_data = $ret_data['country_code'];
            }else{
                $ret_data = '';
            }
        }
        
        return $ret_data;
    }

    public function get_state()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("state_master");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    //employee

    public function employee_email_validation($email = '',$mode = '',$employee_id = '')
    {
        $this->db->select("e.*");
        $this->db->from("employee_master as e");
        $this->db->where("e.email", $email);
        if($mode == "Update"){
            $this->db->where("e.employee_id !=", $employee_id); 
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        $return = "No";
        if (count($ret_data) > 0) {
            $return = "Yes";
        }

        return $return;
    }

    public function insert_employee_data($data)
    {
        $this->db->select("*");
        $this->db->from("employee_master");
        $this->db->where("email", $data["email"]);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        if (count($ret_data) > 0) {
            $insert_id = -1;
        } else {
            $this->db->insert("employee_master", $data);
            $insert_id = $this->db->insert_id();
        }
        return $insert_id;
    }
    public function insert_employee_week_off($data)
    {
        $this->db->insert("employee_week_off", $data);
        $insert_id = $this->db->insert_id();
    }

    public function check_login_credentials($email, $password)
    {
        $this->db->select("em.*,d.departmen_name as department_name,ds.designation_name as designation_name");
        $this->db->from("employee_master as em");
        $this->db->join("department_master as d","d.department_id = em.department","left");
        $this->db->join("designation_master as ds","ds.id = em.designation","left");
        $this->db->where("email", $email);
        $this->db->where("password", $password);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_last_employee_code($company_id = '')
    {
        $this->db->select("em.*");
        $this->db->from("employee_master as em");
        $this->db->where("em.company_id",$company_id);
        $this->db->order_by("em.employee_id", "desc");
        $this->db->limit(1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        $employee_code = 0;
        if (count($ret_data)) {
            if ($ret_data[0]["employee_code"] != "") {
                $company_prifix = $this->get_compnay_prefix($company_id);
                $employee_code = (int) str_replace(
                    $company_prifix . "-",
                    "",
                    $ret_data[0]["employee_code"]
                );
            }
        }
        return $employee_code;
    }
    public function get_compnay_prefix($company_id = '')
    {
        $this->db->select("c.*");
        $this->db->from("company_variables as c");
        $this->db->where("c.company_id", $company_id);
        $this->db->where("c.name", "company_prefix");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return isset($ret_data['value']) ? $ret_data['value'] : '';
    }
    public function get_compnay_attendance_pin($company_id = '')
    {
        $this->db->select("c.*");
        $this->db->from("company_variables as c");
        $this->db->where("c.company_id", $company_id);
        $this->db->where("c.name", "attendance_pin");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return isset($ret_data['value']) ? $ret_data['value'] : '';
    }
    public function get_compnay_email_notification($company_id = '')
    {
        $this->db->select("c.*");
        $this->db->from("company_variables as c");
        $this->db->where("c.company_id", $company_id);
        $this->db->where("c.name", "email_notification");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return isset($ret_data['value']) ? $ret_data['value'] : '';
    }

    public function get_user_details($employee_code)
    {
        $date = date("Y-m-d");
        $this->db->select("em.employee_id as employee_id_val,em.*,ea.*,d.departmen_name as departmen_name,ds.designation_name as designation_name");
        $this->db->from("employee_master as em");
        $this->db->join(
            "employee_attendance as ea",
            "ea.employee_id = em.employee_id AND ea.attendance_date = '$date'",
            "left"
        );
        $this->db->join("department_master as d","d.department_id = em.department","left");
        $this->db->join("designation_master as ds","ds.id = em.designation","left");
        $this->db->where("em.employee_code", $employee_code);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    public function insert_attendance($insert_arr = [])
    {
        $insert_id = 0;
        if (count($insert_arr) > 0 && is_array($insert_arr)) {
            $this->db->insert("employee_attendance", $insert_arr);
            $insert_id = $this->db->insert_id();
        }
        return $insert_id;
    }
    public function update_attendance($insert_arr = [], $employee_id = "")
    {
        $affected_row = 0;
        if (count($insert_arr) > 0 && is_array($insert_arr)) {
            if (array_key_exists("attendance_in_time", $insert_arr)) {
                $this->db->set(
                    "attendance_in_time",
                    $insert_arr["attendance_in_time"]
                );
            } else {
                $this->db->set(
                    "attendance_out_time",
                    $insert_arr["attendance_out_time"]
                );
            }

            if($insert_arr['type'] == 'attendance_out'){
                $this->db->where("attendance_id", $insert_arr['attendance_id']);
            }

            $this->db->where("employee_id", $employee_id);
            $this->db->update("employee_attendance");
            $affected_row = $this->db->affected_rows();
        }

        return $affected_row;
    }
    public function get_attendance($employee_id = "", $current_date = "")
    {
        $this->db->select("ea.*");
        $this->db->from("employee_attendance as ea");
        $this->db->where("ea.attendance_date", $current_date);
        $this->db->where("ea.employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
   
    public function get_employee_details($id)
    {
        $this->db->select("*");
        $this->db->from("employee_master");

        $this->db->where("employee_master.employee_id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];

        return $ret_data;
    }
    public function check_user_email($email)
    {
        $this->db->select("em.*");
        $this->db->from("employee_master as em");
        $this->db->where("email", $email);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function update_employee_otp($employee_id = "", $otp = "")
    {
        $affected_row = 0;
        if ($employee_id > 0 && $otp != "") {
            $this->db->set("otp", $otp);
            $this->db->where("employee_id", $employee_id);
            $this->db->update("employee_master");
            $affected_row = $this->db->affected_rows();
        }
        return $affected_row;
    }
    public function verify_employee_otp($employee_email = "", $otp = "")
    {
        $this->db->select("em.*");
        $this->db->from("employee_master as em");
        $this->db->where("email", $employee_email);
        $this->db->where("otp", $otp);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function update_employee_password($employee_id = "", $password = "")
    {
        $affected_row = 0;
        if ($employee_id > 0 && $password != "") {
            $this->db->set("password", $password);
            $this->db->where("employee_id", $employee_id);
            $this->db->update("employee_master");
            $affected_row = $this->db->affected_rows();
        }
        return $affected_row;
    }

    public function check_login_attempt($email = "")
    {
        $this->db->select("em.*");
        $this->db->from("employee_master as em");
        $this->db->where("email", $email);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    public function update_login_attempt(
        $email = "",
        $attempt = 0,
        $status = ""
    ) {
        if ($status != "") {
            $this->db->set("status", $status);
        }
        $this->db->set("login_attempt_failed", $attempt);
        $this->db->where("email", $email);
        $this->db->update("employee_master");
        $affected_row = $this->db->affected_rows();
    }
    public function get_department()
    {
        $this->db->select("*");
        $this->db->from("department_master");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        // $this->db->where("employee_master.employee_id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function get_designation()
    {
        $this->db->select("dm.*");
        $this->db->from("designation_master as dm");
        $this->db->join("department_master as d","d.department_id = dm.department_id","left");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("d.company_id", $company_id);
        }
        // $this->db->where("employee_master.employee_id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function get_manager()
    {
        $this->db->select("CONCAT(em.first_name,' ',em.last_name) as name,em.employee_id as employee_id ");
        $this->db->from("employee_master as em");
        $this->db->where("em.role", "manager");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }

    public function insert_employee_bank($bank_insert_arr =  array()){
        $this->db->insert_batch('bank_master', $bank_insert_arr); 
    }

    public function get_reporting_senior($department = '',$type = '',$company_id = '')
    {
        $this->db->select("CONCAT(em.first_name,' ',em.last_name) as name,em.employee_id as employee_id ");
        $this->db->from("employee_master as em");
        $this->db->where("em.role !=", "employee");
        $this->db->where("em.department", $department); 
        $this->db->where("em.company_id", $company_id);      
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        $this->db->select("CONCAT(em.first_name,' ',em.last_name) as name,em.employee_id as employee_id ");
        $this->db->from("employee_master as em");
        $this->db->where("em.role ", "arom");     
        $result_obj = $this->db->get();
        $ret_data1 = is_object($result_obj) ? $result_obj->result_array() : [];

        $ret_data = array_merge($ret_data,$ret_data1);
        // pr($this->db->last_query(),1);
        return $ret_data;
    }
    public function get_bank_details($id = ""){
        $this->db->select("b.*");
        $this->db->from("bank_master as b");
        $this->db->where("b.entity_type ","employee");
        $this->db->where("b.entity_id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_employee_edit_json($employe_update_arr = [])
    {
        $affected_row = 0;
        $this->db->set("is_edit",$employe_update_arr['edit_type']);
        $this->db->set("edit_json",$employe_update_arr['updated_json']);
        $this->db->set("updated_by",$employe_update_arr['updated_by']);
        $this->db->set("updated_on",$employe_update_arr['updated_date']);
        $this->db->where("employee_id", $employe_update_arr['employee_id']);
        $this->db->update("employee_master");
        $affected_row = $this->db->affected_rows();
        return $affected_row;
    }
    public function get_department_list($company_id = '')
    {
        $this->db->select("*");
        $this->db->from("department_master");
        $this->db->where("company_id", $company_id);
        
        // $this->db->where("employee_master.employee_id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function get_designation_list($department_id = '')
    {
        $this->db->select("*");
        $this->db->from("designation_master");
        $this->db->where("department_id", $department_id);
        
        // $this->db->where("employee_master.employee_id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function check_company_code($company_code = "")
    {
        $this->db->select("c.*,cv.*");
        $this->db->from("companies as c");
        $this->db->join("company_variables as cv","cv.company_id = c.company_id AND cv.name = 'company_prefix'","inner");
        $this->db->where("c.company_code", $company_code);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;

        // $this->db->select("cv.*");
        // $this->db->from("company_variables as cv");
        // $this->db->where("cv.name", 'company_prefix');
        // $this->db->where("cv.value", $company_code);
        // $result_obj = $this->db->get();
        // $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // return $ret_data;
    }
    public function get_company_details($company_id = "")
    {
        $this->db->select("c.*");
        $this->db->from("companies as c");
        $this->db->where("c.company_id", $company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_company_logo($company_code = "")
    {
        $this->db->select("c.*");
        $this->db->from("companies as c");
        $this->db->join("company_variables as cv","cv.name = 'company_prefix' AND cv.value = '$company_code' && cv.company_id = c.company_id",'inner');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

}

?>
