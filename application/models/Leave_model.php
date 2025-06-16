<?php
class Leave_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function get_employee_leave($id, $month, $year, $type)
    {
        $this->db->select(
            'el.*,CONCAT(em.first_name," ",em.last_name) as approved_name'
        );
        $this->db->from("employee_leave as el");
        $this->db->join(
            "employee_master as em",
            "em.employee_id = el.employee_id",
            "left"
        );
        $this->db->order_by("el.added_date", "desc");
        $this->db->where("el.employee_id", $id);
        $this->db->where("em.sys_record_delete !=", 1);
        if ($type == "validation") {
            $this->db->where("MONTH(el.leave_start_date) >=", $month);
            $this->db->where("YEAR(el.leave_start_date) >=", $year);
        } else {
            $this->db->where("MONTH(el.leave_start_date) =", $month);
            $this->db->where("YEAR(el.leave_start_date) =", $year);
        }

        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function insert_employee_leave($data)
    {
        $this->db->insert("employee_leave", $data);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }
    public function update_employee_leave($update_arr = [])
    {
        $this->db->set("leave_start_date", $update_arr["leave_start_date"]);
        $this->db->set("leave_end_date", $update_arr["leave_end_date"]);
        $this->db->set("leave_type", $update_arr["leave_type"]);
        $this->db->set("leave_name", $update_arr["leave_name"]);
        $this->db->set("updated_date", $update_arr["updated_date"]);
        $this->db->set("reason", $update_arr["reason"]);
        $this->db->where("leave_id", $update_arr["leave_id"]);
        $this->db->update("employee_leave");
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        // pr($this->db->last_query());
        return $affected_row;
    }

    public function get_employee_leave_list(
        $condition_arr = [],
        $search_params = []
    ) {
        $this->db->select(
            'el.leave_id as leave_id,CONCAT(em.first_name," ",em.last_name) as employee_name,em.profile_image as image,em.employee_code as employee_code,el.leave_start_date as from_date,el.leave_end_date as to_date,el.reason as reason,el.status as status,em.designation as designation,em.department as department,em.employee_week_off as employee_week_off,em.city as location,em.email as email,em.employee_id as employee_id'
        );
        $this->db->from("employee_leave as el");
        $this->db->join(
            "employee_master as em",
            "em.employee_id = el.employee_id",
            "left"
        );
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("em.company_id", $company_id);
        }
        if (is_array($search_params) && count($search_params) > 0) {
            if ($search_params["status"] != "") {
                $this->db->where("el.status", $search_params["status"]);
            }
            if ($search_params["employee_name"] != "") {
                $this->db->like(
                    "em.first_name",
                    $search_params["employee_name"]
                );
                $this->db->like(
                    "em.last_name",
                    $search_params["employee_name"]
                );
            }
            if ($search_params["employee_code"] != "") {
                $this->db->like(
                    "em.employee_code",
                    $search_params["employee_code"]
                );
            }
            if ($search_params["start_date"] != "") {
                $this->db->where(
                    "el.leave_start_date >=",
                    $search_params["start_date"]
                );
            }
            if ($search_params["end_date"] != "") {
                $this->db->where(
                    "el.leave_end_date <=",
                    $search_params["end_date"]
                );
            }
        }
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    public function get_leave_request_data($leave_id = '') {
        $this->db->select(
            'el.leave_id as leave_id,CONCAT(em.first_name," ",em.last_name) as employee_name,em.profile_image as image,em.employee_code as employee_code,el.leave_start_date as from_date,el.leave_end_date as to_date,el.reason as reason,el.status as status,CONCAT(dm.designation_name,"(",dm.grads,")") as designation_name,CONCAT(dp.departmen_name,"(",dp.department_code,")") as department_name,em.employee_week_off as employee_week_off,em.city as location,em.email as email,em.employee_id as employee_id'
        );
        $this->db->from("employee_leave as el");
        $this->db->join(
            "employee_master as em",
            "em.employee_id = el.employee_id",
            "left"
        );
        $this->db->join("department_master as dp", "dp.department_id = em.department ");
        $this->db->join("designation_master as dm", "dm.id = em.designation ");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("em.company_id", $company_id);
        }
        $this->db->where("el.leave_id",$leave_id);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function update_leave(
        $status = "",
        $request_id = "",
        $updated_date = "",
        $approved_by = ""
    ) {
        $affected_row = 0;
        $this->db->set("status", $status);
        $this->db->set("updated_date", $updated_date);
        $this->db->set("approved_by", $approved_by);
        $this->db->where("leave_id", $request_id);
        $this->db->update("employee_leave");
        $affected_row = $this->db->affected_rows();
        return $affected_row;
    }
    // leave Allocation
    public function get_leave_allocation()
    {
      $company_id = getCompanyId();
      $company_id_where = "";
      if($company_id > 0){
            $company_id_where = "AND d.company_id = ".$company_id;
      }
      $this->db->select("la.*,dm.designation_name,dm.grads,d.departmen_name,d.department_code");
      $this->db->from("leave_allocation as la");
      $this->db->join("designation_master as dm", "dm.id = la.designation_id ");
      $this->db->join("department_master as d", "d.department_id = la.department_id $company_id_where");
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      return $ret_data;
    }
    public function get_designation($department_id)
    {
      $this->db->select("*");
      $this->db->from("designation_master");
      $this->db->where("department_id", $department_id);
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      return $ret_data;
    }
    public function get_designations($department_ids)
    {
      $this->db->select("*");
      $this->db->from("designation_master");
      $this->db->where_in("department_id", $department_ids);
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      return $ret_data;
    }

    public function get_department()
    {
      $this->db->select("*");
      $this->db->from("department_master");
      $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
      }
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      return $ret_data;
    }
    public function get_leave_allocation_details($id)
    {
      $this->db->select("la.*,dm.designation_name,dm.grads");
      $this->db->from("leave_allocation as la");
      $this->db->join("designation_master as dm", "dm.id = la.designation_id ");
      $this->db->where("la.id", $id);
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
      return $ret_data;
    }
    public function delete_leave_allocation($id)
    {
      $this->db->where("id", $id);
      $result = $this->db->delete("leave_allocation");
      return $result;
    }
    public function leave_allocation_action($data)
    {

      if (empty($data["id"])) {
        $this->db->select("*");
        $this->db->from("leave_allocation");
        $this->db->where("department_id", $data["department_id"]);
        $this->db->where("designation_id", $data["designation_id"]);
        $result_obj = $this->db->get();

        $ret_data = is_object($result_obj)
        ? $result_obj->result_array()
        : [];

        if (count($ret_data) > 0) {
          $insert_id = -1;
        } else {
          $this->db->insert("leave_allocation", $data);
          $insert_id = $this->db->insert_id();
        }

        return $insert_id;
      } else {
        $this->db->where("id", $data["id"]);
        $result = $this->db->update("leave_allocation", $data);
        if ($result == 1) {
          $updateData = "update";
        } else {
          $updateData = "Not update";
        }
        return $updateData;
      }
    }

    public function get_allocated_leaves($employee_id = '')
    {
        $this->db->select("la.sick_leave as SickLeave,la.paid_leave as PaidLeave,la.casual_leave as CasualLeave");
        $this->db->from("employee_master as em");
        $this->db->join("leave_allocation as la","la.designation_id = em.designation","left");
        $this->db->where("em.employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_types_wise_leaves($employee_id = '',$allocated_leaves = 0,$employee_leave_id = '')
    {
        $this->db->select("el.*");
        $this->db->from("employee_leave as el");
        $this->db->where("el.employee_id", $employee_id);
        if($employee_leave_id > 0){
            $this->db->where("el.leave_id !=", $employee_leave_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        $apllied_days = 0;
        if(is_valid_array($ret_data)){
            foreach ($ret_data as $key => $value) {
                $start_date = new DateTime($value["leave_start_date"]);
                $end_date = new DateTime($value["leave_end_date"]);
                $interval = (array) $end_date->diff($start_date);
                $apllied_days += 0 ? 1 : $interval["days"] + 1;
            }
        }

        $remaining_leaves = $allocated_leaves - $apllied_days;

        return $remaining_leaves;
    }
    public function get_employee_details($employee_id = '')
    {
      $this->db->select("em.*,CONCAT(dm.designation_name,'(',dm.grads,')') as designation_name,CONCAT(dp.departmen_name,'(',dp.department_code,')') as department_name");
      $this->db->from("employee_master as em");
      $this->db->join("department_master as dp", "dp.department_id = em.department ");
      $this->db->join("designation_master as dm", "dm.id = em.designation ");
      $this->db->where("em.employee_id", $employee_id);
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
      return $ret_data;
    }
    public function get_employee_leave_details($employee_id = '',$allocated_leaves = [],$leave_id = 0)
    {
      $this->db->select("el.*");
      $this->db->from("employee_leave as el");
      $this->db->where("el.employee_id", $employee_id);
      $this->db->where_in("el.status",["approve","Pending"]);
      if($leave_id > 0){
        $this->db->where("el.leave_id !=",$leave_id);
      }
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      $type_wise_leave = ["SickLeave"=>0,"PaidLeave"=>0,"CasualLeave"=>0];
      
      foreach ($ret_data as $key => $value) {
        $start_date = new DateTime($value["leave_start_date"]);
        $end_date = new DateTime($value["leave_end_date"]);
        $interval = (array) $end_date->diff($start_date);
        $applied_leave_days_val = 0 ? 1 : $interval["days"] + 1;
        if($value['leave_type'] == "half_day"){
            $type_wise_leave[$value['leave_name']] += $applied_leave_days_val/2;
             
        }else{
            $type_wise_leave[$value['leave_name']] += $applied_leave_days_val;
        }
      }
      foreach ($allocated_leaves as $key => $value) {
          $allocated_leaves[$key] = $value - $type_wise_leave[$key];
      }
      return $allocated_leaves;
    }

    // combo off
    public function get_employee_attendance($employee_id = '',$start_date = '',$end_date ='',$current_date = '')
    {
      $this->db->select("ea.*");
      $this->db->from("employee_attendance as ea");
      $this->db->where("ea.employee_id", $employee_id);
      $this->db->where("ea.attendance_date >=", $start_date);
      $this->db->where("ea.attendance_date <=", $end_date);
      $this->db->where("ea.attendance_date !=", $current_date);
      $result_obj = $this->db->get();
      $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
      return $ret_data;
    }
    public function get_employee_shift_details($id = '',$start_date = '',$end_date =''){
        $this->db->select("es.*,sm.*");
        $this->db->from("employee_shift as es");
        $this->db->join("shift_master as sm","sm.id = es.shift_id","left");
        $this->db->where("FIND_IN_SET($id, es.employee_ids) AND es.start_date >= '$start_date' AND es.start_date < '$end_date'");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($this->db->last_query());
        return $ret_data;
    }
    public function get_combo_off_data($employee_id = ''){
        $this->db->select("ec.*");
        $this->db->from("employee_combo_off as ec");
        $this->db->where("ec.employee_id",$employee_id);
        // $this->db->where("ec.status != 'Reject'");  
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function check_combo_off_date($combo_off_date = '',$employee_combo_off_id = ''){
        $this->db->select("ec.employee_combo_off_id");
        $this->db->from("employee_combo_off as ec");
        $this->db->where("ec.combo_off_date",$combo_off_date);
        if($employee_combo_off_id > 0){
           $this->db->where("ec.employee_combo_off_id != ",$employee_combo_off_id);
        }
        $this->db->where("ec.status != 'Reject'");  
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function insert_combo_off($data)
    {
        $this->db->insert("employee_combo_off", $data);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }

    public function update_combo_off($data = [],$employee_combo_off_id = ''){
      $affected_row = 0;
      if($employee_combo_off_id > 0 && is_valid_array($data)){
        $this->db->where("employee_combo_off_id", $employee_combo_off_id);
        $this->db->update("employee_combo_off", $data);
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
      }
      return $affected_row;
    }

    public function get_employee_combo_off_list(
        $condition_arr = [],
        $search_params = []
    ) {
        $this->db->select(
            'ec.employee_combo_off_id as employee_combo_off_id,CONCAT(em.first_name," ",em.last_name) as employee_name,em.profile_image as image,em.employee_code as employee_code,CONCAT(dm.designation_name,"(",dm.grads,")") as designation_name,CONCAT(dp.departmen_name,"(",dp.department_code,")") as department_name,em.employee_week_off as employee_week_off,em.city as location,em.email as email,em.employee_id as employee_id,ec.combo_off_date as combo_off_date,ec.reference_date as reference_date,ec.added_reason as combo_off_reason,ec.update_reason as update_reason,ec.status as status,em.employee_week_off as employee_week_off,ec.over_time as over_time'
        );
        $this->db->from("employee_combo_off as ec");
        $this->db->join(
            "employee_master as em",
            "em.employee_id = ec.employee_id",
            "left"
        );
        $this->db->join("department_master as dp", "dp.department_id = em.department ");
        $this->db->join("designation_master as dm", "dm.id = em.designation ");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("em.company_id", $company_id);
        }
        if (is_array($search_params) && count($search_params) > 0) {
            if ($search_params["status"] != "") {
                $this->db->where("ec.status", $search_params["status"]);
            }
            if ($search_params["employee_name"] != "") {
                $this->db->like("CONCAT(em.first_name,' ',em.last_name)",
                    $search_params["employee_name"]
                );
            }
            if ($search_params["employee_code"] != "") {
                $this->db->like(
                    "em.employee_code",
                    $search_params["employee_code"]
                );
            }
            if ($search_params["combo_off_date"] != "") {
                $this->db->where(
                    "ec.combo_off_date ",
                    $search_params["combo_off_date"]
                );
            }
            if ($search_params["reference_date"] != "") {
                $this->db->where(
                    "ec.reference_date",
                    $search_params["reference_date"]
                );
            }
            if ($search_params["combo_off_reason"] != "") {
                $this->db->like(
                    "ec.added_reason",
                    $search_params["combo_off_reason"]
                );
            }
            if ($search_params["comment"] != "") {
                $this->db->like(
                    "ec.update_reason",
                    $search_params["comment"]
                );
            }

        }
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        return $ret_data;
    }
    
    public function get_company_config($company_id = ''){
        $this->db->select("cv.*");
        $this->db->from("company_variables as cv");
        $this->db->where("cv.company_id",$company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    
}

?>
