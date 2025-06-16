<?php
class Reports_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function getAttandanceData(){
        $this->db->select('ea.*,em.first_name,em.middle_name,em.last_name');
        $this->db->from('employee_attendance ea');
        $this->db->join('employee_master em', 'ea.employee_id = em.employee_id');
        $this->db->limit(10);
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

}