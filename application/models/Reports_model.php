<?php
class Reports_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function getAttandanceData($condition_arr = [],$search_params = ""){
        $this->db->select("ea.*,em.middle_name,em.last_name,
         CONCAT(em.first_name, ' ', em.middle_name, ' ', em.last_name) AS first_name");
        $this->db->from('employee_attendance ea');
        $this->db->join('employee_master em', 'ea.employee_id = em.employee_id');
        //  if(is_valid_array($search_params) && $search_params['part_id'] > 0){
        //     $this->db->where('parts.id', $search_params['part_id']);
        // }
         if (!empty($search_params['value'])) {
            $keyword = $search_params['value'];
            $this->db->group_start(); // Start a group of OR conditions
            
            $fields = [
                'ea.attendance_date',
                'em.first_name',
                // Add more fields if needed
            ];
    
            foreach ($fields as $field) {
                $this->db->or_like($field, $keyword);
            }
    
            $this->db->group_end(); // End the group of OR conditions
        }
        if(isset($search_params['employee_id']) && $search_params['employee_id'] > 0){
            $this->db->where('em.employee_id',$search_params['employee_id']);
        }
        if(isset($search_params['startDate']) && $search_params['startDate'] != ''){
            $this->db->where('ea.attendance_date >=',formatDate($search_params['startDate'],'d-m-Y','Y-m-d'));
        }
         if(isset($search_params['endDate']) && $search_params['endDate'] != ''){
            $this->db->where('ea.attendance_date <=',formatDate($search_params['endDate'],'d-m-Y','Y-m-d'));
        }
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }
        
        $query = $this->db->get();
        $result = is_object($query)?$query->result_array():[];
        // pr($result,1);
        return $result;
    }

    public function getAttandanceDataCount($condition_arr = [],$search_params = []){
       
        $this->db->select('ea.*,em.middle_name,em.last_name,em.first_name');
        $this->db->from('employee_attendance ea');
        $this->db->join('employee_master em', 'ea.employee_id = em.employee_id');
        //  if(is_valid_array($search_params) && $search_params['part_id'] > 0){
        //     $this->db->where('parts.id', $search_params['part_id']);
        // }
         if (!empty($search_params['value'])) {
            $keyword = $search_params['value'];
            $this->db->group_start(); // Start a group of OR conditions
            
            $fields = [
               'ea.attendance_date',
                'em.first_name',
                // Add more fields if needed
            ];
    
            foreach ($fields as $field) {
                $this->db->or_like($field, $keyword);
            }
    
            $this->db->group_end(); // End the group of OR conditions
        }

       if(isset($search_params['employee_id']) && $search_params['employee_id'] > 0){
                
            $this->db->where('em.employee_id',$search_params['employee_id']);
            }
        if(isset($search_params['startDate']) && $search_params['startDate'] != ''){
            $this->db->where('ea.attendance_date >=',formatDate($search_params['startDate'],'d-m-Y','Y-m-d'));
        }
        if(isset($search_params['endDate']) && $search_params['endDate'] != ''){
            $this->db->where('ea.attendance_date <=',formatDate($search_params['endDate'],'d-m-Y','Y-m-d'));
        }
        
        $query = $this->db->get();
        $result = is_object($query)?$query->result_array():[];
       
        return $result;
    }

    public function employeeSiftdata(){
        $this->db->select('es.employee_ids,sm.start_time,sm.end_time');
        $this->db->from('employee_shift es');
        $this->db->join('shift_master sm', 'sm.id = es.shift_id');
        $query = $this->db->get();
        $result = is_object($query)?$query->result_array():[];
        return $result;
    }

    public function getEmployeeData($company_id = 0){
        $this->db->select("em.employee_id,em.first_name, em.middle_name, em.last_name, 
                   CONCAT(em.first_name, ' ', em.middle_name, ' ', em.last_name) AS full_name");
        $this->db->from('employee_master em');
        $this->db->where('em.company_id',$company_id);
        $query = $this->db->get();
        $result = is_object($query)?$query->result_array():[];
        return $result;
    }

}