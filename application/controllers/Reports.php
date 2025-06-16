<?php
defined("BASEPATH") or exit("No direct script access allowed");
require_once('Salary.php');
class Reports extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("reports_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function attendenceReport(){
        $attandence_data = $this->reports_model->getAttandanceData();
        $sift_data = $this->reports_model->employeeSiftdata();
        foreach ($attandence_data as $key => $record) {
            $shift_start = null;
            $shift_end = null;
            foreach ($sift_data as $shift) {
                $ids = explode(',', $shift['employee_ids']);
                if (in_array($record['employee_id'], $ids)) {
                    $attandence_data[$key]['start_time'] = $shift['start_time'];
                    $attandence_data[$key]['end_time'] = $shift['end_time'];
                    break;
                }
            }
        }

    }
}