<?php
defined("BASEPATH") or exit("No direct script access allowed");
class Reports extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("reports_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
    }

    public function attandenceReportColumn(){
        $column[] = [
            "data" => "first_name",
            "title" => "Employee Name",
            "width" => "16%",
            "className" => "dt-left",
        ];
        $column[] = [
            "data" => "attendance_date",
            "title" => "Attendance Date",
            "width" => "17%",
            "className" => "dt-center",
        ];
         $column[] = [
            "data" => "start_time",
            "title" => "Shift Start Time",
            "width" => "10%",
            "className" => "dt-center",
			'orderable' => false
        ];
        $column[] = [
            "data" => "attendance_in_time",
            "title" => "In Time",
            "width" => "10%",
            "className" => "dt-center",
			'orderable' => false
        ];
        $column[] = [
            "data" => "end_time",
            "title" => "Shift End Time",
            "width" => "10%",
            "className" => "dt-center",
			'orderable' => false
        ];
        $column[] = [
            "data" => "attendance_out_time",
            "title" => "Out Time",
            "width" => "17%",
            "className" => "dt-center",
        ];
        $company_id = $this->session->userdata('company_id');
        $emplyoee_data = $this->reports_model->getEmployeeData($company_id);
        $data['employee_data'] = $emplyoee_data;
        $data["data"] = $column;
        $data["is_searching_enable"] = true;
        $data["is_paging_enable"] = true;
        $data["is_serverSide"] = true;
        $data["is_ordering"] = true;
        $data["is_heading_color"] = "#a18f72";
        $data["no_data_message"] =
            '<div class="p-3 no-data-found-block"><img class="p-2" src="' .
            base_url() .
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No Employee data found..!</div>';
        $data["is_top_searching_enable"] = true;
        $data["sorting_column"] = json_encode([]);
        $data["page_length_arr"] = [[10,50,100,200], [10,50,100,200]];
        $data["admin_url"] = base_url();
        $data["base_url"] = base_url();
        
        $this->smarty->view('attandence_report.tpl',$data);
		
    }

  
public function attendenceReport() {
    $order_by = "";
    $post_data = $this->input->post();
    $column_index = array_column($post_data["columns"], "data");
    foreach ($post_data["order"] as $key => $val) {
        if ($key == 0) {
            $order_by .= $column_index[$val["column"]] . " " . $val["dir"];
        } else {
            $order_by .= "," . $column_index[$val["column"]] . " " . $val["dir"];
        }
    }
    $condition_arr["order_by"] = $order_by;
    $condition_arr["start"] = $post_data["start"];
    $condition_arr["length"] = $post_data["length"];
    $attandence_data = $this->reports_model->getAttandanceData($condition_arr, $post_data["search"]);
    $sift_data = $this->reports_model->employeeSiftdata();
    
    foreach ($attandence_data as $key => $record) {
        $shift_start = null;
        $shift_end = null;
       
        $attandence_data[$key]['attendance_date'] = formatDate($record['attendance_date']);
        $attandence_data[$key]['attendance_in_time'] = formatStandardDateTime($record['attendance_in_time']);
        $attandence_data[$key]['attendance_out_time'] = formatStandardDateTime($record['attendance_out_time']);
        $attandence_data[$key]['start_time'] = '-';
        $attandence_data[$key]['end_time'] =  '-';
        foreach ($sift_data as $shift) {
            $ids = explode(',', $shift['employee_ids']);
            if (in_array($record['employee_id'], $ids)) {
                $attandence_data[$key]['start_time'] = $shift['start_time'];
                $attandence_data[$key]['end_time'] =  $shift['end_time'];
                break;
            }
        }
    }
    $column_index = array_column($post_data["columns"], "data");
    $data["data"] = $attandence_data;
    $total_record = $this->reports_model->getAttandanceDataCount($condition_arr, $post_data["search"]);
    
    $data["recordsTotal"] = count($total_record);
    $data["recordsFiltered"] = count($total_record);
    
    // Remove any debug output before this
    echo json_encode($data);
    exit; // Use exit instead of die for consistency
}
}