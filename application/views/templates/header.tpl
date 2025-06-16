<!--  -->
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HRMS</title>
  <link rel="shortcut icon" type="image/png" href="public/assets/images/logos/favicon.png" />
  <link rel="stylesheet" href="public/assets/css/styles.min.css" />
  <link rel="stylesheet" href="public/assets/css/responsive_page.css" />
  <link href="public/css/plugin/line_awesome/line_awesome.css" rel="stylesheet" />

  <!-- <link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/font-awesome-line-awesome/css/all.min.css"
  integrity="sha512-dC0G5HMA6hLr/E1TM623RN6qK+sL8sz5vB+Uc68J7cBon68bMfKcvbkg6OqlfGHo1nMmcCxO5AinnRTDhWbWsA=="
  crossorigin="anonymous"
  referrerpolicy="no-referrer"
  /> -->
  <!-- chosen -->
   <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.min.css" /> -->
  <link rel="stylesheet" href="public/css/plugin/chosen/chosen.css" />
  <!--  tabler css -->
  <link rel="stylesheet" href="public/css/plugin/tabler_css/tabler_icons.css" />
  <!--  tabler css -->

  <!-- slect2 -->
  <link href="public/css/plugin/select2/select2.css" rel="stylesheet" />
  <!-- slect2 -->

  <!-- font awesomw  -->
  <link rel="stylesheet" href="public/css/plugin/fontawesome/font_awesome.css">


  <!-- toaster -->
    <link rel="stylesheet" href="public/css/custom_toaster.css" />
  <!-- toaster -->

  <!-- time date picker -->
    <link rel="stylesheet" href="public/css/time_picker.css" />
  <!-- time date picker -->

  <!-- <script src="public/assets/js/plugins/jquer_file.js"></script> -->

  <!-- date picker -->
  <link rel="stylesheet" type="text/css" href="public/css/plugin/date_picker.css">
  <!-- date picker -->

  <!-- loader -->
  <link rel="stylesheet" href="public/css/plugin/loader.css" />
  <!-- loader -->

  <!-- tool tip css -->
  <link rel="stylesheet" href="public/css/plugin/tooltip/tooltip.css" />
  <!-- tool tip css -->

  <!-- swal alert css -->
    <link rel="stylesheet" href="public/css/plugin/swal_alert/animate.css" />
    <link rel="stylesheet" href="public/css/plugin/swal_alert/sweetalert2.css" />
  <!-- swal alert css -->

  <!-- jquey -->
    <script src="public/assets/js/plugins/jquer_file.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script> -->
  <!-- jquey -->

  <!-- datatable -->
    <link rel="stylesheet" type="text/css" href="public/css/data_table/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="public/css/data_table/searchPanes.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="public/css/data_table/select.dataTables.min.css">
    <script type="text/javascript" src="public/js/plugin/datatable/jquery.dataTables.min.js"></script>
  <!-- datatable -->

  <!-- slect2 -->
  <script src="public/js/plugin/select2/select2.min.js"></script>
  <!-- slect2 -->

  <!-- swal alert js -->
   <script src="public/js/plugin/swal_alert/sweetalert2.js"></script>
   <!-- swal alert js -->

  <!-- date time picker -->
    <script src="public/js/plugin/date_picker/date_picker.js"></script>
  <!-- date time picker -->

  <!-- time picker -->
     <script src="public/js/plugin/time_picker.js"></script>
  <!-- time picker -->

  <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
  <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/pdfmake.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.70/vfs_fonts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.20.0/jquery.validate.min.js" integrity="sha512-WMEKGZ7L5LWgaPeJtw9MBM4i5w5OSBlSjTjCtSnvFJGSVD26gE5+Td12qN5pvWXhuWaWcVwF++F7aqu9cvqP0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- chosen  -->
   <script src="public/js/plugin/chosen/chosen.js"></script>
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.min.js"></script> -->
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <!-- Sidebar Start -->
    <div class=" outer-div-box">
    <aside class="left-sidebar">
      <!-- Sidebar scroll-->

      <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
          <a href="./home.html" class="text-nowrap logo-img">
            <img src="{{$user_data['comapany_logo']}}" width="120" height="90" alt="" />
          </a>
          <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
            <i class="ti ti-x fs-8"></i>
          </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
          <ul id="sidebarnav">
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Home</span>
            </li>
            <div class="sub-menu">
            <li class="sidebar-item">
              <a class="sidebar-link" href="./home.html" aria-expanded="false">
                <span>
                  <i class="ti ti-layout-dashboard"></i>
                </span>
                <span class="hide-menu">Dashboard</span>
              </a>
            </li>
          </div>
             {{if in_array($role,['admin','arom'])}}
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Master</span>
            </li>
          
           <div class="sub-menu">
            
            <li class="sidebar-item">
              <a class="sidebar-link" href="./company.html" aria-expanded="false">
                <span>
                  <i class="ti ti-building-skyscraper"></i>

                </span>
                <span class="hide-menu">Companies</span>
              </a>
            </li>            <li class="sidebar-item">
              <a class="sidebar-link" href="./department.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">Department</span>
              </a>
            </li>
             <li class="sidebar-item">
              <a class="sidebar-link" href="./designation.html" aria-expanded="false">
                <span>
                  <i class="ti ti-users-group"></i>
                </span>
                <span class="hide-menu">Designation</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="./bank-listing.html" aria-expanded="false">
                <span>
                  <i class="ti ti-building-bank"></i>
                </span>
                <span class="hide-menu">Bank Master</span>
              </a>
            </li>

            <li class="sidebar-item">
              <a class="sidebar-link" href="./shift-management.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-scan"></i>
                </span>
                <span class="hide-menu">Shift Master</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./employee-shift.html" aria-expanded="false">
                <span>
                  <i class="ti ti-users-plus"></i>
                </span>
                <span class="hide-menu">Shift Groups</span>
              </a>
            </li>

          </div>
          {{if in_array($role,['admin','arom'])}}
          <div>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Salary</span>
            </li>
            <div class="sub-menu">
              <li class="sidebar-item">
                <a class="sidebar-link" href="./salary-component.html" aria-expanded="false">
                  <span>
                    <i class="ti ti-layers-subtract"></i>

                  </span>
                  <span class="hide-menu">Salary component  </span>
                </a>
              </li>
              <li class="sidebar-item">
                <a class="sidebar-link" href="./salary-structure.html" aria-expanded="false">
                  <span>
                    <i class="ti ti-license"></i>
                  </span>
                  <span class="hide-menu">Salary Structure</span>
                </a>
              </li>
            </div>
          </div>
          {{/if}}



            {{/if}}
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">User</span>
            </li>
            <div class="sub-menu">
            <li class="sidebar-item">
              <a class="sidebar-link" href="./employee-details.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user"></i>
                </span>
                <span class="hide-menu">Profile</span>
              </a>
            </li>
            {{if in_array($role,['admin','arom'])}}
            <li class="sidebar-item">
              <a class="sidebar-link" href="./employee-list.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-circle"></i>
                </span>
                <span class="hide-menu">Employee Listing</span>
              </a>
            </li>

            {{/if}}

          </div>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Leave</span>
            </li>
            <div class="sub-menu">
            <li class="sidebar-item">
              <a class="sidebar-link" href="./leave-list.html" aria-expanded="false">
                <span>
                  <i class="ti ti-plane-departure"></i>
                </span>
                <span class="hide-menu">Leave</span>
              </a>
            </li>
            {{if in_array($role,['admin','arom'])}}
               <li class="sidebar-item">
              <a class="sidebar-link" href="./leave-management-list.html" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-user"></i>
                </span>
                <span class="hide-menu">Leave Management</span>
              </a>
            </li>
            <li class="sidebar-item">
           <a class="sidebar-link" href="./leave-allocation.html" aria-expanded="false">
             <span>
               <i class="ti ti-browser-plus"></i>
             </span>
             <span class="hide-menu">Leave Allocation</span>
           </a>
         </li>
            {{/if}}
           </div>
           {{if $user_data['over_time_allow'] eq 'No' || $user_data['over_time_allow'] eq 'NO'}}
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Combo off</span>
            </li>
            <div class="sub-menu">
              {{if in_array($role,['admin','arom'])}}
              <li class="sidebar-item">
                <a class="sidebar-link" href="./combo-off-request.html" aria-expanded="false">
                  <span>
                    <i class="ti ti-hourglass"></i>
                  </span>
                  <span class="hide-menu">Combo Off Request</span>
                </a>
              </li>
              {{/if}}
              {{if $user_data['over_time_allow'] eq 'No' || $user_data['over_time_allow'] eq 'NO'}}
                <li class="sidebar-item">
                  <a class="sidebar-link" href="./combo-off.html" aria-expanded="false">
                    <span>
                      <i class="ti ti-hourglass-empty"></i>
                    </span>
                    <span class="hide-menu">Combo Off</span>
                  </a>
                </li>
              {{/if}}
            </div>
            {{/if}}



            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Holiday</span>
            </li>
            <div class="sub-menu">
            <li class="sidebar-item">
              <a class="sidebar-link" href="./holiday.html" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-month"></i>
                </span>
                <span class="hide-menu">Holiday</span>
              </a>
            </li>
            {{if in_array($role,['admin','arom'])}}
            <li class="sidebar-item">
              <a class="sidebar-link" href="./holiday-management.html" aria-expanded="false">
                <span>
                  <i class="ti  ti-calendar-cog"></i>
                </span>
                <span class="hide-menu">Holiday Management</span>
              </a>
            </li>
            {{/if}}

          </div>
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Attendance</span>
            </li>
            <div class="sub-menu">
            <li class="sidebar-item">
              <a class="sidebar-link" href="./attendance-sheet.html" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                <span class="hide-menu">Time Sheet</span>
              </a>
            </li>
            {{if in_array($role,['admin','arom'])}}
            <li class="sidebar-item">
              <a class="sidebar-link" href="./employee-attendance.html" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-event"></i>
                </span>
                <span class="hide-menu">Employee Time Sheet</span>
              </a>
            </li>
            {{/if}}
            {{if isset($config['company_prefix'])}}
              {if $config['company_prefix'] != ''}
                <li class="sidebar-item">
                  <a class="sidebar-link" href="./attendance.html?prefix={base64_encode($config['company_prefix'])}" aria-expanded="false">
                    <span>
                      <i class="ti ti-calendar-time"></i>
                    </span>
                    <span class="hide-menu">Attendance In Out</span>
                  </a>
                </li>
              {/if}
            {/if}
            {{if in_array($role,['admin','arom'])}}
            <li class="sidebar-item">
              <a class="sidebar-link" href="./attendance-correction.html" aria-expanded="false">
                <span>
                  <i class="ti ti-calendar-check"></i>
                </span>
                <span class="hide-menu">Attendance Correction</span>
              </a>
            </li>
            {/if}
            </div>
            {{if in_array($role,['admin'])}}
            <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">Settings</span>
            </li>
            <div class="sub-menu">
              <li class="sidebar-item">
                <a class="sidebar-link" href="./company-settings" aria-expanded="false">
                  <span>
                    <i class="ti ti-settings"></i>
                  </span>
                  <span class="hide-menu">Company Settings</span>
                </a>
              </li>
            </div>
            {{/if}}

            <!-- <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-alerts.html" aria-expanded="false">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
                <span class="hide-menu">Alerts</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-card.html" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                <span class="hide-menu">Card</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-forms.html" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                <span class="hide-menu">Forms</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./ui-typography.html" aria-expanded="false">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
                <span class="hide-menu">Typography</span>
              </a> -->
            </li>
            <li class="nav-small-cap-auth">
              <span class="hide-menu">AUTH</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link sign-out-btn" href="javascript:void(0)" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                <span class="hide-menu">Logout</span>
              </a>
            </li>
            <!-- <li class="sidebar-item">
              <a class="sidebar-link" href="./authentication-register.html" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                <span class="hide-menu">Register</span>
              </a>
            </li> -->
            <!-- <li class="nav-small-cap">
              <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
              <span class="hide-menu">EXTRA</span>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./icon-tabler.html" aria-expanded="false">
                <span>
                  <i class="ti ti-mood-happy"></i>
                </span>
                <span class="hide-menu">Icons</span>
              </a>
            </li>
            <li class="sidebar-item">
              <a class="sidebar-link" href="./sample-page.html" aria-expanded="false">
                <span>
                  <i class="ti ti-aperture"></i>
                </span>
                <span class="hide-menu">Sample Page</span>
              </a>
            </li> -->
          </ul>

        </nav>
        <!-- End Sidebar navigation -->
      </div>
      <!-- End Sidebar scroll-->
    </aside>
    <!--  Sidebar End -->
    <!--  Main wrapper -->
    <div class="body-wrapper ">
      <!--  Header Start -->
      <header class="app-header">
        <nav class="navbar navbar-expand-lg navbar-light">
          <div>
            <a href="./home.html" class="text-nowrap logo-img">
            <img src="{{$user_data['comapany_logo']}}" width="80" alt="" height="70">
            </a>

          </div>
          <ul class="navbar-nav">
            <li class="nav-item d-block d-xl-none">
              <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                <i class="ti ti-menu-2"></i>
              </a>
            </li>
          </ul>
          <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
              <li class="nav-item">
              <a class="nav-link nav-icon-hover icon-block" href="./holiday.html" title="Holiday">
                <i class="ti ti-calendar-month" style="font-size: 22px;"></i>
              </a>
            </li> 
              <li class="nav-item">
              <a class="nav-link nav-icon-hover icon-block" href="./announcement_list.html" title="Annoucement">
                <i class="ti ti-bell-ringing"></i>
                <div class="notification bg-primary rounded-circle"></div>
              </a>
            </li>
            
              
              <li class="nav-item dropdown">
                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                  aria-expanded="false">
                  <img src="{{$base_url}}public/img/uploads/employee_profile/{{$user_data['profile_image']}}" alt="" width="45" height="45" class="rounded-circle">
                  <span class="active-dot"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up profile-drop-down p-0" aria-labelledby="drop2">
                  <div class="profile-block-div">
                    <div class="profile-basic-info">
                        <div class="profile-img">
                            <img width="40" height="40" class="profile-initial company-logo-top" alt="{{$user_data['first_name']}} {{$user_data['middle_name']}} {{$user_data['last_name']}}" src="{{$base_url}}public/img/uploads/employee_profile/{{$user_data['profile_image']}}" title="{{$user_data['first_name']}} {{$user_data['middle_name']}} {{$user_data['last_name']}}">
                        </div>
                        <div class="user-name">
                        {{$user_data['first_name']}} {{$user_data['middle_name']}} {{$user_data['last_name']}}
                        </div>
                      </div>
                    <div class="message-body">
                      <!-- <a href="./employee-details.html" class="d-flex align-items-center gap-2 dropdown-item mt-2 mb-2">
                        <i class="ti ti-user fs-6"></i>
                        <p class="mb-0 fs-3">My Profile</p>
                      </a> -->
                      <div class="logout-block" title="My Profile">
                         <a href="./employee-details.html" class="">My Profile <i class="ti ti-user-square-rounded"></i></a>
                      </div>
                      <div class="logout-block" title="Reset Attendance Pin">
                         <a href="javascript:void(0)" class="reset-attendance-pin-btn">Reset Attendance Pin <i class="ti ti-calendar-cog"></i></a>
                      </div>
                      <div class="logout-block" title="Reset Password">
                         <a href="javascript:void(0)" class="Reset-pasword-btn">Reset Password <i class="ti ti-lock"></i>
</i></a>
                      </div>
                      <div class="logout-block" title="Logout">
                         <a href="javascript:void(0)" class="sign-out-btn">Logout <i class="ti ti-login-2"></i></a>
                      </div>

                    </div>
                  </div>
                </div>
              </li>
              <!-- <a href="javascript:void(0)"  data-bs-toggle="dropdown" class="user-name-block">{{$user_data['first_name']}}</a> -->
              <div class="modal fade leave-popup-block" id="reset_Password_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered ">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalToggleLabel">Reset Password</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="ResetPasswordForm" action="javascript:void(0)" method="post">
                        <div class="modal-body">
                          <div class="main-content">

                            <div class="card mb-3 leave-box">
                              <div class="row g-0 m-3">
                                <div class="mb-3 password-box">
                                  <label for="designationName" class="form-label">Old Password</label>
                                  <div class="input-group">
                                      <input type="password" class="form-control old_pass" id="old_pass" name="old_pass"  placeholder="Enter Old Password">
                                      <span class="input-group-text date-picker-addon">
                                        <i class=" ti ti-eye password-icon cursor"  style=""></i>
                                      </span>
                                  </div>
                                </div>
                                <div class="mb-3 password-box">
                                  <label for="designationName" class="form-label">New Password</label>
                                  <div class="input-group">
                                      <input type="password" class="form-control new_pass" id="new_pass" name="new_pass"  placeholder="Enter New Password">
                                      <span class="input-group-text date-picker-addon">
                                        <i class=" ti ti-eye password-icon cursor"  style=""></i>
                                      </span>
                                  </div>
                                </div>
                                <div class="mb-3 password-box">
                                  <label for="designationName" class="form-label">Confirm Password</label>
                                  <div class="input-group">
                                      <input type="password" class="form-control confirm_pass" id="confirm_pass" name="confirm_pass"  placeholder="Enter Confirm Password">
                                   <span class="input-group-text date-picker-addon">
                                        <i class=" ti ti-eye password-icon cursor"  style=""></i>
                                      </span>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>


                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-primary submit-holiday">Submit</button>
                        </div>
                      </form>
                  </div>
                </div>
              </div>
              <div class="modal fade leave-popup-block" id="reset_attendance_pin_popup" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered ">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalToggleLabel">Reset Password</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="ResetAttendancePinForm" action="javascript:void(0)" method="post">
                        <div class="modal-body">
                          <div class="main-content">

                            <div class="card mb-3 leave-box">
                              <div class="row g-0 m-3">
                                <div class="mb-3">
                                  <label for="new_attendance_pin" class="form-label">New Attendance Pin</label>
                                  <input type="text" class="form-control new_attendance_pin number-value-formate-box" id="new_attendance_pin" name="new_attendance_pin"  placeholder="Enter Attendance Pin">
                                </div>
                                <!-- <div class="mb-3">
                                  <label for="designationName" class="form-label">Confirm Password</label>
                                  <input type="text" class="form-control confirm_pass" id="confirm_pass" name="confirm_pass"  placeholder="Enter Confirm Password">
                                </div> -->
                              </div>
                            </div>
                          </div>


                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-primary submit-holiday">Submit</button>
                        </div>
                      </form>
                  </div>
                </div>
              </div>
            </ul>
          </div>
        </nav>
      </header>
      <!--  Header End -->
      <div class="container-fluid ">
