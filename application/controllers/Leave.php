<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Leave extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("leave_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
        
    }

    public function leave_list_summary()
    {
        $id = $_SESSION["employee_id"];
        $current_month = date("n");
        $current_year = date("Y");
        $data_val = [];
        $data_val = $this->get_laeve_data_arr(
            $id,
            $current_month,
            $current_year,
            "list"
        );
        $data_val['leave_type'] = [["id"=>"SickLeave","val"=>"Sick Leave"],["id"=>"PaidLeave","val"=>"Paid Leave"],["id"=>"CasualLeave","val"=>"Casual Leave"]];
        $data_val['selected_month'] =(int) date('m');
        $this->smarty->view("employee_leave.tpl", $data_val);
    }
    public function leave_list_filter_data()
    {
        $id = $_SESSION["employee_id"];
        $month = $this->input->post("month");
        $month_arr = $this->input->post("month_arr");
        $date = DateTime::createFromFormat("F Y", $month);
        $current_month = (int) $date->format("m");
        $current_year = (int) $date->format("Y");
        $data_val = [];
        $data_val = $this->get_laeve_data_arr(
            $id,
            $current_month,
            $current_year,
            "filter"
        );

        $html = $this->smarty->fetch("employee_leave_filter.tpl", $data_val);
        $return_arr["html"] = $html;
        $return_arr["message"] = "Leave data get successfully.";
        $return_arr["success"] = 1;
        echo json_encode($return_arr);
        exit();
    }

    public function get_laeve_data_arr(
        $id = "",
        $current_month = "",
        $current_year = "",
        $type = "list"
    ) {
        $leave_list = $this->leave_model->get_employee_leave(
            $id,
            $current_month,
            $current_year,
            "list"
        );
        
        foreach ($leave_list as $key => $value) {
            $leave_list[$key]["action"] = "--";
            if ($value["status"] == "pending") {
                $start_date_value = new DateTime($value["leave_start_date"]);
                $start_date_value = $start_date_value->format("m/d/Y");
                $end_date_value = new DateTime($value["leave_end_date"]);
                $end_date_value = $end_date_value->format("m/d/Y");
                $currentDate = new DateTime();
                $dateToCheck = new DateTime($value["leave_start_date"]);
                if($dateToCheck < $currentDate){
                    $leave_list[$key]["action"] = display_no_character('');
                }else{
                    $leave_list[$key]["action"] =
                    '<i class="la-edit ti ti-edit" data-start-date="' .
                    $start_date_value .
                    '" datsa-end-date="' .
                    $end_date_value .
                    '" data-leave-request-id="' .
                    $value["leave_id"] .
                    '" data-leave-type="' .
                    $value["leave_type"] .
                    '"></i>';
                }
                
            }

            $leave_list[$key]["approved_by"] =
                $value["approved_by"] > 0 ? $value["approved_name"] : "--";
            $start_date = new DateTime($value["leave_start_date"]);
            $end_date = new DateTime($value["leave_end_date"]);
            $interval = (array) $end_date->diff($start_date);

            $leave_list[$key]["applied_days"] =
            $interval["days"] = 0 ? 1 : $interval["days"] + 1;
        }
        $currentYear = date("Y"); // Get the current year
        $januaryFirst = date("$currentYear-01-01"); // Format January 1st of the current year
        $startDate = new DateTime($januaryFirst);
        $currentDate = new DateTime();
        $lastDateOfYear = date("$currentYear-12-31");
        $currentDate = new DateTime($lastDateOfYear);
        $months = [];
        $dateInterval = new DateInterval("P1M");
        $dateRange = new DatePeriod($startDate, $dateInterval, $currentDate);
        foreach ($dateRange as $date) {
            $months[] = $date->format("F Y");
        }
        $data_val = $this->leave_model->get_employee_details($this->session->userdata("employee_id"));
        $data_val["months"] = $months;
        $data_val["leave_list"] = $leave_list;
        if ($type == "list") {
            $current_month = date("n");
            $current_year = date("Y");
            $appled_leave_list = $this->leave_model->get_employee_leave(
                $id,
                $current_month,
                $current_year,
                "validation"
            );
            $leave_range_arr = [];
            $date_range_arr = [];
            foreach ($appled_leave_list as $key => $value) {
                if($value['status'] != "reject"){
                    array_push($leave_range_arr, [
                        "leave_start_date" => $value["leave_start_date"],
                        "leave_end_date" => $value["leave_end_date"],
                        "leave_request_id" => $value["leave_id"],
                    ]);
                    array_push($date_range_arr, [
                        "start" => $value["leave_start_date"],
                        "end" => $value["leave_end_date"],
                    ]);
                 }
            }

            $leave_start_dates = array_column(
                $appled_leave_list,
                "leave_start_date"
            );
            $leave_end_dates = array_column(
                $appled_leave_list,
                "leave_end_date"
            );
            $dates = array_unique(
                array_merge($leave_start_dates, $leave_end_dates)
            );
            $data_val["leave_dates"] = array_values($dates);
            $data_val["leave_range_arr"] = $leave_range_arr;
            $data_val["date_range_arr"] = $date_range_arr;
        }
        $allocated_leaves = $this->leave_model->get_allocated_leaves($this->session->userdata("employee_id"));
        $data_val['allocated_leaves'] = $this->leave_model->get_employee_leave_details($this->session->userdata("employee_id"),$allocated_leaves,0);

        return $data_val;
    }

    public function add_update_leave()
    {
        // pr($this->input->post());

        $employee_id = $_SESSION["employee_id"];
        $session_date = $_SESSION;
        $post_data = $this->input->post();
        $message = "";
        $success = 0;
        $date = DateTime::createFromFormat("m/d/Y", $post_data["start_date"]);
        $post_data["start_date"] = $date->format("Y-m-d");
        $date = DateTime::createFromFormat("m/d/Y", $post_data["end_date"]);
        $post_data["end_date"] = $date->format("Y-m-d");

        $start_date = new DateTime($post_data["start_date"]);
        $end_date = new DateTime($post_data["end_date"]);
        $interval = (array) $end_date->diff($start_date);
        $applied_leave_days_val = 0 ? 1 : $interval["days"] + 1;
        $allocated_leaves = $this->leave_model->get_allocated_leaves($employee_id);
        if(isset($allocated_leaves[$post_data["leave_name"]])){
                if ($post_data["mode"] == "Add") {
                    $flag = 0;
                    if (array_key_exists("leave_range_arr", $post_data)) {
                        foreach ($post_data["leave_range_arr"] as $key => $value) {
                            if (
                                $this->isDateInRange(
                                    $value["leave_start_date"],
                                    $post_data["start_date"],
                                    $post_data["end_date"]
                                ) ||
                                $this->isDateInRange(
                                    $value["leave_end_date"],
                                    $post_data["start_date"],
                                    $post_data["end_date"]
                                )
                            ) {
                                $flag = 1;
                            }
                        }
                    }

                    if ($flag == 0) {
                       

                            $insert_arr = [
                                "employee_id" => $employee_id,
                                "leave_start_date" => $post_data["start_date"],
                                "leave_end_date" => $post_data["end_date"],
                                "leave_name" => $post_data["leave_name"],
                                "leave_type" => $post_data["leave_type"],
                                "reason" => $post_data["leave_reason"],
                                "approved_by" => 0,
                                "status" => "pending",
                                "added_date" => date("Y-m-d H:i:s"),
                            ];
                            
                            $insert_id = $this->leave_model->insert_employee_leave(
                                $insert_arr
                            );
                            if ($insert_id > 0) {
                                $success = 1;
                                $message = "Leave request added successfully.";
                                $send_data["email"] = $session_date["email"];
                                $send_data["name"] =
                                    $session_date["first_name"] .
                                    " " .
                                    $session_date["last_name"];
                                $send_data["to_date"] = $post_data["end_date"];
                                $send_data["from_date"] = $post_data["start_date"];
                                $send_data["leave_type"] =
                                    $post_data["leave_type"] == "full_day"
                                        ? "full day"
                                        : "half day";
                                $send_data["title"] = $send_data["subject"] =
                                    "Leave Application Received";
                                $send_data["templete"] = "leave_email_template.tpl";
                                $send_data["email_type"] = "request_leave";
                                $return_arr["email_sender"] = $this->email_sender(
                                    $send_data
                                );
                            } else {
                                $message = "Error!";
                            }
                        
                    } else {
                        $success = 0;
                        $message = "Aleady leave apply between two dates.";
                    }
                } elseif ($post_data["mode"] == "Update") {
                    $flag = 0;
                    if (array_key_exists("leave_range_arr", $post_data)) {
                        foreach ($post_data["leave_range_arr"] as $key => $value) {
                            if (
                                $value["leave_request_id"] ==
                                $post_data["leave_request_id"]
                            ) {
                                unset($post_data["leave_range_arr"][$key]);
                            }
                        }

                        foreach ($post_data["leave_range_arr"] as $key => $value) {
                            if (
                                $this->isDateInRange(
                                    $value["leave_start_date"],
                                    $post_data["start_date"],
                                    $post_data["end_date"]
                                ) ||
                                $this->isDateInRange(
                                    $value["leave_end_date"],
                                    $post_data["start_date"],
                                    $post_data["end_date"]
                                )
                            ) {
                                $flag = 1;
                            }
                        }
                    }
                    if ($flag == 0) {
                        
                            $update_arr = [
                                "leave_id" => $post_data["leave_request_id"],
                                "leave_start_date" => $post_data["start_date"],
                                "leave_end_date" => $post_data["end_date"],
                                "leave_name" => $post_data["leave_name"],
                                "leave_type" => $post_data["leave_type"],
                                "updated_date" => date("Y-m-d H:i:s"),
                                "reason" => $post_data["leave_reason"],
                            ];

                            $affected_row = $this->leave_model->update_employee_leave(
                                $update_arr
                            );
                            if ($affected_row > 0) {
                                $success = 1;
                                $message = "Leave request added successfully.";
                                $send_data["email"] = $session_date["email"];
                                $send_data["name"] =
                                    $session_date["first_name"] .
                                    " " .
                                    $session_date["last_name"];
                                $send_data["to_date"] = $post_data["start_date"];
                                $send_data["from_date"] = $post_data["end_date"];
                                $send_data["leave_type"] =
                                    $post_data["leave_type"] == "full_day"
                                        ? "full day"
                                        : "half day";
                                $send_data["title"] = $send_data["subject"] =
                                    "Update Leave Request";
                                $send_data["templete"] = "leave_email_template.tpl";
                                $send_data["email_type"] = "update_leave";
                                $return_arr["email_sender"] = $this->email_sender(
                                    $send_data
                                );
                            } else {
                                $message = "Error!";
                            }
                        
                    } else {
                        $success = 0;
                        $message = "Aleady leave apply between two dates.";
                    }

                    // pr($post_data['leave_range_arr'],1);
                }
            
        }else{
            $success = 0;

            $message = ucfirst(strtolower(get_status($post_data['leave_name'])))." not allocated by admin.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }
    public function isDateInRange($dateToCheck, $startDate, $endDate)
    {
        $dateToCheck = new DateTime($dateToCheck);
        $startDate = new DateTime($startDate);
        $endDate = new DateTime($endDate);

        return $dateToCheck >= $startDate && $dateToCheck <= $endDate;
    }
    public function leave_management()
    {
        $column[] = [
            "data" => "image",
            "title" => "Image",
            "width" => "8%",
            "className" => "dt-center img-box",
        ];
        $column[] = [
            "data" => "employee_name",
            "title" => "Employe Name",
            "width" => "12%",
            "className" => "dt-left",
        ];
        $column[] = [
            "data" => "employee_code",
            "title" => "Employee Code",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "from_date",
            "title" => "From Date",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "to_date",
            "title" => "To Date",
            "width" => "15%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "reason",
            "title" => "Reason",
            "width" => "15%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "applied_days",
            "title" => "Applied Leave (Days)",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "status",
            "title" => "Status",
            "width" => "10%",
            "className" => "dt-center status-row",
        ];
        $column[] = [
            "data" => "action",
            "title" => "Action",
            "width" => "10%",
            "className" => "dt-center",
        ];

        $ajax_json["data"] = $column;
        $ajax_json["is_searching_enable"] = false;
        $ajax_json["is_paging_enable"] = true;
        $ajax_json["is_serverSide"] = true;
        $ajax_json["is_ordering"] = true;
        $ajax_json["is_heading_color"] = "#a18f72";
        $ajax_json["no_data_message"] =
            '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No leave request data found..!</div>';
        $ajax_json["is_top_searching_enable"] = true;
        $ajax_json["sorting_column"] = json_encode([]);
        $ajax_json["page_length_arr"] = $this->config->item("page_length");
        $ajax_json["admin_url"] = base_url();
        $ajax_json["base_url"] = base_url();
        // $ajax_json['teacher_data'] = $this->session->userdata();

        $this->smarty->view("leave_management.tpl", $ajax_json);
    }
    public function get_employee_leaves()
    {
        $post_data = $this->input->post();

        $column_index = array_column($post_data["columns"], "data");
        $order_by = "";
        foreach ($post_data["order"] as $key => $val) {
            if ($key == 0) {
                $order_by .= $column_index[$val["column"]] . " " . $val["dir"];
            } else {
                $order_by .=
                    "," . $column_index[$val["column"]] . " " . $val["dir"];
            }
        }

        $condition_arr["order_by"] = $order_by;
        $condition_arr["start"] = $post_data["start"];
        $condition_arr["length"] = $post_data["length"];
        $base_url = $this->config->item("base_url");
        /* filter params */
        $filter_arr = [];
        if (array_key_exists("search", $post_data)) {
            $serch_params = $post_data["search"];
            $filter_arr["status"] = $serch_params["status"];
            $filter_arr["employee_name"] = $serch_params["employee_name"];
            $filter_arr["employee_code"] = $serch_params["employee_code"];
            if ($serch_params["start_date"] != "") {
                $start_date = DateTime::createFromFormat(
                    "m/d/Y",
                    $serch_params["start_date"]
                );
                $serch_params["start_date"] = $start_date->format("Y-m-d");
            }
            if ($serch_params["end_date"] != "") {
                $end_date = DateTime::createFromFormat(
                    "m/d/Y",
                    $serch_params["end_date"]
                );
                $serch_params["end_date"] = $end_date->format("Y-m-d");
            }
            $filter_arr["start_date"] = $serch_params["start_date"];
            $filter_arr["end_date"] = $serch_params["end_date"];
        }

        $leave_list = $this->leave_model->get_employee_leave_list(
            $condition_arr,
            $filter_arr
        );
        foreach ($leave_list as $key => $value) {
            $leave_list[$key]["employee_url"] =
                $base_url . "employee-details.html?id=" . $value["employee_id"];
            $leave_list[$key]["image_url"] =
                $base_url .
                "public/img/uploads/employee_profile/" .
                $value["image"];
            $leave_list[$key]["status_label"] = get_status($value["status"]);
            $leave_list[$key]["status_text"] = $value["status"];
            $leave_list[$key]["action"] = "--";
            $leave_list[$key]["image"] =
                "<img src=" .
                $base_url .
                "public/img/uploads/employee_profile/" .
                $value["image"] .
                " alt='' width='70' height='70' class='rounded-circle'>";

            $leave_list[$key]["status"] =
                '<span class="' .
                $value["status"] .
                '">' .
                get_status($value["status"]) .
                "</span>";
            $leave_list[$key]["reason"] = display_no_character(
                $value["reason"]
            );
            $start_date = new DateTime($value["from_date"]);
            $end_date = new DateTime($value["to_date"]);
            $interval = (array) $end_date->diff($start_date);
            $leave_list[$key]["applied_days"] =
                $interval["days"] == 0 ? 1 : $interval["days"] + 1;

            if ($value["status"] == "pending") {
                $employee_json = base64_encode(json_encode($leave_list[$key]));
                $leave_list[$key]["employee_json"] = $employee_json;
                $leave_list[$key]["action"] =
                    '<i class="la-check-circle ti ti-calendar-check" data-id="' .
                    $value["leave_id"] .
                    '"  data-user-details="' .$employee_json .'" title="Aprove Reject"></i>';
            }
            $leave_list[$key]["from_date"] = date_formater($value["from_date"]);
            $leave_list[$key]["to_date"] = date_formater($value["to_date"]);
            
        }
        // pr($leave_list,1);

        $data["data"] = $leave_list;
        $total_record = $this->leave_model->get_employee_leave_list(
            [],
            $filter_arr
        );
        $data["recordsTotal"] = count($total_record);
        $data["recordsFiltered"] = count($total_record);
        echo json_encode($data);
        exit();
    }
    public function get_leave_request_data(){
        $post_data = $this->input->post();
        $data['leave_list'] = $this->leave_model->get_leave_request_data($post_data['leave_id']);
        $data['leave_list']["image"] = $this->config->item("base_url") ."public/img/uploads/employee_profile/" .$data['leave_list']["image"];
        $allocated_leaves = $this->leave_model->get_allocated_leaves($data['leave_list']["employee_id"]);
        $data['allocated_leaves'] = $this->leave_model->get_employee_leave_details($this->session->userdata("employee_id"),$allocated_leaves,$post_data['leave_id']);
        $html = $this->smarty->fetch("leave_request_approve.tpl", $data);
        echo json_encode($html);
        exit();
    }
    public function update_leave_status()
    {
        $post_data = $this->input->post();
        $id = $_SESSION["employee_id"];
        $updated_date = date("Y-m-d H:i:s");
        $status = $post_data["slected_status"];
        $employee_data = $post_data["employee_data"];
        $leave_request_id = $post_data["leave_request_id"];
        $affected_row = $this->leave_model->update_leave(
            $status,
            $leave_request_id,
            $updated_date,
            $id
        );
        if ($affected_row > 0) {
            $success = 1;
            $message = "Leave status updated successfully.";
            $send_data["email"] = $employee_data["email"];
            $send_data["name"] = $employee_data["employee_name"];
            $send_data["status"] = get_status($status);
            $send_data["to_date"] = $employee_data["to_date"];
            $send_data["from_date"] = $employee_data["from_date"];
            $send_data["title"] = $send_data["subject"] =
                $status == "approve"
                    ? "Leave Approval Notification"
                    : "Leave Reaject Notification";
            $send_data["templete"] = "leave_email_template.tpl";
            $send_data["email_type"] = "aprove_reject_leave";

            $return_arr["email_sender"] = $this->email_sender($send_data);
        } else {
            $message = "Error!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }
    // leave Allocation

    public function get_designation()
    {
      $department_id=  $this->input->post("department_id");
      $data["designation"] = $this->leave_model->get_designation($department_id);
      echo json_encode($data);
      exit();
    }
      public function leave_allocation()
      {
        $data["department"] = $this->leave_model->get_department();
        $data['designation_arr'] = [];
        if(count($data["department"]) > 0){
            $department_ids = array_column($data["department"],'department_id');
           
            $data["designation_arr"] = $this->leave_model->get_designations($department_ids);
        }
        // pr($data);
        $data["data"] = $this->leave_model->get_leave_allocation();
        foreach ($data["data"] as $key => $value) {
          $data["data"][$key]["total_leave"] = $value['sick_leave']+$value['paid_leave']+$value['casual_leave'];

          $data["data"][$key]["action"] =
          '<span  class="edit_leave_allocation me-2 text-secondary cursor" data-id=' .
          $value["id"] .
          ' title="Edit"><i class=" la-edit ti ti-edit"></i></span>
          <span class="delete_leave_allocation text-danger cursor" data-id=' .
          $value["id"] .
          ' title="Delete"><i class=" la-trash ti ti-trash"></i></span>';

        }
        $data["no_data_message"] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No leave allocation data found..!</div>';

        $this->smarty->view("leave_allocation.tpl", $data);
      }



      public function get_leave_allocation_details()
      {
        $data["data"] = [];
        if (isset($_POST["edit"])) {
          $id = $this->input->post("edit");
          $holiday_details = $this->leave_model->get_leave_allocation_details($id);

          $data["data"] = $holiday_details;
        }
        echo json_encode($data);
        exit();
      }
      public function leave_allocation_action()
      {
        if (isset($_POST["id"])) {
          $id = $this->input->post("id");
        } else {
          $id = "";
        }
        $total_leave  = $this->input->post("sick_leave")+$this->input->post("paid_leave")+$this->input->post("casual_leave");
        if ($id == "") {
          $data = [
            "sick_leave" => $this->input->post("sick_leave"),
            "paid_leave" => $this->input->post("paid_leave"),
            "casual_leave" => $this->input->post("casual_leave"),
            "total_leave"=>$total_leave,
            "department_id" => $this->input->post("department_id"),
            "designation_id" => $this->input->post("designation_id"),
            "added_by" => 0,
            "added_on" => date("Y-m-d H:i:s"),
          ];
        } else {

          $data = [
            "id" => $this->input->post("id"),
            "sick_leave" => $this->input->post("sick_leave"),
            "paid_leave" => $this->input->post("paid_leave"),
            "casual_leave" => $this->input->post("casual_leave"),
            "total_leave"=>$total_leave,
            "department_id" => $this->input->post("department_id"),
            "designation_id" => $this->input->post("designation_id"),
            "updated_by" => 0,
            "updated_on" => date("Y-m-d H:i:s"),
          ];
        }
        $result = $this->leave_model->leave_allocation_action($data);
        if ($result < 0) {
          $success = -1;
          $message = "Leave Already Allocated.";
        } elseif ($result == "update") {
          $success = 1;
          $message = "Leave allocation updated successfully.";
        } elseif ($result > 0) {
          $success = 1;
          $message = "Leave allocated successfully.";
        } else {
          $success = 0;
          $message = "Error add data.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
      }

      public function delete_leave_allocation()
      {
        $id = $this->input->post("id");

        $result = $this->leave_model->delete_leave_allocation($id);

        if ($result) {
          $success = 1;
          $message = "Leave allocation successfully deleted.";
        } else {
          $success = 0;
          $message = "An error occurred. Please try again.!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
      }

      // combo_off
      public function combo_off(){
        $company_id = getCompanyId();
        $company_config = $this->leave_model->get_company_config($company_id);
        $valid_dates = $this->config->item("default_combo_off_days");
        if(is_valid_array($company_config)){
            $company_config_arr = array_column($company_config,"value","name");
            $valid_dates = $company_config_arr['combo_off_valid_day'] > 0 ? $company_config_arr['combo_off_valid_day'] : $this->config->item("default_combo_off_days");
        }
        $id = $this->session->userdata("employee_id");
        $combo_off_detail_arr = [];
        $combo_off_detail_arr['employee_data'] = $this->leave_model->get_employee_details($id);
        $currentMonth = date('m');
        $currentYear = date('Y');
        $startDate = date('Y-m-01', strtotime("$currentYear-$currentMonth-01"));
        $currentDate = date('Y-m-d');
        $startDate = date('Y-m-d', strtotime("-$valid_dates days", strtotime($currentDate)));
        $combo_off_detail_arr['startDate'] = $startDate;
        $combo_off_detail_arr['endDate'] = $currentDate;
        $shift_details = $this->leave_model->get_employee_shift_details($id,$startDate,$currentDate);
        $currentDate = date('Y-m-d');
        $attendance = $this->leave_model->get_employee_attendance($id,$startDate,$currentDate,$currentDate);
        $applied_combo_off = $this->leave_model->get_combo_off_data($id);
        $aplied_pending_cobo_off = [];
        foreach ($applied_combo_off as $key => $value) {
            $applied_combo_off[$key]['action'] = "--";

            if($value['status'] == "Pending"){
                $applied_combo_off[$key]['action'] = '<i class="la-edit ti ti-edit edit-combo-off" data-combo-off-id="' .$value['employee_combo_off_id'] .'" data-reference-date="'.getDatePickerFormat($value['reference_date']).'" data-combo-off-date="'.getDatePickerFormat($value['combo_off_date']).'" title="Edit"></i>';
            }

            if($value['status'] != "Reject"){
                array_push($aplied_pending_cobo_off, $value);
            }
        }
        $combo_off_detail_arr['applied_combo_off'] = $applied_combo_off;
        $applied_combo_off_dates = array_column($aplied_pending_cobo_off, "reference_date");
        $overall_combo_off_dates = array_column($aplied_pending_cobo_off, "combo_off_date");
        
        $overtimes_date = [];
        foreach ($attendance as $key => $value) {
            $dateToCheck = $value['attendance_date'];
            
            if(!in_array($dateToCheck, $applied_combo_off_dates)){
                foreach ($shift_details as $key_val => $val) {
                    // Start and end dates
                    $startDate = $val['start_date'];
                    $endDate = $val['end_date'];
                    // Convert dates to timestamps
                    $dateToCheckTimestamp = strtotime($dateToCheck);
                    $startDateTimestamp = strtotime($startDate);
                    $endDateTimestamp = strtotime($endDate);
                    // Check if the date falls between the start and end dates
                    if ($dateToCheckTimestamp >= $startDateTimestamp && $dateToCheckTimestamp <= $endDateTimestamp) {
                        $shift_time = $this->getmintBetweenTwoTime($val['start_time'],$val['end_time']);
                        $attendance_time = $this->getMintBetweenTwoDatetime($value['attendance_in_time'],$value['attendance_out_time']);

                        if($shift_time < $attendance_time){
                            $difference_time = $attendance_time - $shift_time;
                            $min = ($difference_time % 60) ;
                            $hours = ($difference_time - $min) / 60;
                            $over_time = str_pad($hours, 2, '0', STR_PAD_LEFT)."h ".str_pad($min, 2, '0', STR_PAD_LEFT)."m";
                            $date_arr = ["date"=>$dateToCheck,"formated_date" => getDatePickerFormat($dateToCheck),"over_time"=>$over_time];
                            array_push($overtimes_date, $date_arr);
                            
                        }
                        array_push($overall_combo_off_dates, $dateToCheck);

                    }
                }
            }else{
                array_push($overall_combo_off_dates, $dateToCheck);
            }
        }
        $combo_off_detail_arr['overtimes_date'] = $overtimes_date;
        $combo_off_detail_arr['overall_combo_off_dates'] = $overall_combo_off_dates;
        $combo_off_detail_arr["no_data_message"] = '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No combo off data found..!</div>';
        $this->smarty->view("employee_combo_off.tpl",$combo_off_detail_arr);
      }
      public function getmintBetweenTwoTime($time1 = '', $time2 = '')
        {
            // Convert the times to 24-hour format
            $time1_24 = date("H:i", strtotime($time1));
            $time2_24 = date("H:i", strtotime($time2));
            // $diff_hours = round(abs(strtotime($time2_24) - strtotime($time1_24)) / 3600, 2);
            $diff_minutes = round(abs(strtotime($time2_24) - strtotime($time1_24)) / 60);

            return $diff_minutes;
        }

      public function getMintBetweenTwoDatetime($datetime1 = '', $datetime2 = '')
      {
                // Create DateTime objects from the input datetime strings
                $dt1 = new DateTime($datetime1);
                $dt2 = new DateTime($datetime2);

            // Calculate the difference between the two DateTime objects
            $interval = $dt1->diff($dt2);

            // Calculate total hours between the two datetimes
            $total_minutes = $interval->days * 24 * 60 + $interval->h * 60 + $interval->i;

            return $total_minutes;
      }
      public function add_update_combo_off()
      {
            $post_data = $this->input->post();
            // pr($post_data,1);
            $employee_id = $this->session->userdata("employee_id");
            $combo_off_date = mysqlFormat($post_data['combo_off_date']);
            $combo_off_reason = $post_data['combo_off_reason'];

            // check exit combooff date
            $message = "some thing went wrong";
            $success = 0;
            $combo_off_data = $this->leave_model->check_combo_off_date($combo_off_date,$post_data['employee_combo_off_id']);
            if(!(count($combo_off_data) > 0)){
                $current_date = date("Y-m-d H:i:s");
                if($post_data['mode'] == 'Add'){
                    $reference_date = mysqlFormat($post_data['reference_date']);
                    $insert_arr = ["employee_id"=>$employee_id,"combo_off_date"=>$combo_off_date,"reference_date"=>$reference_date,"added_reason"=>$combo_off_reason,"over_time"=>$post_data['overtime_hours'],"status"=>"Pending","added_by"=>$employee_id,"added_date"=>$current_date];
                    $insert_id = $this->leave_model->insert_combo_off($insert_arr);
                    if($insert_id > 0){
                        $message = "Combo off added successfully.";
                        $success = 1;
                    }
                }else{
                    $employee_combo_off_id = $post_data['employee_combo_off_id'];
                    $update_arr = ["combo_off_date"=>$combo_off_date,"added_reason"=>$combo_off_reason,"updated_by"=>$employee_id,"updated_date"=>$current_date];
                    $affetced_id = $this->leave_model->update_combo_off($update_arr,$employee_combo_off_id);
                    if($affetced_id > 0){
                        $message = "Combo off updated successfully.";
                        $success = 1;
                    }                }
            }else{
                $message = "Combo off already added for the date $combo_off_date.";
                $success = 0;
            }
            
            $return_arr["message"] = $message;
            $return_arr["success"] = $success;
            // pr($return_arr,1);
            echo json_encode($return_arr);
            exit();
            
      }

      public function combo_off_list(){
        $column[] = [
            "data" => "image",
            "title" => "Image",
            "width" => "10%",
            "className" => "dt-center img-box",
        ];
        $column[] = [
            "data" => "employee_name",
            "title" => "Employee Name",
            "width" => "12%",
            "className" => "dt-left",
        ];
        $column[] = [
            "data" => "employee_code",
            "title" => "Employee Code",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "reference_date",
            "title" => "Reference Date",
            "width" => "12%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "combo_off_date",
            "title" => "Combo Off Date",
            "width" => "12%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "combo_off_reason",
            "title" => "Combo Off Reason",
            "width" => "13%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "update_reason",
            "title" => "Approve/Reject Reason",
            "width" => "13%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "status",
            "title" => "Status",
            "width" => "10%",
            "className" => "dt-center status-row",
        ];
        $column[] = [
            "data" => "action",
            "title" => "Action",
            "width" => "8%",
            "className" => "dt-center",
        ];

        $ajax_json["data"] = $column;
        $ajax_json["is_searching_enable"] = false;
        $ajax_json["is_paging_enable"] = true;
        $ajax_json["is_serverSide"] = true;
        $ajax_json["is_ordering"] = true;
        $ajax_json["is_heading_color"] = "#a18f72";
        $ajax_json["no_data_message"] =
            '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No combo off request data found..!</div>';
        $ajax_json["is_top_searching_enable"] = true;
        $ajax_json["sorting_column"] = json_encode([]);
        $ajax_json["page_length_arr"] = $this->config->item("page_length");
        $ajax_json["base_url"] = base_url();
        $ajax_json['status_arr'] = [['id'=>'Pending','val'=>'Pending'],['id'=>'Approve','val'=>'Approve'],['id'=>'Reject','val'=>'Reject']];
        // pr($ajax_json['status_arr'],1);
        $this->smarty->view("combo_off_Request.tpl", $ajax_json);
      }

     // combo off list

    public function get_combo_off_request(){
        $post_data = $this->input->post();

        $column_index = array_column($post_data["columns"], "data");
        $order_by = "";
        foreach ($post_data["order"] as $key => $val) {
            if ($key == 0) {
                $order_by .= $column_index[$val["column"]] . " " . $val["dir"];
            } else {
                $order_by .=
                    "," . $column_index[$val["column"]] . " " . $val["dir"];
            }
        }

        $condition_arr["order_by"] = $order_by;
        $condition_arr["start"] = $post_data["start"];
        $condition_arr["length"] = $post_data["length"];
        $order_by = "";
        foreach ($post_data["order"] as $key => $val) {
            if ($key == 0) {
                $order_by .= $column_index[$val["column"]] . " " . $val["dir"];
            } else {
                $order_by .=
                    "," . $column_index[$val["column"]] . " " . $val["dir"];
            }
        }
        $condition_arr["order_by"] = $order_by;
        $condition_arr["start"] = $post_data["start"];
        $condition_arr["length"] = $post_data["length"];
        $base_url = $this->config->item("base_url");
        /* filter params */
        $filter_arr = [];
        if (array_key_exists("search", $post_data)) {
            $serch_params = $post_data["search"];
            $filter_arr["status"] = $serch_params["status"];
            $filter_arr["employee_name"] = $serch_params["employee_name"];
            $filter_arr["employee_code"] = $serch_params["employee_code"];
            if ($serch_params["reference_date"] != "") {
                $serch_params["reference_date"] = mysqlFormat($serch_params["reference_date"]);
            }
            if ($serch_params["combo_off_date"] != "") {
                $serch_params["combo_off_date"] = mysqlFormat($serch_params["combo_off_date"]);
            }
            $filter_arr["combo_off_date"] = $serch_params["combo_off_date"];
            $filter_arr["reference_date"] = $serch_params["reference_date"];
            $filter_arr["combo_off_reason"] = $serch_params["combo_off_reason"];
            $filter_arr["comment"] = $serch_params["comment"];
        }

        $employee_combo_off_list = $this->leave_model->get_employee_combo_off_list($condition_arr,$filter_arr);
        // pr($employee_combo_off_list,1);
        foreach ($employee_combo_off_list as $key => $value) {
            $employee_combo_off_list[$key]['image_url']= $value['image'] = get_entiry_url('employee_profile','',$value['image']);
            $employee_combo_off_list[$key]['image'] = "<img src=" .$value['image']." alt='' width='70' height='70' class='rounded-circle'>";
            $employee_combo_off_list[$key]['employee_name'] = "<a href='".get_entiry_url('employee','View',$value['employee_id'])."' title='".$value['employee_name']."''>".$value['employee_name']."</a>";
            $employee_combo_off_list[$key]['update_reason'] = display_no_character($value['update_reason']);
            $employee_combo_off_list[$key]['status'] = '<span class="'.strtolower($value['status']).'">'.$value['status'].'</span>';
            $employee_combo_off_list[$key]['status_text'] = $value['status'];
            
            $employee_combo_off_list[$key]['action'] = '--';
            $employee_combo_off_list[$key]["other_Action"] = "";
            if($value['status'] == 'Pending'){
                $employee_data = ["employee_name"=>$value['employee_name'],"employee_code"=>$value['employee_code'],"location"=>$value['location'],"designation_name"=>$value['designation_name'],"department_name"=>$value['department_name'],"employee_week_off"=>$value['employee_week_off'],"image"=>$value['image'],"over_time"=>$value['over_time'],"combo_off_date"=>$value['combo_off_date'],"reference_date"=>$value['reference_date'],"reason"=>$value['combo_off_reason']];
                $employee_data = base64_encode(json_encode($employee_data));
                $employee_combo_off_list[$key]['action'] = "<i class='ti ti-circle-check approve-combo-off'
                data-employee='$employee_data' data-combo-off-id='".$value['employee_combo_off_id']."'
                ' title='Approve'></i>";

                $extra_par = "data-employee='$employee_data' data-combo-off-id='".$value['employee_combo_off_id']."'";
                $action_btn_arr[] = ["class"=>"approve-combo-off","title"=>"Approve","extra_par"=>$extra_par,"href"=>"javascript:void(0)"];
                $employee_combo_off_list[$key]["other_Action"] = getGridButton($action_btn_arr);
                // pr($employee_combo_off_list[$key]["other_Action"]1,1);

            }
            // $employee_details ["image"]
        }
        $data["data"] = $employee_combo_off_list;
        $total_record = $this->leave_model->get_employee_combo_off_list([],$filter_arr);
        $data["recordsTotal"] = count($total_record);
        $data["recordsFiltered"] = count($total_record);
        echo json_encode($data);
        exit();
    }

    public function update_combo_off_status(){
        $post_data = $this->input->post();
        $message = "some thing went wrong";
        $success = 0;
        $combo_off_request_id = $post_data['combo_off_request_id'];
        if($combo_off_request_id > 0){
            $id = $this->session->userdata("employee_id");
            $update_reason = $post_data['combo_off_comment'];
            $updated_date = date("Y-m-d H:i:s");
            $status = $post_data['slected_status'] == "approve" ? "Approve" : "Reject";
            $update_arr = ["status"=>$status,"update_reason"=>'',"update_reason"=>$update_reason,"updated_by"=>$id,"updated_date"=>$updated_date];
            $affected_row = $this->leave_model->update_combo_off($update_arr,$combo_off_request_id);
            if($affected_row > 0){
                $message = "Combo off request ".$post_data['slected_status']." successfully.";
                $success = 1;
            }
        }
        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }


}

?>
