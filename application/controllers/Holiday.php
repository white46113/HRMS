<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Holiday extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("holiday_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function holiday()
    {
        $data = [];
        $data["current_year"] = date("Y");
        $holiday = $this->holiday_model->get_holiday($data["current_year"], "");
        $month_wise_holiday = [];
        foreach ($holiday as $key => $value) {
            $date = $value["holiday_date"];
            $monthName = date("F", strtotime($date));
            $value["holiday_date"] = $new_date = date(
                "d F Y",
                strtotime($date)
            );
            $month_wise_holiday[$monthName][] = $value;
            # code...
        }
        $data["holiday_data"] = $month_wise_holiday;
        // $data = [];
        // pr($holiday,1);
        $this->smarty->view("holiday.tpl", $data);
    }

    public function holiday_management()
    {
        $current_year = date("Y");
        $start_year = 2020;
        $year_arr = [];
        for ($i=$start_year; $i <=$current_year ; $i++) { 
            array_push($year_arr, $i);
        }
        // $data["holiday"] = $this->holiday_model->get_holiday($current_year, "");
        $holiday_dates = [];
        // foreach ($data["holiday"] as $key => $value) {
        //     array_push($holiday_dates, $value["holiday_date"]);
        //     $currentDate = new DateTime();
        //     $holidayDate = DateTime::createFromFormat(
        //         "Y-m-d",
        //         $value["holiday_date"]
        //     );
        //     if ($holidayDate >= $currentDate) {
        //         $data["holiday"][$key]["action"] =
        //             '<span  class="edit_holiday me-2 text-secondary cursor" data-id=' .
        //             $value["id"] .
        //             ' title="Edit"><i class=" la-edit ti ti-edit"></i></span>
        //       <span class="delete_holiday text-danger cursor" data-id=' .
        //             $value["id"] .
        //             ' title="Delete"><i class=" la-trash ti ti-trash"></i></span>';
        //     } else {
        //         $data["holiday"][$key]["action"] = "--";
        //     }
        // }
        $ajax_json['year_arr'] = $year_arr;
        $ajax_json["holiday_dates"] = $holiday_dates;
        $column[] = [
            "data" => "holiday_name",
            "title" => "Holiday Name",
            "width" => "8%",
            "className" => "dt-center img-box",
        ];
        $column[] = [
            "data" => "holiday_date",
            "title" => "Holiday Date",
            "width" => "12%",
            "className" => "dt-center",
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
            '<div class="p-3 no-data-found-block" ><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No holiday management data found..!</div>';
        $ajax_json["is_top_searching_enable"] = true;
        $ajax_json["sorting_column"] = json_encode([]);
        $ajax_json["page_length_arr"] = $this->config->item("page_length");
        $ajax_json["admin_url"] = base_url();
        $ajax_json["base_url"] = base_url();

        $this->smarty->view("holiday_management.tpl", $ajax_json);
    }
     public function holiday_management_data(){
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
        $filter_arr = [];
        $holiday = $this->holiday_model->get_holiday($post_data['search']['year'], "",$condition_arr);
        $holiday_dates = [];
        foreach ($holiday as $key => $value) {
            if($post_data['search']['year'] == date("Y")){
                array_push($holiday_dates, $value["holiday_date"]);
            }
            $currentDate = new DateTime();
            $holidayDate = DateTime::createFromFormat(
                "Y-m-d",
                $value["holiday_date"]
            );
            if ($holidayDate >= $currentDate) {
                $holiday[$key]["action"] =
                    '<span  class="edit_holiday me-2 text-secondary cursor" data-id=' .
                    $value["id"] .
                    ' title="Edit"><i class=" la-edit ti ti-edit"></i></span>
              <span class="delete_holiday text-danger cursor" data-id=' .
                    $value["id"] .
                    ' title="Delete"><i class=" la-trash ti ti-trash"></i></span>';
            } else {
                $holiday[$key]["action"] = "--";
            }
            $holiday[$key]["holiday_date"] = date_formater($value['holiday_date']);
        }
        $data["holiday_dates"] = $holiday_dates;
        $data["data"] = $holiday;
        $total_record = $this->holiday_model->get_holiday('','',[]);
        $data["recordsTotal"] = count($holiday);
        $data["recordsFiltered"] = count($holiday);
        echo json_encode($data);
        exit();
     }

    public function get_holiday_details()
    {
        $data["data"] = [];
        if (isset($_POST["edit"])) {
            $id = $this->input->post("edit");
            $holiday_details = $this->holiday_model->get_holiday_details($id);
            $date = "";
            $date = DateTime::createFromFormat(
                "Y-m-d",
                $holiday_details["holiday_date"]
            );
            $holiday_details["holiday_date_fomated"] = $date->format("m/d/Y");
            $data["data"] = $holiday_details;
        }
        echo json_encode($data);
        exit();
    }
    public function holiday_action()
    {
        // pr($this->input->post(),1);
        if (isset($_POST["id"])) {
            $id = $this->input->post("id");
        } else {
            $id = "";
        }
        // print_r($_POST);
        if ($id == "") {
            $date = DateTime::createFromFormat(
                "m/d/Y",
                $this->input->post("holiday_date")
            );
            $holiday_date = $date->format("Y-m-d");
            $data = [
                "holiday_name" => $this->input->post("holiday_name"),
                "holiday_date" => $holiday_date,
                "company_id"=> $_SESSION['company_id'],
                "created_by" => $_SESSION['employee_id'],
                "created_on" => date("Y-m-d H:i:s"),
            ];
        } else {
            $date = DateTime::createFromFormat(
                "m/d/Y",
                $this->input->post("holiday_date")
            );
            $holiday_date = $date->format("Y-m-d");
            $data = [
                "id" => $this->input->post("id"),
                "holiday_name" => $this->input->post("holiday_name"),
                "holiday_date" => $holiday_date,
                "updated_by" => $_SESSION['employee_id'],
                "updated_on" => date("Y-m-d H:i:s"),
            ];
        }
        $result = $this->holiday_model->holiday_action($data);
        // print_r($data);
        if ($result < 0) {
            $success = -1;
            $message = "Holiday Already Exits.";
        } elseif ($result == "update") {
            $success = 1;
            $message = "Holiday Updated successfully!";
        } elseif ($result > 0) {
            $success = 1;
            $message = "Holiday added successfully!";
        } else {
            $success = 0;
            $message = "Error add data.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
    }

    public function delete_holiday()
    {
        $id = $this->input->post("id");

        $result = $this->holiday_model->delete_holiday($id);

        if ($result) {
            $success = 1;
            $message = "Holiday Delete successfully!";
        } else {
            $success = 0;
            $message = "An error occurred. Please try again.!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }
}
