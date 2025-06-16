<?php
defined("BASEPATH") or exit("No direct script access allowed");

class Activities extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model("activities_model");
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }

    public function announcement()
    {
        $id = $this->input->get("id");
        $data = [];
        if (isset($id)) {
            $announcement = $this->activities_model->get_announcement_details(
                $id
            );
            $data["announcement"] = $announcement[0];
            $data["announcement"]["announcement_date"] = getDatePickerFormat($data["announcement"]["announcement_date"]);
            
        }
            $this->smarty->view("announcement.tpl",$data);
        
    }
    public function announcement_details()
    {
        $id = $this->input->get("id");
        if (isset($id)) {
            $announcement = $this->activities_model->get_announcement_details(
                $id
            );
            $data["announcement"] = $announcement[0];
            $this->smarty->view("announcement_details.tpl", $data);
        }
    }
    public function announcement_list()
    {
        $data["announcement"] = $this->activities_model->get_announcement();
        $data["role"] = $_SESSION["role"];

        foreach ($data["announcement"] as $key => $value) {
            $currentDate = new DateTime();
            $announcementDate = DateTime::createFromFormat(
                "Y-m-d",
                $value["announcement_date"]
            );

            if ($_SESSION["role"] == "admin" || $_SESSION["role"] == "Admin") {
                $data["announcement"][$key]["action"] =
                    '<a href="announcement_details.html?id=' .
                    $value["id"] .
                    '" class="view_announcement text-success me-2" title="View" data-id="' .
                    $value["id"] .
                    '"><i class="las la-eye"></i></a>';
                if ($announcementDate > $currentDate) {
                    $data["announcement"][$key]["action"] .=
                        '<a href="announcement.html?id=' .
                        $value["id"] .
                        '" class="edit_announcement me-2 text-secondary" title="Edit" data-id="' .
                        $value["id"] .
                        '"><i class="las la-edit"></i></a><span class="delete_announcement text-danger" title="Delete" data-id="' .
                        $value["id"] .
                        '"><i class="las la-trash-alt"></i></span>';
                }
            } else {
                $data["announcement"][$key]["action"] =
                    '<a href="announcement_details.html?id=' .
                    $value["id"] .
                    '" class="view_announcement me-4 text-success" title="View" data-id="' .
                    $value["id"] .
                    '"><i class="las la-eye"></i></a>
          ';
            }
        }

        // foreach ($data["announcement"] as $key => $value) {
        //     if (
        //         ($data["announcement"][$key]["email_sent"] == "Yes" &&
        //             $_SESSION["role"] == "employee") ||
        //         $_SESSION["role"] == "admin"
        //     ){
        //         // $this->smarty->view("announcement_list.tpl", $data);
        //     } else {
        //         $data["announcement"][$key] = [];
        //         // $this->smarty->view("announcement_list.tpl", $data);
        //     }
        // }
        $this->smarty->view("announcement_list.tpl", $data);

        //   foreach ($data['announcement'] as $key => $value) {
        //     // print_r($value);
        //     $currentDate = new DateTime();
        //     $announcementDate = DateTime::createFromFormat('m/d/Y', $data['announcement'][$key]['announcement_date']);
        //
        //     if ($announcementDate > $currentDate) {
        //         if ($_SESSION['role'] == "employee") {
        //             $this->smarty->view('announcement_list.tpl', $data);
        //         } else {
        //           $data['announcement'][$key] = [];
        //             $this->smarty->view('announcement_list.tpl', $data);
        //         }
        //     }
        // }
    }

    public function add_update_announcement()
    {
        if (isset($_POST["id"])) {
            $id = $this->input->post("id");
        } else {
            $id = "";
        }

        if ($id == "") {
            $data = [
                "title" => $this->input->post("title"),
                "content" => $this->input->post("content"),
                "announcement_date" => mysqlFormat($this->input->post("announcement_date")),
                "company_id"=>$_SESSION['company_id'],
                "added_by" => 0,
                "added_on" => date("Y-m-d H:i:s"),
            ];
        } else {
            $data = [
                "id" => $id,
                "title" => $this->input->post("title"),
                "content" => $this->input->post("content"),
                "announcement_date" => mysqlFormat($this->input->post("announcement_date")),
                "updated_by" => 0,
                "updated_on" => date("Y-m-d H:i:s"),
            ];
        }
        $result = $this->activities_model->add_update_announcement($data);
        if ($result < 0) {
            $success = -1;
            $message = "Announcement Already Exits.";
        } elseif ($result == "update") {
            $success = 1;
            $message = "Announcement Updated successfully!";
        } elseif ($result > 0) {
            $success = 1;
            $message = "Announcement added successfully!";
        } else {
            $success = 0;
            $message = "Error add data.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
    }

    public function delete_announcement()
    {
        $id = $this->input->post("id");

        $result = $this->activities_model->delete_announcement($id);

        if ($result) {
            $success = 1;
            $message = "Announcement Delete successfully!";
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

?>
