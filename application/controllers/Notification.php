<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Notification extends MY_controller
{

	function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("notification_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function daily_attendance_log()
    {

        $current_date = date("Y-m-d");
        $attendance_data = $this->notification_model->get_all_attendance($current_date);
        // pr($attendance_data,1);
        $employee_wise_data = [];
        foreach ($attendance_data as $key => $value) {
            $employee_wise_data[$value["employee_id"]][] = [
                "attendance_date" => $value["attendance_date"],
            ];
        }

        $insert_attendance_arr = [];
        foreach ($employee_wise_data as $key => $value) {
            $employee_attendance_date = array_column($value, "attendance_date");
            if (!in_array($current_date, $employee_attendance_date)) {
                $insert_attendance_arr[] = [
                    "employee_id" => $key,
                    "attendance_date" => $current_date,
                    "attendance_in_time" => "0000-00-00 00:00:00",
                    "attendance_out_time" => "0000-00-00 00:00:00",
                ];
            }
        }
        
        // pr($insert_attendance_arr,1);
        if (count($insert_attendance_arr) > 0) {
            $inser_id = $this->notification_model->insert_attendance_log(
                $insert_attendance_arr
            );
        }
    }

    public function auto_out_log()
    {
        // $timeString = $this->config->item("shift_out_time");

        // // Convert time string to timestamp
        // $timestamp = strtotime($timeString);

        // // Convert timestamp to desired time format
        // $timeFormatted = date("H:i:s", $timestamp);

        $default_out_time = "11:59 PM";

        $current_date = date("Y-m-d");

        // $current_time = strtotime(date("H:i:s")); 
        // if ($timestamp < $current_time) {
            $attendance_data = $this->notification_model->get_all_attendance_in_data(
                $current_date
            );

            // pr($attendance_data,1);
            $auto_out_arr = [];
            foreach ($attendance_data as $key => $value) {
                // pr($value);



                if (
                    $value["attendance_in_time"] != "0000-00-00 00:00:00" &&
                    $value["attendance_in_time"] != null
                ) {
                    if (
                        $value["attendance_out_time"] ==
                            "0000-00-00 00:00:00" ||
                        $value["attendance_out_time"] != null
                    ) {

                        $attendance_in_time = $value["attendance_in_time"];
                        $attendance_in_time = new DateTime($attendance_in_time);

                        // Target time
                        $attendance_out_time = $value['end_time']; // 4:55 PM
                        $attendance_out_time = DateTime::createFromFormat('h:i A', $attendance_out_time);

                        if($value['end_time'] != "" && $value['end_time'] != null ){
                            if(($attendance_in_time->format('H:i') < $attendance_out_time->format('H:i') || $attendance_in_time->format('H:i') == $attendance_out_time->format('H:i'))){
                                $timestamp = strtotime($value['end_time']);
                                $timeFormatted = date("H:i:s", $timestamp);
                            }else{
                                $timestamp = strtotime($default_out_time);
                                $timeFormatted = date("H:i:s", $timestamp);
                            }
                        }else{
                            $timestamp = strtotime($default_out_time);
                            $timeFormatted = date("H:i:s", $timestamp);
                        }
                        $auto_out_arr[] = [
                            "attendance_id" => $value["attendance_id"],
                            "attendance_out_time" =>
                                $current_date . " " . $timeFormatted,
                            ];
                        
                    }
                }
                # code...
            }
            if (count($auto_out_arr) > 0) {
                $this->notification_model->auto_out_attendance($auto_out_arr);
            }
        // }
    }

    public function send_notifiction(){

        $current_date = date("Y-m-d");
        $current_notification = $this->notification_model->get_current_notification($current_date);
        foreach ($current_notification as $key => $value) {
            $employee = $this->notification_model->get_all_employee($value['company_id']);
            foreach ($employee as $k => $v) {
                $data["name"] = $v['first_name']." ".$v['last_name'];
                $data["email"] = $v['email'];
                $data["subject"] = $data["title"] = $value['title'];
                $data["templete"] = "notifiction_email_template.tpl";
                $data["type"] = "sign_up_success";
                $data["content"] = $value['content'];
                $res = $this->email_sender($data);
            }
           
            // if($res == 'Message has been sent'){
            $this->notification_model->update_notification($value['id']);
            // }
            


        }

        
        
    }


}

?>