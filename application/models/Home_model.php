<?php
class Home_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        // $this->load->database();
    }
    public function getCountry()
    {
        $this->db->select("*");
        $this->db->from("countries");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function getEmployeeList($condition_arr = [], $search_params = "")
    {
        $this->db->select(
            'u.id as id,CONCAT(u.first_name," ",u.last_name) as name,u.email as email,u.created_on as added_date,CONCAT(u.tel_number," ",u.phone_number) as phone_number,u.status as status,IF(u.state != "",u.state,"-") as state,IF(u.city != "",u.city,"-") as city,IF(u.zipcode != "",u.zipcode,"-") as zipcode'
        );
        $this->db->from("user_master as u");
        $this->db->where("u.user_type", "Dealer");
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }
        $result_obj = $this->db->get();

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
    // employee

    public function get_user_details($employee_id)
    {
        $date = date("Y-m-d");
        $this->db->select("em.employee_id as employee_id_val,em.*,ea.*");
        $this->db->from("employee_master as em");
        $this->db->join(
            "employee_attendance as ea",
            "ea.employee_id = em.employee_id AND ea.attendance_date = '$date'",
            "left"
        );
        $this->db->where("em.employee_id", $employee_id);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    public function get_employee_details($id = '')
    {
        $this->db->select("em.*,s.*,c.*,d.departmen_name as departmen_name,d.department_code as department_code,ds.designation_name as designation_name,CONCAT(re.first_name,' ',re.last_name) as manager,cm.company_name as company_name");
        $this->db->from("employee_master as em");
        $this->db->join("tbl_country_master as c","c.id = em.country","left");
        $this->db->join("state_master as s","s.iStateId = em.state","left");
        $this->db->join("department_master as d","d.department_id = em.department","left");
        $this->db->join("designation_master as ds","ds.id = em.designation","left");
        $this->db->join("employee_master as re","re.employee_id = em.reporting_manager","left");
        $this->db->join("companies as cm","cm.company_id = em.company_id","left");
        // $this->db->join("employee_shift as es","FIND_IN_SET(em.employee_id, es.employee_ids)","left");
        // $this->db->join("shift_master as sm","sm.id = es.shift_id","left");
        $this->db->where("em.employee_id", $id);
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($this->db->last_query(),1);

        return $ret_data;
    }

    public function get_employee_shift_details($id = '',$current_date = ''){
        $this->db->select("es.*,sm.*");
        $this->db->from("employee_shift as es");
        $this->db->join("shift_master as sm","sm.id = es.shift_id","left");
        $this->db->where("FIND_IN_SET($id, es.employee_ids) AND es.start_date <= '$current_date' AND es.end_date >= '$current_date'");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    public function get_employee_listing_data(
        $condition_arr = [],
        $search_params = ""
    ) {
        $this->db->select(
            'em.employee_id as employee_id,em.profile_image as image, CONCAT(em.first_name," ",IF(em.middle_name != "",em.middle_name, ""),IF(em.middle_name != ""," ", ""),em.last_name) as name,em.employee_code as employee_code,em.employee_code as employee_code,em.employment_date as joining_date,em.email as email,CONCAT(d.departmen_name," (",d.department_code,")") as department,de.designation_name as designation,em.status as status,em.is_edit as is_edit,em.created_by as added_by,em.updated_by as updated_by'
        );
        $this->db->from("employee_master as em");
        $this->db->join("tbl_country_master as tc", "tc.id = em.country",'left');
        $this->db->join("state_master as st", "st.iStateId = em.state",'left');
        $this->db->join("department_master as d", "d.department_id = em.department",'left');
        $this->db->join("designation_master as de", "de.id = em.designation",'left');
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }

        if (is_array($search_params) && count($search_params) > 0) {
            if ($search_params["status"] != "") {
                $this->db->where("em.status", $search_params["status"]);
            }
            if ($search_params["employee_name"] != "") {
                $this->db->or_like(
                    "em.first_name",
                    $search_params["employee_name"]
                );
                $this->db->or_like(
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
            if ($search_params["join_date"] != "") {
                $this->db->where(
                    "em.employment_date >=",
                    mysqlFormat($search_params["join_date_from"])
                );
                $this->db->where(
                    "em.employment_date <=",
                    mysqlFormat($search_params["join_date_to"])
                );
            }
            if ($search_params["email"] != "") {
                $this->db->like(
                    "em.email",
                    $search_params["email"]
                );
            }
            if ($search_params["department"] != "") {
                $this->db->where(
                    "d.department_id",
                    $search_params["department"]
                );
            }
            if ($search_params["designation"] != "") {
                $this->db->where(
                    "de.id",
                    $search_params["designation"]
                );
            }
        }
        if (isset($search_params["search_val"]) && $search_params["search_val"] != "") {
	            $keyword = $search_params["search_val"];
	            $this->db->group_start();
	            $fields = [
	                'em.status',
	                'em.first_name',
	                'em.last_name',
	                'em.employee_code',
	                'em.employment_date',
	                'em.email',
	                'd.departmen_name',
                    'd.department_code',
                    'de.designation_name'

	            ];
	            
	            foreach ($fields as $field) {
	                $this->db->or_like($field, $keyword);
	            }
	            $this->db->group_end(); // End the group of OR conditions
	        }

        $this->db->where("em.sys_record_delete !=", 1);
        $this->db->where("em.employee_id !=",$_SESSION['employee_id']);
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("em.company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        // pr($this->db->last_query(),1);
        return $ret_data;
    }

    public function get_employee_week_off(
        $employee_ids = [],
        $current_month = ""
    ) {
        $this->db->select("ef.*");
        $this->db->from("employee_week_off as ef");
        $this->db->where_in("ef.employee_id", $employee_ids);
        $this->db->where("ef.month", $current_month);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function insert_employee_week_off($data)
    {
        $this->db->insert("employee_week_off", $data);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }
    public function get_all_attendance($current_date)
    {
        $this->db->select("ea.*,em.*");
        $this->db->from("employee_master as em");
        $this->db->join(
            "employee_attendance as ea",
            "ea.employee_id = em.employee_id AND ea.attendance_date = '$current_date'",
            "left"
        );
        $this->db->where("em.sys_record_delete !=", 1);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function insert_attendance_log($insert_arr = [])
    {
        $insert_id = 0;
        // pr($insert_arr,1);
        if (count($insert_arr) > 0 && is_array($insert_arr)) {
            $this->db->insert_batch("employee_attendance", $insert_arr);
            $insert_id = $this->db->insert_id();
        }
        return $insert_id;
    }
    public function get_all_attendance_in_data($date)
    {
        $this->db->select("ea.*");
        $this->db->from("employee_attendance as ea");
        $this->db->where("ea.attendance_date", $date);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function auto_out_attendance($update_arr = [])
    {
        $affected_row = 0;
        if (count($update_arr) > 0 && is_array($update_arr)) {
            $affected_row = $this->db->update_batch(
                "employee_attendance",
                $update_arr,
                "attendance_id"
            );
        }
        return $affected_row;
    }
    public function update_employee_week_off_data($update_arr = [])
    {
        $this->db->set("employee_week_off", $update_arr["week_off"]);
        $this->db->where("week_off_id", $update_arr["week_off_id"]);
        $this->db->update("employee_week_off");
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;

        return $affected_row;
    }
    public function update_employee_week_off($update_arr = [])
    {
        $this->db->set("employee_week_off", $update_arr["week_off"]);
        $this->db->where("employee_id", $update_arr["employee_id"]);
        $this->db->update("employee_master");
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;

        return $affected_row;
    }

    public function update_employee_status($employee_id = "", $status = "")
    {
        $affected_row = 0;
        if ($employee_id > 0 && $status != "") {
            $this->db->set("status", $status);
            $this->db->where("employee_id", $employee_id);
            $this->db->update("employee_master");
            $affected_row = $this->db->affected_rows();
        }
        return $affected_row;
    }

    

    public function get_holiday($year, $type)
    {
        $this->db->select("h.*");
        $this->db->from("holiday_master as h");
        $this->db->order_by("h.holiday_date", "ASC");
        if ($year != "" && $year != null) {
            $this->db->where("YEAR(h.holiday_date)", $year);
            if ($type == "dashbord") {
                $this->db->where("h.holiday_date >=", date("Y/m/d"));
            }
        }

        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("h.company_id", 20);
        }
        $result_obj = $this->db->get();
        // pr($this->db->last_query(),1);
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function delete_employee($id = "")
    {
        $this->db->set("sys_record_delete", 1);
        $this->db->where("employee_id", $id);
        $this->db->update("employee_master");
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;

        return $affected_row;
    }
    public function get_employee_birthdays($current_date = "", $next_date = "")
    {
        $this->db->select("e.*");
        $this->db->from("employee_master as e");
        $this->db->group_start();
        $this->db->where("(DAY(e.dob) >=".date('d', strtotime($current_date))." AND MONTH(e.dob) = ".date('m', strtotime($current_date)).") OR (MONTH(e.dob) = ".date('m', strtotime($next_date))." AND DAY(e.dob) <= ".date('d', strtotime($next_date)).") ");
        $this->db->group_end();
        $this->db->where("e.sys_record_delete !=", 1);
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("e.company_id", $company_id);
        }
        $this->db->limit(5);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_employee_work_aniversary($current_date = "", $next_date = "")
    {
        $this->db->select("e.*");
        $this->db->from("employee_master as e");
        $this->db->group_start();
        $this->db->where('e.employment_date >=',$current_date);
        $this->db->where('e.employment_date <=',$next_date);
        // $this->db->where("(DAY(e.employment_date) >=".date('d', strtotime($current_date))." AND MONTH(e.employment_date) = ".date('m', strtotime($current_date)).") OR (MONTH(e.employment_date) = ".date('m', strtotime($next_date))." AND DAY(e.employment_date) <= ".date('d', strtotime($next_date)).") ");
        $this->db->group_end();
        $this->db->where("e.sys_record_delete !=", 1);
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("e.company_id", $company_id);
        }
        $this->db->limit(5);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
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
     public function get_edit_json($id = ""){
        $this->db->select("em.edit_json as edit_json,CONCAT(ea.first_name,' ',ea.last_name) as updated_by,ea.employee_id as updated_by_id");
        $this->db->from("employee_master as em");
         $this->db->join(
            "employee_master as ea",
            "ea.employee_id = em.updated_by",
            "left"
        );
        $this->db->where("em.employee_id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_department($id = ""){
        $this->db->select("CONCAT(dm.departmen_name,' (',dm.department_code,')') as department");
        $this->db->from("department_master as dm");
        $this->db->where("dm.department_id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data['department'];
    }
    public function get_designation($id = ""){
        $this->db->select("dn.designation_name as designation");
        $this->db->from("designation_master as dn");
        $this->db->where("dn.id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data['designation'];
    }
    public function get_country($id = ""){
        $this->db->select("c.country_name as country_name");
        $this->db->from("tbl_country_master as c");
        $this->db->where("c.id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data['country_name'];
    }
    public function get_state_name($id = ""){
        $this->db->select("s.vState as state_name");
        $this->db->from("state_master as s");
        $this->db->where("s.iStateId ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data['state_name'];
    }
    public function get_reporting_senior($id = ""){
        $this->db->select("CONCAT(em.first_name,' ',em.last_name) as reporting_manager");
        $this->db->from("employee_master as em");
        $this->db->where("em.employee_id ",$id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data['reporting_manager'];
    }
    public function update_employe_approve_date($employee_updated_arr = array(),$employee_id = ""){
        $this->db->where('employee_id', $employee_id);
        $this->db->update('employee_master', $employee_updated_arr);
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        return $affected_row;
    }
    public function delete_banks($bank_ids = "")
    {
        $this->db->where_in("id", $bank_ids);
        $result = $this->db->delete("bank_master");
        return $result;
    }
    public function update_banks($bank_update_arr = [])
    {
        $this->db->update_batch('bank_master', $bank_update_arr, 'id');
    }
    public function insert_banks($bank_insert_arr = [])
    {
        $this->db->insert_batch('bank_master', $bank_insert_arr);
    }
    public function get_filter_department($id = ""){
        $this->db->select("CONCAT(dm.departmen_name,' (',dm.department_code,')') as department,dm.department_id as department_id");
        $this->db->from("department_master as dm");
        if($id > 0){
            $this->db->where("dm.company_id ",$id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_filter_designation($id = ""){
        $this->db->select("dn.designation_name as designation,dn.id as designation_id");
        $this->db->from("designation_master as dn");
        $this->db->join("department_master as d","d.department_id = dn.department_id","left");
        if($id > 0){
            $this->db->where("d.company_id ",$id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function get_extended_salary_structure($employee_id = '',$year = ''){
        $this->db->select("ex.*");
        $this->db->from("employee_extended_salary_structure as ex");
        $this->db->where("YEAR(ex.effective_from) ",$year);
        $this->db->where("ex.employee_id ",$employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }   

    /* get my department department data */
    public function get_department_member($company_id = '',$department_id = '',$employee_id = '',$current_date = ''){
        
        $this->db->select("CONCAT(em.first_name,' ',IF(em.middle_name != '', CONCAT(em.middle_name,' '), ''),em.last_name) as full_name,ea.attendance_in_time as attendance_in_time,ea.attendance_out_time as attendance_out_time,el.leave_id as leave_id,CONCAT(dm.departmen_name,'(',dm.department_code,')') as department_name,dn.designation_name as designation_name,em.employee_id as employee_id,em.profile_image as profile_image");
        $this->db->from("employee_master as em");
        $this->db->join(
            "employee_attendance as ea",
            "ea.employee_id = em.employee_id AND ea.attendance_date = '$current_date'",
            "left"
        );
        $this->db->join(
            "employee_leave as el",
            "el.employee_id = em.employee_id AND '$current_date' >= el.leave_start_date  AND el.leave_end_date >= '$current_date'",
            "left"
        );
        $this->db->join(
            "department_master as dm",
            "dm.department_id = em.department",
            "left"
        );
        $this->db->join(
            "designation_master as dn",
            "dn.id = em.designation",
            "left"
        );
        if($company_id > 0){
            $this->db->where("em.company_id ",$company_id);
        }
        
        $user_role = $this->session->userdata("role");
        $role_arr = ['arom','admin'];
        if(!in_array($user_role, $role_arr)){
            $this->db->where("em.department ",$department_id);
        }
        $this->db->where("em.employee_id !=",$employee_id);
        $this->db->where("em.status != 'Inactive'");
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    /* get allocated leave */
    public function get_allocated_leave($company_id = '',$designation_id = '',$department_id = ''){
        $this->db->select("la.total_leave as total_leave");
        $this->db->from("leave_allocation as la");
        $this->db->where("la.designation_id",$designation_id);
        $this->db->where("la.department_id ",$department_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    } 
    public function get_applied_leave($employee_id = ''){
        $this->db->select("la.*");
        $this->db->from("employee_leave as la");
        $this->db->where("la.employee_id",$employee_id);
        $this->db->where("la.status",'approve');
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_attendance_summary($employee_id = '',$current_date = '',$current_month = ''){
        $this->db->select("ea.*");
        $this->db->from("employee_attendance as ea");
        $this->db->where("ea.employee_id",$employee_id);
        $this->db->where("ea.attendance_date !=",$current_date);
        $this->db->where("MONTH(ea.attendance_date) =",$current_month);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    } 
    public function get_current_month_leave($employee_id='',$current_month = ''){
        $this->db->select("el.*");
        $this->db->from("employee_leave as el");
        $this->db->where("el.employee_id",$employee_id);
        $this->db->where("MONTH(el.leave_start_date)",$current_month);
        $this->db->where("el.status",'approve');
        $this->db->where("el.leave_start_date <= ",date("Y-m-d"));
        $this->db->where("el.leave_end_date <= ",date("Y-m-d"));
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    } 
    public function get_notification_data($current_year = '',$company_id = "") {
        $this->db->select("am.*");
        $this->db->from("announcement_master as am");
        $this->db->where("YEAR(am.announcement_date)", $current_year);
        $this->db->where("am.email_sent", 'Yes');
        if($company_id > 0){    
            $this->db->where("am.company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        // pr($this->db->last_query(),1);
        return $ret_data;
    }
    public function get_company_details($company_id = ""){
        $this->db->select("c.company_logo as company_logo");
        $this->db->from("companies as c");
        $this->db->where("c.company_id ",$company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

} 
?>

