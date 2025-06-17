<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/userguide3/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['default_controller'] = 'user/thankyou';
$route['404_override'] = 'user/no_page_found';
$route['translate_uri_dashes'] = FALSE;
$route['signup.html'] = 'user/signup';
$route['dealer.html'] = 'home/dealer';
$route['dealer-profile.html'] = 'home/dealer_profile';
$route['dealer-address.html'] = 'home/dealer_address';

//  employee

// $route['add-employee.html'] = 'user/add_employee';
$route['login.html'] = 'user/login';
$route['forgot.html'] = 'user/forgot_password';
// $route['signup.html'] = 'user/signup';
$route['home.html'] = 'home/home';
$route['employee-details.html'] = 'home/employee_profile';
$route['employee-list.html'] = 'home/employee_listing';

/* user  */

$route['employee-add.html'] = 'user/employedd_add_update';

/* attendance */
$route['attendance.html'] = 'user/attendance';
$route['attendance-sheet.html'] = 'attendance/attendance_sheet';
$route['attendance-correction.html'] = 'attendance/attendance_correction';
$route['employee-attendance.html'] = 'attendance/employee_attendance_sheet';
/* leave */
$route['leave-list.html'] = 'leave/leave_list_summary';
$route['leave-management-list.html'] = 'leave/leave_management';
$route['leave-allocation.html'] = 'leave/leave_allocation';
$route['send_email.html'] = 'user/send_email';
$route['combo-off.html'] = 'leave/combo_off';
$route['combo-off-request.html'] = 'leave/combo_off_list';

/* holiday and designation */
$route['holiday-management.html'] = 'holiday/holiday_management';
$route['holiday.html'] = 'holiday/holiday';


/* master */
$route['designation.html'] = 'master/designation';
$route['department.html'] = 'master/department';
$route['bank-listing.html'] = 'bank/bank_listing';
$route['shift-management.html'] = 'shift/shift_management';
$route['employee-shift.html'] = 'shift/employee_shift';
$route['company.html'] = 'company/index';
$route['add-company.html'] = 'company/add';
$route['update-company.html'] = 'company/add';
$route['company-view'] = 'company/showViewPage';
$route['company-settings'] = 'master/company_config';

/* annoucement */

$route['announcement.html'] = 'activities/announcement';
$route['announcement_list.html'] = 'activities/announcement_list';
$route['announcement_details.html'] = 'activities/announcement_details';

/* cron */
$route['daily-log'] = 'notification/daily_attendance_log';
$route['send_email'] = 'user/send_email';
$route['auto-out-log'] = 'notification/auto_out_log';
$route['send-notification'] = 'notification/send_notifiction';

/* salary */
$route['salary-component.html'] = 'salary';
$route['salary-component-add.html'] = 'salary/add_action';
$route['salary-structure.html'] = 'salary/salary_strucuture';
$route['salary-structure-add.html'] = 'salary/salary_strucuture_action';
$route['salary-structure-update.html'] = 'salary/salary_strucuture_action';
$route['employee-salary-structure.html'] = 'salary/employee_salary_strucuture';
$route['employee-salary-structure-extend.html'] = 'salary/employee_salary_strucuture_action';
$route['employee-salary-structure-update.html'] = 'salary/employee_salary_strucuture_update_action';
$route['pdf.html'] = 'salary/generate_pdf';
$route['salary-calc'] = 'salary/employeeSalaryCalculation';

// $route['attendence_report_ajax'] = 'reports/attendenceReport';
$route['attendence_report'] = 'reports/attandenceReportColumn';


/* API */
$route['check_company_exit'] = 'user/check_company_code';
