<?php
defined("BASEPATH") or exit("No direct script access allowed");
class Attendance extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("attendance_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function attendance_sheet()
    {
        $current_month = date("n");
        $current_year = date("Y");
        $attendance_sheet_details = $this->attendance_model->get_attendance_details(
            $_SESSION["employee_id"],
            $current_month,
            $current_year
        );

        $data = $this->get_attendance_sheet_data($attendance_sheet_details);
        $this->smarty->view("attendance_sheet.tpl", $data);
    }
    public function employee_attendance_sheet()
    {
        $date = date("Y-m-d");
        $attendance_sheet_details = $this->attendance_model->get_employees_attendance_details($date);
        $data = $this->get_employee_attendance_sheet_data($attendance_sheet_details);
        // pr($data,1);
        $data["date"] = date("d/m/Y");
        $this->smarty->view("employees_attendance_sheet.tpl", $data);
    }
    public function get_employee_attendance_sheet_data($attendance_sheet_details = [])
    {
        $employee_all_details = $this->attendance_model->get_all_employee_details();
        $employee_details = [];
        $employee_data = [];
        foreach ($employee_all_details as $key => $value) {
            $employee_details[$value['employee_id']] = 
                    $value["employee_week_off"] != "" && $value["employee_week_off"] != null ? explode(",", $value["employee_week_off"]) : [];
            $employee_data[$value['employee_id']] = $value;
        }
        $total_work_hours = 0;
        $total_work_min = 0;
        if (count($attendance_sheet_details) > 0) {
            foreach ($attendance_sheet_details as $key => $value) {
                $week_off = $employee_details[$value['employee_id']];
                $attendance_date = new DateTime($value["attendance_date"]);
                $attendance_date = $attendance_date->format("D d");
                $attendance_sheet_details[$key]["employee_name"] = $employee_data[$value['employee_id']]['name'];
                $attendance_sheet_details[$key][
                    "attendance_date"
                ] = $attendance_date;
                $attendance_sheet_details[$key]["btn_html"] = '--';
                $attendance_sheet_details[$key]["row_class"] = '';
                if (
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null &&
                    $value["attendance_in_time"] != "0000-00-00 00:00:00"
                ) {
                    $attendance_in_time = new DateTime(
                        $value["attendance_in_time"]
                    );
                    $attendance_in_time = $attendance_in_time->format("g:i A");
                    $attendance_sheet_details[$key][
                        "attendance_in_time"
                    ] = $attendance_in_time;
                    $attendance_sheet_details[$key]["attendance"] = "P";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-present';
                } else {
                    $attendance_sheet_details[$key]["attendance"] = "A";
                    $attendance_sheet_details[$key]["attendance_in_time"] =
                        "--";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-absent';
                }

                if (
                    $value["attendance_out_time"] != "" &&
                    $value["attendance_out_time"] != null &&
                    $value["attendance_out_time"] != "0000-00-00 00:00:00"
                ) {
                    $attendance_out_time = new DateTime(
                        $value["attendance_out_time"]
                    );
                    $attendance_out_time = $attendance_out_time->format(
                        "g:i A"
                    );
                    $attendance_sheet_details[$key][
                        "attendance_out_time"
                    ] = $attendance_out_time;
                } else {
                    $attendance_sheet_details[$key]["attendance_out_time"] =
                        "--";
                }

                $working_hr = "00:00";
                if (
                    $value["attendance_out_time"] != "" &&
                    $value["attendance_out_time"] != "0000-00-00 00:00:00" &&
                    $value["attendance_out_time"] != null &&
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null
                ) {
                    $date1 = new DateTime($value["attendance_in_time"]);
                    $date2 = new DateTime($value["attendance_out_time"]);
                    $working_hr = (array) $date2->diff($date1);
                    $total_work_hours += (int) $working_hr["h"];
                    $total_work_min += (int) $working_hr["i"];
                    $working_hr =
                        str_pad($working_hr["h"], 2, "0", STR_PAD_LEFT) .
                        ":" .
                        str_pad($working_hr["i"], 2, "0", STR_PAD_LEFT);
                    // correction button
                    // if(date('M') == date('M',strtotime($value["attendance_date"])) && date('Y-m-d',strtotime($value["attendance_date"]) != date('Y-m-d'))){
                        $attendance_sheet_details[$key]["btn_html"] = '<i class="la-edit ti ti-edit" style="font-size: 26px;" data-id="'.$value['attendance_id'].'" title="Edit"></i>';
                    // }
                } elseif (
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null &&
                    $value["attendance_in_time"] != "0000-00-00 00:00:00"
                ) {
                    $date1 = new DateTime($value["attendance_in_time"]);
                    $date2 = new DateTime();
                    $working_hr = (array) $date2->diff($date1);
                    $total_work_hours += (int) $working_hr["h"];
                    $total_work_min += (int) $working_hr["i"];
                    $working_hr =
                        str_pad($working_hr["h"], 2, "0", STR_PAD_LEFT) .
                        ":" .
                        str_pad($working_hr["i"], 2, "0", STR_PAD_LEFT);
                } else {
                    $working_hr == "00:00";
                }

                $date = new DateTime($value["attendance_date"]);
                $dayName = $date->format("l");
                $attendance_sheet_details[$key]["week_off"] = "No";
                if (in_array($dayName, $week_off)) {
                    $attendance_sheet_details[$key]["week_off"] = "Yes";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-week-off';
                }
                if ($total_work_min > 60) {
                    $total_work_hours += floor($total_work_min / 60);
                    $total_work_min = $total_work_min % 60;
                }

                $attendance_sheet_details[$key]["working_hr"] = $working_hr;
                $attendance_sheet_details[$key]["correction_row"] = "No";
                if($attendance_sheet_details[$key]['correction_count'] > 0){
                    $attendance_sheet_details[$key]["correction_row"] = "Yes";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-correction';
                }
                if($attendance_sheet_details[$key]['pending_correction_count'] > 0){
                     $attendance_sheet_details[$key]["btn_html"] = '--';
                }

            }
        }
        $currentYear = date("Y"); // Get the current year
        $januaryFirst = date("$currentYear-01-01"); // Format January 1st of the current year

        $startDate = new DateTime($januaryFirst);
        $currentDate = new DateTime();
        $months = [];
        $dateInterval = new DateInterval("P1M");
        $dateRange = new DatePeriod($startDate, $dateInterval, $currentDate);
        foreach ($dateRange as $date) {
            $months[] = $date->format("F Y");
        }
        $data = [];
        $data["months"] = $months;
        // pr($attendance_sheet_details,1);
        // exit;
        $data["total_working_hours"] =
            str_pad($total_work_hours, 2, "0", STR_PAD_LEFT) .
            ":" .
            str_pad($total_work_min, 2, "0", STR_PAD_LEFT);
        $data["attendance_sheet"] = $attendance_sheet_details;
        $data["attendance_in"] = $this->config->item("shift_in_time");
        $data["attendance_out"] = $this->config->item("shift_out_time");

        return $data;
    }
    public function filter_employee_sheet_data()
    {
        $post_data = $this->input->post();
        $date = explode("/",$post_data['date']);
        $date = $date[2]."-".$date[1]."-".$date[0];
        $attendance_sheet_details = $this->attendance_model->get_employees_attendance_details($date);
        $data = $this->get_employee_attendance_sheet_data($attendance_sheet_details);
        $html = $this->smarty->fetch("filter_employee_attendance_sheet.tpl", $data);
        $return_arr["html"] = $html;
        $return_arr["total_working_hours"] = $data["total_working_hours"];
        $return_arr["message"] = "Attendance data get successfully.";
        $return_arr["success"] = 1;
        echo json_encode($return_arr);
        exit();
    }

    public function filter_sheet_data()
    {
        $employee_id = $_SESSION["employee_id"];
        $month = $this->input->post("month");
        $month_arr = $this->input->post("month_arr");
        $date = DateTime::createFromFormat("F Y", $month);
        $month_val = (int) $date->format("m");
        $year_val = (int) $date->format("Y");
        $attendance_sheet_details = $this->attendance_model->get_attendance_details(
            $employee_id,
            $month_val,
            $year_val
        );
        $data = $this->get_attendance_sheet_data($attendance_sheet_details);
        $html = $this->smarty->fetch("filter_attendance_sheet.tpl", $data);
        $return_arr["html"] = $html;
        $return_arr["total_working_hours"] = $data["total_working_hours"];
        $return_arr["message"] = "Attendance data get successfully.";
        $return_arr["success"] = 1;
        echo json_encode($return_arr);
        exit();
    }

    public function get_attendance_sheet_data($attendance_sheet_details = [])
    {
        $employee_details = $this->attendance_model->get_employee_details(
            $_SESSION["employee_id"]
        );
        $week_off =
            $employee_details[0]["employee_week_off"] != "" &&
            $employee_details[0]["employee_week_off"] != null
                ? explode(",", $employee_details[0]["employee_week_off"])
                : [];
        $total_work_hours = 0;
        $total_work_min = 0;
        if (count($attendance_sheet_details) > 0) {
            foreach ($attendance_sheet_details as $key => $value) {
                $attendance_date = new DateTime($value["attendance_date"]);
                $attendance_date = $attendance_date->format("D d");
                $attendance_sheet_details[$key][
                    "attendance_date"
                ] = $attendance_date;
                $attendance_sheet_details[$key]["btn_html"] = '--';
                $attendance_sheet_details[$key]["row_class"] = '';
                if (
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null &&
                    $value["attendance_in_time"] != "0000-00-00 00:00:00"
                ) {
                    $attendance_in_time = new DateTime(
                        $value["attendance_in_time"]
                    );
                    $attendance_in_time = $attendance_in_time->format("g:i A");
                    $attendance_sheet_details[$key][
                        "attendance_in_time"
                    ] = $attendance_in_time;
                    $attendance_sheet_details[$key]["attendance"] = "P";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-present';
                } else {
                    $attendance_sheet_details[$key]["attendance"] = "A";
                    $attendance_sheet_details[$key]["attendance_in_time"] =
                        "--";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-absent';
                }

                if (
                    $value["attendance_out_time"] != "" &&
                    $value["attendance_out_time"] != null &&
                    $value["attendance_out_time"] != "0000-00-00 00:00:00"
                ) {
                    $attendance_out_time = new DateTime(
                        $value["attendance_out_time"]
                    );
                    $attendance_out_time = $attendance_out_time->format(
                        "g:i A"
                    );
                    $attendance_sheet_details[$key][
                        "attendance_out_time"
                    ] = $attendance_out_time;
                } else {
                    $attendance_sheet_details[$key]["attendance_out_time"] =
                        "--";
                }

                $working_hr = "00:00";
                if (
                    $value["attendance_out_time"] != "" &&
                    $value["attendance_out_time"] != "0000-00-00 00:00:00" &&
                    $value["attendance_out_time"] != null &&
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null
                ) {
                    $date1 = new DateTime($value["attendance_in_time"]);
                    $date2 = new DateTime($value["attendance_out_time"]);
                    $working_hr = (array) $date2->diff($date1);
                    $total_work_hours += (int) $working_hr["h"];
                    $total_work_min += (int) $working_hr["i"];
                    $working_hr =
                        str_pad($working_hr["h"], 2, "0", STR_PAD_LEFT) .
                        ":" .
                        str_pad($working_hr["i"], 2, "0", STR_PAD_LEFT);
                    // correction button
                    if(date('M') == date('M',strtotime($value["attendance_date"])) && date('Y-m-d',strtotime($value["attendance_date"]) != date('Y-m-d'))){
                        $attendance_sheet_details[$key]["btn_html"] = '<i class="la-edit ti ti-edit" data-id="'.$value['attendance_id'].'" title="Edit"></i>';
                    }
                } elseif (
                    $value["attendance_in_time"] != "" &&
                    $value["attendance_in_time"] != null &&
                    $value["attendance_in_time"] != "0000-00-00 00:00:00"
                ) {
                    $date1 = new DateTime($value["attendance_in_time"]);
                    $date2 = new DateTime();
                    $working_hr = (array) $date2->diff($date1);
                    $total_work_hours += (int) $working_hr["h"];
                    $total_work_min += (int) $working_hr["i"];
                    $working_hr =
                        str_pad($working_hr["h"], 2, "0", STR_PAD_LEFT) .
                        ":" .
                        str_pad($working_hr["i"], 2, "0", STR_PAD_LEFT);
                } else {
                    $working_hr == "00:00";
                }

                $date = new DateTime($value["attendance_date"]);
                $dayName = $date->format("l");
                $attendance_sheet_details[$key]["week_off"] = "No";
                if (in_array($dayName, $week_off)) {
                    $attendance_sheet_details[$key]["week_off"] = "Yes";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-week-off';
                }
                if ($total_work_min > 60) {
                    $total_work_hours += floor($total_work_min / 60);
                    $total_work_min = $total_work_min % 60;
                }

                $attendance_sheet_details[$key]["working_hr"] = $working_hr;
                $attendance_sheet_details[$key]["correction_row"] = "No";
                if($attendance_sheet_details[$key]['correction_count'] > 0){
                    $attendance_sheet_details[$key]["correction_row"] = "Yes";
                    $attendance_sheet_details[$key]["row_class"] = 'timesheet-correction';
                }
                if($attendance_sheet_details[$key]['pending_correction_count'] > 0){
                     $attendance_sheet_details[$key]["btn_html"] = '--';
                }

            }
        }
        $currentYear = date("Y"); // Get the current year
        $januaryFirst = date("$currentYear-01-01"); // Format January 1st of the current year

        $startDate = new DateTime($januaryFirst);
        $currentDate = new DateTime();
        $months = [];
        $dateInterval = new DateInterval("P1M");
        $dateRange = new DatePeriod($startDate, $dateInterval, $currentDate);
        foreach ($dateRange as $date) {
            $months[] = $date->format("F Y");
        }
        $data = [];
        $data["months"] = $months;
        // pr($attendance_sheet_details,1);
        // exit;
        $data["total_working_hours"] =
            str_pad($total_work_hours, 2, "0", STR_PAD_LEFT) .
            ":" .
            str_pad($total_work_min, 2, "0", STR_PAD_LEFT);
        $data["attendance_sheet"] = $attendance_sheet_details;
        $data["attendance_in"] = $this->config->item("shift_in_time");
        $data["attendance_out"] = $this->config->item("shift_out_time");

        return $data;
    }
    public function get_correction_data()
    {
        $attendance_id = $this->input->post("attendance_id");
        $attendance = $this->attendance_model->get_attendance_summary(
            $attendance_id
        );
        $success = 0;
        if (count($attendance) > 0) {
            if (
                $attendance["attendance_in_time"] != "" &&
                $attendance["attendance_in_time"] != null &&
                $attendance["attendance_in_time"] != "0000-00-00 00:00:00"
            ) {
                $attendance_in_time = new DateTime(
                    $attendance["attendance_in_time"]
                );
                $attendance_in_time = $attendance_in_time->format("g:i A");
            } else {
                $attendance["attendance_in_time"] = "";
                $attendance_in_time = "";
            }

            if (
                $attendance["attendance_out_time"] != "" &&
                $attendance["attendance_out_time"] != null &&
                $attendance["attendance_out_time"] != "0000-00-00 00:00:00"
            ) {
                $attendance_out_time = new DateTime(
                    $attendance["attendance_out_time"]
                );
                $attendance_out_time = $attendance_out_time->format("g:i A");
            } else {
                $attendance["attendance_out_time"] = "";
                $attendance_out_time = "";
            }
            $success = 1;
            $attendance["in_time"] = $attendance_in_time;
            $attendance["out_time"] = $attendance_out_time;
        }

        $attendance["success"] = $success;
        echo json_encode($attendance);
        exit();
    }

    public function submit_correction_data()
    {
        $in_time = $this->input->post("attendance_in_time");
        $out_time = $this->input->post("attendance_out_time");
        $attendance_date = $this->input->post("attendance_date");
        $attendance_id = $this->input->post("attendance_id");
        $success = 0;
        $message = "";

        if ($in_time != "" && $out_time != "") {
            $time1 = new DateTime($attendance_date . $in_time);
            $time2 = new DateTime($attendance_date . $out_time);
            $difference = (array) $time1->diff($time2);
            $attendance_summary = $this->attendance_model->get_attendance_summary($attendance_id);
            if (
                $difference["invert"] == 0 &&
                ($difference["h"] > 0 || $difference["i"] > 0)
            ) {
                $attendance_in_time = new DateTime($attendance_date . $in_time);
                $attendance_in_time = $attendance_in_time->format(
                    "y-m-d H:i:s"
                );
                $attendance_out_time = new DateTime(
                    $attendance_date . $out_time
                );
                $attendance_out_time = $attendance_out_time->format(
                    "y-m-d H:i:s"
                );

                $insert_arr = ['attendance_id'=>$attendance_id,'attendance_in_time'=>$attendance_summary['attendance_in_time'],'attendance_out_time'=>$attendance_summary['attendance_out_time'],'attendance_correction_in_time'=>$attendance_in_time,'attendance_correction_out_time'=>$attendance_out_time,'added_by'=>$this->session->userdata("employee_id"),'added_date'=>date("Y-m-d")];
                $insert_id = $this->attendance_model->insert_attendance_correction($insert_arr);
                $message =  $insert_id > 0 ? "Attendance correction submited successfully." : "Some error.";
                $success = $insert_id > 0 ? 1 : 0;
            } elseif (
                $difference["h"] == 0 &&
                $difference["i"] == 0 &&
                $difference["invert"] == 0
            ) {
                $message =
                    "Attendance in time and attendance out time must be diffrent!";
            } else {
                $message =
                    "Attendance out time must be greater than attendance in time!";
            }
        } elseif ($in_time != "") {
            $attendance_in_time = new DateTime($attendance_date . $in_time);
            $attendance_in_time = $attendance_in_time->format("y-m-d H:i:s");
            $insert_arr = ['attendance_id'=>$attendance_id,'attendance_in_time'=>$attendance_in_time,'attendance_out_time'=>'','added_by'=>$this->session->userdata("employee_id"),'added_date'=>date("Y-m-d")];
                $insert_id = $this->attendance_model->insert_attendance_correction($insert_arr);
                $message =  $insert_id > 0 ? "Attendance correction submited successfully." : "Some error.";
                $success = $insert_id > 0 ? 1 : 0;
            // $attendance_out_time = $attendance_out_time->format('g:i A');
        }

        $retur_arr["message"] = $message;
        $retur_arr["success"] = $success;
        echo json_encode($retur_arr);
        exit();
    }
    public function attendance_correction(){
        // $column[] = [
        //     "data" => "image",
        //     "title" => "Image",
        //     "width" => "8%",
        //     "className" => "dt-center img-box",
        // ];
        $column[] = [
            "data" => "name",
            "title" => "Name",
            "width" => "12%",
            "className" => "dt-left",
        ];
        $column[] = [
            "data" => "attendance_date",
            "title" => "Attendance Date",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "attendance_in_time_val",
            "title" => "Attendance In Time",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "correction_attendance_in_time",
            "title" => "Correction In Time",
            "width" => "10%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "attendance_out_time_val",
            "title" => "Attendance Out Time",
            "width" => "15%",
            "className" => "dt-center",
        ];
        $column[] = [
            "data" => "correction_attendance_out_time",
            "title" => "Correction Out Time",
            "width" => "15%",
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
            "className" => "dt-center ",
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
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No attendance correction request data found..!</div>';
        $ajax_json["is_top_searching_enable"] = true;
        $ajax_json["sorting_column"] = json_encode([]);
        $ajax_json["page_length_arr"] = $this->config->item("page_length");
        $ajax_json["admin_url"] = base_url();
        $ajax_json["base_url"] = base_url();
        // $ajax_json['teacher_data'] = $this->session->userdata();
        $ajax_json["correction_status_arr"] = [["id"=>"Pending","val"=>"Pending"],["id"=>"Approve","val"=>"Approve"],["id"=>"Reject","val"=>"Reject"]];
        $this->smarty->view("attendance_correction.tpl", $ajax_json);
    }

    public function attendance_correction_date(){
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
            $filter_arr["attendance_date"] = '';
            $filter_arr["attendance_in_time"] = '';
            $filter_arr["correction_in_time"] = '';
            $filter_arr["attendance_out_time"] = '';
            $filter_arr["correction_out_time"] = '';
            if ($serch_params["attendance_date"] != "") {
                $start_date = DateTime::createFromFormat(
                    "m/d/Y",
                    $serch_params["attendance_date"]
                );
                $filter_arr["attendance_date"] = $start_date->format("Y-m-d");
            }
            if ($serch_params["attendance_in_time"] != "") {
                $time = DateTime::createFromFormat('g:i A',$serch_params["attendance_in_time"]);
                $filter_arr["attendance_in_time"] = $time->format("H:i");
            }
            if ($serch_params["correction_in_time"] != "") {
                $time = DateTime::createFromFormat('g:i A',$serch_params["correction_in_time"]);
                $filter_arr["correction_in_time"] = $time->format("H:i");
            }
            if ($serch_params["attendance_out_time"] != "") {
                $time = DateTime::createFromFormat('g:i A',$serch_params["attendance_out_time"]);
                $filter_arr["attendance_out_time"] = $time->format("H:i");
            }
            if ($serch_params["correction_out_time"] != "") {
                $time = DateTime::createFromFormat('g:i A',$serch_params["correction_out_time"]);
                $filter_arr["correction_out_time"] = $time->format("H:i");
            }
                
            // pr($filter_arr,1);
        }


        $correction_list = $this->attendance_model->get_attendance_correction($condition_arr,$filter_arr);
        
        foreach ($correction_list as $key => $value) {
            $correction_list[$key]['correction_attendance_in_time'] = timeFormate($value['correction_attendance_in_time']);
            $correction_list[$key]['correction_attendance_out_time'] = timeFormate($value['correction_attendance_out_time']);
            $correction_list[$key]['attendance_in_time_val'] = timeFormate($value['attendance_in_time_val']);
            $correction_list[$key]['attendance_out_time_val'] = timeFormate($value['attendance_out_time_val']);
            $correction_list[$key]['action'] = '--';
            if($value['status'] == 'Pending'){
                $correction_list[$key]['action'] = '<i class="ti ti-calendar-clock approve-reject-correction" data-id="'.$value['attendance_id_val'].'" title="Approve Correction"></i>';
            }
            $correction_list[$key]["status"] ='<span class="'.strtolower($value["status"]).'">' .
                get_status($value["status"]) .
                "</span>";
             $correction_list[$key]['attendance_date'] = date_formater($value['attendance_date']);
                
        }
        // pr($correction_list,1);
        $data["data"] = $correction_list;
        $total_record = $this->attendance_model->get_attendance_correction([],$filter_arr);
        $data["recordsTotal"] = count($total_record);
        $data["recordsFiltered"] = count($total_record);
        echo json_encode($data);
        exit();
    }
    public function submit_attendance_correction(){
        $post_data = $this->input->post();
        $attendance_correction_id = $post_data['id'];
        $status = $post_data['status'];
        $message = "Some thing went wrong!";
        $success = 0;
        $attendance_correction_data = $this->attendance_model->get_attendance_correction_details($attendance_correction_id);
        if(is_valid_array($attendance_correction_data)){
            $attendance_correction_update_arr = ["status"=>$status,"updated_by"=>$this->session->userdata("employee_id"),"updated_date"=>date("Y-m-d")];
            $attendance_update_arr = ["attendance_in_time"=>$attendance_correction_data['attendance_in_time'],"attendance_out_time"=>$attendance_correction_data['attendance_out_time']];
            $affected_row = 0;
            if($status == 'Approve'){
                $affected_row = $this->attendance_model->update_attendance($attendance_correction_data['attendance_id'],$attendance_correction_data['attendance_correction_in_time'],$attendance_correction_data['attendance_correction_out_time']);
            }

            if($affected_row > 0 || $status == 'Reject'){

                $affected_row = $this->attendance_model->update_attendance_correction($attendance_correction_update_arr,$attendance_correction_id);
                if($affected_row > 0){
                    $message = "Attendance correction ".strtolower($status)." successfully.";
                    $success = 1;
                }
            }
        }

        $retur_arr["message"] = $message;
        $retur_arr["success"] = $success;
        echo json_encode($retur_arr);
        exit();

    }
}
