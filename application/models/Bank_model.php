<?php
class Bank_model extends CI_Model
{
  function __construct()
  {
    parent::__construct();
  }




  public function get_bank_listing_data($condition_arr = [],$search_params = "") {
    // pr($condition_arr,1);
    $this->db->select('bm.bank_name as bank_name, bm.branch_address as branch_address, bm.ifsc_code as ifsc_code, bm.account_type as account_type,bm.account_no as account_no, bm.account_holder_name as account_holder_name, bm.entity_type as entity_type, bm.status as status,em.employee_code as employee_code,c.company_code as company_code');
    $this->db->from("bank_master as bm");
    $this->db->join("companies as c", "c.company_id = bm.entity_id AND bm.entity_type = 'Company'", 'left');
    $this->db->join("employee_master as em", "em.employee_id = bm.entity_id AND bm.entity_type = 'Employee'", 'left');
    if (count($condition_arr) > 0) {
      $this->db->limit($condition_arr["length"], $condition_arr["start"]);
      if ($condition_arr["order_by"] != "") {
        $this->db->order_by($condition_arr["order_by"]);
      }
    }
    if (is_array($search_params) && count($search_params) > 0) {
            if ($search_params["status"] != "") {
                $this->db->where("bm.status", $search_params["status"]);
            }
            if ($search_params["bank_name"] != "") {
                $this->db->like(
                    "bm.bank_name",
                    $search_params["bank_name"]
                );
            }
            if ($search_params["branch_name"] != "") {
                $this->db->like(
                    "bm.branch_address",
                    $search_params["branch_name"]
                );
            }
            if ($search_params["ifsc_code"] != "") {
                $this->db->like(
                    "bm.ifsc_code",
                    $search_params["ifsc_code"]
                );
            }
            if ($search_params["entity_type"] != "") {
                $this->db->where(
                    "bm.entity_type",
                    $search_params["entity_type"]
                );
            }

            if($search_params['emp_com_code'] != ""){
              if ($search_params["entity_type"] == "Company") {
              $this->db->like(
                    "company_code",
                    $search_params["emp_com_code"]
                );
              }elseif ($search_params["entity_type"] == "Employee") {
                  $this->db->like(
                      "employee_code",
                      $search_params["emp_com_code"]
                  );
              }else{
                  $this->db->or_like(
                      "company_code",
                      $search_params["emp_com_code"]
                  );
                  $this->db->or_like(
                      "employee_code",
                      $search_params["emp_com_code"]
                  );
              }
            }
            


            if ($search_params["account_type"] != "") {
                $this->db->like(
                    "bm.account_type",
                    $search_params["account_type"]
                );
            }
            if ($search_params["account_number"] != "") {
                $this->db->where(
                    "bm.account_no",
                    $search_params["account_number"]
                );
            }
            if ($search_params["account_holder"] != "") {
                $this->db->where(
                    "bm.account_holder_name",
                    $search_params["account_holder"]
                );
            }
        }

    $company_id = getCompanyId();
    if($company_id > 0){
      $this->db->where("em.company_id = ".$company_id ." OR c.company_id = ".$company_id."");
      // $this->db->where_or("c.company_id", $company_id);
    }
    // $this->db->where("em.sys_record_delete !=", 1);
    $result_obj = $this->db->get();

    
    $ret_data = is_object($result_obj) ? $result_obj->result_array() : [];
    // echo $this->db->last_query();
    // exit;
    // print_r($ret_data);
    // exit;
    return $ret_data;
  }


}

?>
