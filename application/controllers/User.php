<?php
defined("BASEPATH") or exit("No direct script access allowed");

class User extends MY_controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->library("session");
        $this->load->model("user_model");
        // include "application/libraries/phpqrcode/qrlib.php";
        // include "application/libraries/fpdf/fpdf.php";
        // require_once(APPPATH.'libraries/tcpdf/tcpdf.php');
        $base_url = $this->config->item("base_url");
        $this->smarty->assign("base_url", $base_url);
    }
    public function no_page_found()
    {
        $this->smarty->view("404_page.tpl");
    }
    public function login()
    {
        // pr($this->input->cookie("remember_me_user"),1);
        $remember_data = ["user_name" => "", "password" => ""];
        if (array_key_exists("remember_me_user", $this->input->cookie())) {
            $data = $this->input->cookie("remember_me_user");
            $remember_data["remember_data"] = "No";
            if ($data != "") {
                $data = (array) json_decode($data);
                $remember_data["user_name"] = $data["user_name"];
                $remember_data["password"] = $data["password"];
                $remember_data["remember_data"] = "Yes";
            }
        }

        $this->smarty->view("login.tpl", $remember_data);
    }

    public function login_action()
    {
        $email = trim($this->input->post("username"));
        $password = md5($this->input->post("password"));
        /* get login attempt */
        $user_login_attempt = $this->user_model->check_login_attempt($email);
        /* get login attempt */
        if (isset($user_login_attempt['employee_id'])) {
            if (
                $user_login_attempt["status"] != "Block" &&
                $user_login_attempt["login_attempt_failed"] < 3
            ) {
                $user = $this->user_model->check_login_credentials(
                    $email,
                    $password
                );
                $success = 0;
                if (isset($user['employee_id'])) {
                    if (!in_array($user["status"], ["Inactive", "Pending"])) {
                        /* update login attempt */
                        $attempt = 0;
                        $this->user_model->update_login_attempt(
                            $email,
                            $attempt
                        );
                        /* update login attempt */
                        $user["login"] = true;
                        $user["comapany_logo"] = base_url()."public/assets/images/logos/dark-logo.svg";
                        if($user['company_id'] > 0){
                            $company_data = $this->user_model->get_company_details($user['company_id']);
                            $path = $this->config->item("company_logo_path");
                            if($company_data['company_logo'] != '' && $company_data['company_logo'] != null){
                                $user["comapany_logo"] = base_url().$path.$company_data['company_logo'];
                            }
                            $company_config  = $this->user_model->get_company_config($user['company_id']);
                            $company_config = array_column($company_config, "value","name");
                            // pr($company_config,1);
                            $this->config->set_item('company_prefix',$company_config['company_prefix']);
                        }
                        $this->session->set_userdata($user);
                        $success = 1;
                        $message = "Login successfully!";
                        if (
                            array_key_exists("remember", $this->input->post())
                        ) {
                            $user_data = [
                                "user_name" => $email,
                                "password" => $this->input->post("password"),
                            ];
                            $this->input->set_cookie(
                                "remember_me_user",
                                json_encode($user_data),
                                time() - 3600
                            );
                        } else {

                            $this->input->set_cookie("remember_me_user", "");
                        }

                        
                    } elseif ($user["status"] == "Inactive") {
                        $message = "User temporary inactive!";
                    } elseif ($user["status"] == "Pending") {
                        $message = "User verification pending!";
                    }
                } else {
                    /* update login attempt */
                    $attempt = $user_login_attempt["login_attempt_failed"] + 1;
                    $this->user_model->update_login_attempt($email, $attempt);
                    /* update login attempt */
                    $success = 0;
                    $message = "Invalid credentials!";
                }
            } else {
                /* update login attempt */
                $status = "";
                if ($user_login_attempt["login_attempt_failed"] >= 3) {
                    $status = "Block";
                }
                $attempt = $user_login_attempt["login_attempt_failed"] + 1;
                $this->user_model->update_login_attempt(
                    $email,
                    $attempt,
                    $status
                );
                /* update login attempt */
                $success = 0;
                $message = "User temporary block!";
            }
        } else {
            $success = 0;
            $message = "User not exist with this email!";
        }
        // pr($user_login_attempt,1);

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }
    public function signup()
    {
        // sign up
        $data["country"] = $this->user_model->get_country();
        $data["state"] = $this->user_model->get_state();
        $this->smarty->view("signup.tpl", $data);
    }
    public function signup_action()
    {
        $data = [
            "first_name" => $this->input->post("first_name"),
            "last_name" => $this->input->post("last_name"),
            "tel_number" => $this->input->post("country_id"),
            "phone_number" => $this->input->post("mobile_number"),
            "email" => $this->input->post("email"),
            "user_type" => $this->input->post("user_type"),
            "password" => $this->input->post("password"),
            "created_by" => 0,
            "created_on" => date("Y-m-d H:i:s"),
        ];

        $result = $this->user_model->insert_user_data($data);

        if ($result < 0) {
            $success = -1;
            $message = "Email Already Exits.";
        } elseif ($result) {
            $success = 1;
            $message = "Data add successfully!";
        } else {
            $success = 0;
            $message = "Error add data.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;

        echo json_encode($return_arr);
        exit();
    }

    public function log_out()
    {
        unset($_SESSION["userdata"]);
        session_destroy();
        redirect("/login.html");
    }
    public function forgot_password()
    {
        $this->smarty->view("forgot_password.tpl");
    }
    public function verify_user()
    {
        $email = trim($this->input->post("username"));
        $user = $this->user_model->check_user_email($email);
        $success = 0;
        if ($user["employee_id"] > 0 && $user["sys_record_delete"] != 1) {
            $message = "Otp send successfully.";
            $data["name"] = $user["first_name"] . " " . $user["last_name"];
            $data["email"] = $user["email"];
            $data["otp"] = rand(1000, 999999);
            $data["type"] = "send_otp";
            $data["subject"] = $data["title"] = "OTP Verification For Employee";
            $data["templete"] = "otp_email.tpl";
            $affected_row = $this->user_model->update_employee_otp(
                $user["employee_id"],
                $data["otp"]
            );
            if ($affected_row > 0) {
                $success = 1;
                $email_notification = $this->user_model->get_compnay_email_notification($user['company_id']);
                $email_notification = $email_notification =='Yes' ? true :false;
                $return_arr["email_send_message"] = $this->email_sender($data,$email_notification);
            } else {
                $message = "Error!";
            }
            $return_arr["email"] = $user["email"];
        } else {
            $success = 0;
            $message = "User not exist!";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }
    public function change_password()
    {
        $email = $this->input->post("email");
        $password = $this->input->post("password");
        $otp = $this->input->post("otp");
        $user = $this->user_model->verify_employee_otp($email, $otp);
        $success = 0;
        if ($user["employee_id"] > 0) {
            $password = md5($password);
            $affected_row = $this->user_model->update_employee_password(
                $user["employee_id"],
                $password
            );
            if ($affected_row > 0) {
                $message = "Password successfully updated.";
                $data["name"] = $user["first_name"] . " " . $user["last_name"];
                $data["email"] = $user["email"];
                $data["subject"] = $data["title"] =
                    "Password Updated Successfully";
                $data["type"] = "password_updated";
                $data["templete"] = "otp_email.tpl";
                $return_arr["email_send_message"] = $this->email_sender($data);
                $success = 1;
            } else {
                $message = "Error!";
            }
        } else {
            $success = 0;
            $message = "Invalid otp.";
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    // employee Add form
    public function attendance()
    {
        $type = $this->input->get();

        $company_prifix["type"] = "web";
        if (array_key_exists("type", $type)) {
            $company_prifix["type"] = "Tab";
        }
        $company_prifix["prefix"] = base64_decode($type['prefix']);
        $company_data = $this->user_model->get_company_logo($company_prifix['prefix']);
        $comapany_logo = base_url()."public/assets/images/logos/dark-logo.svg";
        $path = $this->config->item("company_logo_path");
        if($company_data['company_logo'] != '' && $company_data['company_logo'] != null){
            $comapany_logo = base_url().$path.$company_data['company_logo'];
        }
        $company_prifix["logo"] = $comapany_logo;
        $this->smarty->view("attendance.tpl", $company_prifix);
       
        
    }

    public function send_email()
    {
        // $category_arr = [];
        // $cat_data = $this->user_model->get_cat();
        // $final_html = "";
        // foreach ($cat_data as $key => $value) {
        //     $html = "";
        //     if ($value["parent_id"] == 0) {
        //         $html .=
        //             "<ul> <li class='category_" .
        //             $value["id"] .
        //             "'>" .
        //             $value["category_name"] .
        //             "</li>";
        //         $child = $this->get_child($cat_data, $value["id"]);

        //         $category = [
        //             "category" => $value["category_name"],
        //             "id" => $value["id"],
        //             "child" => $child,
        //             "html" => $html,
        //         ];
        //         if (count($child) > 0) {
        //             foreach ($child as $key_val => $val) {
        //                 if (array_key_exists("html", $child[$key_val])) {
        //                     $html .= $child[$key_val]["html"];
        //                 }
        //             }
        //         }
        //         $html .= "</ul>";
        //         $category["html"] = $html;
        //         $final_html .= $html;
        //         array_push($category_arr, $category);
        //     }
        // }
        // $category_arr["html"] = $final_html;
        // pr($category_arr, 1);
        $data["name"] = "Aarbaj Mulla";
        $data["email"] = "mullaaarbaj10@yopmail.com";
        $data["subject"] = $data["title"] = "Sign In";
        $data["employee_code"] = "MDN-123";
        $data["user_name"] = "aarbaj@#0811";
        $data["templete"] = "email_template.tpl";
        $data["type"] = "sign_up_success";
        $data["type"] = "activate_account";
        pr($this->email_sender($data));
    }

    public function get_child($cat_data, $parent_id)
    {
        $child_data = [];
        foreach ($cat_data as $key => $value) {
            $html = "";
            if ($value["parent_id"] == $parent_id) {
                $html .=
                    "<ul> <li class='category_" .
                    $value["id"] .
                    "'>" .
                    $value["category_name"] .
                    "</li>";
                $child = $this->get_child($cat_data, $value["id"]);

                $category = [
                    "category" => $value["category_name"],
                    "id" => $value["id"],
                    "child" => $child,
                    "html" => $html,
                ];

                if (count($child) > 0) {
                    foreach ($child as $key_val => $val) {
                        if (array_key_exists("html", $child[$key_val])) {
                            $html .= $child[$key_val]["html"];
                        }
                    }
                }
                $html .= "</ul>";
                $category["html"] = $html;
                array_push($child_data, $category);
            }
        }
        return $child_data;
    }

    public function add_employee()
    {
        $data["country"] = $this->user_model->get_country();
        $data["state"] = $this->user_model->get_state();
        $this->smarty->view("employee_signup.tpl", $data);
    }
    public function employee_email()
    {

        if(array_key_exists("email", $this->input->post())){
            $email = $this->input->post("email");
        }else{
            $email = $this->input->post("work_email");
        }

        $mode = $this->input->post("mode");
        $employee_id = $mode == "Update" ? $this->input->post("employee_id") : "";

        $valid = $this->user_model->employee_email_validation($email,$mode,$employee_id);

        if ($valid == "Yes") {
            echo "false";
        } else {
            echo "true";
        }

        exit();
    }

    public function employee_registration_action()
    {


        $upload_error = 0;
        $upload_data = [];
        if($_FILES['profile_image']['name'] != ""){

            $profileImageData =
                $_FILES["profile_image"]["name"] != ""
                    ? $_FILES["profile_image"]
                    : [];
            $config["upload_path"] = "public/img/uploads/employee_profile/";
            $config["allowed_types"] = "gif|jpg|png|jpeg|png";

            $this->load->library("upload", $config);
            $upload_error_msg = "";
            if (!empty($profileImageData)) {
                if (!$this->upload->do_upload("profile_image")) {
                    $upload_error_msg = $error = [
                        "error" => $this->upload->display_errors(),
                    ];
                    $upload_error = 1;
                } else {

                    $upload_data = $this->upload->data();
                }
            }
        }

        $post_data  = $this->input->post();
        if ($upload_error == 0 && $post_data['mode'] == "Add") {
            $last_employee_code = $this->user_model->get_last_employee_code($post_data['company']);
            $company_prifix = $this->user_model->get_compnay_prefix($post_data['company']);
            if($this->session->userdata('role') == 'arom'){
                $attendance_pin = $this->user_model->get_compnay_attendance_pin($post_data['company']);
            }else{
                $attendance_pin = $this->config->item("attendance_pin");
            }
            // pr($post_data['company'],1);
            $employee_code =
                $company_prifix .
                "-" .
                str_pad($last_employee_code + 1, 5, "0", STR_PAD_LEFT);
            $data = [
                "first_name" => $post_data["first_name"],
                "middle_name" => $post_data["middle_name"],
                "last_name" => $post_data["last_name"],
                "employee_code" => $employee_code,
                "role" => $post_data["employement_type"],
                "email" => trim($post_data["email"]),
                "phone_code" => $post_data["phone_code"],
                "mobile_number" => $post_data["mobile_number"],
                "secondary_mobile_code" => $post_data["secondary_number_code"],
                "secondary_mobile_number" => $post_data["secondary_number"],
                "dob" => date_format(
                    date_create($post_data["dob"]),
                    "Y-m-d"
                ),
                "gender" => $post_data["gender"],
                "marital_status" => $post_data["marital_status"],
                "country" => $post_data["country"],
                "state" => $post_data["state"],
                "city" => $post_data["city"],
                "address" => $post_data["address"],
                "zipcode" => $post_data["zipcode"],
                "department" => $post_data["department"],
                "designation" => $post_data["designation"],
                "employment_date" => date_format(
                    date_create($post_data["employement_date"]),
                    "Y-m-d"
                ),
                "password" => md5($post_data["password"]),
                "profile_image" => $upload_data["file_name"],
                "reporting_manager" => $post_data["manager"],
                "employee_week_off" => $post_data["week_off"],
                "work_mobile_code" => $post_data["work_mobile_number_code"],
                "work_mobile_number" => $post_data["work_mobile_number"],
                "work_email" => trim($post_data["work_email"]),
                "over_time_allow" => $post_data["overtime_allow"],
                "overtime_rate_per_hour"=>removeNumberFormate($post_data['overtime_rate_per_hour']),
                "education_degree" => $post_data["degree_name"],
                "education_feild" => $post_data["education_field"],
                "education_college" => $post_data["college_name"],
                "education_pass_out_year" => $post_data["pass_out_year"],
                "aadhar_number" => $post_data["aadhar_number"],
                "pan_card_number" => $post_data["pan_card_number"],
                "pf_number" => $post_data["pf_number"],
                "uan_number" => $post_data["uan_number"],
                "company_id" => $post_data['company'],
                "status" => "Pending",
                "attendance_pin"=> $attendance_pin,
                "created_by" => $_SESSION['employee_id'],
                "created_on" => date("Y-m-d H:i:s"),
            ];

            $result = $this->user_model->insert_employee_data($data);
            if ($result < 0) {
                $success = -1;
                $message = "Email Already Exits.";
            } elseif ($result > 0) {

                /* insert week off */
                $week_off_arr = [
                    "employee_id" => $result,
                    "employee_week_off" => $this->input->post("week_off"),
                    "month" => date("F"),
                    "added_date" => date("Y-m-d H:i:s"),
                ];
                $this->user_model->insert_employee_week_off($week_off_arr);

                /* add bank */
                $bank_insert_arr = [];
                foreach ($post_data['bank_name'] as $key => $value) {
                    $bank_insert_arr[$key]['bank_name'] = $post_data['bank_name'][$key];
                    $bank_insert_arr[$key]['branch_address'] = $post_data['branch_address'][$key];
                    $bank_insert_arr[$key]['ifsc_code'] = $post_data['ifsc_code'][$key];
                    $bank_insert_arr[$key]['account_type'] = $post_data['account_type'][$key];
                    $bank_insert_arr[$key]['account_no'] = $post_data['account_number'][$key];
                    $bank_insert_arr[$key]['account_holder_name'] = $post_data['account_holder_name'][$key];
                    if(array_key_exists($key,$post_data['defaul_bank'])){
                        $bank_insert_arr[$key]['default_bank'] = $post_data['defaul_bank'][$key];
                    }else{
                        $bank_insert_arr[$key]['default_bank'] = "No";
                    }
                    $bank_insert_arr[$key]['entity_type'] = 'Employee';
                    $bank_insert_arr[$key]['entity_id'] = $result;
                    $bank_insert_arr[$key]['added_by'] = 0;
                    $bank_insert_arr[$key]['added_on'] = date("Y-m-d H:i:s");
                }
                if(count($bank_insert_arr) > 0){
                    $this->user_model->insert_employee_bank($bank_insert_arr);
                }

                $success = 1;
                $message = "Employee added successfully!";
                $send_data["email"] = $this->input->post("email");
                $send_data["name"] =
                    $this->input->post("first_name") .
                    " " .
                    $this->input->post("last_name");
                $send_data["employee_code"] = $employee_code;
                $send_data["title"] = $send_data["subject"] =
                    "Signup successfully";
                $send_data["type"] = "sign_up_success";
                $send_data["templete"] = "email_template.tpl";
                // $this->email_sender($send_data);
                $return_arr["email_sender"] = $this->email_sender($send_data);
            } else {
                $success = 0;
                $message = "Error add data.";
            }
        }else if($post_data['mode'] == "Update" && $upload_error == 0){
            // pr($post_data,1);
            if(count($upload_data) > 0){
                $post_data['profile_image_name']  =  $upload_data["file_name"];
            }
            $post_data['overtime_rate_per_hour'] = removeNumberFormate($post_data['overtime_rate_per_hour']);
            $update_arr = [];
            $old_emloyee_data =  $data["employee_data"] = $this->user_model->get_employee_details($post_data['employee_id']);
            unset($old_emloyee_data['edit_json']);
            $bank_data = $this->user_model->get_bank_details($post_data['employee_id']);
            $old_bank_ids = array_column($bank_data, "id");

            $update_arr["old_employe_data"]['employee_data'] = $old_emloyee_data;
            $update_arr["old_employe_data"]['bank_data'] = $bank_data;
            $new_bank_data = [];
            foreach ($post_data['bank_id'] as $key => $value) {
                $new_bank_data[$key]['bank_id'] = $post_data['bank_id'][$key];
                $new_bank_data[$key]['bank_name'] = $post_data['bank_name'][$key];
                $new_bank_data[$key]['branch_address'] = $post_data['branch_address'][$key];
                $new_bank_data[$key]['ifsc_code'] = $post_data['ifsc_code'][$key];
                $new_bank_data[$key]['account_type'] = $post_data['account_type'][$key];
                $new_bank_data[$key]['account_number'] = $post_data['account_number'][$key];
                $new_bank_data[$key]['account_holder_name'] = $post_data['account_holder_name'][$key];
                if(array_key_exists($key,$post_data['defaul_bank'])){
                    $new_bank_data[$key]['default_bank'] = $post_data['defaul_bank'][$key];
                }else{
                    $new_bank_data[$key]['default_bank'] = "No";
                }
            }
            $new_bank_ids = array_column($new_bank_data, "bank_id");
            $post_data['deleted_bank'] = array_diff($old_bank_ids, $new_bank_ids);
            $post_data['bank_data'] = $new_bank_data;
            unset($post_data['bank_id'],$post_data['bank_name'],$post_data['branch_address'],$post_data['ifsc_code'],$post_data['account_type'],$post_data['account_number'],$post_data['account_holder_name'],$post_data['defaul_bank']);
            $update_arr["new_employe_data"] = $post_data;
            $employe_update_arr['employee_id'] = $post_data['employee_id'];
            $employe_update_arr['updated_json'] = json_encode($update_arr);
            $employe_update_arr['updated_by'] = $_SESSION["employee_id"];
             $employe_update_arr['edit_type'] = "Yes";
            $employe_update_arr['updated_date'] = date("Y-m-d H:i:s");
            if(count($employe_update_arr) > 0){
                $affected_row = $this->user_model->update_employee_edit_json($employe_update_arr);
                if($affected_row > 0){
                    $success = 1;
                    $message = "Employee updated successfully!";
                }else{
                    $success = 0;
                    $message = "Error add data.";
                }
            }
        }else {
            $message = $upload_error_msg['error'];
            $success = 0;
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    public function logout_action()
    {
        unset($_SESSION["userdata"]);
        session_destroy();
        $success = 1;
        $message = "Logout successfully!";
        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }

    public function attendance_action()
    {
        $employee_code = $this->input->post("employee_code");
        $type = $this->input->post("type");
        $company_prifix = $this->input->post("prefix");
        $company_logo = $this->input->post("logo");

        $success = 0;
        $message = "Employee not exit with this code!";
        $html = "";
        $attendance_pin = "";
        if ($employee_code != "") {
            // $company_prifix = $this->config->item("company_prifix");
            $employee_code = $company_prifix . "-" . $employee_code;
            $user = $this->user_model->get_user_details($employee_code);
            if (is_array($user)) {
                if (count($user) > 0) {
                    $attendance_pin = $user['attendance_pin'];
                    if (
                        $user["attendance_out_time"] == "0000-00-00 00:00:00" ||
                        $user["attendance_out_time"] == null
                    ) {
                        $user["attendance_out_time"] = "";
                    }
                    if (
                        $user["attendance_in_time"] == "0000-00-00 00:00:00" ||
                        $user["attendance_in_time"] == null
                    ) {
                        $user["attendance_in_time"] = "";
                    }
                    $user["type"] = $type;
                    $user['company_logo'] = $company_logo;
                    $user["attendance_id"] = isset($user['attendance_id']) ? $user['attendance_id'] : '';
                    $html = $this->smarty->fetch(
                        "attendance_in_out_block.tpl",
                        $user
                    );
                    $success = 1;
                    $message = "Employee data fetch successfully!";
                } else {
                    $success = 0;
                    $message = "Employee code not exist!";
                }
            } else {
                $success = 0;
                $message = "Employee code not exist!";
            }
        }

        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        $return_arr["html"] = $html;

        $return_arr["attendance_pin"] = $attendance_pin;
        echo json_encode($return_arr);
        exit();
    }
    public function attendance_in_out_action()
    {
        $type = $this->input->post("type");
        $employee_id = $this->input->post("employee_id");
        $success = 0;
        $message = "Something went wrong!";
        if ($employee_id > 0) {
            $employee_details = $this->user_model->get_employee_details(
                $employee_id
            );
            if ($type == "In") {
                $current_date = date("Y-m-d");
                $attendance_date = $this->user_model->get_attendance(
                    $employee_id,
                    $current_date
                );
                if (count($attendance_date) > 0) {
                    $date = date("Y-m-d H:i:s");
                    $insert_arr["attendance_in_time"] = $date;
                    $insert_arr["type"] = "attendance_in";
                    $affected_row = $this->user_model->update_attendance(
                        $insert_arr,
                        $employee_id
                    );
                    if ($affected_row > 0) {
                        $success = 1;
                        $message = "Attendance in successfully.";
                    }
                } else {
                    $date = date("Y-m-d H:i:s");
                    $insert_arr["employee_id"] = $employee_id;
                    $insert_arr["attendance_date"] = $date;
                    $insert_arr["attendance_in_time"] = $date;
                    $insert_arr["attendance_out_time"] = "";
                    $insert_id = $this->user_model->insert_attendance(
                        $insert_arr
                    );
                    if ($insert_id > 0) {
                        $success = 1;
                        $message = "Attendance in successfully.";
                    }
                }

                if ($success == 1) {
                    $send_data["email"] = $employee_details["email"];
                    $send_data["name"] =
                        $employee_details["first_name"] .
                        " " .
                        $employee_details["last_name"];
                    $send_data["subject"] = "Attendance in successfully";
                    $send_data["title"] = "Attendance in successfully";
                    $send_data["attendance_message"] =
                        "Your attendance in at " .
                        $insert_arr["attendance_in_time"] .
                        " in HRMS system.";
                }
            }
            if ($type == "Out") {
                $date = date("Y-m-d H:i:s");
                $insert_arr["attendance_out_time"] = $date;
                $insert_arr["attendance_id"] = $this->input->post('attendance_id');
                $insert_arr["type"] = "attendance_out";
                $affected_row = $this->user_model->update_attendance(
                    $insert_arr,
                    $employee_id
                );
                if ($affected_row > 0) {
                    $send_data["email"] = $employee_details["email"];
                    $send_data["name"] =
                        $employee_details["first_name"] .
                        " " .
                        $employee_details["last_name"];
                    $send_data["subject"] = "Attendance out successfully";
                    $send_data["title"] = "Attendance out successfully";
                    $send_data["attendance_message"] =
                        "Your attendance out at " .
                        $insert_arr["attendance_out_time"] .
                        " in HRMS system.";
                    $success = 1;
                    $message = "Attendance Out successfully.";
                }
            }
        }

        if ($success == 1) {
            $send_data["templete"] = "attendance_email_template.tpl";
            $return_arr["email_sender"] = $this->email_sender($send_data);
        }
        $return_arr["message"] = $message;
        $return_arr["success"] = $success;
        echo json_encode($return_arr);
        exit();
    }



    public function employedd_add_update(){
        $get_data = $this->input->get();
        $data["manager"] = [];
        $data["employee_data"] = [];
        $data["bank_data"] = [];
        $data["mode"] = "Add";
        $data["index"] = 0;
        $data["back_url"] = "employee-list.html";
        $data["selected_company"] = getCompanyId();
        $data["department"] = [];
        $data["designation"] = [];
        if(array_key_exists("id",$get_data)){
            $data["employee_data"] = $this->user_model->get_employee_details($get_data['id']);
            $data["employee_data"]['employee_week_off'] = explode(",", $data["employee_data"]["employee_week_off"]);
            $data["employee_data"]['phone_code'] = $this->user_model->get_country_code($data["employee_data"]['phone_code']);
            $data["employee_data"]['secondary_mobile_code'] = $this->user_model->get_country_code($data["employee_data"]['secondary_mobile_code']);
            $data["employee_data"]['work_mobile_code'] = $this->user_model->get_country_code($data["employee_data"]['work_mobile_code']);
            $data["bank_data"] = $this->user_model->get_bank_details($get_data['id']);
            $data["mode"] = "Update";
            $data["index"] = count($data['bank_data']) - 1;
            $data["selected_company"] = $data["employee_data"]['company_id'];
            $data["department"] = $this->user_model->get_department_list($data["selected_company"]);
            $data["designation"] = $this->user_model->get_designation_list($data["employee_data"]['department']);
            $data["manager"] = $this->user_model->get_reporting_senior($data["employee_data"]['department'],'',$data["selected_company"]);
            // pr($data,1);
        }else{
            $data["department"] = $this->user_model->get_department_list($data["selected_company"]);
        }
        $data["country"] = $this->user_model->get_country();
        $data["state"] = $this->user_model->get_state();
        $data["company_details"] = $this->user_model->get_companies();
        $data["role"] = $_SESSION['role'];

        // pr($data,1);
        $data['employement_type'] = [0 => ["id"=>"employee","val"=>"Employee"],1 => ["id"=>"manager","val"=>"Manager"],2 => ["id"=>"admin","val"=>"Admin"]]; //,3 => ["id"=>"arom","val"=>"AROM"]

        // pr($data,1);
        $this->smarty->view("employee_add_update.tpl",$data);
    }
    public function get_add_banck_block(){
        $data = [];
        $data['index'] = $this->input->post("banck_count");
        $data['bank_data'] = [];
        $html = $this->smarty->fetch("bank_add_templete.tpl",$data);
        $return_arr["html"] = $html;
        echo json_encode($return_arr);
        exit();
    }
    public function get_reporting_senior(){
        // pr($post,1);
        $post = $this->input->post();
        $department = $post['department'];
        $type = $post['type'];
        $company_id = $post['company_id'];
        $return_arr = $this->user_model->get_reporting_senior($department,$type,$company_id);
        echo json_encode($return_arr);
        exit();
    }

    public function get_department(){
        // pr($post,1);
        $post = $this->input->post();
        $company_id = $post['company_id'];
        $return_arr = $this->user_model->get_department_list($company_id);
        echo json_encode($return_arr);
        exit();
    }
    public function get_designation(){
        // pr($post,1);
        $post = $this->input->post();
        $department_id = $post['department'];
        $return_arr = $this->user_model->get_designation_list($department_id);
        echo json_encode($return_arr);
        exit();
    }
    public function check_company_code(){
        $company_code = $this->input->get('company_code');
        $data['success'] = 0;
        $data['message'] = "Please enter company_code";
        $data['data'] = array();
        if($company_code != ''){
            $return_arr = $this->user_model->check_company_code($company_code);
            if(count($return_arr) > 0){
                $data['success'] = 1;
                $data['message'] = "company data found successfully.";
                $return_arr[0]['redirect_url'] = base_url().'attendance.html?prefix='.base64_encode($return_arr[0]['value']).'&type=Tab';
                $data['data'] = $return_arr[0];
            }else{
                $data['success'] = 1;
                $data['message'] = "company data not found.";
            }
        }
        // Convert data to JSON format
        $json_response = json_encode($data);

        // Set headers
        $this->output
            ->set_content_type('application/json')
            ->set_output($json_response);
    }
}

?>
