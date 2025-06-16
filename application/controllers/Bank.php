<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Bank extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model("bank_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }


    public function get_bank_listing_data()
    {

        $post_data = $this->input->post();
        // pr($post_data,1);
        $column_index = array_column($_POST['columns'], "data");
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
        $list_data = $this->bank_model->get_bank_listing_data(
            $condition_arr,
            $post_data["search"]
        );
  // pr($list_data,1);
        foreach ($list_data as $key => $value) {

            $list_data[$key]["bank_name"] = $value["bank_name"] ;
            $list_data[$key]["branch_address"] = $value["branch_address"] ;
            $list_data[$key]["ifsc_code"] = $value["ifsc_code"] ;
            $list_data[$key]["account_type"] = $value["account_type"] ;
            $list_data[$key]["account_no"] = $value["account_no"] ;
            $list_data[$key]["account_holder_name"] = $value["account_holder_name"] ;
            $list_data[$key]["entity_type"] = $value["entity_type"] ;
            $list_data[$key]["employee_code"] = ($value["entity_type"] == "Employee") ? $value["employee_code"] : (($value["entity_type"] == "Company") ? $value["company_code"] : null);
            $list_data[$key]["status"] = ($value["status"] == "Active") ? '<span class="active">Active</span>' : (($value["status"] == "Inactive") ? '<span class="inactive">Inactive</span>' : null);
            // $list_data[$key]["action"] = "" ;

        }

        $data["data"] = $list_data;
        $total_record = $this->bank_model->get_bank_listing_data([], $post_data["search"]);
        $data["recordsTotal"] = count($total_record);
        $data["recordsFiltered"] = count($total_record);
        echo json_encode($data);
        exit();
    }

    public function bank_listing()
    {

      $column[] = [
          "data" => "bank_name",
          "title" => "Bank Name",
          "width" => "8%",
          "className" => "dt-left",
      ];
      $column[] = [
          "data" => "branch_address",
          "title" => "Branch Name",
          "width" => "12%",
          "className" => "dt-left",
      ];
      $column[] = [
          "data" => "ifsc_code",
          "title" => "IFSC Code",
          "width" => "9%",
          "className" => "dt-left",
      ];
      $column[] = [
          "data" => "account_type",
          "title" => "Account Type",
          "width" => "10%",
          "className" => "dt-center",
      ];
      $column[] = [
          "data" => "account_no",
          "title" => "Account Number",
          "width" => "15%",
          "className" => "dt-left",
      ];
      $column[] = [
          "data" => "account_holder_name",
          "title" => "Account Holder Name",
          "width" => "10%",
          "className" => "dt-left",
      ];
      $column[] = [
          "data" => "entity_type",
          "title" => "Entity Type",
          "width" => "10%",
          "className" => "dt-center",
      ];

      $column[] = [
          "data" => "employee_code",
          "title" => "Employee Code / Company Code",
          "width" => "10%",
          "className" => "dt-left",
      ];

      $column[] = [
          "data" => "status",
          "title" => "Status",
          "width" => "10%",
          "className" => "dt-center status-row",
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
            'public/assets/images/images/no_data_found_new.png" height="150" width="150"><br> No bank data found..!</div>';
        $ajax_json["is_top_searching_enable"] = true;
        $ajax_json["sorting_column"] = json_encode([]);
        $ajax_json["page_length_arr"] = $this->config->item("page_length");
        $ajax_json["admin_url"] = base_url();
        $ajax_json["base_url"] = base_url();
        // $ajax_json['teacher_data'] = $this->session->userdata();
        // pr($ajax_json,1);
        $this->smarty->view("bank_listing.tpl", $ajax_json);
    }

}

?>
