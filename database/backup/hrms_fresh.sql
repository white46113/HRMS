-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 23, 2024 at 10:55 AM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u875583157_hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement_master`
--

CREATE TABLE `announcement_master` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `announcement_date` date DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `email_sent` enum('Yes','No') DEFAULT 'No',
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_correction`
--

CREATE TABLE `attendance_correction` (
  `attendance_correction_id` int(11) NOT NULL,
  `attendance_id` int(11) NOT NULL,
  `attendance_in_time` datetime NOT NULL,
  `attendance_out_time` datetime NOT NULL,
  `attendance_correction_in_time` datetime NOT NULL,
  `attendance_correction_out_time` datetime NOT NULL,
  `status` enum('Pending','Approve','Reject') NOT NULL DEFAULT 'Pending',
  `added_by` int(11) NOT NULL,
  `added_date` date NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_master`
--

CREATE TABLE `bank_master` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch_address` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `account_type` enum('Saving','Current','Domestic') DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `default_bank` enum('Yes','No') DEFAULT 'No',
  `entity_type` enum('Company','Employee') DEFAULT NULL,
  `entity_id` int(11) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_code` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `company_address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `contact_number_code` varchar(255) NOT NULL,
  `date_founded` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pan_number` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `gst_number` varchar(255) NOT NULL,
  `tan_number` varchar(255) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_variables`
--

CREATE TABLE `company_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `type` enum('check_box','input','date') NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department_master`
--

CREATE TABLE `department_master` (
  `department_id` int(11) NOT NULL,
  `departmen_name` varchar(255) NOT NULL,
  `department_code` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation_master`
--

CREATE TABLE `designation_master` (
  `id` int(11) NOT NULL,
  `designation_name` varchar(255) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `grads` enum('I','II','III') NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation_salary_structure`
--

CREATE TABLE `designation_salary_structure` (
  `designation_salary_structure_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `ctc_value` double(15,2) NOT NULL,
  `component_json` longtext NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designation_salary_structure_component`
--

CREATE TABLE `designation_salary_structure_component` (
  `designation_salary_structure_component_id` int(11) NOT NULL,
  `designation_salary_structure_id` int(11) NOT NULL,
  `salary_component_id` int(11) NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `component_value` decimal(10,2) NOT NULL,
  `value_type` enum('Percentage','Decimal') NOT NULL,
  `component_type` enum('Income','Deduction','Taxes') NOT NULL,
  `year` int(11) NOT NULL,
  `is_compulsory` enum('Yes','No') NOT NULL,
  `description` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_in_time` datetime DEFAULT NULL,
  `attendance_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_combo_off`
--

CREATE TABLE `employee_combo_off` (
  `employee_combo_off_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `combo_off_date` date NOT NULL,
  `reference_date` date NOT NULL,
  `over_time` varchar(255) NOT NULL,
  `added_reason` varchar(255) NOT NULL,
  `update_reason` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Approve','Reject') NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_extended_salary_structure`
--

CREATE TABLE `employee_extended_salary_structure` (
  `employee_extended_salary_structure_id` int(11) NOT NULL,
  `refrence_number` varchar(255) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ctc_value` double(10,2) NOT NULL,
  `effective_from` date NOT NULL,
  `effective_to` date NOT NULL,
  `is_default` enum('No','Yes') NOT NULL DEFAULT 'No',
  `status` enum('Active','Inactive') NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_extended_salary_structure_component`
--

CREATE TABLE `employee_extended_salary_structure_component` (
  `employee_extended_salary_component_id` int(11) NOT NULL,
  `employee_extended_salary_structure_id` int(11) NOT NULL,
  `salary_component_id` int(11) NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `component_type` enum('Income','Deduction','Taxes') NOT NULL,
  `component_value` decimal(10,2) NOT NULL,
  `value_type` enum('Percentage','Decimal') NOT NULL,
  `is_compulsory` enum('Yes','No') NOT NULL,
  `year` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave`
--

CREATE TABLE `employee_leave` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_start_date` date NOT NULL,
  `leave_end_date` date NOT NULL,
  `leave_name` enum('SickLeave','PaidLeave','CasualLeave') NOT NULL,
  `leave_type` enum('half_day','full_day') NOT NULL DEFAULT 'full_day',
  `reason` varchar(255) NOT NULL,
  `approved_by` int(11) DEFAULT 0,
  `status` enum('pending','reject','approve') NOT NULL DEFAULT 'pending',
  `added_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_master`
--

CREATE TABLE `employee_master` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `employee_code` varchar(255) NOT NULL,
  `role` enum('admin','employee','manager','arom') NOT NULL DEFAULT 'employee',
  `email` varchar(255) DEFAULT NULL,
  `phone_code` varchar(10) NOT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `secondary_mobile_code` varchar(10) DEFAULT NULL,
  `secondary_mobile_number` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `marital_status` enum('Single','Married','Other') NOT NULL DEFAULT 'Single',
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employment_date` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `login_attempt_failed` int(11) DEFAULT 0,
  `profile_image` varchar(255) DEFAULT NULL,
  `reporting_manager` int(11) DEFAULT NULL,
  `employee_week_off` varchar(255) NOT NULL,
  `work_mobile_code` varchar(10) NOT NULL,
  `work_mobile_number` varchar(15) NOT NULL,
  `work_email` varchar(255) NOT NULL,
  `over_time_allow` enum('Yes','NO') NOT NULL,
  `overtime_rate_per_hour` double(18,6) DEFAULT NULL,
  `education_degree` varchar(255) NOT NULL,
  `education_feild` varchar(255) NOT NULL,
  `education_college` varchar(255) NOT NULL,
  `education_pass_out_year` int(11) NOT NULL,
  `aadhar_number` varchar(15) NOT NULL,
  `pan_card_number` varchar(25) NOT NULL,
  `pf_number` varchar(25) DEFAULT NULL,
  `uan_number` varchar(25) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `status` enum('Active','Inactive','Pending','Block') DEFAULT 'Active',
  `is_edit` enum('Yes','No') DEFAULT 'No',
  `edit_json` text DEFAULT NULL,
  `otp` varchar(255) NOT NULL,
  `attendance_pin` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `sys_record_delete` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_master`
--

INSERT INTO `employee_master` (`employee_id`, `first_name`, `middle_name`, `last_name`, `employee_code`, `role`, `email`, `phone_code`, `mobile_number`, `secondary_mobile_code`, `secondary_mobile_number`, `dob`, `gender`, `marital_status`, `country`, `state`, `city`, `address`, `zipcode`, `department`, `designation`, `employment_date`, `password`, `login_attempt_failed`, `profile_image`, `reporting_manager`, `employee_week_off`, `work_mobile_code`, `work_mobile_number`, `work_email`, `over_time_allow`, `overtime_rate_per_hour`, `education_degree`, `education_feild`, `education_college`, `education_pass_out_year`, `aadhar_number`, `pan_card_number`, `pf_number`, `uan_number`, `company_id`, `status`, `is_edit`, `edit_json`, `otp`, `attendance_pin`, `created_by`, `created_on`, `updated_by`, `updated_on`, `sys_record_delete`) VALUES
(1, 'Admin', '', '', 'AROM', 'arom', 'admin@gmail.com', '+91', '98765 43210', '', '', '2000-02-08', 'Male', 'Single', '105', '12', 'Nagpur', 'Vaishali Nagar Nagpur', '440015', '1', '1', '2024-02-01', 'f925916e2754e5e03f75dd58a5733251', 0, '06861059652e73a19e3d946ed4de09d5.jpeg', 1, 'Sunday', '+1', '8485835698', 'arom.work@gmail.com', 'Yes', NULL, 'B Tech', 'CSE', 'KIT', 2015, '2147483647', 'PAN123456', '', '', 0, 'Active', 'No', '', '754865', 568956, 0, '2024-02-26 14:43:47', 1, '2024-03-29 21:12:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_shift`
--

CREATE TABLE `employee_shift` (
  `employee_shift_id` int(11) NOT NULL,
  `group_title` varchar(255) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `employee_ids` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_week_off`
--

CREATE TABLE `employee_week_off` (
  `week_off_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `employee_week_off` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `added_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday_master`
--

CREATE TABLE `holiday_master` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(255) DEFAULT NULL,
  `holiday_date` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_allocation`
--

CREATE TABLE `leave_allocation` (
  `id` int(11) NOT NULL,
  `sick_leave` int(11) DEFAULT NULL,
  `paid_leave` int(11) DEFAULT NULL,
  `casual_leave` int(11) DEFAULT NULL,
  `total_leave` int(11) NOT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_component`
--

CREATE TABLE `salary_component` (
  `salary_component_id` int(11) NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `component_value` decimal(10,2) NOT NULL,
  `value_type` enum('Percentage','Decimal') NOT NULL,
  `component_type` enum('Income','Deduction','Taxes') NOT NULL,
  `year` int(11) NOT NULL,
  `is_compulsory` enum('Yes','No') NOT NULL,
  `description` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift_master`
--

CREATE TABLE `shift_master` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `shift_name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL,
  `shift_type` enum('I','II','III') DEFAULT NULL,
  `start_time` varchar(255) NOT NULL,
  `end_time` varchar(255) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `iStateId` int(10) UNSIGNED NOT NULL,
  `vState` varchar(255) NOT NULL,
  `vStateCode` varchar(20) NOT NULL,
  `iCountryId` int(11) DEFAULT NULL,
  `vCountryCode` varchar(3) DEFAULT NULL,
  `eStatus` enum('Active','Inactive') DEFAULT NULL,
  `iSysRecDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`iStateId`, `vState`, `vStateCode`, `iCountryId`, `vCountryCode`, `eStatus`, `iSysRecDeleted`) VALUES
(1, 'ANDHRA PRADESH', 'AP', 99, 'IN', 'Active', 0),
(2, 'ASSAM', 'AS', 99, 'IN', 'Active', 0),
(3, 'ARUNACHAL PRADESH', 'AR', 99, 'IN', 'Active', 0),
(4, 'BIHAR', 'BR', 99, 'IN', 'Active', 0),
(5, 'GUJRAT', 'GJ', 99, 'IN', 'Active', 0),
(6, 'HARYANA', 'HR', 99, 'IN', 'Active', 0),
(7, 'HIMACHAL PRADESH', 'HP', 99, 'IN', 'Active', 0),
(8, 'JAMMU & KASHMIR', 'JK', 99, 'IN', 'Active', 0),
(9, 'KARNATAKA', 'KA', 99, 'IN', 'Active', 0),
(10, 'KERALA', 'KL', 99, 'IN', 'Active', 0),
(11, 'MADHYA PRADESH', 'MP', 99, 'IN', 'Active', 0),
(12, 'MAHARASHTRA', 'MH', 99, 'IN', 'Active', 0),
(13, 'MANIPUR', 'MN', 99, 'IN', 'Active', 0),
(14, 'MEGHALAYA', 'ML', 99, 'IN', 'Active', 0),
(15, 'MIZORAM', 'MZ', 99, 'IN', 'Active', 0),
(16, 'NAGALAND', 'NL', 99, 'IN', 'Active', 0),
(17, 'ORISSA', 'OR', 99, 'IN', 'Active', 0),
(18, 'PUNJAB', 'PB', 99, 'IN', 'Active', 0),
(19, 'RAJASTHAN', 'RJ', 99, 'IN', 'Active', 0),
(20, 'SIKKIM', 'SK', 99, 'IN', 'Active', 0),
(21, 'TAMIL NADU', 'TN', 99, 'IN', 'Active', 0),
(22, 'TRIPURA', 'TR', 99, 'IN', 'Active', 0),
(23, 'UTTAR PRADESH', 'UP', 99, 'IN', 'Active', 0),
(24, 'WEST BENGAL', 'WB', 99, 'IN', 'Active', 0),
(25, 'DELHI', 'DL', 99, 'IN', 'Active', 0),
(26, 'GOA', 'GA', 99, 'IN', 'Active', 0),
(27, 'PONDICHERRY', 'PY', 99, 'IN', 'Active', 0),
(28, 'LAKSHDWEEP', 'LD', 99, 'IN', 'Active', 0),
(29, 'DAMAN & DIU', 'DD', 99, 'IN', 'Active', 0),
(30, 'DADRA & NAGAR', 'DN', 99, 'IN', 'Active', 0),
(31, 'CHANDIGARH', 'CH', 99, 'IN', 'Active', 0),
(32, 'ANDAMAN & NICOBAR', 'AN', 99, 'IN', 'Active', 0),
(33, 'UTTARANCHAL', 'UT', 99, 'IN', 'Active', 0),
(34, 'JHARKHAND', 'JH', 99, 'IN', 'Active', 0),
(35, 'CHATTISGARH', 'CG', 99, 'IN', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country_master`
--

CREATE TABLE `tbl_country_master` (
  `id` int(11) NOT NULL,
  `country_code` char(2) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `telephone_prefix` varchar(10) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_country_master`
--

INSERT INTO `tbl_country_master` (`id`, `country_code`, `country_name`, `currency_code`, `telephone_prefix`, `status`) VALUES
(1, 'AD', 'Andorra', 'EUR', '+376', 'Active'),
(2, 'AE', 'United Arab Emirates', 'AED', '+971', 'Active'),
(3, 'AF', 'Afghanistan', 'AFN', '+93', 'Active'),
(4, 'AG', 'Antigua and Barbuda', 'XCD', '+1-268', 'Active'),
(5, 'AI', 'Anguilla', 'XCD', '+1-264', 'Active'),
(6, 'AL', 'Albania', 'ALL', '+355', 'Active'),
(7, 'AM', 'Armenia', 'AMD', '+374', 'Active'),
(8, 'AO', 'Angola', 'AOA', '+244', 'Active'),
(9, 'AQ', 'Antarctica', '', '+672', 'Active'),
(10, 'AR', 'Argentina', 'ARS', '+54', 'Active'),
(11, 'AS', 'American Samoa', 'USD', '+1-684', 'Active'),
(12, 'AT', 'Austria', 'EUR', '+43', 'Active'),
(13, 'AU', 'Australia', 'AUD', '+61', 'Active'),
(14, 'AW', 'Aruba', 'AWG', '+297', 'Active'),
(15, 'AX', 'Åland Islands', 'EUR', '+358', 'Active'),
(16, 'AZ', 'Azerbaijan', 'AZN', '+994', 'Active'),
(17, 'BA', 'Bosnia and Herzegovina', 'BAM', '+387', 'Active'),
(18, 'BB', 'Barbados', 'BBD', '+1-246', 'Active'),
(19, 'BD', 'Bangladesh', 'BDT', '+880', 'Active'),
(20, 'BE', 'Belgium', 'EUR', '+32', 'Active'),
(21, 'BF', 'Burkina Faso', 'XOF', '+226', 'Active'),
(22, 'BG', 'Bulgaria', 'BGN', '+359', 'Active'),
(23, 'BH', 'Bahrain', 'BHD', '+973', 'Active'),
(24, 'BI', 'Burundi', 'BIF', '+257', 'Active'),
(25, 'BJ', 'Benin', 'XOF', '+229', 'Active'),
(26, 'BL', 'Saint Barthélemy', 'EUR', '+590', 'Active'),
(27, 'BM', 'Bermuda', 'BMD', '+1-441', 'Active'),
(28, 'BN', 'Brunei Darussalam', 'BND', '+673', 'Active'),
(29, 'BO', 'Bolivia', 'BOB', '+591', 'Active'),
(30, 'BQ', 'Bonaire, Sint Eustatius and Saba', 'USD', '+599', 'Active'),
(31, 'BR', 'Brazil', 'BRL', '+55', 'Active'),
(32, 'BS', 'Bahamas', 'BSD', '+1-242', 'Active'),
(33, 'BT', 'Bhutan', 'BTN', '+975', 'Active'),
(34, 'BV', 'Bouvet Island', 'NOK', '+47', 'Active'),
(35, 'BW', 'Botswana', 'BWP', '+267', 'Active'),
(36, 'BY', 'Belarus', 'BYR', '+375', 'Active'),
(37, 'BZ', 'Belize', 'BZD', '+501', 'Active'),
(38, 'CA', 'Canada', 'CAD', '+1', 'Active'),
(39, 'CC', 'Cocos [Keeling] Islands', 'AUD', '+61', 'Active'),
(40, 'CD', 'Democratic Republic of the Congo', 'COD', '+243', 'Active'),
(41, 'CF', 'Central African Republic', 'XAF', '+236', 'Active'),
(42, 'CG', 'Republic of the Congo', 'XAF', '+242', 'Active'),
(43, 'CH', 'Switzerland', 'CHF', '+41	', 'Active'),
(44, 'CI', 'Ivory Coast', 'XOF', '+225', 'Active'),
(45, 'CK', 'Cook Islands', 'NZD', '+682', 'Active'),
(46, 'CL', 'Chile', 'CLP', '+56', 'Active'),
(47, 'CM', 'Cameroon', 'XAF', '+237', 'Active'),
(48, 'CN', 'China', 'CNY', '+86', 'Active'),
(49, 'CO', 'Colombia', 'COP', '+57', 'Active'),
(50, 'CR', 'Costa Rica', 'CRC', '+506', 'Active'),
(51, 'CU', 'Cuba', 'CUP', '+53', 'Active'),
(52, 'CV', 'Cape Verde', 'CVE', '+238', 'Active'),
(53, 'CW', 'Curaçao', 'ANG', '+599', 'Active'),
(54, 'CX', 'Christmas Island', 'AUD', '+61', 'Active'),
(55, 'CY', 'Cyprus', 'EUR', '+357', 'Active'),
(56, 'CZ', 'Czech Republic', 'CZK', '+420', 'Active'),
(57, 'DE', 'Germany', 'EUR', '+49', 'Active'),
(58, 'DJ', 'Djibouti', 'DJF', '+253', 'Active'),
(59, 'DK', 'Denmark', 'DKK', '+45', 'Active'),
(60, 'DM', 'Dominica', 'XCD', '+1-767', 'Active'),
(61, 'DO', 'Dominican Republic', 'DOP', '+1-809', 'Active'),
(62, 'DZ', 'Algeria', 'DZD', '+213', 'Active'),
(63, 'EC', 'Ecuador', 'USD', '+593', 'Active'),
(64, 'EE', 'Estonia', 'EUR', '+372', 'Active'),
(65, 'EG', 'Egypt', 'EGP', '+20', 'Active'),
(66, 'EH', 'Western Sahara', 'MAD', '+212', 'Active'),
(67, 'ER', 'Eritrea', 'ERN', '+291', 'Active'),
(68, 'ES', 'Spain', 'EUR', '+34', 'Active'),
(69, 'ET', 'Ethiopia', 'ETB', '+251', 'Active'),
(70, 'FI', 'Finland', 'EUR', '+358', 'Active'),
(71, 'FJ', 'Fiji', 'FJD', '+679', 'Active'),
(72, 'FK', 'Falkland Islands', 'FKP', '+500', 'Active'),
(73, 'FM', 'Micronesia', 'USD', '+691', 'Active'),
(74, 'FO', 'Faroe Islands', 'DKK', '+298', 'Active'),
(75, 'FR', 'France', 'EUR', '+33', 'Active'),
(76, 'GA', 'Gabon', 'XAF', '+241', 'Active'),
(77, 'GB', 'United Kingdom of Great Britain and Northern Ireland', 'GBP', '+44', 'Active'),
(78, 'GD', 'Grenada', 'XCD', '+1-473', 'Active'),
(79, 'GE', 'Georgia', 'GEL', '+995', 'Active'),
(80, 'GF', 'French Guiana', 'EUR', '+594', 'Active'),
(81, 'GG', 'Guernsey', 'GBP', '+44-1481', 'Active'),
(82, 'GH', 'Ghana', 'GHS', '+233', 'Active'),
(83, 'GI', 'Gibraltar', 'GIP', '+350', 'Active'),
(84, 'GL', 'Greenland', 'DKK', '+299', 'Active'),
(85, 'GM', 'Gambia', 'GMD', '+220', 'Active'),
(86, 'GN', 'Guinea', 'GNF', '+224', 'Active'),
(87, 'GP', 'Guadeloupe', 'EUR', '+590', 'Active'),
(88, 'GQ', 'Equatorial Guinea', 'XAF', '+240', 'Active'),
(89, 'GR', 'Greece', 'EUR', '+30', 'Active'),
(90, 'GS', 'South Georgia and the South Sandwich Islands', 'GBP', '+500', 'Active'),
(91, 'GT', 'Guatemala', 'GTQ', '+502', 'Active'),
(92, 'GU', 'Guam', 'USD', '+1-671', 'Active'),
(93, 'GW', 'Guinea-Bissau', 'XOF', '+245', 'Active'),
(94, 'GY', 'Guyana', 'GYD', '+592', 'Active'),
(95, 'HK', 'Hong Kong', 'HKD', '+852', 'Active'),
(96, 'HM', 'Heard Island and McDonald Islands', 'AUD', '+672', 'Active'),
(97, 'HN', 'Honduras', 'HNL', '+504', 'Active'),
(98, 'HR', 'Croatia', 'HRK', '+385', 'Active'),
(99, 'HT', 'Haiti', 'HTG', '+509', 'Active'),
(100, 'HU', 'Hungary', 'HUF', '+36', 'Active'),
(101, 'ID', 'Indonesia', 'IDR', '+62', 'Active'),
(102, 'IE', 'Ireland', 'EUR', '+353', 'Active'),
(103, 'IL', 'Israel', 'ILS', '+972', 'Active'),
(104, 'IM', 'Isle of Man', 'GBP', '+44-1624', 'Active'),
(105, 'IN', 'India', 'INR', '+91', 'Active'),
(106, 'IO', 'British Indian Ocean Territory', 'USD', '+246', 'Active'),
(107, 'IQ', 'Iraq', 'IQD', '+964', 'Active'),
(108, 'IR', 'Iran', 'IRR', '+98', 'Active'),
(109, 'IS', 'Iceland', 'ISK', '+354', 'Active'),
(110, 'IT', 'Italy', 'EUR', '+39', 'Active'),
(111, 'JE', 'Jersey', 'GBP', '+44-1534', 'Active'),
(112, 'JM', 'Jamaica', 'JMD', '+1-876', 'Active'),
(113, 'JO', 'Jordan', 'JOD', '+962', 'Active'),
(114, 'JP', 'Japan', 'JPY', '+81', 'Active'),
(115, 'KE', 'Kenya', 'KES', '+254', 'Active'),
(116, 'KG', 'Kyrgyzstan', 'KGS', '+996', 'Active'),
(117, 'KH', 'Cambodia', 'KHR', '+855', 'Active'),
(118, 'KI', 'Kiribati', 'AUD', '+686', 'Active'),
(119, 'KM', 'Comoros', 'KMF', '+269', 'Active'),
(120, 'KN', 'Saint Kitts and Nevis', 'XCD', '+1-869', 'Active'),
(121, 'KP', 'North Korea', 'KPW', '+850', 'Active'),
(122, 'KR', 'South Korea', 'KRW', '+82', 'Active'),
(123, 'KW', 'Kuwait', 'KWD', '+965', 'Active'),
(124, 'KY', 'Cayman Islands', 'KYD', '+1-345', 'Active'),
(125, 'KZ', 'Kazakhstan', 'KZT', '+7', 'Active'),
(126, 'LA', 'Laos', 'LAK', '+856', 'Active'),
(127, 'LB', 'Lebanon', 'LBP', '+961', 'Active'),
(128, 'LC', 'Saint Lucia', 'XCD', '+1-758', 'Active'),
(129, 'LI', 'Liechtenstein', 'CHF', '+423', 'Active'),
(130, 'LK', 'Sri Lanka', 'LKR', '+94', 'Active'),
(131, 'LR', 'Liberia', 'LRD', '+231', 'Active'),
(132, 'LS', 'Lesotho', 'LSL', '+266', 'Active'),
(133, 'LT', 'Lithuania', 'EUR', '+370', 'Active'),
(134, 'LU', 'Luxembourg', 'EUR', '+352', 'Active'),
(135, 'LV', 'Latvia', 'EUR', '+371', 'Active'),
(136, 'LY', 'Libya', 'LYD', '+218', 'Active'),
(137, 'MA', 'Morocco', 'MAD', '+212', 'Active'),
(138, 'MC', 'Monaco', 'EUR', '+377', 'Active'),
(139, 'MD', 'Moldova', 'MDL', '+373', 'Active'),
(140, 'ME', 'Montenegro', 'EUR', '+382', 'Active'),
(141, 'MF', 'Saint Martin', 'EUR', '+590', 'Active'),
(142, 'MG', 'Madagascar', 'MGA', '+261', 'Active'),
(143, 'MH', 'Marshall Islands', 'USD', '+692', 'Active'),
(144, 'MK', 'North Macedonia', 'MKD', '+389', 'Active'),
(145, 'ML', 'Mali', 'XOF', '+223', 'Active'),
(146, 'MM', 'Myanmar [Burma]', 'MMK', '+95', 'Active'),
(147, 'MN', 'Mongolia', 'MNT', '+976', 'Active'),
(148, 'MO', 'Macao', 'MOP', '+853', 'Active'),
(149, 'MP', 'Northern Mariana Islands', 'USD', '+1-670', 'Active'),
(150, 'MQ', 'Martinique', 'EUR', '+596', 'Active'),
(151, 'MR', 'Mauritania', 'MRO', '+222', 'Active'),
(152, 'MS', 'Montserrat', 'XCD', '+1-664', 'Active'),
(153, 'MT', 'Malta', 'EUR', '+356', 'Active'),
(154, 'MU', 'Mauritius', 'MUR', '+230', 'Active'),
(155, 'MV', 'Maldives', 'MVR', '+960', 'Active'),
(156, 'MW', 'Malawi', 'MWK', '+265', 'Active'),
(157, 'MX', 'Mexico', 'MXN', '+52', 'Active'),
(158, 'MY', 'Malaysia', 'MYR', '+60', 'Active'),
(159, 'MZ', 'Mozambique', 'MZN', '+258', 'Active'),
(160, 'NA', 'Namibia', 'NAD', '+264', 'Active'),
(161, 'NC', 'New Caledonia', 'XPF', '+687', 'Active'),
(162, 'NE', 'Niger', 'XOF', '+227', 'Active'),
(163, 'NF', 'Norfolk Island', 'AUD', '+672', 'Active'),
(164, 'NG', 'Nigeria', 'NGN', '+234', 'Active'),
(165, 'NI', 'Nicaragua', 'NIO', '+505', 'Active'),
(166, 'NL', 'Netherlands', 'EUR', '+31', 'Active'),
(167, 'NO', 'Norway', 'NOK', '+47', 'Active'),
(168, 'NP', 'Nepal', 'NPR', '+977', 'Active'),
(169, 'NR', 'Nauru', 'AUD', '+674', 'Active'),
(170, 'NU', 'Niue', 'NZD', '+683', 'Active'),
(171, 'NZ', 'New Zealand', 'NZD', '+64', 'Active'),
(172, 'OM', 'Oman', 'OMR', '+968', 'Active'),
(173, 'PA', 'Panama', 'PAB', '+507', 'Active'),
(174, 'PE', 'Peru', 'PEN', '+51', 'Active'),
(175, 'PF', 'French Polynesia', 'XPF', '+689', 'Active'),
(176, 'PG', 'Papua New Guinea', 'PGK', '+675', 'Active'),
(177, 'PH', 'Philippines', 'PHP', '+63', 'Active'),
(178, 'PK', 'Pakistan', 'PKR', '+92', 'Active'),
(179, 'PL', 'Poland', 'PLN', '+48', 'Active'),
(180, 'PM', 'Saint Pierre and Miquelon', 'EUR', '+508', 'Active'),
(181, 'PN', 'Pitcairn Islands', 'NZD', '+64', 'Active'),
(182, 'PR', 'Puerto Rico', 'USD', '+1-787', 'Active'),
(183, 'PS', 'Palestine', 'ILS', '+970', 'Active'),
(184, 'PT', 'Portugal', 'EUR', '+351', 'Active'),
(185, 'PW', 'Palau', 'USD', '+680', 'Active'),
(186, 'PY', 'Paraguay', 'PYG', '+595', 'Active'),
(187, 'QA', 'Qatar', 'QAR', '+974', 'Active'),
(188, 'RE', 'Réunion', 'EUR', '+262', 'Active'),
(189, 'RO', 'Romania', 'RON', '+40', 'Active'),
(190, 'RS', 'Serbia', 'RSD', '+381', 'Active'),
(191, 'RU', 'Russia', 'RUB', '+7', 'Active'),
(192, 'RW', 'Rwanda', 'RWF', '+250', 'Active'),
(193, 'SA', 'Saudi Arabia', 'SAR', '+966', 'Active'),
(194, 'SB', 'Solomon Islands', 'SBD', '+677', 'Active'),
(195, 'SC', 'Seychelles', 'SCR', '+248', 'Active'),
(196, 'SD', 'Sudan', 'SDG', '+249', 'Active'),
(197, 'SE', 'Sweden', 'SEK', '+46', 'Active'),
(198, 'SG', 'Singapore', 'SGD', '+65', 'Active'),
(199, 'SH', 'Saint Helena', 'SHP', '+290', 'Active'),
(200, 'SI', 'Slovenia', 'EUR', '+386', 'Active'),
(201, 'SJ', 'Svalbard and Jan Mayen', 'NOK', '+47', 'Active'),
(202, 'SK', 'Slovakia', 'EUR', '+421', 'Active'),
(203, 'SL', 'Sierra Leone', 'SLL', '+232', 'Active'),
(204, 'SM', 'San Marino', 'EUR', '+378', 'Active'),
(205, 'SN', 'Senegal', 'XOF', '+221', 'Active'),
(206, 'SO', 'Somalia', 'SOS', '+252', 'Active'),
(207, 'SR', 'Suriname', 'SRD', '+597', 'Active'),
(208, 'SS', 'South Sudan', 'SSP', '+211', 'Active'),
(209, 'ST', 'São Tomé and Príncipe', 'STD', '+239', 'Active'),
(210, 'SV', 'El Salvador', 'USD', '+503', 'Active'),
(211, 'SX', 'Sint Maarten', 'ANG', '+1-721', 'Active'),
(212, 'SY', 'Syria', 'SYP', '+963', 'Active'),
(213, 'SZ', 'Eswatini', 'SZL', '+268', 'Active'),
(214, 'TC', 'Turks and Caicos Islands', 'USD', '+1-649', 'Active'),
(215, 'TD', 'Chad', 'XAF', '+235', 'Active'),
(216, 'TF', 'French Southern Territories', 'EUR', '+262', 'Active'),
(217, 'TG', 'Togo', 'XOF', '+228', 'Active'),
(218, 'TH', 'Thailand', 'THB', '+66', 'Active'),
(219, 'TJ', 'Tajikistan', 'TJS', '+992', 'Active'),
(220, 'TK', 'Tokelau', 'NZD', '+690', 'Active'),
(221, 'TL', 'East Timor', 'USD', '+670', 'Active'),
(222, 'TM', 'Turkmenistan', 'TMT', '+993', 'Active'),
(223, 'TN', 'Tunisia', 'TND', '+216', 'Active'),
(224, 'TO', 'Tonga', 'TOP', '+676', 'Active'),
(225, 'TR', 'Turkey', 'TRY', '+90', 'Active'),
(226, 'TT', 'Trinidad and Tobago', 'TTD', '+1-868', 'Active'),
(227, 'TV', 'Tuvalu', 'AUD', '+688', 'Active'),
(228, 'TW', 'Taiwan', 'TWD', '+886', 'Active'),
(229, 'TZ', 'Tanzania', 'TZS', '+255', 'Active'),
(230, 'UA', 'Ukraine', 'UAH', '+380', 'Active'),
(231, 'UG', 'Uganda', 'UGX', '+256', 'Active'),
(232, 'UM', 'U.S. Minor Outlying Islands', 'USD', '+1', 'Active'),
(233, 'US', 'United States', 'USD', '+1', 'Active'),
(234, 'UY', 'Uruguay', 'UYU', '+598', 'Active'),
(235, 'UZ', 'Uzbekistan', 'UZS', '+998', 'Active'),
(236, 'VA', 'Vatican City', 'EUR', '+379', 'Active'),
(237, 'VC', 'Saint Vincent and the Grenadines', 'XCD', '+1-784', 'Active'),
(238, 'VE', 'Venezuela', 'VEF', '+58', 'Active'),
(239, 'VG', 'British Virgin Islands', 'USD', '+1-284', 'Active'),
(240, 'VI', 'U.S. Virgin Islands', 'USD', '+1-340', 'Active'),
(241, 'VN', 'Vietnam', 'VND', '+84', 'Active'),
(242, 'VU', 'Vanuatu', 'VUV', '+678', 'Active'),
(243, 'WF', 'Wallis and Futuna', 'XPF', '+681', 'Active'),
(244, 'WS', 'Samoa', 'WST', '+685', 'Active'),
(245, 'XK', 'Kosovo', 'EUR', '+383', 'Active'),
(246, 'YE', 'Yemen', 'YER', '+967', 'Active'),
(247, 'YT', 'Mayotte', 'EUR', '+262', 'Active'),
(248, 'ZA', 'South Africa', 'ZAR', '+27', 'Active'),
(249, 'ZM', 'Zambia', 'ZMW', '+260', 'Active'),
(250, 'ZW', 'Zimbabwe', 'ZWL', '+263', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement_master`
--
ALTER TABLE `announcement_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_correction`
--
ALTER TABLE `attendance_correction`
  ADD PRIMARY KEY (`attendance_correction_id`);

--
-- Indexes for table `bank_master`
--
ALTER TABLE `bank_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `company_variables`
--
ALTER TABLE `company_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department_master`
--
ALTER TABLE `department_master`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `designation_master`
--
ALTER TABLE `designation_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation_salary_structure`
--
ALTER TABLE `designation_salary_structure`
  ADD PRIMARY KEY (`designation_salary_structure_id`);

--
-- Indexes for table `designation_salary_structure_component`
--
ALTER TABLE `designation_salary_structure_component`
  ADD PRIMARY KEY (`designation_salary_structure_component_id`);

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`attendance_id`);

--
-- Indexes for table `employee_combo_off`
--
ALTER TABLE `employee_combo_off`
  ADD PRIMARY KEY (`employee_combo_off_id`);

--
-- Indexes for table `employee_extended_salary_structure`
--
ALTER TABLE `employee_extended_salary_structure`
  ADD PRIMARY KEY (`employee_extended_salary_structure_id`);

--
-- Indexes for table `employee_extended_salary_structure_component`
--
ALTER TABLE `employee_extended_salary_structure_component`
  ADD PRIMARY KEY (`employee_extended_salary_component_id`);

--
-- Indexes for table `employee_leave`
--
ALTER TABLE `employee_leave`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `employee_master`
--
ALTER TABLE `employee_master`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_shift`
--
ALTER TABLE `employee_shift`
  ADD PRIMARY KEY (`employee_shift_id`);

--
-- Indexes for table `employee_week_off`
--
ALTER TABLE `employee_week_off`
  ADD PRIMARY KEY (`week_off_id`);

--
-- Indexes for table `holiday_master`
--
ALTER TABLE `holiday_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_allocation`
--
ALTER TABLE `leave_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_component`
--
ALTER TABLE `salary_component`
  ADD PRIMARY KEY (`salary_component_id`);

--
-- Indexes for table `shift_master`
--
ALTER TABLE `shift_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`iStateId`),
  ADD KEY `mod_state_iCountryId_index` (`iCountryId`);

--
-- Indexes for table `tbl_country_master`
--
ALTER TABLE `tbl_country_master`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement_master`
--
ALTER TABLE `announcement_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_correction`
--
ALTER TABLE `attendance_correction`
  MODIFY `attendance_correction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_master`
--
ALTER TABLE `bank_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_variables`
--
ALTER TABLE `company_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department_master`
--
ALTER TABLE `department_master`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation_master`
--
ALTER TABLE `designation_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation_salary_structure`
--
ALTER TABLE `designation_salary_structure`
  MODIFY `designation_salary_structure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designation_salary_structure_component`
--
ALTER TABLE `designation_salary_structure_component`
  MODIFY `designation_salary_structure_component_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_combo_off`
--
ALTER TABLE `employee_combo_off`
  MODIFY `employee_combo_off_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_extended_salary_structure`
--
ALTER TABLE `employee_extended_salary_structure`
  MODIFY `employee_extended_salary_structure_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_extended_salary_structure_component`
--
ALTER TABLE `employee_extended_salary_structure_component`
  MODIFY `employee_extended_salary_component_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_master`
--
ALTER TABLE `employee_master`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `employee_shift_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_week_off`
--
ALTER TABLE `employee_week_off`
  MODIFY `week_off_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday_master`
--
ALTER TABLE `holiday_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_allocation`
--
ALTER TABLE `leave_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_component`
--
ALTER TABLE `salary_component`
  MODIFY `salary_component_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift_master`
--
ALTER TABLE `shift_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `iStateId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
