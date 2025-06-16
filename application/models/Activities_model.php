<?php
class Activities_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function add_update_announcement($data)
    {
        if (empty($data["id"])) {
            $this->db->select("*");
            $this->db->from("announcement_master");
            $this->db->where("title", $data["title"]);
            $result_obj = $this->db->get();
            $ret_data = is_object($result_obj)
                ? $result_obj->result_array()
                : [];

            if (count($ret_data) > 0) {
                $insert_id = -1;
            } else {
                $this->db->insert("announcement_master", $data);
                $insert_id = $this->db->insert_id();
            }

            return $insert_id;
        } else {
            $this->db->where("id", $data["id"]);
            $result = $this->db->update("announcement_master", $data);
            if ($result == 1) {
                $updateData = "update";
            } else {
                $updateData = "Not update";
            }
            return $updateData;
        }
    }

    public function get_announcement()
    {
        $this->db->select("*");
        $this->db->order_by("announcement_date", "ASC");
        $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("company_id", $company_id);
        }
        $result_obj = $this->db->get("announcement_master");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function get_announcement_details($id)
    {
        $this->db->select("*");
        $this->db->from("announcement_master");
        $this->db->where("id", $id);
        $result_obj = $this->db->get();
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }

    public function delete_announcement($id)
    {
        $this->db->where("id", $id);
        $result = $this->db->delete("announcement_master");
        return $result;
    }
}

?>
