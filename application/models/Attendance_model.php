<?php
class Attendance_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        // $this->load->database();
    }
    public function get_attendance_details($employee_id, $month, $year)
    {
        $date = date("Y-m-d");
        $this->db->select("ea.*,SUM(acp.attendance_correction_id) as pending_correction_count,SUM(ac.attendance_correction_id) as correction_count");
        $this->db->from("employee_attendance as ea");
        $this->db->join("attendance_correction as acp","acp.attendance_id = ea.attendance_id AND acp.status = 'Pending'",'left');
        $this->db->join("attendance_correction as ac","ac.attendance_id = ea.attendance_id",'left');
        $this->db->where("ea.employee_id", $employee_id);
        $this->db->where("MONTH(ea.attendance_date)", $month);
        $this->db->where("YEAR(ea.attendance_date)", $year);
        $this->db->group_by("ea.attendance_id");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_employee_details($id)
    {
        $this->db->select("*");
        $this->db->from("employee_master");
        $this->db->join(
            "tbl_country_master",
            "tbl_country_master.id = employee_master.country"
        );
        $this->db->join(
            "state_master",
            "state_master.iStateId = employee_master.state"
        );
        $this->db->where("employee_master.employee_id", $id);
        $this->db->where("employee_master.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($this->db->last_query(),1);

        return $ret_data;
    }
    public function get_employees_attendance_details($data)
    {
        $date = date("Y-m-d");
        $this->db->select("ea.*,SUM(acp.attendance_correction_id) as pending_correction_count,SUM(ac.attendance_correction_id) as correction_count");
        $this->db->from("employee_attendance as ea");
        $this->db->join("attendance_correction as acp","acp.attendance_id = ea.attendance_id AND acp.status = 'Pending'",'left');
        $this->db->join("attendance_correction as ac","ac.attendance_id = ea.attendance_id",'left');
        $this->db->join("employee_master as e","e.employee_id = ea.employee_id");
        $this->db->where("ea.attendance_date", $data);
        $this->db->group_by("ea.attendance_id");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("e.company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_all_employee_details()
    {
        $this->db->select('*,CONCAT(first_name," ",IF(middle_name != "",middle_name, ""),IF(middle_name != ""," ", ""),last_name) as name');
        $this->db->from("employee_master");
        $this->db->join(
            "tbl_country_master",
            "tbl_country_master.id = employee_master.country"
        );
        $this->db->join(
            "state_master",
            "state_master.iStateId = employee_master.state"
        );
        $this->db->where("employee_master.sys_record_delete !=", 1);
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($this->db->last_query(),1);

        return $ret_data;
    }
    
    public function get_attendance_summary($attendance_id)
    {
        $this->db->select("ea.*");
        $this->db->from("employee_attendance as ea");
        $this->db->where("ea.attendance_id", $attendance_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function update_attendance(
        $attendance_id = "",
        $attendance_in_time = "",
        $attendance_out_time = ""
    ) {
        $affected_row = 0;

        if ($attendance_id > 0) {
            if ($attendance_out_time != "") {
                $this->db->set("attendance_out_time", $attendance_out_time);
            }
            if ($attendance_in_time != "") {
                $this->db->set("attendance_in_time", $attendance_in_time);
            }
            $this->db->where("attendance_id", $attendance_id);
            $this->db->update("employee_attendance");
            $affected_row = $this->db->affected_rows();
            $affected_row = $affected_row == 0 ? 1 : $affected_row;
        }

        return $affected_row;
    }
    public function update_attendance_correction($update_arr = [],$attendance_id = 0) {
        $affected_row = 0;

        if (is_valid_array($update_arr) && $attendance_id > 0) {
            $this->db->where("attendance_correction_id", $attendance_id);
            $this->db->update("attendance_correction",$update_arr);
            // pr($this->db->last_query(),1);
            $affected_row = $this->db->affected_rows();
            $affected_row = $affected_row == 0 ? 1 : $affected_row;
        }

        return $affected_row;
    }

    public function insert_attendance_correction($insert_arr = [])
    {
        $insert_id = 0;
        if(is_valid_array($insert_arr)) {
            $this->db->insert("attendance_correction", $insert_arr);
            $insert_id = $this->db->insert_id();
        }

        return $insert_id;
        
    }
    public function get_attendance_correction($condition_arr = [],$search_params = [])
    {
        $company_id = getCompanyId();
        $company_id_where = "";
        if($company_id > 0){
            $company_id_where = "AND e.company_id = $company_id";
        }
        $this->db->select("ac.attendance_correction_id as attendance_id_val,ac.attendance_in_time as attendance_in_time_val,ac.attendance_out_time as attendance_out_time_val,ac.attendance_correction_in_time as correction_attendance_in_time,ac.attendance_correction_out_time as correction_attendance_out_time,ac.status as status,ea.attendance_date as attendance_date,CONCAT(e.first_name,' ',e.last_name) as name");
        $this->db->from("attendance_correction as ac");
        $this->db->join("employee_attendance as ea","ea.attendance_id = ac.attendance_id");
        $this->db->join("employee_master as e","e.employee_id = ea.employee_id $company_id_where");

        if (is_valid_array($search_params)) {
            if ($search_params["status"] != "") {
                $this->db->where("ac.status", $search_params["status"]);
            }
            if ($search_params["employee_name"] != "") {
                $this->db->like(
                    "CONCAT(e.first_name,' ',e.last_name)",
                    $search_params["employee_name"]
                );
            }
            if ($search_params["attendance_date"] != "") {
                $this->db->like("Date(ea.attendance_date)", $search_params["attendance_date"]);
            }
            if ($search_params["attendance_in_time"] != "") {
                $this->db->like("TIME(ac.attendance_in_time)", $search_params["attendance_in_time"]);
            }
            if ($search_params["correction_in_time"] != "") {
                $this->db->like("TIME(ac.attendance_correction_in_time)", $search_params["correction_in_time"]);
            }
            if ($search_params["attendance_out_time"] != "") {
                $this->db->like("TIME(ac.attendance_out_time)", $search_params["attendance_out_time"]);
            }
            if ($search_params["correction_out_time"] != "") {
                $this->db->like("TIME(ac.attendance_correction_out_time)", $search_params["correction_out_time"]);
            }
            
        }

        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($ret_data);
        // pr($this->db->last_query(),1);
        return $ret_data;
    }
    public function get_attendance_correction_details($attendance_id)
    {
        $this->db->select("ac.*");
        $this->db->from("attendance_correction as ac");
        $this->db->where("ac.attendance_correction_id", $attendance_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
}
