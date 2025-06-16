<?php
class Salary_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
   public function get_salary_component($id = '')
    {
        $this->db->select("sc.*");
        $this->db->from("salary_component as sc");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("sc.company_id", $company_id);
        }
        if($id > 0){
        	$this->db->where("sc.salary_component_id", $id);
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
    public function insert_salary_component($data = [],$company_id = '',$year = '')
    {
    	$insert_id = 0;
        $component_name_arr = array_column($data, "component_name");
    	$this->db->select("sc.*");
        $this->db->from("salary_component as sc");
        $this->db->where("sc.company_id", $company_id);
        $this->db->where("sc.year", $year);
        $this->db->where_in("sc.component_name", $component_name_arr);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        $flag = 0;
        if(count($ret_data) > 0){
            $exit_component_year_wise = array_column($ret_data,"year", "component_name");
            foreach ($data as $key => $value) {
                if(array_key_exists($value['component_name'],$exit_component_year_wise)){
                   
                   if($exit_component_year_wise[$value['component_name']] == $value['year']){
                        $flag = 1;
                   }
                }
                
            }
        }

        if($flag == 1){
        	$insert_id = -1;
        }else{
        	$this->db->insert_batch("salary_component", $data);
        	$insert_id = $this->db->insert_id();
        }
        
        return $insert_id;
    }
    public function update_salary_component($data = [],$company_id = '',$salary_component_id = '')
    {
    	$affected_row = 0;
    	$this->db->select("sc.*");
        $this->db->from("salary_component as sc");
        $this->db->where("sc.salary_component_id !=", $salary_component_id);
        $this->db->where("sc.company_id", $company_id);
        $this->db->where("sc.component_name", $data['component_name']);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];

        // pr($ret_data);
        if(count($ret_data) > 0){
        	$affected_row = -1;
        }else{
        	$this->db->where("salary_component_id", $salary_component_id);
	        $this->db->update("salary_component",$data);
	        $affected_row = $this->db->affected_rows();
	        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        }
        
        return $affected_row;
    }
    public function get_department($id)
    {
        $this->db->select("*");
        $this->db->from("department_master");
        if($id > 0){
          $this->db->where("company_id", $id);
        }
    
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_designation($department_ids = [])
    {
        $this->db->select("dm.*");
        $this->db->from("designation_master as dm");
        $this->db->where_in("dm.department_id", $department_ids);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_component($company_id = '',$year = '')
    {
        $this->db->select("sc.*");
        $this->db->from("salary_component as sc");
        $this->db->where("sc.company_id", $company_id);
        $this->db->where("sc.year", $year);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_designation_data($department_id = [])
    {
        $this->db->select("dm.*");
        $this->db->from("designation_master as dm");
        $this->db->where("dm.department_id", $department_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_component_data($ids = '')
    {
        $this->db->select("sc.*");
        $this->db->from("salary_component as sc");
        $this->db->where_in("sc.salary_component_id", $ids);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function insert_salary_structure($insert_arr = []){
        $this->db->insert("designation_salary_structure", $insert_arr);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }
    public function get_salary_structure($designation_id = '',$company_id = ''){
        $this->db->select("ds.*");
        $this->db->from("designation_salary_structure as ds");
        $this->db->where("ds.designation_id", $designation_id);
        $this->db->where("ds.company_id", $company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_salary_structure_details($salary_structure_id = ''){
        $this->db->select("ds.*");
        $this->db->from("designation_salary_structure as ds");
        $this->db->where("ds.designation_salary_structure_id", $salary_structure_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_salary_structure_component_details($salary_structure_id = ''){
        $this->db->select("ds.*");
        $this->db->from("designation_salary_structure_component as ds");
        $this->db->where("ds.designation_salary_structure_id", $salary_structure_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_salary_structure($updated_date_arr = [],$salary_structure_id = ''){
        $this->db->where("designation_salary_structure_id", $salary_structure_id);
        $this->db->update("designation_salary_structure",$updated_date_arr);
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        return $affected_row;
    }

    public function get_designation_salary_structure_list($company_id = ''){
        $this->db->select("dss.*,CONCAT(d.departmen_name,' (',d.department_code,')') as department,CONCAT(ds.designation_name,' (',ds.grads,')') as designation,CONCAT(ad.first_name,' ',ad.last_name) as added_by_name,CONCAT(ud.first_name,' ',ud.last_name) as updated_by_name");
        $this->db->from("designation_salary_structure as dss");
        $this->db->join("department_master as d","d.department_id = dss.department_id","left");
        $this->db->join("designation_master as ds","ds.id = dss.designation_id","left");
        $this->db->join("employee_master as ad","ad.employee_id = dss.added_by","left");
        $this->db->join("employee_master as ud","ud.employee_id = dss.updated_by","left");
        if($company_id != ''){
            $this->db->where("dss.company_id", $company_id);
        }
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function insert_salary_structure_component($component_arr = []){
        if(is_valid_array($component_arr)){
         $this->db->insert_batch('designation_salary_structure_component', $component_arr);
        }
    }
    public function delete_salary_structure_component($designation_salary_structure_id = '  '){
        $this->db->where_in("designation_salary_structure_id", $designation_salary_structure_id);
        $result = $this->db->delete("designation_salary_structure_component");
        return $result;
    }
    public function update_salary_structure_component($component_arr = []){

        if(is_valid_array($component_arr)){
            $this->db->update_batch('designation_salary_structure_component',$component_arr, 'designation_salary_structure_component_id'); 
        }
    }
    public function get_employee_salary_structure($employee_id = ''){
        $this->db->select("es.*,CONCAT(em.first_name,' ',em.last_name) as employee_name,CONCAT(ad.first_name,' ',ad.last_name) as added_by_name,CONCAT(ud.first_name,' ',ud.last_name) as updated_by_name");
        $this->db->from("employee_extended_salary_structure as es");
        $this->db->join("employee_master as em","em.employee_id = es.employee_id","left");
        $this->db->join("employee_master as ad","ad.employee_id = es.added_by","left");
        $this->db->join("employee_master as ud","ud.employee_id = es.updated_by","left");
        $this->db->where("es.employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_employee_details($employee_id = ''){
        $this->db->select("em.*,CONCAT(em.first_name,' ',em.last_name) as employee_name");
        $this->db->from("employee_master as em");
        $this->db->where("em.employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_designation_salary_structure($designation_id = '',$department_id = '',$company_id = ''){
        $this->db->select("dss.*,CONCAT(d.departmen_name,' (',d.department_code,')') as department,,CONCAT(ds.designation_name,' (',ds.grads,')') as designation,c.company_name as company_name,c.company_code as company_code");
        $this->db->from("designation_salary_structure as dss");
        $this->db->join("department_master as d","d.department_id = dss.department_id","left");
        $this->db->join("designation_master as ds","ds.id = dss.designation_id","left");
        $this->db->join("companies as c","c.company_id = dss.company_id","left");
        $this->db->where("dss.designation_id", $designation_id);
        $this->db->where("dss.department_id", $department_id);
        $this->db->where("dss.company_id", $company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }

    public function get_extend_employee_salary_structure($employee_id = ''){
        $this->db->select("ess.*");
        $this->db->from("employee_extended_salary_structure as ess");
        $this->db->where("ess.employee_id", $employee_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return count($ret_data);
    }

    public function insert_extend_employee_salary_structure($insert_arr = []){
        $this->db->insert(" employee_extended_salary_structure", $insert_arr);
        $insert_id = $this->db->insert_id();
        return $insert_id;
    }
    public function insert_extend_employee_salary_structure_component($component_arr = []){
        if(is_valid_array($component_arr)){
         $this->db->insert_batch('employee_extended_salary_structure_component', $component_arr);
        }
    }
    public function check_existing_employee_salary_structure_data($effective_date_from = '',$effective_date_to = '',$employee_salary_structure_id = '',$employee_id = ''){
        $this->db->select("es.*");
        $this->db->from("employee_extended_salary_structure as es");
        if($employee_salary_structure_id > 0){
            $this->db->where("es.employee_extended_salary_structure_id !=", $employee_salary_structure_id);
        }
        $this->db->where("es.effective_from", $effective_date_from);
        $this->db->where("es.effective_to", $effective_date_to);
        $this->db->where("es.employee_id", $employee_id);    
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return count($ret_data);
    }

    public function get_employee_salary_structure_data($employee_salary_structure_id = ''){
        $this->db->select("es.*,CONCAT(d.departmen_name,' (',d.department_code,')') as department,,CONCAT(ds.designation_name,' (',ds.grads,')') as designation,c.company_name as company_name,c.company_id as company_id,d.department_id as department_id,ds.id as designation_id");
        $this->db->from("employee_extended_salary_structure as es");
        $this->db->join("employee_master as em","em.employee_id = es.employee_id","left");
        $this->db->join("department_master as d","d.department_id = em.department","left");
        $this->db->join("designation_master as ds","ds.id = em.designation","left");
        $this->db->join("companies as c","c.company_id = em.company_id","left");
        $this->db->where("es.employee_extended_salary_structure_id", $employee_salary_structure_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function get_employee_salary_structure_component($employee_salary_structure_id = ''){
        $this->db->select("ds.*");
        $this->db->from("employee_extended_salary_structure_component as ds");
        $this->db->where("ds.employee_extended_salary_structure_id", $employee_salary_structure_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function delete_employee_salary_structure_component($employee_salary_structure_id = '  '){
        $this->db->where_in("employee_extended_salary_structure_id", $employee_salary_structure_id);
        $result = $this->db->delete("employee_extended_salary_structure_component");
        return $result;
    }
    public function update_employee_salary_structure($updated_date_arr = [],$employee_salary_structure_id = ''){
        $this->db->where("employee_extended_salary_structure_id", $employee_salary_structure_id);
        $this->db->update("employee_extended_salary_structure",$updated_date_arr);
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        return $affected_row;
    }

    public function getEmployeeData($month_name = '',$employee_id = ''){
        // $company_id = $this->session->userData('company_id');
        $this->db->select('em.employee_id,em.designation,em.department,c.company_name,c.company_logo as company_logo,d.departmen_name,ds.designation_name,co.country_name,s.vState,bm.bank_name,bm.account_no,CONCAT(if(em.city is null,"",em.city)," ", s.vState," ", co.country_name) as address
        ,concat(em.first_name," ",em.last_name) as full_name,em.employee_code,em.employment_date,em.pf_number,ew.employee_week_off as week_off,em.over_time_allow,em.overtime_rate_per_hour');
        $this->db->from('employee_master em');
        $this->db->join('companies c','c.company_id = em.company_id');
        $this->db->join('department_master d','d.department_id = em.department');
        $this->db->join('designation_master	ds','ds.id = em.designation');
        $this->db->join('tbl_country_master	co','em.country = co.id');
        $this->db->join('state_master s','s.iStateId = em.state');
        $this->db->join('bank_master bm','bm.entity_type = "Employee" AND bm.entity_id = em.employee_id');
        $this->db->join('employee_week_off ew',"ew.employee_id = em.employee_id AND ew.month = '$month_name'",'left');
        if($employee_id != ''){
           $this->db->where('em.employee_id',$employee_id); 
        }
        // $this->db->where('em.company_id',$company_id);
        $query = $this->db->get();
        $employee_data = is_object($query) ? $query->result_array() : [];
        return $employee_data;
    }
    public function getDesignationComponenetData(){
        // $company_id = $this->session->userData('company_id');
        $this->db->select('ds.designation_id,ds.department_id,ds.ctc_value,dsc.*,"Designation" as type');
        $this->db->from('designation_salary_structure ds');
        $this->db->join('designation_salary_structure_component dsc','ds.designation_salary_structure_id = dsc.designation_salary_structure_id');
        // $this->db->where('ds.company_id',$company_id);
        $query = $this->db->get();
        $designation_wise_data = is_object($query) ? $query->result_array() : [];
        return $designation_wise_data;
    }

    public function getEmployeeComponenetData($emp_ids = [],$date_arr = []){
        // $company_id = $this->session->userData('company_id');
        $this->db->select('em.employee_id,em.ctc_value,esc.*,"Employee" as type');
        $this->db->from('employee_extended_salary_structure em');
        $this->db->join('employee_extended_salary_structure_component esc','em.employee_extended_salary_structure_id = esc.employee_extended_salary_structure_id');
        // $this->db->where_in('em.employee_id',$emp_ids);
        $this->db->where('em.is_default',"Yes");
        $this->db->where('em.effective_from >=',$date_arr['start_date']);
        $this->db->where("em.effective_to <=" ,$date_arr['end_date']);
        $query = $this->db->get();
        $employee_wise_data = is_object($query) ? $query->result_array() : [];
        return $employee_wise_data;
    }

    public function UpdateDefaultStructure($id = '',$e_id=''){
        $id = $id ?? 0;
        if($id == 0) return 0;
        //change the structure to default no.
        $data = array('is_default' => "No");
        $this->db->where('employee_id', $e_id);
        $this->db->update('employee_extended_salary_structure', $data);
        $data = array('is_default' => "Yes");
        $this->db->where('employee_extended_salary_structure_id', $id);
        $this->db->update('employee_extended_salary_structure', $data);
        $affected_row = $this->db->affected_rows();
        return $affected_row;

    }

    public function getLeavesData($date_arr = [],$employee_ids = []){
        $start_date = $date_arr['start_date'];
        $end_date = $date_arr['end_date'];
        $this->db->select('el.leave_start_date,el.leave_end_date,el.employee_id,el.leave_type');
        $this->db->from('employee_leave el');
        $this->db->where("el.leave_start_date >= '$start_date' AND el.leave_end_date <= '$end_date'");
        $this->db->where_in('el.employee_id',$employee_ids);
        $this->db->where('el.status','approve');
        // $this->db->group_by('el.employee_id');
        $query = $this->db->get();
        $employee_wise_data = is_object($query) ? $query->result_array() : [];
        return $employee_wise_data;
    }

    public function getAllocatedLeaves($deparment_ids = [],$designation_ids = []){
        $this->db->select('la.designation_id,la.department_id,la.total_leave');
        $this->db->from('leave_allocation la');
        $this->db->where_in('la.designation_id',$designation_ids);
        $this->db->where_in('la.department_id',$deparment_ids);
        $query = $this->db->get();
        $leaves_data = is_object($query) ? $query->result_array() : [];
        return $leaves_data;
    }

    public function getHolidayList($date_arr = []){
        $this->db->select('hm.holiday_date');
        $this->db->from('holiday_master hm');
        $this->db->where('hm.holiday_date >=',$date_arr['start_date']);
        $this->db->where('hm.holiday_date <=',$date_arr['end_date']);
        $query = $this->db->get();
        $holiday_list = is_object($query) ? $query->result_array() : [];
        return $holiday_list;
    }

    public function getAttancedence($date_arr = [],$employee_id = ''){
        $this->db->select('et.attendance_date,et.employee_id,et.attendance_in_time,et.attendance_out_time');
        $this->db->from('employee_attendance et');
        $this->db->where('et.attendance_date >=',$date_arr['start_date']);
        $this->db->where('et.attendance_date <=',$date_arr['end_date']);
        if($employee_id != ''){
            $this->db->where('et.employee_id',$employee_id);
        }
        $query = $this->db->get();
        $attendencde_dates_raw = is_object($query) ? $query->result_array() : [];
        $attendence_data = $attendence_date_comp = [];
        if(is_valid_array($attendencde_dates_raw)){
            foreach($attendencde_dates_raw as $key=>$value){
                if($value['attendance_in_time'] != '0000-00-00 00:00:00' && $value['attendance_out_time'] != '0000-00-00 00:00:00'){
                    $attendence_data[$value['employee_id']] []= $value['attendance_date'];
                    $attendence_date_comp[$value['employee_id']][$value['attendance_date']]['in_time'] = $value['attendance_in_time'];
                    $attendence_date_comp[$value['employee_id']][$value['attendance_date']]['out_time'] = $value['attendance_out_time'];
                }
            }
        }
        $return_arr['attendence_data'] = $attendence_data;
        $return_arr['in_out_employee_data'] = $attendence_date_comp;
        return $return_arr;
    }

    public function getEmployeeShiftData($employee_id = 0,$date_arr = []){
        $start_date = $date_arr['start_date'];
        $end_date = $date_arr['end_date'];
        $this->db->select('sm.start_time,sm.end_time,es.employee_ids,es.start_date,es.end_date');
        $this->db->from('employee_shift es');
        $this->db->join('shift_master sm','es.shift_id = sm.id','left');
        $this->db->where("FIND_IN_SET($employee_id, es.employee_ids) >" ,0);
        $this->db->where("es.start_date >= '$start_date' AND es.start_date <= '$end_date'");
        $this->db->where("es.end_date <= '$end_date'");
        $query = $this->db->get();
        $employee_shift_wise_data = is_object($query) ? $query->result_array() : [];
        return $employee_shift_wise_data;
    }
    public function getComboffData($date_arr = [],$employee_id =''){
        $this->db->select('ec.employee_id,ec.combo_off_date');
        $this->db->from('employee_combo_off ec');
        $this->db->where('ec.combo_off_date >=',$date_arr['start_date']);
        $this->db->where('ec.combo_off_date <=',$date_arr['end_date']);
        $this->db->where('ec.status','Approve');
        if($employee_id != ''){
            $this->db->where('ec.employee_id',$employee_id);
        }
        $query = $this->db->get();
        $employee_combo_off = is_object($query) ? $query->result_array() : [];
        return $employee_combo_off;
    }
}



?>
