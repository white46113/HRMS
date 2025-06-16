<?php
class Holiday_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        // $this->load->database();
    }
    public function get_holiday($year = '', $type = '',$condition_arr = [])
    {
        $this->db->select("h.*");
        $this->db->from("holiday_master as h");
        if ($year != "" && $year != null) {
            $this->db->where("YEAR(h.holiday_date)", $year);
            if ($type == "dashbord") {
                $this->db->where("h.holiday_date >=", date("Y/m/d"));
            }
        }
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("h.company_id", $company_id);
        }
        if (count($condition_arr) > 0) {
            $this->db->limit($condition_arr["length"], $condition_arr["start"]);
            if ($condition_arr["order_by"] != "") {
                $this->db->order_by($condition_arr["order_by"]);
            }
        }else{
             $this->db->order_by("h.holiday_date", "ASC");
        }
        $result_obj = $this->db->get();
        // pr($this->db->last_query(),1);
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
    public function get_holiday_details($id)
    {
        $this->db->select("*");
        $this->db->from("holiday_master");
        $this->db->where("id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
        return $ret_data;
    }
    public function delete_holiday($id)
    {
        $this->db->where("id", $id);
        $result = $this->db->delete("holiday_master");
        return $result;
    }
    public function holiday_action($data)
    {
        if (empty($data["id"])) {
            $this->db->select("*");
            $this->db->from("holiday_master");
            $this->db->where("holiday_date", $data["holiday_date"]);
            $company_id = getCompanyId();
            if($company_id > 0){
                $this->db->where("company_id", $company_id);
            }
            $result_obj = $this->db->get();
            $ret_data = is_object($result_obj)
                ? $result_obj->result_array()
                : [];

            if (count($ret_data) > 0) {
                $insert_id = -1;
            } else {
                $this->db->insert("holiday_master", $data);
                $insert_id = $this->db->insert_id();
            }

            return $insert_id;
        } else {
            $this->db->where("id", $data["id"]);
            $result = $this->db->update("holiday_master", $data);
            if ($result == 1) {
                $updateData = "update";
            } else {
                $updateData = "Not update";
            }
            return $updateData;
        }
    }
}
