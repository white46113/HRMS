<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Shift extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("Shift_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }


    public function shift_management()
    {
        $data["data"] = $this->Shift_model->get_shift('');
        if(count($data['data']) > 0){
          $shift_ids = array_column($data['data'], "id");
          $user_shift = $this->Shift_model->get_all_employee_shift($shift_ids);
          if(count($user_shift) > 0){
            $user_shift = array_unique(array_column($user_shift, "shift_id"));
          }
        }
        foreach ($data["data"] as $key => $value) {
                $data["data"][$key]["action"] =
                    '<span  class="edit_shift me-2 text-secondary cursor" data-id=' .
                    $value["id"] .
                    ' title="Edit"><i class=" la-edit ti ti-edit"></i></span>';
              if(!in_array($value['id'], $user_shift)){
                $data["data"][$key]["action"] .='<span class="delete_shift text-danger cursor" data-id=' .
                    $value["id"] .
                    ' title="Delete"><i class=" la-trash ti ti-trash"></i></span>';
              }

        }
         $data["no_data_message"] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No Shift Management data found..!</div>';
        $data["company_details"] = $this->Shift_model->get_companies();
        $data["selected_company"] = getCompanyId();
        $data["departments"] = $this->Shift_model->get_department($data["selected_company"]);
        if(!($data["selected_company"] > 0)){
           $data["departments"] = [];
        }
        $data["shift_type_data"] = [["id"=>"I","val"=>"I"],["id"=>"II","val"=>"II"],["id"=>"III","val"=>"III"]];
        $this->smarty->view("shift_management.tpl", $data);
    }
    public function get_department(){
      $company_id = $this->input->post("company_id");
      $data["departments"] = [];
      if($company_id > 0){
          $data["departments"] = $this->Shift_model->get_department($company_id);
      }
      // pr($data,1);
      echo json_encode($data);
      exit();
      
    }

    public function get_shift_details()
    {
        $data["data"] = [];
        if (isset($_POST["edit"])) {
            $id = $this->input->post("edit");
            $shift_details = $this->Shift_model->get_shift_details($id);

            $data["data"] = $shift_details;
        }
        echo json_encode($data);
        exit();
    }
    public function shift_action()
    {
      // pr($this->input->post_data(),1);
        if (isset($_POST["id"])) {
            $id = $this->input->post("id");
        } else {
            $id = "";
        }
        $in_time = $this->input->post("start_time");
        $out_time = $this->input->post("end_time");
        $attendance_date = date("Y-m-d");
        $time1 = new DateTime($attendance_date . $in_time);
        $time2 = new DateTime($attendance_date . $out_time);
        $difference = (array) $time1->diff($time2);
        $date1 = DateTime::createFromFormat('g:i A', $in_time);
        $date2 = DateTime::createFromFormat('g:i A', $out_time);

        // Calculate the difference
        $interval = $date1->diff($date2);
        // $difference["invert"] == 0 &&
        if (($difference["h"] > 0 || $difference["i"] > 0)) {
          if ($id == "") {
              $data = [
                  "company_id" => $this->input->post('company_id'),
                  "shift_name" => $this->input->post("shift_name"),
                  "department_id"=>$this->input->post("department_id"),
                  "shift_type" => $this->input->post("shift_type"),
                  "start_time" => $this->input->post("start_time"),
                  "end_time" => $this->input->post("end_time"),
                  "added_by" => 0,
                  "added_on" => date("Y-m-d H:i:s"),
              ];
          } else {

              $data = [
                  "id" => $this->input->post("id"),
                  // "company_id" => 2,
                  "shift_name" => $this->input->post("shift_name"),
                  "shift_type" => $this->input->post("shift_type"),
                  "start_time" => $this->input->post("start_time"),
                  "end_time" => $this->input->post("end_time"),
                  "updated_by" => 0,
                  "updated_on" => date("Y-m-d H:i:s"),
              ];
          }
          $result = $this->Shift_model->shift_action($data);
          // print_r($data);
          // pr($this->db->last_query(),1);
          if ($result < 0) {
              $success = -1;
              $message = "Shift Already Exits for this configration.";
          } elseif ($result == "update") {
              $success = 1;
              $message = "Shift Updated successfully!";
          } elseif ($result > 0) {
              $success = 1;
              $message = "Shift added successfully!";
          } else {
              $success = 0;
              $message = "Error add data.";
          }
        }else{
          $success = 0;
          $message = "Shift start time is must be greater than end time!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
    }

    public function delete_shift()
    {
        $id = $this->input->post("id");

        $result = $this->Shift_model->delete_shift($id);

        if ($result) {
            $success = 1;
            $message = "Shift Delete successfully!";
        } else {
            $success = 0;
            $message = "An error occurred. Please try again.!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    public function employee_shift()
  {
    $data["data"] = $this->Shift_model->get_employee_shift();
    $data["shift"] = $this->Shift_model->get_shift('');
    $data["employee"] = $this->Shift_model->get_employee();
    foreach ($data["data"] as $key => $value) {
      $employee_ids_string = $value['employee_ids'];
      $employee_ids_array = explode(',', $employee_ids_string);
      $data['data'][$key]["employee_ids_count"] = count($employee_ids_array);

      $data["data"][$key]["action"] =
      '<span  class="view_shift me-2 text-secondary cursor" data-id=' .
      $value["employee_shift_id"] .
      ' title="View Details"><i class="ti ti-eye"></i></span>';
      $currentDate = new DateTime();
      $startDateObj = new DateTime($value['start_date']);

      if(!($startDateObj <= $currentDate)){
          $data["data"][$key]["action"] .= '<span  class="edit_shift me-2 text-secondary cursor" data-id=' .
      $value["employee_shift_id"] .
      ' title="Edit"><i class=" la-edit ti ti-edit"></i></span>
      <span class="delete_shift text-danger cursor" data-id=' .
      $value["employee_shift_id"] .
      ' title="Delete"><i class=" la-trash ti ti-trash"></i></span>';
      }

    }
    $data["company_details"] = $this->Shift_model->get_companies();
    $data["selected_company"] = getCompanyId();
    $data["departments"] = $this->Shift_model->get_department($data["selected_company"]);
    $data["no_data_message"] =
            '<div class="p-3"><img class="p-2 no-data-found-block" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No shift groups data found..!</div>';
    $data["shift_type_data"] = [["id"=>"I","val"=>"I"],["id"=>"II","val"=>"II"],["id"=>"III","val"=>"III"]];
    $this->smarty->view("employee_shift.tpl", $data);
  }
  public function get_employee_shift_view_details()
  {
    $mode = $this->input->post("mode");
   
      $id = $this->input->post("id");
      $shift_details = $this->Shift_model->get_employee_shift_details($id);
      $shift_data = $shift_details;
      // pr($shift_data,1);
      $shiftDetails = array(
        'employee_shift_id' => $shift_data[0]['employee_shift_id'],
        'group_title' => $shift_data[0]['group_title'],
        'shift_id' => $shift_data[0]['shift_id'],
        'department_id' => $shift_data[0]['department_id'],
        'employee_ids' => explode(",",$shift_data[0]['employee_ids']),
        'start_date' => getDatePickerFormat($shift_data[0]['start_date']),
        'end_date' => getDatePickerFormat($shift_data[0]['end_date']),
        'start_date_display' => date_formater($shift_data[0]['start_date']),
        'end_date_display' => date_formater($shift_data[0]['end_date']),
        'added_by' => $shift_data[0]['added_by'],
        'added_on' => date_formater($shift_data[0]['added_on']),
        'updated_by' => date_formater($shift_data[0]['updated_by']),
        'updated_on' => $shift_data[0]['updated_on'],
        'status' => $shift_data[0]['status'],
        'id' => $shift_data[0]['id'],
        'company_id' => $shift_data[0]['company_id'],
        'shift_name' => $shift_data[0]['shift_name'],
        'shift_type' => $shift_data[0]['shift_type'],
        'start_time' => $shift_data[0]['start_time'],
        'end_time' => $shift_data[0]['end_time'],
        'employee_count'=> count(explode(",", $shift_data[0]['employee_ids'])),
        'department_name'=> $shift_data[0]['department'],
        'department_code'=> $shift_data[0]['department_code']
      );

    $employees = array();
    foreach ($shift_data as $entry) {
      $employee = array(
        'employee_id' => $entry['employee_id'],
        'first_name' => $entry['first_name'],
        'middle_name' => $entry['middle_name'],
        'last_name' => $entry['last_name'],
        'employee_code' => $entry['employee_code'],
        'role' => $entry['role'],
        'department' => $entry['department']." (".$entry['department_code'].")",
        'designation' => $entry['designation']
      );
      $employees[] = $employee;
    }
    $data['shiftDetails'] = $shiftDetails;
    $data['employees'] =$employees;
    $data['html'] = '';
   
    if($mode == "details"){
      $data['html'] = $this->smarty->fetch("employee_shift_details.tpl", $data);
    }
    
    echo json_encode($data);
    exit();
  }

  public function employee_shift_action()
  {
    if (isset($_POST["employee_shift_id"])) {
      $id = $this->input->post("employee_shift_id");
    } else {
      $id = "";
    }

    if (isset($_POST["employee_ids"])) {
      $employee_ids = $this->input->post("employee_ids");
      $employee_ids_string = $employee_ids;
    }

    if ($id == "") {

      $data = [
        "group_title" => $this->input->post("group_title"),
        "shift_id" => $this->input->post("shift_id"),
        "employee_ids" => $employee_ids_string,
        "start_date" => mysqlFormat($this->input->post("start_date")),
        "end_date" => mysqlFormat($this->input->post("end_date")),
        "added_by" => 0,
        "added_on" => date("Y-m-d H:i:s"),
      ];
    } else {

      $data = [

        "group_title" => $this->input->post("group_title"),
        "shift_id" => $this->input->post("shift_id"),
        "employee_ids" => $employee_ids_string,
        "start_date" => mysqlFormat($this->input->post("start_date")),
        "end_date" => mysqlFormat($this->input->post("end_date")),
        "updated_by" => 0,
        "updated_on" => date("Y-m-d H:i:s"),
      ];
    }
    $result = $this->Shift_model->employee_shift_action($data,$id);
  
    if ($result < 0) {
      $success = -1;
      $message = "Group Name Already Exits.";
    }elseif ($result == 'exist') {
      $success = 0;
      $message = "Employee has already been added to the shift between the two dates!";
    }elseif ($result == "update") {
      $success = 1;
      $message = "Employee Shift Updated successfully!";
    } elseif ($result > 0) {
      $success = 1;
      $message = "Employee Shift added successfully!";
    }else {
      $success = 0;
      $message = "Some thing went wrong.";
    }

    $return_arr["message"] = $message;
    $return_arr["success"] = $success;

    echo json_encode($return_arr);
    exit();
  }

  public function delete_employee_shift()
  {
    $id = $this->input->post("id");

    $result = $this->Shift_model->delete_employee_shift($id);

    if ($result) {
      $success = 1;
      $message = "Shift Delete successfully!";
    } else {
      $success = 0;
      $message = "An error occurred. Please try again.!";
    }

    $return_arr["message"] = $message;
    $return_arr["success"] = $success;
    echo json_encode($return_arr);
    exit();
  }

  public function get_shits(){
    $post_data = $this->input->post();
    $data["shift"] = $this->Shift_model->get_shift($post_data['department_id']);
    $data["employee"] = $this->Shift_model->get_department_employee($post_data['department_id']);
    echo json_encode($data);
    exit();
  }
}
