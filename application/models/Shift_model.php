<?php
class Shift_model extends CI_Model
{
  function __construct()
  {
    parent::__construct();
    // $this->load->database();
  }
   public function get_companies()
    {
        $this->db->select("*");
        $result_obj = $this->db->get("companies");
        $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
        return $ret_data;
    }
  public function get_shift($department_id = '')
  {
    $where = '';
    if($department_id > 0){
      $where = "AND dm.department_id = ".$department_id;
    }
    $this->db->select("s.*,c.company_name,dm.departmen_name as departmen_name,dm.department_code as department_code");
    $this->db->from("shift_master as s");
    $this->db->join('department_master as dm', 'dm.department_id = s.department_id '.$where);
    $this->db->join("companies as c", "c.company_id = s.company_id ");
    $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("s.company_id", $company_id);
        }
    $result_obj = $this->db->get();
    // pr($result_obj);
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    return $ret_data;
  }
  public function get_shift_details($id)
  {
    $this->db->select("sm.*,dm.departmen_name as departmen_name,dm.department_code as department_code");
    $this->db->from("shift_master as sm");
    $this->db->join('department_master as dm', 'dm.department_id = sm.department_id');
    $this->db->where("sm.id", $id);
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
    return $ret_data;
  }
  public function delete_shift($id)
  {
    $this->db->where("id", $id);
    $result = $this->db->delete("shift_master");
    return $result;
  }
  public function shift_action($data)
  {
    // "shift_name" => $this->input->post("shift_name"),
    // "shift_type" => $this->input->post("shift_type"),
    // "start_time" => $this->input->post("start_time"),
    // "end_time" => $this->input->post("end_time"),


    if (empty($data["id"])) {
      $this->db->select("*");
      $this->db->from("shift_master");
      // $this->db->where("shift_name", $data["shift_name"]);
      $this->db->where("department_id", $data["department_id"]);
      $this->db->where("shift_type", $data["shift_type"]);
      $result_obj = $this->db->get();

      $ret_data = is_object($result_obj)
      ? $result_obj->result_array()
      : [];

      if (count($ret_data) > 0) {
        $insert_id = -1;
      } else {
        $this->db->insert("shift_master", $data);
        $insert_id = $this->db->insert_id();
      }

      return $insert_id;
    } else {
      $this->db->where("id", $data["id"]);
      $result = $this->db->update("shift_master", $data);
      if ($result == 1) {
        $updateData = "update";
      } else {
        $updateData = "Not update";
      }
      return $updateData;
    }
  }
  public function employee_shift_action($data,$id)
  {

    // check already exist shift for employee
    $employee_ids = explode(',', $data['employee_ids']);;
    $start_date = $data['start_date'];
    $end_date = $data['end_date'];
    $this->db->select("*");
    $this->db->from("employee_shift");
    $this->db->where("('$start_date' BETWEEN start_date AND end_date OR '$end_date' BETWEEN start_date AND end_date)");
    if($id > 0){
        $this->db->where("employee_shift_id !=",$id);
    }
    $where_con = '';
    foreach ($employee_ids as $key=>$value) {
        if((count($employee_ids) == $key+1) || count($employee_ids) == 1){
            $where_con .= "FIND_IN_SET('$value', employee_ids) > 0";
        }else{
          $where_con .= "FIND_IN_SET('$value', employee_ids) > 0 OR ";
        }
        
    }
    if($where_con != ''){
      $this->db->where("(".$where_con.")");
    }
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj)? $result_obj->result_array(): [];


    if(count($ret_data) == 0){
        if (empty($id)) {
          $this->db->select("*");
          $this->db->from("employee_shift");
          $this->db->where("group_title", $data["group_title"]);
          $result_obj = $this->db->get();
          $ret_data = is_object($result_obj)
          ? $result_obj->result_array()
          : [];

          if (count($ret_data) > 0) {
            $insert_id = -1;
          } else {
            $this->db->insert("employee_shift", $data);
            $insert_id = $this->db->insert_id();
          }

          return $insert_id;
        } else {
          $this->db->where("employee_shift_id", $id);
          $result = $this->db->update("employee_shift", $data);
          if ($result == 1) {
            $updateData = "update";
          } else {
            $updateData = "Not update";
          }
          return $updateData;
        }
    }else{
      $return = "exist";
      return $return;
    }
  }
  public function get_employee_shift()
  {
    $this->db->select("*");
    $this->db->from("employee_shift as es");
    $this->db->join("shift_master as s", "s.id = es.shift_id");
    $company_id = getCompanyId();
        if($company_id > 0){
            $this->db->where("s.company_id", $company_id);
        }
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    return $ret_data;
  }
  public function get_employee_shift_details($id)
  {

    $this->db->select('es.*, sm.*, em.employee_id, em.first_name, em.middle_name, em.last_name, em.employee_code, em.role, dm.departmen_name as department,dm.department_code as department_code, em.designation');
    $this->db->from('employee_shift as es');
    $this->db->join('shift_master as sm', 'sm.id = es.shift_id');
    $this->db->join('employee_master as em', 'FIND_IN_SET(em.employee_id, es.employee_ids) > 0', 'left');
    $this->db->join('department_master as dm', 'dm.department_id = em.department');
    $this->db->where('es.employee_shift_id', $id);
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];


    // pr($this->db->last_query());
    // pr($result_obj,1);
    return $ret_data;
  }
  public function get_employee_shift_view_details($id)
  {
    $this->db->select("*");
    $this->db->from("employee_shift");
    $this->db->where("employee_shift_id", $id);
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->row_array() : [];
    return $ret_data;
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

  public function get_employee()
  {
    $this->db->select("em.*");
    $this->db->from("employee_master as em");
    $this->db->where_not_in("em.role ", ["admin","arom"]);
    $this->db->where("em.sys_record_delete !=", 1);
    $company_id = getCompanyId();
    if($company_id > 0){
      $this->db->where("em.company_id", $company_id);
    }
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    return $ret_data;
  }

  public function delete_employee_shift($id)
  {
    $this->db->where("employee_shift_id", $id);
    $result = $this->db->delete("employee_shift");
    return $result;
  }

  public function get_department_employee($department_id = '')
  {
    $this->db->select('em.employee_id,CONCAT(em.first_name," ",em.last_name," (",em.employee_code,")") as employee_name');
    $this->db->from("employee_master as em");
    $this->db->where("em.department ", $department_id);
    $this->db->where_not_in("em.role", ["arom"]);
    $this->db->where("em.sys_record_delete !=", 1);
    $company_id = getCompanyId();
    if($company_id > 0){
      $this->db->where("em.company_id", $company_id);
    }
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    return $ret_data;
  }
  public function get_all_employee_shift($shift_arr = [])
  {
    $this->db->select("es.shift_id");
    $this->db->from("employee_shift as es");
    $this->db->where_in("es.shift_id",$shift_arr);
    $result_obj = $this->db->get();
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    return $ret_data;
  }
}
