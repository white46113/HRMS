<?php
class Notification_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function get_all_attendance($current_date = '')
    {
        $this->db->select("ea.*,em.*");
        $this->db->from("employee_master as em");
        $this->db->join(
            "employee_attendance as ea",
            "ea.employee_id = em.employee_id AND ea.attendance_date = '$current_date'",
            "left"
        );
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
    public function get_all_attendance_in_data($current_date = '')
    {
        $this->db->select("ea.*,es.*,sm.start_time,sm.end_time");
        $this->db->from("employee_attendance as ea");
        $this->db->join(
            "employee_shift as es",
            "FIND_IN_SET(ea.employee_id, es.employee_ids) AND es.start_date <= '$current_date' AND es.end_date >= '$current_date'",
            "left"
        );
        $this->db->join(
            "shift_master as sm",
            "sm.id = es.shift_id",
            "left"
        );
        $this->db->where("ea.attendance_date", $current_date);
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
    public function get_all_employee($company_id = '')
    {
        $this->db->select("em.*");
        $this->db->from("employee_master as em");
        $this->db->where("em.company_id", $company_id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_current_notification($current_date = ''){
        $this->db->select("am.*");
        $this->db->from("announcement_master as am");
        $this->db->where("am.announcement_date", $current_date);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function update_notification($notification_id = ''){
        $this->db->set("email_sent", "Yes");
        $this->db->where("id", $notification_id);
        $this->db->update("announcement_master");
        $affected_row = $this->db->affected_rows();
        $affected_row = $affected_row == 0 ? 1 : $affected_row;
        return $affected_row;
    }

}
?>