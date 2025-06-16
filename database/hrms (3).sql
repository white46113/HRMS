-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 06:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
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

--
-- Dumping data for table `attendance_correction`
--

INSERT INTO `attendance_correction` (`attendance_correction_id`, `attendance_id`, `attendance_in_time`, `attendance_out_time`, `attendance_correction_in_time`, `attendance_correction_out_time`, `status`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(1, 1, '2025-05-25 12:46:59', '2025-05-25 12:47:13', '2025-05-25 09:30:00', '2025-05-25 18:30:00', 'Approve', 15, '2025-05-25', 1, '2025-05-25'),
(2, 97, '2025-06-02 11:46:11', '2025-06-02 11:52:17', '2025-06-02 09:00:00', '2025-06-02 11:52:00', 'Approve', 21, '2025-06-02', 20, '2025-06-02');

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

--
-- Dumping data for table `bank_master`
--

INSERT INTO `bank_master` (`id`, `bank_name`, `branch_address`, `ifsc_code`, `account_type`, `account_no`, `account_holder_name`, `default_bank`, `entity_type`, `entity_id`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`) VALUES
(1, 'YES BANK LTD', 'EMPIRE ESTATE CHINCHWAD', 'YESB0000648', 'Current', '064884600002299', 'BSP METATECH LLP', 'Yes', 'Company', 1, 1, '2025-04-13 11:24:22', NULL, NULL, 'Active'),
(2, 'NKGSB BANK', 'BHOSARI', 'NKGS0000050', 'Current', '05011010000094', 'SHUBHAM ENTERPRISES', 'Yes', 'Company', 2, 2, '2025-04-14 09:12:21', 1, '2025-04-26 05:33:18', 'Active'),
(3, 'YES BANK LTD', ' SANTACRUZ EAST', 'YESB0000462', 'Saving', '046291900011615', 'SUHAS SHIVAJI PATIL', 'Yes', 'Employee', 3, 0, '2025-04-14 14:31:18', 1, '0000-00-00 00:00:00', 'Active'),
(4, 'NKGSB BANK', 'Bhosari', 'NKGS0000050', 'Current', '050110100000944', 'SHUBHAM PATIL', 'Yes', 'Employee', 4, 0, '2025-04-16 11:49:44', NULL, NULL, 'Active'),
(5, 'YES BANK LTD', 'EMPIRE ESTATE,CHICHWAD', 'YESB0000551', 'Saving', '055191600007283', 'AJAY VIJAYSINGH KADAM', 'Yes', 'Employee', 5, 0, '2025-05-19 09:14:40', NULL, NULL, 'Active'),
(6, 'YES BANK', 'CHICHWAD', 'YESB0001437', 'Saving', '143791900001992', 'JAGATAMBA PRASAD YADAV', 'Yes', 'Employee', 6, 0, '2025-05-19 10:11:05', NULL, NULL, 'Active'),
(7, 'YES BANK', 'CHICHWAD', 'YESB0000462', 'Saving', '46291900010952', 'SANJIT SAMANTA', 'Yes', 'Employee', 7, 0, '2025-05-19 10:46:59', NULL, NULL, 'Active'),
(8, 'YES BANK', 'CHICHWAD', 'YESB0000551', 'Saving', '055191600007283', 'AJAY VIJAYSINGH KADAM', 'Yes', 'Employee', 8, 0, '2025-05-19 10:56:43', NULL, NULL, 'Active'),
(9, 'YES BANK', 'CHICHWAD', 'YESB0000648', 'Saving', '064899500056502', 'AMOL MAHADEV MORE', 'Yes', 'Employee', 9, 0, '2025-05-19 11:05:15', NULL, NULL, 'Active'),
(10, 'Yes Bank Ltd', 'PIMPLE SOUDAGAR', 'YESB0000462', 'Saving', '46291900010922', 'AMOL SHIVAJI NARUTE', 'Yes', 'Employee', 10, 0, '2025-05-19 11:30:14', NULL, NULL, 'Active'),
(11, 'Yes Bank Ltd', 'CHICHWAD', 'YESB0000648', 'Saving', '-064899500056499', 'SURAJ SHELKE', 'Yes', 'Employee', 11, 0, '2025-05-25 07:03:27', NULL, NULL, 'Active'),
(12, 'Yes Bank Ltd', 'CHICHWAD', 'YESB0001020', 'Saving', '102091900014992', 'Sujata Yuvaraj Patil', 'Yes', 'Employee', 12, 0, '2025-05-25 07:31:35', NULL, NULL, 'Active'),
(13, 'Yes Bank Ltd', 'Pimple saudagar', 'YESB0000648', 'Saving', '064899500056512', 'Rahul Waghmode', 'Yes', 'Employee', 13, 0, '2025-05-25 08:03:42', NULL, NULL, 'Active'),
(14, 'Yes Bank Ltd', 'CHICHWAD', 'YESB0000648', 'Saving', '64899500056489', 'Nitin Rameshji Bobde', 'Yes', 'Employee', 14, 0, '2025-05-25 08:14:18', NULL, NULL, 'Active'),
(15, 'YES BANK LTD', ' SANTACRUZ EAST', 'YESB0000462', 'Saving', '046291900011625', 'RAHUL DATTATRAY POKHARKAR', 'Yes', 'Employee', 15, 0, '2025-05-25 08:15:26', 1, '0000-00-00 00:00:00', 'Active'),
(16, 'Yes Bank Ltd', 'PIMPLE SAUDAGAR', 'YESB0000648', 'Saving', '46291900039714    ', 'ANIKET GANESH SAUNDANE', 'Yes', 'Employee', 16, 0, '2025-05-25 08:53:04', NULL, NULL, 'Active'),
(17, 'Yes Bank Ltd', 'PIMPLE SOUDAGAR', 'YESB0000462', 'Saving', '46291900011582', 'HANUMANT SHANKAR GOSAVI', 'Yes', 'Employee', 17, 0, '2025-05-25 09:00:06', NULL, NULL, 'Active'),
(18, 'State Bank of India', 'Connaught Place, New Delhi', 'SBIN0001234', 'Saving', '123456789012', 'AROM Infotect', 'Yes', 'Company', 3, 1, '2025-05-28 12:09:53', NULL, NULL, 'Active'),
(19, 'ABC Bank of India', 'MG Road, Mumbai', 'ABCD0123456', 'Current', '123456789013', 'Gayatri Narayan Hedau', 'Yes', 'Employee', 18, 0, '2025-05-28 12:14:19', NULL, NULL, 'Active'),
(20, 'State Bank of India', 'MG Road, Mumbai', 'SBIN0001234', 'Saving', '123456789012', 'Aarbaj Mulla', 'Yes', 'Employee', 19, 0, '2025-05-28 14:40:12', 18, '0000-00-00 00:00:00', 'Active'),
(21, 'State Bank of India', 'Connaught Place, New Delhi', 'SBIN0001234', 'Current', '123456789012', 'Zolo Info Zone ', 'Yes', 'Company', 4, 2, '2025-06-02 11:10:27', NULL, NULL, 'Active'),
(22, 'ABC Bank of India', 'MG Road, Mumbai', 'ABCD0123456', 'Current', '123456789013', 'Gayu Zolo', 'Yes', 'Employee', 20, 0, '2025-06-02 11:16:35', NULL, NULL, 'Active'),
(23, 'ABC Bank of India', 'MG Road, Mumbai', 'ABCD0123457', 'Saving', '123456789018', 'Nikita Zolo', 'Yes', 'Employee', 21, 0, '2025-06-02 11:24:33', NULL, NULL, 'Active'),
(24, 'State Bank of India', 'MG Road, Mumbai', 'ABCD0123456', 'Current', '123456789013', 'Aarbaj Mulla', 'Yes', 'Employee', 22, 0, '2025-06-02 15:15:01', NULL, NULL, 'Active');

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

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `company_name`, `company_code`, `company_logo`, `company_email`, `company_address`, `city`, `state`, `country`, `zip_code`, `website`, `contact_number_code`, `date_founded`, `description`, `pan_number`, `contact_number`, `contact_person`, `gst_number`, `tan_number`, `added_by`, `added_on`, `updated_by`, `updated_on`) VALUES
(1, 'BSP METATECH LLP', '', 'logo.jpg', 'Accounts@bspmetatech.com', 'Gat No-177 ,Phase-III,MIDC Chakan Pune-410501', 'pune', 12, 105, '410501', '', '+91', '2015-04-01', ' ', 'AAFFL7327N', '09146966873', 'Rahul Pokharkar', '27AAFFL7327N1ZT', 'PNEB10819E', 1, '2025-04-13 11:24:22', NULL, NULL),
(3, 'AROM Infotech', 'AROM', 'Colorful_Minimalist_Social_Community_Logo-removebg-preview1.png', 'arom@gmail.com', 'Gat No-177 ,Phase-III,MIDC Chakan Pune-410501', 'Pune', 12, 105, '411046', '', '+91', '2016-05-01', ' ', 'ABCDE1234F', '9874563210', 'Gayu', '27AAHCC0130B2ZF', '', 1, '2025-05-28 12:09:53', NULL, NULL),
(4, 'Zolo Info Zone', 'ZIN', 'Bharat_ID_Icon.png', 'zolo@gmail.com', 'Baner', 'Pune', 12, 105, '440017', '', '+91', '2015-06-01', ' NA', 'ABCDE1234F', '9874563210', 'Gayu Hedau', '27AAECM2936N1Z2', 'NA', 2, '2025-06-02 11:10:27', NULL, NULL);

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

--
-- Dumping data for table `company_variables`
--

INSERT INTO `company_variables` (`id`, `name`, `title`, `value`, `description`, `type`, `company_id`) VALUES
(1, 'email_notification', 'Email Notification', 'No', 'This use for enable/disable notifications', 'check_box', 1),
(2, 'birthday_wishes_notification', 'Birthday Wishes Notification', 'No', 'This use for enable/disable birthday wishes email notifications', 'check_box', 1),
(3, 'anniversary_wishes_notification', 'Anniversary Wishes Notification', 'No', 'This use for enable/disable anniversary wishes email notifications', 'check_box', 1),
(4, 'combo_off_valid_day', 'Combo Off Valid Day', '30', 'This use for allow to add before combo off', 'input', 1),
(5, 'shift_in_time', 'Default Shift In Time', '9:30 AM', 'This use for set shift in time in case of employee shift not define', 'input', 1),
(6, 'shift_out_time', 'Default Shift out Time', '7:30 PM', 'This use for set shift out time in case of employee shift not define', 'input', 1),
(7, 'attendance_pin', 'Attendence pin', '410501', 'This use for set default attendance pin for employee', 'input', 1),
(8, 'company_prefix', 'Company prefix', 'BSP METATECH LLP', 'This is company prefix', 'input', 1),
(17, 'email_notification', 'Email Notification', 'No', 'This use for enable/disable notifications', 'check_box', 3),
(18, 'birthday_wishes_notification', 'Birthday Wishes Notification', 'No', 'This use for enable/disable birthday wishes email notifications', 'check_box', 3),
(19, 'anniversary_wishes_notification', 'Anniversary Wishes Notification', 'No', 'This use for enable/disable anniversary wishes email notifications', 'check_box', 3),
(20, 'combo_off_valid_day', 'Combo Off Valid Day', '30', 'This use for allow to add before combo off', 'input', 3),
(21, 'shift_in_time', 'Default Shift In Time', '9:30 AM', 'This use for set shift in time in case of employee shift not define', 'input', 3),
(22, 'shift_out_time', 'Default Shift out Time', '7:30 PM', 'This use for set shift out time in case of employee shift not define', 'input', 3),
(23, 'attendance_pin', 'Attendence pin', '123456', 'This use for set default attendance pin for employee', 'input', 3),
(24, 'company_prefix', 'Company prefix', 'AROM', 'This is company prefix', 'input', 3),
(25, 'email_notification', 'Email Notification', 'No', 'This use for enable/disable notifications', 'check_box', 4),
(26, 'birthday_wishes_notification', 'Birthday Wishes Notification', 'No', 'This use for enable/disable birthday wishes email notifications', 'check_box', 4),
(27, 'anniversary_wishes_notification', 'Anniversary Wishes Notification', 'No', 'This use for enable/disable anniversary wishes email notifications', 'check_box', 4),
(28, 'combo_off_valid_day', 'Combo Off Valid Day', '30', 'This use for allow to add before combo off', 'input', 4),
(29, 'shift_in_time', 'Default Shift In Time', '9:30 AM', 'This use for set shift in time in case of employee shift not define', 'input', 4),
(30, 'shift_out_time', 'Default Shift out Time', '7:30 PM', 'This use for set shift out time in case of employee shift not define', 'input', 4),
(31, 'attendance_pin', 'Attendence pin', '123456', 'This use for set default attendance pin for employee', 'input', 4),
(32, 'company_prefix', 'Company prefix', 'ZIN', 'This is company prefix', 'input', 4);

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

--
-- Dumping data for table `department_master`
--

INSERT INTO `department_master` (`department_id`, `departmen_name`, `department_code`, `company_id`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(1, 'ACCOUNTS & FINANCE ', 'NA', 1, 1, '2025-04-13 11:24:54', 1, '2025-04-14 13:46:45'),
(3, 'PURCHASES & STORE ', 'NA', 1, 1, '2025-04-14 13:47:03', NULL, NULL),
(4, 'DESIGN & DEVLOPMENT  ', 'NA1', 1, 1, '2025-04-14 13:47:41', NULL, NULL),
(5, 'QUALITY & QMS', 'NA2', 1, 1, '2025-04-14 13:49:16', NULL, NULL),
(6, 'PRODUCTION ', 'NA3', 1, 1, '2025-04-14 13:49:33', NULL, NULL),
(7, 'LABOUR ', 'NA4', 1, 1, '2025-04-14 13:49:58', NULL, NULL),
(8, 'LOGISTICS ', 'NA5', 1, 1, '2025-04-14 13:53:12', NULL, NULL),
(13, 'PLANT HEAD', 'Head', 1, 1, '2025-05-25 12:17:30', NULL, NULL),
(14, 'Dev - AROM', 'DEV', 3, 1, '2025-05-28 12:10:16', NULL, NULL),
(15, 'Accountant - AROM', 'ACC', 3, 18, '2025-05-28 16:11:59', NULL, NULL),
(16, 'BA- AROM', 'BA', 3, 18, '2025-05-29 09:41:50', NULL, NULL),
(17, 'Dev - Zolo', 'DEV', 4, 2, '2025-06-02 11:11:07', NULL, NULL);

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

--
-- Dumping data for table `designation_master`
--

INSERT INTO `designation_master` (`id`, `designation_name`, `department_id`, `grads`, `created_on`, `created_by`, `updated_on`, `updated_by`, `status`) VALUES
(3, 'GENRAL MANAGER', 6, 'I', '2025-04-14 13:50:56', 0, NULL, NULL, 'Active'),
(4, 'PLANT HEAD ', 6, 'II', '2025-04-14 13:51:27', 0, NULL, NULL, 'Active'),
(5, 'FIANANCE & PURCHASES HEAD ', 1, 'II', '2025-04-14 13:52:15', 0, NULL, NULL, 'Active'),
(6, 'ACCOUNTANT', 1, 'II', '2025-04-14 13:52:33', 0, NULL, NULL, 'Active'),
(7, 'DRIVER', 8, 'III', '2025-04-14 13:53:36', 0, NULL, NULL, 'Active'),
(8, 'MACHINE OPRATOR ', 6, 'II', '2025-04-14 13:53:55', 0, NULL, NULL, 'Active'),
(9, 'DIE SETTOR ', 6, 'III', '2025-04-14 13:54:14', 0, NULL, NULL, 'Active'),
(10, 'STORE INCHARGE ', 3, 'II', '2025-04-14 13:54:35', 0, NULL, NULL, 'Active'),
(11, 'DISPATCH  EXECUTIVE', 8, 'II', '2025-04-14 13:55:30', 0, NULL, NULL, 'Active'),
(12, 'PPC MANAGER ', 6, 'II', '2025-04-14 13:55:53', 0, NULL, NULL, 'Active'),
(13, 'QMS HEAD ', 5, 'II', '2025-04-14 13:56:20', 0, NULL, NULL, 'Active'),
(14, 'QUALITY MANAGER', 5, 'II', '2025-04-14 13:56:52', 0, NULL, NULL, 'Active'),
(15, 'MANAGER -NPD ', 4, 'II', '2025-04-14 13:57:24', 0, NULL, NULL, 'Active'),
(16, 'JR .QUALITY ENGINEER', 5, 'II', '2025-04-14 13:58:00', 0, NULL, NULL, 'Active'),
(17, 'LASER OPRATOR ', 5, 'II', '2025-04-14 13:58:36', 0, NULL, NULL, 'Active'),
(18, 'JR. PRODUCTION ENGINEER', 6, 'II', '2025-04-14 13:58:57', 0, NULL, NULL, 'Active'),
(19, 'ASST. MANAGER -NPD ', 4, 'II', '2025-04-14 13:59:19', 0, NULL, NULL, 'Active'),
(25, 'DISPATCH', 8, 'I', '2025-05-19 11:16:35', 0, NULL, NULL, 'Active'),
(26, 'Software Engineer', 14, 'I', '2025-05-28 12:10:35', 0, NULL, NULL, 'Active'),
(27, 'Accountant ', 15, 'I', '2025-05-28 16:12:20', 0, NULL, NULL, 'Active'),
(28, 'Tester', 16, 'I', '2025-05-29 09:42:17', 0, NULL, NULL, 'Active'),
(29, 'Software Engineer', 17, 'I', '2025-06-02 11:11:32', 0, NULL, NULL, 'Active'),
(30, 'Tester', 17, 'II', '2025-06-02 11:41:22', 0, NULL, NULL, 'Active');

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

--
-- Dumping data for table `designation_salary_structure`
--

INSERT INTO `designation_salary_structure` (`designation_salary_structure_id`, `department_id`, `designation_id`, `company_id`, `ctc_value`, `component_json`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(4, 1, 5, 1, 876000.00, '[{\"salary_component_id\":\"6\",\"component_name\":\"BASIC\",\"component_value\":\"40.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"BASIC\",\"company_id\":\"1\"},{\"salary_component_id\":\"7\",\"component_name\":\"HRA\",\"component_value\":\"20.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"HRA Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"8\",\"component_name\":\"Convenience\",\"component_value\":\"19200\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Convenience\",\"company_id\":\"1\"},{\"salary_component_id\":\"9\",\"component_name\":\"Children  allowance\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Children  allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"10\",\"component_name\":\"Medical  Allowance\",\"component_value\":\"15000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Medical  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"11\",\"component_name\":\"Washing  Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Washing  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"12\",\"component_name\":\"Telephone & Internet Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Telephone & Internet Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"13\",\"component_name\":\"Special Personal Allowance\",\"component_value\":\"265800\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Special Personal Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"14\",\"component_name\":\"PF - 13%\",\"component_value\":\"23400\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 13%\",\"company_id\":\"1\"},{\"salary_component_id\":\"15\",\"component_name\":\"PF - 12 %\",\"component_value\":\"21600\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 12 %\",\"company_id\":\"1\"},{\"salary_component_id\":\"18\",\"component_name\":\"PT\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PT\",\"company_id\":\"1\"}]', 1, '2025-05-25 12:38:29', NULL, NULL),
(5, 1, 6, 1, 504000.00, '[{\"salary_component_id\":\"6\",\"component_name\":\"BASIC\",\"component_value\":\"40.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"BASIC\",\"company_id\":\"1\"},{\"salary_component_id\":\"7\",\"component_name\":\"HRA\",\"component_value\":\"20.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"HRA Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"8\",\"component_name\":\"Convenience\",\"component_value\":\"19200\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Convenience\",\"company_id\":\"1\"},{\"salary_component_id\":\"9\",\"component_name\":\"Children  allowance\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Children  allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"10\",\"component_name\":\"Medical  Allowance\",\"component_value\":\"15000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Medical  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"11\",\"component_name\":\"Washing  Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Washing  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"12\",\"component_name\":\"Telephone & Internet Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Telephone & Internet Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"13\",\"component_name\":\"Special Personal Allowance\",\"component_value\":\"117000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Special Personal Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"14\",\"component_name\":\"PF - 13%\",\"component_value\":\"23400\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 13%\",\"company_id\":\"1\"},{\"salary_component_id\":\"15\",\"component_name\":\"PF - 12 %\",\"component_value\":\"21600\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 12 %\",\"company_id\":\"1\"},{\"salary_component_id\":\"18\",\"component_name\":\"PT\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PT\",\"company_id\":\"1\"}]', 1, '2025-05-25 12:40:18', NULL, NULL),
(6, 3, 10, 1, 936000.00, '[{\"salary_component_id\":\"6\",\"component_name\":\"BASIC\",\"component_value\":\"40.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"Yes\",\"description\":\"BASIC\",\"company_id\":\"1\"},{\"salary_component_id\":\"7\",\"component_name\":\"HRA\",\"component_value\":\"20.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"HRA Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"8\",\"component_name\":\"Convenience\",\"component_value\":\"19200\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"Yes\",\"description\":\"Convenience\",\"company_id\":\"1\"},{\"salary_component_id\":\"9\",\"component_name\":\"Children  allowance\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"Yes\",\"description\":\"Children  allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"10\",\"component_name\":\"Medical  Allowance\",\"component_value\":\"15000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"Yes\",\"description\":\"Medical  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"11\",\"component_name\":\"Washing  Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Washing  Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"12\",\"component_name\":\"Telephone & Internet Allowance\",\"component_value\":\"24000\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Telephone & Internet Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"13\",\"component_name\":\"Special Personal Allowance\",\"component_value\":\"289800\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Special Personal Allowance\",\"company_id\":\"1\"},{\"salary_component_id\":\"14\",\"component_name\":\"PF - 13%\",\"component_value\":\"23400\",\"value_type\":\"Decimal\",\"component_type\":\"Taxes\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 13%\",\"company_id\":\"1\"},{\"salary_component_id\":\"15\",\"component_name\":\"PF - 12 %\",\"component_value\":\"21600\",\"value_type\":\"Decimal\",\"component_type\":\"Taxes\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF - 12 %\",\"company_id\":\"1\"},{\"salary_component_id\":\"18\",\"component_name\":\"PT\",\"component_value\":\"2400\",\"value_type\":\"Decimal\",\"component_type\":\"Taxes\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PT\",\"company_id\":\"1\"}]', 1, '2025-05-25 13:15:23', NULL, NULL),
(7, 14, 26, 3, 600000.00, '[{\"salary_component_id\":\"19\",\"component_name\":\"Basic Allowence\",\"component_value\":\"80.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Basic Allowence\",\"company_id\":\"3\"},{\"salary_component_id\":\"20\",\"component_name\":\"Tax\",\"component_value\":\"5.00\",\"value_type\":\"Percentage\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Tax\",\"company_id\":\"3\"},{\"salary_component_id\":\"21\",\"component_name\":\"Travel Allowence\",\"component_value\":\"20.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Travel Allowence\",\"company_id\":\"3\"}]', 18, '2025-05-28 14:15:29', 18, '2025-05-29 10:30:13'),
(8, 15, 27, 3, 504000.00, '[{\"salary_component_id\":\"22\",\"component_name\":\"Basic\",\"component_value\":\"201600.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Basic\",\"company_id\":\"3\"},{\"salary_component_id\":\"23\",\"component_name\":\"H. R. A\",\"component_value\":\"100800.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"H. R. A\",\"company_id\":\"3\"},{\"salary_component_id\":\"24\",\"component_name\":\"Conv.\",\"component_value\":\"19200.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Children Allowance\",\"company_id\":\"3\"},{\"salary_component_id\":\"25\",\"component_name\":\"Children Allowance\",\"component_value\":\"2400.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Children Allowance\",\"company_id\":\"3\"},{\"salary_component_id\":\"26\",\"component_name\":\"Medical Allowance\",\"component_value\":\"15000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Medical Allowance\",\"company_id\":\"3\"},{\"salary_component_id\":\"27\",\"component_name\":\"Washing Allowance\",\"component_value\":\"24000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"---\",\"company_id\":\"3\"},{\"salary_component_id\":\"28\",\"component_name\":\"Telephone & Internet Allowance\",\"component_value\":\"24000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"-----\",\"company_id\":\"3\"},{\"salary_component_id\":\"29\",\"component_name\":\"Special Personal Allowance\",\"component_value\":\"117000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"------\",\"company_id\":\"3\"},{\"salary_component_id\":\"30\",\"component_name\":\" PF12% \",\"component_value\":\"21600.00\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"------\",\"company_id\":\"3\"},{\"salary_component_id\":\"31\",\"component_name\":\" PT  \",\"component_value\":\"2400.00\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"-------\",\"company_id\":\"3\"}]', 18, '2025-05-28 16:15:14', 18, '2025-05-29 10:41:46'),
(9, 17, 29, 4, 504000.00, '[{\"salary_component_id\":\"37\",\"component_name\":\"Basic Allowence - Z\",\"component_value\":\"201600.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"Yes\",\"description\":\"Basic Allowence - Z\",\"company_id\":\"4\"},{\"salary_component_id\":\"38\",\"component_name\":\"H. R. A - Z\",\"component_value\":\"100800.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"H. R. A - Z\",\"company_id\":\"4\"},{\"salary_component_id\":\"39\",\"component_name\":\"Conv. - Z\",\"component_value\":\"19200.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Conv. - Z\",\"company_id\":\"4\"},{\"salary_component_id\":\"40\",\"component_name\":\"Children Allowance\",\"component_value\":\"2400.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Children Allowance\",\"company_id\":\"4\"},{\"salary_component_id\":\"41\",\"component_name\":\"Medical Allowance\",\"component_value\":\"15000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Medical Allowance\",\"company_id\":\"4\"},{\"salary_component_id\":\"42\",\"component_name\":\"Washing Allowance\",\"component_value\":\"24000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Washing Allowance\",\"company_id\":\"4\"},{\"salary_component_id\":\"43\",\"component_name\":\"Telephone & Internet Allowance\",\"component_value\":\"24000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Telephone & Internet Allowance\",\"company_id\":\"4\"},{\"salary_component_id\":\"44\",\"component_name\":\"Special Personal Allowance\",\"component_value\":\"117000.00\",\"value_type\":\"Decimal\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Special Personal Allowance\",\"company_id\":\"4\"},{\"salary_component_id\":\"45\",\"component_name\":\"PF12%\",\"component_value\":\"21600.00\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PF12%\",\"company_id\":\"4\"},{\"salary_component_id\":\"46\",\"component_name\":\"PT\",\"component_value\":\"2400.00\",\"value_type\":\"Decimal\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"PT\",\"company_id\":\"4\"}]', 20, '2025-06-02 11:40:52', NULL, NULL),
(10, 17, 30, 4, 360000.00, '[{\"salary_component_id\":\"47\",\"component_name\":\"Basic -  Z\",\"component_value\":\"100.00\",\"value_type\":\"Percentage\",\"component_type\":\"Income\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Basic -  Z\",\"company_id\":\"4\"},{\"salary_component_id\":\"48\",\"component_name\":\"Tax - Z\",\"component_value\":\"5.00\",\"value_type\":\"Percentage\",\"component_type\":\"Deduction\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Tax - Z\",\"company_id\":\"4\"},{\"salary_component_id\":\"50\",\"component_name\":\"Employee Provident Fund -Z\",\"component_value\":\"1200.00\",\"value_type\":\"Decimal\",\"component_type\":\"Taxes\",\"year\":\"2025\",\"is_compulsory\":\"No\",\"description\":\"Employee Provident Fund\",\"company_id\":\"4\"}]', 20, '2025-06-02 11:45:21', 20, '2025-06-02 15:30:38');

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

--
-- Dumping data for table `designation_salary_structure_component`
--

INSERT INTO `designation_salary_structure_component` (`designation_salary_structure_component_id`, `designation_salary_structure_id`, `salary_component_id`, `component_name`, `component_value`, `value_type`, `component_type`, `year`, `is_compulsory`, `description`, `company_id`) VALUES
(7, 3, 6, 'BASIC', 40.00, 'Percentage', 'Income', 2025, 'No', 'BASIC', 1),
(8, 3, 7, 'HRA', 20.00, 'Percentage', 'Income', 2025, 'No', 'HRA Allowance', 1),
(9, 3, 8, 'Convenience', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Convenience', 1),
(10, 3, 9, 'Children  allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children  allowance', 1),
(11, 3, 10, 'Medical  Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical  Allowance', 1),
(12, 3, 11, 'Washing  Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Washing  Allowance', 1),
(13, 3, 12, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 1),
(14, 3, 13, 'Special Personal Allowance', 289800.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 1),
(15, 3, 14, 'PF - 13%', 23400.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 13%', 1),
(16, 3, 15, 'PF - 12 %', 21600.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 12 %', 1),
(17, 3, 18, 'PT', 2400.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 1),
(18, 4, 6, 'BASIC', 40.00, 'Percentage', 'Income', 2025, 'No', 'BASIC', 1),
(19, 4, 7, 'HRA', 20.00, 'Percentage', 'Income', 2025, 'No', 'HRA Allowance', 1),
(20, 4, 8, 'Convenience', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Convenience', 1),
(21, 4, 9, 'Children  allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children  allowance', 1),
(22, 4, 10, 'Medical  Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical  Allowance', 1),
(23, 4, 11, 'Washing  Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Washing  Allowance', 1),
(24, 4, 12, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 1),
(25, 4, 13, 'Special Personal Allowance', 265800.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 1),
(26, 4, 14, 'PF - 13%', 23400.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 13%', 1),
(27, 4, 15, 'PF - 12 %', 21600.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 12 %', 1),
(28, 4, 18, 'PT', 2400.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 1),
(29, 5, 6, 'BASIC', 40.00, 'Percentage', 'Income', 2025, 'No', 'BASIC', 1),
(30, 5, 7, 'HRA', 20.00, 'Percentage', 'Income', 2025, 'No', 'HRA Allowance', 1),
(31, 5, 8, 'Convenience', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Convenience', 1),
(32, 5, 9, 'Children  allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children  allowance', 1),
(33, 5, 10, 'Medical  Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical  Allowance', 1),
(34, 5, 11, 'Washing  Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Washing  Allowance', 1),
(35, 5, 12, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 1),
(36, 5, 13, 'Special Personal Allowance', 117000.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 1),
(37, 5, 14, 'PF - 13%', 23400.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 13%', 1),
(38, 5, 15, 'PF - 12 %', 21600.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 12 %', 1),
(39, 5, 18, 'PT', 2400.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 1),
(40, 6, 6, 'BASIC', 40.00, 'Percentage', 'Income', 2025, 'Yes', 'BASIC', 1),
(41, 6, 7, 'HRA', 20.00, 'Percentage', 'Income', 2025, 'No', 'HRA Allowance', 1),
(42, 6, 8, 'Convenience', 19200.00, 'Decimal', 'Income', 2025, 'Yes', 'Convenience', 1),
(43, 6, 9, 'Children  allowance', 2400.00, 'Decimal', 'Income', 2025, 'Yes', 'Children  allowance', 1),
(44, 6, 10, 'Medical  Allowance', 15000.00, 'Decimal', 'Income', 2025, 'Yes', 'Medical  Allowance', 1),
(45, 6, 11, 'Washing  Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Washing  Allowance', 1),
(46, 6, 12, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 1),
(47, 6, 13, 'Special Personal Allowance', 289800.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 1),
(48, 6, 14, 'PF - 13%', 23400.00, 'Decimal', 'Taxes', 2025, 'No', 'PF - 13%', 1),
(49, 6, 15, 'PF - 12 %', 21600.00, 'Decimal', 'Taxes', 2025, 'No', 'PF - 12 %', 1),
(50, 6, 18, 'PT', 2400.00, 'Decimal', 'Taxes', 2025, 'No', 'PT', 1),
(131, 7, 19, 'Basic Allowence', 80.00, 'Percentage', 'Income', 2025, 'No', 'Basic Allowence', 3),
(132, 7, 20, 'Tax', 5.00, 'Percentage', 'Deduction', 2025, 'No', 'Tax', 3),
(133, 7, 21, 'Travel Allowence', 20.00, 'Percentage', 'Income', 2025, 'No', 'Travel Allowence', 3),
(134, 8, 22, 'Basic', 201600.00, 'Decimal', 'Income', 2025, 'No', 'Basic', 3),
(135, 8, 23, 'H. R. A', 100800.00, 'Decimal', 'Income', 2025, 'No', 'H. R. A', 3),
(136, 8, 24, 'Conv.', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 3),
(137, 8, 25, 'Children Allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 3),
(138, 8, 26, 'Medical Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical Allowance', 3),
(139, 8, 27, 'Washing Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', '---', 3),
(140, 8, 28, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', '-----', 3),
(141, 8, 29, 'Special Personal Allowance', 117000.00, 'Decimal', 'Income', 2025, 'No', '------', 3),
(142, 8, 30, ' PF12% ', 21600.00, 'Decimal', 'Deduction', 2025, 'No', '------', 3),
(143, 8, 31, ' PT  ', 2400.00, 'Decimal', 'Deduction', 2025, 'No', '-------', 3),
(144, 9, 37, 'Basic Allowence - Z', 201600.00, 'Decimal', 'Income', 2025, 'Yes', 'Basic Allowence - Z', 4),
(145, 9, 38, 'H. R. A - Z', 100800.00, 'Decimal', 'Income', 2025, 'No', 'H. R. A - Z', 4),
(146, 9, 39, 'Conv. - Z', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Conv. - Z', 4),
(147, 9, 40, 'Children Allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 4),
(148, 9, 41, 'Medical Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical Allowance', 4),
(149, 9, 42, 'Washing Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Washing Allowance', 4),
(150, 9, 43, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 4),
(151, 9, 44, 'Special Personal Allowance', 117000.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 4),
(152, 9, 45, 'PF12%', 21600.00, 'Decimal', 'Deduction', 2025, 'No', 'PF12%', 4),
(153, 9, 46, 'PT', 2400.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 4),
(156, 10, 47, 'Basic -  Z', 100.00, 'Percentage', 'Income', 2025, 'No', 'Basic -  Z', 4),
(157, 10, 48, 'Tax - Z', 5.00, 'Percentage', 'Deduction', 2025, 'No', 'Tax - Z', 4),
(158, 10, 50, 'Employee Provident Fund -Z', 1200.00, 'Decimal', 'Taxes', 2025, 'No', 'Employee Provident Fund', 4);

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

--
-- Dumping data for table `employee_attendance`
--

INSERT INTO `employee_attendance` (`attendance_id`, `employee_id`, `attendance_date`, `attendance_in_time`, `attendance_out_time`) VALUES
(1, 15, '2025-05-25', '2025-05-25 09:30:00', NULL),
(2, 15, '2025-05-24', '2025-05-24 09:30:32', '2025-05-24 18:30:00'),
(3, 15, '2025-05-23', '2025-05-23 09:30:00', '2025-05-23 18:30:00'),
(4, 15, '2025-05-22', '2025-05-22 09:30:32', '2025-05-22 18:30:00'),
(5, 13, '2025-05-25', '2025-05-25 13:42:50', '0000-00-00 00:00:00'),
(6, 18, '2025-05-28', '2025-05-28 12:18:34', '0000-00-00 00:00:00'),
(7, 15, '2025-04-01', '2025-04-01 09:00:00', '2025-04-01 18:30:00'),
(8, 15, '2025-04-02', '2025-04-02 09:00:00', '2025-04-02 18:30:00'),
(9, 15, '2025-04-03', '2025-04-03 09:00:00', '2025-04-03 18:30:00'),
(10, 15, '2025-04-04', '2025-04-04 09:00:00', '2025-04-04 18:30:00'),
(11, 15, '2025-04-05', '2025-04-05 09:00:00', '2025-04-05 18:30:00'),
(12, 15, '2025-04-06', '2025-04-06 09:00:00', '2025-04-06 18:30:00'),
(13, 15, '2025-04-07', '2025-04-07 09:00:00', '2025-04-07 18:30:00'),
(14, 15, '2025-04-08', '2025-04-08 09:00:00', '2025-04-08 18:30:00'),
(15, 15, '2025-04-09', '2025-04-09 09:00:00', '2025-04-09 18:30:00'),
(16, 15, '2025-04-10', '2025-04-10 09:00:00', '2025-04-10 18:30:00'),
(17, 15, '2025-04-11', '2025-04-11 09:00:00', '2025-04-11 18:30:00'),
(18, 15, '2025-04-12', '2025-04-12 09:00:00', '2025-04-12 18:30:00'),
(19, 15, '2025-04-13', '2025-04-13 09:00:00', '2025-04-13 18:30:00'),
(20, 15, '2025-04-14', '2025-04-14 09:00:00', '2025-04-14 18:30:00'),
(21, 15, '2025-04-15', '2025-04-15 09:00:00', '2025-04-15 18:30:00'),
(22, 15, '2025-04-16', '2025-04-16 09:00:00', '2025-04-16 18:30:00'),
(23, 15, '2025-04-17', '2025-04-17 09:00:00', '2025-04-17 18:30:00'),
(24, 15, '2025-04-18', '2025-04-18 09:00:00', '2025-04-18 18:30:00'),
(25, 15, '2025-04-19', '2025-04-19 09:00:00', '2025-04-19 18:30:00'),
(26, 15, '2025-04-20', '2025-04-20 09:00:00', '2025-04-20 18:30:00'),
(27, 15, '2025-04-21', '2025-04-21 09:00:00', '2025-04-21 18:30:00'),
(28, 15, '2025-04-22', '2025-04-22 09:00:00', '2025-04-22 18:30:00'),
(29, 15, '2025-04-23', '2025-04-23 09:00:00', '2025-04-23 18:30:00'),
(30, 15, '2025-04-24', '2025-04-24 09:00:00', '2025-04-24 18:30:00'),
(31, 15, '2025-04-25', '2025-04-25 09:00:00', '2025-04-25 18:30:00'),
(32, 15, '2025-04-26', '2025-04-26 09:00:00', '2025-04-26 18:30:00'),
(33, 15, '2025-04-27', '2025-04-27 09:00:00', '2025-04-27 18:30:00'),
(34, 15, '2025-04-28', '2025-04-28 09:00:00', '2025-04-28 18:30:00'),
(35, 15, '2025-04-29', '2025-04-29 09:00:00', '2025-04-29 18:30:00'),
(36, 15, '2025-04-30', '2025-04-30 09:00:00', '2025-04-30 18:30:00'),
(63, 19, '2025-04-01', '2025-04-01 09:30:00', '2025-04-01 18:30:00'),
(64, 19, '2025-04-02', '2025-04-02 09:30:00', '2025-04-02 18:30:00'),
(65, 19, '2025-04-03', '2025-04-03 09:30:00', '2025-04-03 18:30:00'),
(66, 19, '2025-04-04', '2025-04-04 09:30:00', '2025-04-04 18:30:00'),
(67, 19, '2025-04-05', '2025-04-05 09:30:00', '2025-04-05 18:30:00'),
(68, 19, '2025-04-06', '2025-04-06 09:30:00', '2025-04-06 18:30:00'),
(69, 19, '2025-04-07', '2025-04-07 09:30:00', '2025-04-07 18:30:00'),
(70, 19, '2025-04-08', '2025-04-08 09:30:00', '2025-04-08 18:30:00'),
(71, 19, '2025-04-09', '2025-04-09 09:30:00', '2025-04-09 18:30:00'),
(72, 19, '2025-04-10', '2025-04-10 09:30:00', '2025-04-10 18:30:00'),
(73, 19, '2025-04-11', '2025-04-11 09:30:00', '2025-04-11 18:30:00'),
(74, 19, '2025-04-12', '2025-04-12 09:30:00', '2025-04-12 18:30:00'),
(75, 19, '2025-04-13', '2025-04-13 09:30:00', '2025-04-13 18:30:00'),
(76, 19, '2025-04-14', '2025-04-14 09:30:00', '2025-04-14 18:30:00'),
(77, 19, '2025-04-15', '2025-04-15 09:30:00', '2025-04-15 18:30:00'),
(78, 19, '2025-04-16', '2025-04-16 09:30:00', '2025-04-16 18:30:00'),
(79, 19, '2025-04-17', '2025-04-17 09:30:00', '2025-04-17 18:30:00'),
(80, 19, '2025-04-18', '2025-04-18 09:30:00', '2025-04-18 18:30:00'),
(81, 19, '2025-04-19', '2025-04-19 09:30:00', '2025-04-19 18:30:00'),
(82, 19, '2025-04-20', '2025-04-20 09:30:00', '2025-04-20 18:30:00'),
(83, 19, '2025-04-21', '2025-04-21 09:30:00', '2025-04-21 18:30:00'),
(84, 19, '2025-04-22', '2025-04-22 09:30:00', '2025-04-22 18:30:00'),
(85, 19, '2025-04-23', '2025-04-23 09:30:00', '2025-04-23 18:30:00'),
(86, 19, '2025-04-24', '2025-04-24 09:30:00', '2025-04-24 18:30:00'),
(87, 19, '2025-04-25', '2025-04-25 09:30:00', '2025-04-25 18:30:00'),
(88, 19, '2025-04-26', '2025-04-26 09:30:00', '2025-04-26 18:30:00'),
(89, 19, '2025-04-27', '2025-04-27 09:30:00', '2025-04-27 18:30:00'),
(90, 19, '2025-04-28', '2025-04-28 09:30:00', '2025-04-28 18:30:00'),
(91, 19, '2025-04-29', '2025-04-29 09:30:00', '2025-04-29 18:30:00'),
(92, 19, '2025-04-30', '2025-04-30 09:30:00', '2025-04-30 18:30:00'),
(93, 15, '2025-05-30', '2025-05-30 14:25:54', '2025-05-30 18:10:34'),
(94, 15, '2025-05-31', '2025-05-31 16:39:24', '2025-05-31 16:57:01'),
(95, 19, '2025-06-01', '2025-06-01 23:10:15', '2025-06-01 23:15:16'),
(96, 18, '2025-06-01', '2025-06-01 23:13:00', '0000-00-00 00:00:00'),
(97, 21, '2025-06-02', '2025-06-02 09:00:00', '2025-06-02 11:52:00'),
(98, 21, '2025-05-01', '2025-05-01 09:30:00', '2025-05-01 19:30:00'),
(99, 21, '2025-05-02', '2025-05-02 09:30:00', '2025-05-02 19:30:00'),
(100, 21, '2025-05-03', '2025-05-03 09:30:00', '2025-05-03 19:30:00'),
(101, 21, '2025-05-04', '2025-05-04 09:30:00', '2025-05-04 19:30:00'),
(102, 21, '2025-05-05', '2025-05-05 09:30:00', '2025-05-05 19:30:00'),
(103, 21, '2025-05-06', '2025-05-06 09:30:00', '2025-05-06 19:30:00'),
(104, 21, '2025-05-07', '2025-05-07 09:30:00', '2025-05-07 19:30:00'),
(105, 21, '2025-05-08', '2025-05-08 09:30:00', '2025-05-08 19:30:00'),
(106, 21, '2025-05-09', '2025-05-09 09:30:00', '2025-05-09 19:30:00'),
(107, 21, '2025-05-10', '2025-05-10 09:30:00', '2025-05-10 19:30:00'),
(108, 21, '2025-05-11', '2025-05-11 09:30:00', '2025-05-11 19:30:00'),
(109, 21, '2025-05-12', '2025-05-12 09:30:00', '2025-05-12 19:30:00'),
(110, 21, '2025-05-13', '2025-05-13 09:30:00', '2025-05-13 19:30:00'),
(111, 21, '2025-05-14', '2025-05-14 09:30:00', '2025-05-14 19:30:00'),
(112, 21, '2025-05-15', '2025-05-15 09:30:00', '2025-05-15 19:30:00'),
(113, 21, '2025-05-16', '2025-05-16 09:30:00', '2025-05-16 19:30:00'),
(114, 21, '2025-05-17', '2025-05-17 09:30:00', '2025-05-17 19:30:00'),
(115, 21, '2025-05-18', '2025-05-18 09:30:00', '2025-05-18 19:30:00'),
(116, 21, '2025-05-19', '2025-05-19 09:30:00', '2025-05-19 19:30:00'),
(117, 21, '2025-05-20', '2025-05-20 09:30:00', '2025-05-20 19:30:00'),
(118, 21, '2025-05-21', '2025-05-21 09:30:00', '2025-05-21 19:30:00'),
(119, 21, '2025-05-22', '2025-05-22 09:30:00', '2025-05-22 19:30:00'),
(120, 21, '2025-05-23', '2025-05-23 09:30:00', '2025-05-23 19:30:00'),
(121, 21, '2025-05-24', '2025-05-24 09:30:00', '2025-05-24 19:30:00'),
(122, 21, '2025-05-25', '2025-05-25 09:30:00', '2025-05-25 19:30:00'),
(123, 21, '2025-05-26', '2025-05-26 09:30:00', '2025-05-26 19:30:00'),
(124, 21, '2025-05-27', '2025-05-27 09:30:00', '2025-05-27 19:30:00'),
(125, 21, '2025-05-28', '2025-05-28 09:30:00', '2025-05-28 19:30:00'),
(126, 21, '2025-05-29', '2025-05-29 09:30:00', '2025-05-29 19:30:00'),
(127, 21, '2025-05-30', '2025-05-30 09:30:00', '2025-05-30 19:30:00'),
(128, 22, '2025-01-01', '2025-01-01 09:30:00', '2025-01-01 19:30:00'),
(129, 22, '2025-01-02', '2025-01-02 09:30:00', '2025-01-02 19:30:00'),
(130, 22, '2025-01-03', '2025-01-03 09:30:00', '2025-01-03 19:30:00'),
(131, 22, '2025-01-04', '2025-01-04 09:30:00', '2025-01-04 19:30:00'),
(132, 22, '2025-01-05', '2025-01-05 09:30:00', '2025-01-05 19:30:00'),
(133, 22, '2025-01-06', '2025-01-06 09:30:00', '2025-01-06 19:30:00'),
(134, 22, '2025-01-07', '2025-01-07 09:30:00', '2025-01-07 19:30:00'),
(135, 22, '2025-01-08', '2025-01-08 09:30:00', '2025-01-08 19:30:00'),
(136, 22, '2025-01-09', '2025-01-09 09:30:00', '2025-01-09 19:30:00'),
(137, 22, '2025-01-10', '2025-01-10 09:30:00', '2025-01-10 19:30:00'),
(138, 22, '2025-01-11', '2025-01-11 09:30:00', '2025-01-11 19:30:00'),
(139, 22, '2025-01-12', '2025-01-12 09:30:00', '2025-01-12 19:30:00'),
(140, 22, '2025-01-13', '2025-01-13 09:30:00', '2025-01-13 19:30:00'),
(141, 22, '2025-01-14', '2025-01-14 09:30:00', '2025-01-14 19:30:00'),
(142, 22, '2025-01-15', '2025-01-15 09:30:00', '2025-01-15 19:30:00'),
(143, 22, '2025-01-16', '2025-01-16 09:30:00', '2025-01-16 19:30:00'),
(144, 22, '2025-01-17', '2025-01-17 09:30:00', '2025-01-17 19:30:00'),
(145, 22, '2025-01-18', '2025-01-18 09:30:00', '2025-01-18 19:30:00'),
(146, 22, '2025-01-19', '2025-01-19 09:30:00', '2025-01-19 19:30:00'),
(147, 22, '2025-01-20', '2025-01-20 09:30:00', '2025-01-20 19:30:00'),
(148, 22, '2025-01-21', '2025-01-21 09:30:00', '2025-01-21 19:30:00'),
(149, 22, '2025-01-22', '2025-01-22 09:30:00', '2025-01-22 19:30:00'),
(150, 22, '2025-01-23', '2025-01-23 09:30:00', '2025-01-23 19:30:00'),
(151, 22, '2025-01-24', '2025-01-24 09:30:00', '2025-01-24 19:30:00'),
(152, 22, '2025-01-25', '2025-01-25 09:30:00', '2025-01-25 19:30:00'),
(153, 22, '2025-01-26', '2025-01-26 09:30:00', '2025-01-26 19:30:00'),
(154, 22, '2025-01-27', '2025-01-27 09:30:00', '2025-01-27 19:30:00'),
(155, 22, '2025-01-28', '2025-01-28 09:30:00', '2025-01-28 19:30:00'),
(156, 22, '2025-01-29', '2025-01-29 09:30:00', '2025-01-29 19:30:00'),
(157, 22, '2025-01-30', '2025-01-30 09:30:00', '2025-01-30 19:30:00'),
(158, 22, '2025-01-31', '2025-01-31 09:30:00', '2025-01-31 19:30:00'),
(159, 22, '2025-02-01', '2025-02-01 09:30:00', '2025-02-01 19:30:00'),
(160, 22, '2025-02-03', '2025-02-03 09:30:00', '2025-02-03 19:30:00'),
(161, 22, '2025-02-04', '2025-02-04 09:30:00', '2025-02-04 19:30:00'),
(162, 22, '2025-02-05', '2025-02-05 09:30:00', '2025-02-05 19:30:00'),
(163, 22, '2025-02-06', '2025-02-06 09:30:00', '2025-02-06 19:30:00'),
(164, 22, '2025-02-07', '2025-02-07 09:30:00', '2025-02-07 19:30:00'),
(165, 22, '2025-02-08', '2025-02-08 09:30:00', '2025-02-08 19:30:00'),
(166, 22, '2025-02-10', '2025-02-10 09:30:00', '2025-02-10 19:30:00'),
(167, 22, '2025-02-11', '2025-02-11 09:30:00', '2025-02-11 19:30:00'),
(168, 22, '2025-02-12', '2025-02-12 09:30:00', '2025-02-12 19:30:00'),
(169, 22, '2025-02-13', '2025-02-13 09:30:00', '2025-02-13 19:30:00'),
(170, 22, '2025-02-14', '2025-02-14 09:30:00', '2025-02-14 19:30:00'),
(171, 22, '2025-02-15', '2025-02-15 09:30:00', '2025-02-15 19:30:00'),
(172, 22, '2025-02-17', '2025-02-17 09:30:00', '2025-02-17 19:30:00'),
(173, 22, '2025-02-18', '2025-02-18 09:30:00', '2025-02-18 19:30:00'),
(174, 22, '2025-02-19', '2025-02-19 09:30:00', '2025-02-19 19:30:00'),
(175, 22, '2025-02-20', '2025-02-20 09:30:00', '2025-02-20 19:30:00'),
(176, 22, '2025-02-21', '2025-02-21 09:30:00', '2025-02-21 19:30:00'),
(177, 22, '2025-02-22', '2025-02-22 09:30:00', '2025-02-22 19:30:00'),
(178, 22, '2025-02-24', '2025-02-24 09:30:00', '2025-02-24 19:30:00'),
(179, 22, '2025-02-25', '2025-02-25 09:30:00', '2025-02-25 19:30:00'),
(180, 22, '2025-02-26', '2025-02-26 09:30:00', '2025-02-26 19:30:00'),
(181, 22, '2025-02-27', '2025-02-27 09:30:00', '2025-02-27 19:30:00'),
(182, 22, '2025-02-28', '2025-02-28 09:30:00', '2025-02-28 19:30:00'),
(183, 22, '2025-03-01', '2025-03-01 09:30:00', '2025-03-01 19:30:00'),
(184, 22, '2025-03-02', '2025-03-02 09:30:00', '2025-03-02 19:30:00'),
(185, 22, '2025-03-03', '2025-03-03 09:30:00', '2025-03-03 19:30:00'),
(186, 22, '2025-03-04', '2025-03-04 09:30:00', '2025-03-04 19:30:00'),
(187, 22, '2025-03-05', '2025-03-05 09:30:00', '2025-03-05 19:30:00'),
(188, 22, '2025-03-06', '2025-03-06 09:30:00', '2025-03-06 19:30:00'),
(189, 22, '2025-03-07', '2025-03-07 09:30:00', '2025-03-07 19:30:00'),
(190, 22, '2025-03-08', '2025-03-08 09:30:00', '2025-03-08 19:30:00'),
(191, 22, '2025-03-09', '2025-03-09 09:30:00', '2025-03-09 19:30:00'),
(192, 22, '2025-03-10', '2025-03-10 09:30:00', '2025-03-10 19:30:00'),
(193, 22, '2025-03-11', '2025-03-11 09:30:00', '2025-03-11 19:30:00'),
(194, 22, '2025-03-12', '2025-03-12 09:30:00', '2025-03-12 19:30:00'),
(195, 22, '2025-03-13', '2025-03-13 09:30:00', '2025-03-13 19:30:00'),
(196, 22, '2025-03-16', '2025-03-16 09:30:00', '2025-03-16 19:30:00'),
(197, 22, '2025-03-17', '2025-03-17 09:30:00', '2025-03-17 19:30:00'),
(198, 22, '2025-03-18', '2025-03-18 09:30:00', '2025-03-18 19:30:00'),
(199, 22, '2025-03-19', '2025-03-19 09:30:00', '2025-03-19 19:30:00'),
(200, 22, '2025-03-20', '2025-03-20 09:30:00', '2025-03-20 19:30:00'),
(201, 22, '2025-03-21', '2025-03-21 09:30:00', '2025-03-21 19:30:00'),
(202, 22, '2025-03-22', '2025-03-22 09:30:00', '2025-03-22 19:30:00'),
(203, 22, '2025-03-23', '2025-03-23 09:30:00', '2025-03-23 19:30:00'),
(204, 22, '2025-03-24', '2025-03-24 09:30:00', '2025-03-24 19:30:00'),
(205, 22, '2025-03-25', '2025-03-25 09:30:00', '2025-03-25 19:30:00'),
(206, 22, '2025-03-26', '2025-03-26 09:30:00', '2025-03-26 19:30:00'),
(207, 22, '2025-03-27', '2025-03-27 09:30:00', '2025-03-27 19:30:00'),
(208, 22, '2025-03-28', '2025-03-28 09:30:00', '2025-03-28 19:30:00'),
(209, 22, '2025-03-29', '2025-03-29 09:30:00', '2025-03-29 19:30:00'),
(210, 22, '2025-03-30', '2025-03-30 09:30:00', '2025-03-30 19:30:00'),
(211, 22, '2025-03-31', '2025-03-31 09:30:00', '2025-03-31 19:30:00'),
(212, 22, '2025-04-01', '2025-04-01 09:30:00', '2025-04-01 19:30:00'),
(213, 22, '2025-04-02', '2025-04-02 09:30:00', '2025-04-02 19:30:00'),
(214, 22, '2025-04-03', '2025-04-03 09:30:00', '2025-04-03 19:30:00'),
(215, 22, '2025-04-04', '2025-04-04 09:30:00', '2025-04-04 19:30:00'),
(216, 22, '2025-04-05', '2025-04-05 09:30:00', '2025-04-05 19:30:00'),
(217, 22, '2025-04-07', '2025-04-07 09:30:00', '2025-04-07 19:30:00'),
(218, 22, '2025-04-08', '2025-04-08 09:30:00', '2025-04-08 19:30:00'),
(219, 22, '2025-04-09', '2025-04-09 09:30:00', '2025-04-09 19:30:00'),
(220, 22, '2025-04-10', '2025-04-10 09:30:00', '2025-04-10 19:30:00'),
(221, 22, '2025-04-11', '2025-04-11 09:30:00', '2025-04-11 19:30:00'),
(222, 22, '2025-04-12', '2025-04-12 09:30:00', '2025-04-12 19:30:00'),
(223, 22, '2025-04-16', '2025-04-16 09:30:00', '2025-04-16 19:30:00'),
(224, 22, '2025-04-17', '2025-04-17 09:30:00', '2025-04-17 19:30:00'),
(225, 22, '2025-04-18', '2025-04-18 09:30:00', '2025-04-18 19:30:00'),
(226, 22, '2025-04-19', '2025-04-19 09:30:00', '2025-04-19 19:30:00'),
(227, 22, '2025-04-21', '2025-04-21 09:30:00', '2025-04-21 19:30:00'),
(228, 22, '2025-04-22', '2025-04-22 09:30:00', '2025-04-22 19:30:00'),
(229, 22, '2025-04-23', '2025-04-23 09:30:00', '2025-04-23 19:30:00'),
(230, 22, '2025-04-24', '2025-04-24 09:30:00', '2025-04-24 19:30:00'),
(231, 22, '2025-04-25', '2025-04-25 09:30:00', '2025-04-25 19:30:00'),
(232, 22, '2025-04-26', '2025-04-26 09:30:00', '2025-04-26 19:30:00'),
(233, 22, '2025-04-28', '2025-04-28 09:30:00', '2025-04-28 19:30:00'),
(234, 22, '2025-04-29', '2025-04-29 09:30:00', '2025-04-29 19:30:00'),
(235, 22, '2025-04-30', '2025-04-30 09:30:00', '2025-04-30 19:30:00');

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

--
-- Dumping data for table `employee_extended_salary_structure`
--

INSERT INTO `employee_extended_salary_structure` (`employee_extended_salary_structure_id`, `refrence_number`, `employee_id`, `ctc_value`, `effective_from`, `effective_to`, `is_default`, `status`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(1, 'ESS/2025/05/00001', 15, 504000.00, '2025-05-01', '2025-05-31', 'Yes', 'Active', 1, '2025-05-28 12:15:54', 2, '2025-05-28 13:17:47'),
(2, 'ESS/2025/05/00001', 8, 504000.00, '2025-05-01', '2025-05-31', 'No', 'Active', 1, '2025-05-29 12:48:54', NULL, NULL),
(3, 'ESS/2025/06/00001', 21, 540000.00, '2025-06-01', '2025-06-30', 'Yes', 'Active', 20, '2025-06-02 12:04:20', NULL, NULL);

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

--
-- Dumping data for table `employee_extended_salary_structure_component`
--

INSERT INTO `employee_extended_salary_structure_component` (`employee_extended_salary_component_id`, `employee_extended_salary_structure_id`, `salary_component_id`, `component_name`, `component_type`, `component_value`, `value_type`, `is_compulsory`, `year`, `description`) VALUES
(23, 1, 6, 'BASIC', 'Income', 40.00, 'Percentage', 'No', 2025, 'BASIC'),
(24, 1, 7, 'HRA', 'Income', 20.00, 'Percentage', 'No', 2025, 'HRA Allowance'),
(25, 1, 8, 'Convenience', 'Income', 19200.00, 'Decimal', 'No', 2025, 'Convenience'),
(26, 1, 9, 'Children  allowance', 'Income', 2400.00, 'Decimal', 'No', 2025, 'Children  allowance'),
(27, 1, 10, 'Medical  Allowance', 'Income', 15000.00, 'Decimal', 'No', 2025, 'Medical  Allowance'),
(28, 1, 11, 'Washing  Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Washing  Allowance'),
(29, 1, 12, 'Telephone & Internet Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Telephone & Internet Allowance'),
(30, 1, 13, 'Special Personal Allowance', 'Income', 117000.00, 'Decimal', 'No', 2025, 'Special Personal Allowance'),
(31, 1, 15, 'PF - 12 %', 'Deduction', 21600.00, 'Decimal', 'No', 2025, 'PF - 12 %'),
(32, 1, 18, 'PT', 'Deduction', 2400.00, 'Decimal', 'No', 2025, 'PT'),
(33, 2, 6, 'BASIC', 'Income', 40.00, 'Percentage', 'No', 2025, 'BASIC'),
(34, 2, 7, 'HRA', 'Income', 20.00, 'Percentage', 'No', 2025, 'HRA Allowance'),
(35, 2, 8, 'Convenience', 'Income', 19200.00, 'Decimal', 'No', 2025, 'Convenience'),
(36, 2, 9, 'Children  allowance', 'Income', 2400.00, 'Decimal', 'No', 2025, 'Children  allowance'),
(37, 2, 10, 'Medical  Allowance', 'Income', 15000.00, 'Decimal', 'No', 2025, 'Medical  Allowance'),
(38, 2, 11, 'Washing  Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Washing  Allowance'),
(39, 2, 12, 'Telephone & Internet Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Telephone & Internet Allowance'),
(40, 2, 13, 'Special Personal Allowance', 'Income', 117000.00, 'Decimal', 'No', 2025, 'Special Personal Allowance'),
(41, 2, 14, 'PF - 13%', 'Deduction', 23400.00, 'Decimal', 'No', 2025, 'PF - 13%'),
(42, 2, 15, 'PF - 12 %', 'Deduction', 21600.00, 'Decimal', 'No', 2025, 'PF - 12 %'),
(43, 2, 18, 'PT', 'Deduction', 2400.00, 'Decimal', 'No', 2025, 'PT'),
(44, 3, 37, 'Basic Allowence - Z', 'Income', 237600.00, 'Decimal', 'Yes', 2025, 'Basic Allowence - Z'),
(45, 3, 38, 'H. R. A - Z', 'Income', 100800.00, 'Decimal', 'No', 2025, 'H. R. A - Z'),
(46, 3, 39, 'Conv. - Z', 'Income', 19200.00, 'Decimal', 'No', 2025, 'Conv. - Z'),
(47, 3, 40, 'Children Allowance', 'Income', 2400.00, 'Decimal', 'No', 2025, 'Children Allowance'),
(48, 3, 41, 'Medical Allowance', 'Income', 15000.00, 'Decimal', 'No', 2025, 'Medical Allowance'),
(49, 3, 42, 'Washing Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Washing Allowance'),
(50, 3, 43, 'Telephone & Internet Allowance', 'Income', 24000.00, 'Decimal', 'No', 2025, 'Telephone & Internet Allowance'),
(51, 3, 44, 'Special Personal Allowance', 'Income', 117000.00, 'Decimal', 'No', 2025, 'Special Personal Allowance'),
(52, 3, 45, 'PF12%', 'Deduction', 21600.00, 'Decimal', 'No', 2025, 'PF12%'),
(53, 3, 46, 'PT', 'Deduction', 2400.00, 'Decimal', 'No', 2025, 'PT');

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

--
-- Dumping data for table `employee_leave`
--

INSERT INTO `employee_leave` (`leave_id`, `employee_id`, `leave_start_date`, `leave_end_date`, `leave_name`, `leave_type`, `reason`, `approved_by`, `status`, `added_date`, `updated_date`) VALUES
(1, 15, '2025-05-30', '2025-05-30', 'SickLeave', 'full_day', '', 1, 'approve', '2025-05-25 13:36:10', '2025-05-25 13:36:29'),
(2, 21, '2025-06-27', '2025-06-27', 'PaidLeave', 'full_day', '---', 20, 'approve', '2025-06-02 11:49:15', '2025-06-02 11:50:05');

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
(1, 'Admin', '', '', 'AROM', 'admin', 'admin@gmail.com', '+91', '98765 43210', '', '', '2000-02-08', 'Male', 'Single', '105', '12', 'Pune', 'Shivaji Nagar', '410015', '1', '1', '2024-02-01', 'f925916e2754e5e03f75dd58a5733251', 0, '06861059652e73a19e3d946ed4de09d5.jpeg', 1, 'Sunday', '+1', '8485835698', 'arom.work@gmail.com', 'Yes', NULL, 'B Tech', 'CSE', 'KIT', 2015, '2147483647', 'PAN123456', '', '', 1, 'Active', 'No', '', '754865', 568956, 0, '2024-02-26 14:43:47', 1, '2024-03-29 21:12:06', 0),
(2, 'Arom', '', '', 'Arom', 'arom', 'arom@gmail.com', '+91', '98765 43210', '', '', '2000-02-08', 'Male', 'Single', '105', '12', 'Pune', 'Vaishali Nagar', '410016', '1', '1', '2024-02-01', 'f925916e2754e5e03f75dd58a5733251', 0, '06861059652e73a19e3d946ed4de09d5.jpeg', 1, 'Sunday', '+1', '8485835698', 'arom1@gmail.com', 'Yes', NULL, 'B Tech', 'IT', 'KIT', 2015, '2147483647', 'PAN123456', '', '', 0, 'Active', 'No', '', '231303', 568956, 0, '2024-02-26 14:43:47', 1, '2024-03-29 21:12:06', 0),
(3, 'SUHAS ', 'SHIVAJI ', 'PATIL', 'BSP METATECH LLP-00001', 'manager', 'suhas.patil33@gmail.com', '+91', '84118 86653', '+91', '94058 60253', '1986-06-28', 'Male', 'Married', '105', '12', 'PUNE', 'FLAT NO -606 ,B WING ,B10 BUILDING ,SAHARA CITY, CHAKAN PUNE-410501', '410501', '1', '5', '2017-09-01', 'fd0b2616f0567e0b3c1ce9ce201289b2', 0, 'IMG_20210523_171934.jpg', 1, 'Monday,Thursday', '+91', '84118 86653', 'suhaspatil@bspmetatech.com', 'NO', 0.000000, 'MBA FINANCE', 'ACCOUNTS & FINANCE', 'KIMS KARAD', 2009, '635619569835', 'BAMPP3773N', '100909994834', '100909994834', 1, 'Active', 'No', '', '', 410501, 1, '2025-04-14 14:31:18', 1, '2025-05-25 08:34:50', 0),
(5, 'AJAY ', 'VIJAYSINGH', 'KADAM', 'BSP METATECH LLP-00002', 'employee', 'KADAMAJAY952@GMAIL.COM', '+91', '9970034240', '+91', '9503828712', '2000-06-22', 'Male', 'Single', '105', '12', 'PUNE', 'MOHAN NAGAR,CHICHWAD', '411019', '1', '6', '2024-04-10', '13ed9086ef2dde55a631822f901f6440', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM.jpeg', 1, 'Thursday', '+91', '9970034240', 'ACCOUNTS2@BSPMETATECH.COM', 'NO', 0.000000, 'MBA', 'FINANCE', 'S B PATIL COLLEGE OF MANAGEMENT', 2024, '744429912074', 'HVDPK8119M', '101706489590', '', 1, 'Pending', 'No', NULL, '', 410501, 1, '2025-05-19 09:14:40', NULL, NULL, 1),
(6, 'JAGATAMBA', 'PRASAD', 'YADAV', 'BSP METATECH LLP-00003', 'manager', 'jpmech1992@gamil.com', '+91', '7569925404', '+91', '9695682210', '1992-08-11', 'Male', 'Married', '105', '23', 'Bhadohi', 'Basantapur,Palhaiya,Bhadohi', '221402', '5', '14', '2024-08-17', '6ff35ba81f5885f7a3e1ce8f4458a3ca', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM1.jpeg', 1, 'Thursday', '+91', '7569925404', 'qualityunit2@bspmetatech.com', 'NO', 0.000000, 'DIPLOMA MACH.ENGG', 'MACHANICAL', 'GOVT.POLITECHNIC GAZIYABAD,UP', 2013, '488299064065', 'AJFPY3064L', '100179473147', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-19 10:11:05', NULL, NULL, 0),
(7, 'SANJIT', '', 'SAMANTA', 'BSP METATECH LLP-00004', 'employee', 'SANJITSAMANTA007@GMAIL.COM', '+91', '7040216649', '+91', '8167580131', '1989-09-06', 'Male', 'Married', '105', '24', 'MEDINIPUR', 'VILL-PARULIA,PO-CHAPDA,KOLAGHAT, PURAB MEDINIPUR', '721154', '6', '4', '2015-01-08', 'e87287634c1aa765bc38077440237310', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM2.jpeg', 1, 'Thursday', '+91', '7040216649', 'SANJIT@BSPMETATECH.COM', 'NO', 0.000000, 'DIPLOMA MACH.ENGG.', 'AUTOMOBILE', 'THE CULCUTTA TECHNICAL SCHOOL', 2011, '670439520334', 'DIOPS3230K', '101829976507', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-19 10:46:59', NULL, NULL, 0),
(8, 'AJAY ', 'VIJAYSINGH', 'KADAM', 'BSP METATECH LLP-00005', 'employee', 'ACCOUNTS2@BSPMETATECH.COM', '+91', '9970034240', '+91', '9503828712', '2000-06-22', 'Male', 'Single', '105', '12', 'SANGLI', 'ATAPADI,SANGLI', '415301', '1', '6', '2024-04-10', '13ed9086ef2dde55a631822f901f6440', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM3.jpeg', 1, 'Thursday', '+91', '9970034240', 'ACCOUNTS2@BSPMETATECH.COM', 'NO', 0.000000, 'MBA', 'FINANCE', 'S B PATIL COLLEGE OF MANAGEMENT', 2024, '744429912074', 'HVDPK8119M', '101706489590', '', 1, 'Active', 'Yes', '{\"old_employe_data\":{\"employee_data\":{\"employee_id\":\"8\",\"first_name\":\"AJAY \",\"middle_name\":\"VIJAYSINGH\",\"last_name\":\"KADAM\",\"employee_code\":\"BSP METATECH LLP-00005\",\"role\":\"employee\",\"email\":\"ACCOUNTS2@BSPMETATECH.COM\",\"phone_code\":\"+91\",\"mobile_number\":\"9970034240\",\"secondary_mobile_code\":\"+91\",\"secondary_mobile_number\":\"9503828712\",\"dob\":\"2000-06-22\",\"gender\":\"Male\",\"marital_status\":\"Single\",\"country\":\"105\",\"state\":\"12\",\"city\":\"SANGLI\",\"address\":\"ATAPADI,SANGLI\",\"zipcode\":\"415301\",\"department\":\"1\",\"designation\":\"6\",\"employment_date\":\"2024-04-10\",\"password\":\"13ed9086ef2dde55a631822f901f6440\",\"login_attempt_failed\":\"0\",\"profile_image\":\"WhatsApp_Image_2025-05-17_at_3_42_30_PM3.jpeg\",\"reporting_manager\":\"1\",\"employee_week_off\":\"Thursday\",\"work_mobile_code\":\"+91\",\"work_mobile_number\":\"9970034240\",\"work_email\":\"ACCOUNTS2@BSPMETATECH.COM\",\"over_time_allow\":\"NO\",\"overtime_rate_per_hour\":\"0.000000\",\"education_degree\":\"MBA\",\"education_feild\":\"FINANCE\",\"education_college\":\"S B PATIL COLLEGE OF MANAGEMENT\",\"education_pass_out_year\":\"2024\",\"aadhar_number\":\"744429912074\",\"pan_card_number\":\"HVDPK8119M\",\"pf_number\":\"101706489590\",\"uan_number\":\"\",\"company_id\":\"1\",\"status\":\"Active\",\"is_edit\":\"No\",\"otp\":\"\",\"attendance_pin\":\"410501\",\"created_by\":\"1\",\"created_on\":\"2025-05-19 10:56:43\",\"updated_by\":null,\"updated_on\":null,\"sys_record_delete\":\"0\"},\"bank_data\":[{\"id\":\"8\",\"bank_name\":\"YES BANK\",\"branch_address\":\"CHICHWAD\",\"ifsc_code\":\"YESB0000551\",\"account_type\":\"Saving\",\"account_no\":\"055191600007283\",\"account_holder_name\":\"AJAY VIJAYSINGH KADAM\",\"default_bank\":\"Yes\",\"entity_type\":\"Employee\",\"entity_id\":\"8\",\"added_by\":\"0\",\"added_on\":\"2025-05-19 10:56:43\",\"updated_by\":null,\"updated_on\":null,\"status\":\"Active\"}]},\"new_employe_data\":{\"mode\":\"Update\",\"employee_id\":\"8\",\"first_name\":\"AJAY \",\"middle_name\":\"VIJAYSINGH\",\"last_name\":\"KADAM\",\"email\":\"ACCOUNTS2@BSPMETATECH.COM\",\"dob\":\"06\\/22\\/2000\",\"mobile_number\":\"99700 34240\",\"secondary_number\":\"95038 28712\",\"gender\":\"Male\",\"marital_status\":\"Single\",\"profile_image_name\":\"WhatsApp_Image_2025-05-17_at_3_42_30_PM3.jpeg\",\"company\":\"1\",\"department\":\"1\",\"designation\":\"6\",\"employement_type\":\"employee\",\"manager\":\"1\",\"employement_date\":\"04\\/10\\/2024\",\"week_off\":\"Thursday\",\"work_mobile_number\":\"99700 34240\",\"work_email\":\"ACCOUNTS2@BSPMETATECH.COM\",\"overtime_allow\":\"No\",\"overtime_rate_per_hour\":\"0\",\"country\":\"105\",\"state\":\"12\",\"city\":\"SANGLI\",\"address\":\"ATAPADI,SANGLI\",\"zipcode\":\"415301\",\"aadhar_number\":\"744429912074\",\"pan_card_number\":\"HVDPK8119M\",\"pf_number\":\"101706489590\",\"uan_number\":\"\",\"degree_name\":\"MBA\",\"education_field\":\"FINANCE\",\"college_name\":\"S B PATIL COLLEGE OF MANAGEMENT\",\"pass_out_year\":\"2024\",\"phone_code\":\"+91\",\"secondary_number_code\":\"+91\",\"work_mobile_number_code\":\"+91\",\"deleted_bank\":[],\"bank_data\":[{\"bank_id\":\"8\",\"bank_name\":\"YES BANK\",\"branch_address\":\"CHICHWAD\",\"ifsc_code\":\"YESB0000551\",\"account_type\":\"Saving\",\"account_number\":\"055191600007283\",\"account_holder_name\":\"AJAY VIJAYSINGH KADAM\",\"default_bank\":\"Yes\"}]}}', '', 410501, 1, '2025-05-19 10:56:43', 1, '2025-05-25 07:56:41', 0),
(9, 'AMOL ', 'MAHADEV', 'MORE', 'BSP METATECH LLP-00006', 'employee', 'amolmore01@rediffmail.com', '+91', '9764414302', '+91', '7758911600', '1981-02-05', 'Male', 'Married', '105', '12', 'PUNE', 'Rudraksh co-op hsg society, C-1204, P', '412033', '4', '19', '2025-07-04', '8a8a971e2243596aab4d46f9d9ab083c', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM4.jpeg', 1, 'Thursday', '+91', '9764414302', 'npd@bspmetatech.com', 'NO', 0.000000, 'Diploma in Mechanical Engg.', 'Mechanical', 'Indira Gandhi Institute of Engg. ', 2010, '327297900581', 'BOUPM0460H', '100081448486', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-19 11:05:15', NULL, NULL, 0),
(10, 'AMOL ', 'SHIVAJI', 'NARUTE', 'BSP METATECH LLP-00007', 'employee', 'naruteamol191@gmail.com', '+91', '9890937287', '+91', '9975123713', '1998-08-15', 'Male', 'Single', '105', '12', 'SOLAPUR', 'AT- TAMSHIWADI, POST- PHONDIRAS, TAL-MALSHIRAS, DIST- SOLAPUR', '413107', '8', '25', '2022-06-11', 'e0c60703a864da8c5c71987541e3fda0', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM5.jpeg', 1, 'Thursday', '+91', '9890937287', 'naruteamol191@gmail.com', 'NO', 0.000000, 'BE MECHANICAL', 'ENG', 'SVPM COLLEGE ', 2022, '667708152536', 'CGUPN5082P', '102094535873', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-19 11:30:14', NULL, NULL, 0),
(11, 'SURAJ', 'BAJIRAO', 'SHELKE', 'BSP METATECH LLP-00008', 'employee', 'suraj99220@gmail.com', '+91', '9922066876', '+91', '9822349916', '1998-09-23', 'Male', 'Single', '105', '12', 'MOSHI', 'Survey No: 96,97, Yashada Supreme Society, Phase1, E-wing, Flat number-1405,Moshi, Dudulgaon,PCMC-412105', '412105', '5', '16', '2025-01-04', '8da1ff2adc239bf54c372b225af795f1', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM9.jpeg', 1, 'Thursday', '+91', '9922066876', 'inprocessquality@bspmetatech.com', 'NO', 0.000000, 'DIPLOMA MACH.ENGG', 'ELECTRICAL', 'ALL INDIA SHRI SHIVAJI MEMORIAL SOCIETY COLLEGE OF ENGINEERING(AISSMS COE)', 2020, '446224654740', 'HNTPS3049B', 'PUPUN03058730000010240', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-25 07:03:27', NULL, NULL, 0),
(12, 'SUJATA', 'YUVARAJ', 'PATIL', 'BSP METATECH LLP-00009', 'employee', 'sujatapatil2275@gmail.com', '+91', '8605861898', '+91', '9881366697', '1979-11-22', 'Female', 'Married', '105', '12', 'MOSHI', 'B-507, Royal Palm, Near G K Palacio, Borhadewadi Moshi,Pune-412105', '412105', '5', '13', '2023-12-15', 'e4beaaf41dd65e545eac66b4356045b7', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM10.jpeg', 1, 'Thursday', '+91', '8605861898', 'quality@bspmetatech.com', 'NO', 0.000000, 'Diploma in E& TC', 'Electronic', 'PVPIT college Budhagaon( Sangli)', 2001, '489660939800', 'BUJPP4733P', '', '101946810072', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-25 07:31:35', NULL, NULL, 0),
(13, 'RAHUL', 'POPAT', 'WAHGMODE', 'BSP METATECH LLP-00010', 'employee', 'rahulwaghmode732@gmail.com', '+91', '9096304693', '+91', '7719098824', '1997-07-17', 'Male', 'Single', '105', '12', 'PUNE', 'Waghmode Niwas ,khed, bargewasti,chimbali,pune', '412105', '4', '19', '2025-04-15', 'f925916e2754e5e03f75dd58a5733251', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM11.jpeg', 1, 'Thursday', '+91', '9096304693', 'npd@bspmetatech.com', 'NO', 0.000000, 'Diploma /B tech ', 'Electrical', 'dattakala institue ', 2020, '904313065247', 'AFDPW4108B', '101525901177', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-25 08:03:42', NULL, NULL, 0),
(14, 'NITIN', 'RAMESHJI', 'BOBDE', 'BSP METATECH LLP-00011', 'employee', 'nbobde06@gmail.com', '+91', '9881965820', '+91', '9881965820', '1987-03-17', 'Male', 'Married', '105', '12', 'NAGPUR', 'CHINCHABHAWAN JUNI WASTI WARDHA ROAD, Nagpur', '45748', '5', '16', '2025-01-01', '53280a0906099e7c17de6fc93f936b82', 1, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM12.jpeg', 1, 'Thursday', '+91', '9881965820', 'nbobde06@gmail.com', 'NO', 0.000000, 'BE MECHANICAL', 'Mechanical', 'Smt. Radhikatai Pandav College Of Engineering', 2014, '952128126533', 'AYTPB2015P', '101332702435', '', 1, 'Active', 'No', NULL, '', 410501, 1, '2025-05-25 08:14:18', NULL, NULL, 0),
(15, 'RAHUL', 'DATTATRAY', 'POKHARKAR', 'BSP METATECH LLP-00012', 'manager', 'rpokharkar@gmail.com', '+91', '09146966873', '+91', '09096206949', '1987-04-24', 'Male', 'Married', '105', '12', 'pune', 'flat no-13,Laxmi Appt. Vrudawan Garden, Khed /Rajgurunagar', '410505', '1', '6', '2018-02-16', 'f925916e2754e5e03f75dd58a5733251', 0, 'rahul.jpg', 3, 'Thursday', '+91', '9146966873', 'accounts@bspmetatech.com', 'NO', 0.000000, 'Bcom', 'ACCOUNTS & FINANCE', 'Annasaheb Awate Collage', 2008, '432243215252', 'BBAPP2953D', '101829976548', '101829976548', 1, 'Active', 'No', '', '', 410501, 1, '2025-05-25 08:15:26', 1, '2025-05-25 08:20:13', 0),
(16, 'ANIKET', 'GANESH', 'SAUNDANE', 'BSP METATECH LLP-00013', 'employee', 'aniketsaundane@gmail.com', '+91', '9145456851', '+91', '9145456851', '2000-12-24', 'Male', 'Single', '105', '12', 'NASHIK', 'RADHAKRISHNA CHOWK CIDCO', '422008', '6', '18', '2025-02-22', '1dcacbba95dff412ba1fb80c3ed2ea90', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM13.jpeg', 1, 'Thursday', '+91', '9145456851', 'productionunit2@bspmetatech.com', 'NO', 0.000000, 'BE MECHANICAL', 'ENGINEERING', 'MMIT COLLEGE LOHGAON ', 2022, '205862248440', 'LBZPS3980C', '101859109805    ', '', 1, 'Pending', 'No', NULL, '', 410501, 1, '2025-05-25 08:53:04', NULL, NULL, 0),
(17, 'HANUMANT', 'SHANKAR', 'GOSAVI', 'BSP METATECH LLP-00014', 'employee', 'gosavihanumant86@gmail.com', '+91', '7020217941', '+91', '7020217941', '1986-06-01', 'Male', 'Married', '105', '12', 'SOLAPUR', 'AT POST- GHANEGAON, TAL- BARSHI, DIST-SOLAPUR', '413403', '3', '10', '2022-07-22', '401010d3e67c32b058f0e2245516b695', 0, 'WhatsApp_Image_2025-05-17_at_3_42_30_PM14.jpeg', 1, 'Thursday', '+91', '7020217941', 'stores@bspmetatech.com', 'NO', 0.000000, 'B.A.', 'ARTS', 'SBZ COLLEGE', 2007, '861825174653', 'AMEPG5528R', '101287503572', '', 1, 'Pending', 'No', NULL, '', 410501, 1, '2025-05-25 09:00:06', NULL, NULL, 0),
(18, 'Gayatri', 'Narayan', 'Hedau', 'AROM-00001', 'admin', 'gayu.arom@gmail.com', '+91', '08381058482', '+91', '', '1989-05-03', 'Female', 'Single', '105', '12', 'Pune', 'Nagar, Lane Number 2', '411046', '14', '26', '2024-05-01', 'f925916e2754e5e03f75dd58a5733251', 0, 'images1.jpg', 1, 'Saturday,Sunday', '+91', '9874563210', 'gayu.arom@gmail.com', 'NO', 0.000000, 'BE', 'Electronic', 'GHRCE', 2021, '123456789124', 'ABCDE1234F', '', '', 3, 'Active', 'No', NULL, '', 123456, 1, '2025-05-28 12:14:19', NULL, NULL, 0),
(19, 'Aarbaj', 'Asalam', 'Mulla', 'AROM-00002', 'employee', 'aarbaj.arom@gmail.com', '+91', '9874563210', '', '', '2000-11-08', 'Male', 'Single', '105', '12', 'Pune', 'Nagar, Lane Number 2', '411046', '15', '27', '2024-05-01', 'f925916e2754e5e03f75dd58a5733251', 0, 'boy.jpg', 2, 'Thursday', '+91', '9874563210', 'aarbaj.arom@gmail.com', 'NO', 0.000000, 'BE', 'Electronic', 'GHRCE', 2021, '123456789123', 'ABCDE1234F', '', '', 3, 'Active', 'Yes', '{\"old_employe_data\":{\"employee_data\":{\"employee_id\":\"19\",\"first_name\":\"Aarbaj \",\"middle_name\":\"Asalam\",\"last_name\":\"Mulla\",\"employee_code\":\"AROM-00002\",\"role\":\"employee\",\"email\":\"aarbaj.arom@gmail.com\",\"phone_code\":\"+91\",\"mobile_number\":\"9874563210\",\"secondary_mobile_code\":\"\",\"secondary_mobile_number\":\"\",\"dob\":\"2000-11-08\",\"gender\":\"Male\",\"marital_status\":\"Single\",\"country\":\"105\",\"state\":\"12\",\"city\":\"Pune\",\"address\":\"Nagar, Lane Number 2\",\"zipcode\":\"411046\",\"department\":\"15\",\"designation\":\"27\",\"employment_date\":\"2024-05-01\",\"password\":\"f925916e2754e5e03f75dd58a5733251\",\"login_attempt_failed\":\"0\",\"profile_image\":\"boy.jpg\",\"reporting_manager\":\"2\",\"employee_week_off\":\"Thursday\",\"work_mobile_code\":\"+91\",\"work_mobile_number\":\"9874563210\",\"work_email\":\"aarbaj.arom@gmail.com\",\"over_time_allow\":\"NO\",\"overtime_rate_per_hour\":\"0.000000\",\"education_degree\":\"BE\",\"education_feild\":\"Electronic\",\"education_college\":\"GHRCE\",\"education_pass_out_year\":\"2021\",\"aadhar_number\":\"123456789123\",\"pan_card_number\":\"ABCDE1234F\",\"pf_number\":\"\",\"uan_number\":\"\",\"company_id\":\"3\",\"status\":\"Active\",\"is_edit\":\"No\",\"otp\":\"\",\"attendance_pin\":\"123456\",\"created_by\":\"18\",\"created_on\":\"2025-05-28 14:40:12\",\"updated_by\":\"18\",\"updated_on\":\"2025-05-28 16:23:20\",\"sys_record_delete\":\"0\"},\"bank_data\":[{\"id\":\"20\",\"bank_name\":\"State Bank of India\",\"branch_address\":\"MG Road, Mumbai\",\"ifsc_code\":\"SBIN0001234\",\"account_type\":\"Saving\",\"account_no\":\"123456789012\",\"account_holder_name\":\"Aarbaj Mulla\",\"default_bank\":\"Yes\",\"entity_type\":\"Employee\",\"entity_id\":\"19\",\"added_by\":\"0\",\"added_on\":\"2025-05-28 14:40:12\",\"updated_by\":\"18\",\"updated_on\":\"0000-00-00 00:00:00\",\"status\":\"Active\"}]},\"new_employe_data\":{\"mode\":\"Update\",\"employee_id\":\"19\",\"first_name\":\"Aarbaj \",\"middle_name\":\"Asalam\",\"last_name\":\"Mulla\",\"email\":\"aarbaj.arom@gmail.com\",\"dob\":\"11\\/08\\/2000\",\"mobile_number\":\"9874563210\",\"secondary_number\":\"\",\"gender\":\"Male\",\"marital_status\":\"Single\",\"profile_image_name\":\"boy.jpg\",\"company\":\"3\",\"department\":\"15\",\"designation\":\"27\",\"employement_type\":\"employee\",\"manager\":\"2\",\"employement_date\":\"05\\/01\\/2024\",\"week_off\":\"Friday\",\"work_mobile_number\":\"9874563210\",\"work_email\":\"aarbaj.arom@gmail.com\",\"overtime_allow\":\"No\",\"overtime_rate_per_hour\":\"0\",\"country\":\"105\",\"state\":\"12\",\"city\":\"Pune\",\"address\":\"Nagar, Lane Number 2\",\"zipcode\":\"411046\",\"aadhar_number\":\"123456789123\",\"pan_card_number\":\"ABCDE1234F\",\"pf_number\":\"\",\"uan_number\":\"\",\"degree_name\":\"BE\",\"education_field\":\"Electronic\",\"college_name\":\"GHRCE\",\"pass_out_year\":\"2021\",\"phone_code\":\"+91\",\"secondary_number_code\":\"+1\",\"work_mobile_number_code\":\"+91\",\"deleted_bank\":[],\"bank_data\":[{\"bank_id\":\"20\",\"bank_name\":\"State Bank of India\",\"branch_address\":\"MG Road, Mumbai\",\"ifsc_code\":\"SBIN0001234\",\"account_type\":\"Saving\",\"account_number\":\"123456789012\",\"account_holder_name\":\"Aarbaj Mulla\",\"default_bank\":\"Yes\"}]}}', '', 123456, 18, '2025-05-28 14:40:12', 18, '2025-05-28 17:48:51', 0),
(20, 'Gayu  ', '', 'Zolo', 'ZIN-00001', 'admin', 'gayu.zolo@gmail.com', '+91', '9857463210', '+91', '', '2000-06-01', 'Female', 'Single', '105', '12', 'Pune', 'Nagar, Lane Number 2', '411046', '17', '29', '2015-06-01', 'f925916e2754e5e03f75dd58a5733251', 0, 'images2.jpg', 2, 'Sunday', '+91', '9857463210', 'gayu.zolo@gmail.com', 'NO', 0.000000, 'BE', 'Electronic', 'GHRCE', 2013, '123456789124', 'ABCDE1234F', '', '', 4, 'Active', 'No', NULL, '', 123456, 2, '2025-06-02 11:16:35', NULL, NULL, 0),
(21, 'Nikita', '', 'Zolo', 'ZIN-00002', 'employee', 'nikita.zolo@gmail.com', '+91', '9857463210', '+91', '', '2000-05-31', 'Female', 'Married', '105', '12', 'Pune', 'Nagar, Lane Number 2', '411046', '17', '29', '2020-06-01', 'f925916e2754e5e03f75dd58a5733251', 0, 'pngtree-coworker-clipart-cartoon-female-employee-in-business-outfit-vector-png-image_6799765.png', 20, 'Sunday', '+91', '9857463210', 'nikita.zolo@gmail.com', 'NO', 0.000000, 'BE', 'Electronic', 'GHRCE', 2014, '123456789128', 'ABCDE1234H', '', '', 4, 'Active', 'No', NULL, '', 123456, 20, '2025-06-02 11:24:33', NULL, NULL, 0),
(22, 'Aarbaj', '', 'Mulla', 'ZIN-00003', 'manager', 'aarbaj.zolo@gmail.com', '+91', '9857463210', '+91', '', '1999-06-02', 'Female', 'Single', '105', '12', 'Pune', 'Nagar, Lane Number 2', '411046', '17', '30', '2025-06-01', 'f925916e2754e5e03f75dd58a5733251', 0, 'pngtree-vector-male-office-worker-png-image_9157125.png', 20, 'Sunday', '+91', '9864712301', 'aarbaj.zolo@gmail.com', 'NO', 0.000000, 'BE', 'Electronic', 'GHRCE', 2017, '123456789123', 'ABCDE1234G', '', '', 4, 'Active', 'No', NULL, '', 123456, 20, '2025-06-02 15:15:01', NULL, NULL, 0);

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

--
-- Dumping data for table `employee_shift`
--

INSERT INTO `employee_shift` (`employee_shift_id`, `group_title`, `shift_id`, `employee_ids`, `start_date`, `end_date`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`) VALUES
(1, 'General', 5, '3,15', '2025-05-25', '2025-12-31', 0, '2025-05-25 12:42:27', NULL, NULL, NULL);

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

--
-- Dumping data for table `employee_week_off`
--

INSERT INTO `employee_week_off` (`week_off_id`, `employee_id`, `employee_week_off`, `month`, `added_date`) VALUES
(1, 3, 'Thursday', 'April', '2025-04-14 14:31:18'),
(3, 5, 'Thursday', 'May', '2025-05-19 09:14:40'),
(4, 6, 'Thursday', 'May', '2025-05-19 10:11:05'),
(5, 7, 'Thursday', 'May', '2025-05-19 10:46:59'),
(6, 8, 'Thursday', 'May', '2025-05-19 10:56:43'),
(7, 9, 'Thursday', 'May', '2025-05-19 11:05:15'),
(8, 10, 'Thursday', 'May', '2025-05-19 11:30:14'),
(9, 11, 'Thursday', 'May', '2025-05-25 07:03:27'),
(10, 12, 'Thursday', 'May', '2025-05-25 07:31:35'),
(11, 13, 'Thursday', 'May', '2025-05-25 08:03:42'),
(12, 14, 'Thursday', 'May', '2025-05-25 08:14:18'),
(13, 15, 'Thursday', 'May', '2025-05-25 08:15:26'),
(14, 3, 'Monday,Thursday', 'May', '2025-05-25 08:22:45'),
(15, 16, 'Thursday', 'May', '2025-05-25 08:53:04'),
(16, 17, 'Thursday', 'May', '2025-05-25 09:00:06'),
(17, 18, 'Saturday,Sunday', 'May', '2025-05-28 12:14:19'),
(18, 19, 'Thursday', 'May', '2025-05-28 14:40:12'),
(19, 20, 'Sunday', 'June', '2025-06-02 11:16:35'),
(20, 21, 'Sunday', 'June', '2025-06-02 11:24:33'),
(21, 22, 'Sunday', 'June', '2025-06-02 15:15:01');

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

--
-- Dumping data for table `holiday_master`
--

INSERT INTO `holiday_master` (`id`, `holiday_name`, `holiday_date`, `company_id`, `created_by`, `created_on`, `updated_by`, `updated_on`, `status`) VALUES
(1, 'Ganesh Chaturthi', '2025-06-10', 4, 20, '2025-06-02 11:57:43', NULL, NULL, 'Active');

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

--
-- Dumping data for table `leave_allocation`
--

INSERT INTO `leave_allocation` (`id`, `sick_leave`, `paid_leave`, `casual_leave`, `total_leave`, `designation_id`, `department_id`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`) VALUES
(1, 12, 0, 12, 24, 6, 1, 0, '2025-05-25 08:46:23', NULL, NULL, 'Active'),
(3, 12, 0, 12, 24, 10, 3, 0, '2025-05-25 08:47:00', NULL, NULL, 'Active'),
(4, 12, 0, 12, 24, 15, 4, 0, '2025-05-25 08:47:17', NULL, NULL, 'Active'),
(19, 12, 15, 5, 32, 29, 17, 0, '2025-06-02 11:48:27', NULL, NULL, 'Active');

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

--
-- Dumping data for table `salary_component`
--

INSERT INTO `salary_component` (`salary_component_id`, `component_name`, `component_value`, `value_type`, `component_type`, `year`, `is_compulsory`, `description`, `company_id`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(6, 'BASIC', 40.00, 'Percentage', 'Income', 2025, 'No', 'BASIC', 1, 1, '2025-05-25 12:22:31', 1, '2025-05-25 13:29:45'),
(7, 'HRA', 20.00, 'Percentage', 'Income', 2025, 'No', 'HRA Allowance', 1, 1, '2025-05-25 12:22:31', NULL, NULL),
(8, 'Convenience', 1600.00, 'Decimal', 'Income', 2025, 'No', 'Convenience', 1, 1, '2025-05-25 12:22:31', 1, '2025-05-25 13:29:59'),
(9, 'Children  allowance', 200.00, 'Decimal', 'Income', 2025, 'No', 'Children  allowance', 1, 1, '2025-05-25 12:22:31', 1, '2025-05-25 13:29:51'),
(10, 'Medical  Allowance', 1250.00, 'Decimal', 'Income', 2025, 'No', 'Medical  Allowance', 1, 1, '2025-05-25 12:22:31', 1, '2025-05-25 13:30:09'),
(11, 'Washing  Allowance', 2000.00, 'Decimal', 'Income', 2025, 'No', 'Washing  Allowance', 1, 1, '2025-05-25 12:22:31', NULL, NULL),
(12, 'Telephone & Internet Allowance', 2000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 1, 1, '2025-05-25 12:22:31', NULL, NULL),
(13, 'Special Personal Allowance', 1000.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 1, 1, '2025-05-25 12:22:31', NULL, NULL),
(14, 'PF - 13%', 0.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 13%', 1, 1, '2025-05-25 12:23:26', 1, '2025-05-25 13:29:29'),
(15, 'PF - 12 %', 0.00, 'Decimal', 'Deduction', 2025, 'No', 'PF - 12 %', 1, 1, '2025-05-25 12:24:06', 1, '2025-05-25 13:29:21'),
(16, 'ESIC - 3.25%', 0.00, 'Decimal', 'Deduction', 2025, 'No', 'ESIC - 3.25%', 1, 1, '2025-05-25 12:26:07', 1, '2025-05-25 13:29:12'),
(17, 'ESIC - 0.75%', 0.00, 'Decimal', 'Deduction', 2025, 'No', 'ESIC - 0.75%', 1, 1, '2025-05-25 12:26:07', 1, '2025-05-25 13:29:04'),
(18, 'PT', 0.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 1, 1, '2025-05-25 12:26:07', 1, '2025-05-25 13:29:37'),
(19, 'Basic Allowence', 80.00, 'Percentage', 'Income', 2025, 'No', 'Basic Allowence', 3, 18, '2025-05-28 14:15:00', 18, '2025-05-28 16:13:35'),
(20, 'Tax', 5.00, 'Percentage', 'Deduction', 2025, 'No', 'Tax', 3, 18, '2025-05-28 14:15:00', 18, '2025-05-28 16:13:51'),
(21, 'Travel Allowence', 15.00, 'Percentage', 'Income', 2025, 'No', 'Travel Allowence', 3, 18, '2025-05-28 14:15:00', 18, '2025-05-28 16:14:11'),
(22, 'Basic', 201600.00, 'Decimal', 'Income', 2025, 'No', 'Basic', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:39:21'),
(23, 'H. R. A', 100800.00, 'Decimal', 'Income', 2025, 'No', 'H. R. A', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:40:00'),
(24, 'Conv.', 19200.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:39:49'),
(25, 'Children Allowance', 2400.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:39:32'),
(26, 'Medical Allowance', 15000.00, 'Decimal', 'Income', 2025, 'No', 'Medical Allowance', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:40:13'),
(27, 'Washing Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', '---', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:41:18'),
(28, 'Telephone & Internet Allowance', 24000.00, 'Decimal', 'Income', 2025, 'No', '-----', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:41:05'),
(29, 'Special Personal Allowance', 117000.00, 'Decimal', 'Income', 2025, 'No', '------', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:40:49'),
(30, ' PF12% ', 1800.00, 'Decimal', 'Deduction', 2025, 'No', '------', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:40:26'),
(31, ' PT  ', 200.00, 'Decimal', 'Deduction', 2025, 'No', '-------', 3, 18, '2025-05-28 16:11:05', 18, '2025-05-29 09:40:38'),
(32, 'BA- Basic', 40.00, 'Percentage', 'Income', 2025, 'No', 'BA- Basic', 3, 18, '2025-05-29 09:47:33', NULL, NULL),
(33, 'BA-HRA', 15.00, 'Percentage', 'Income', 2025, 'No', 'BA-HRA', 3, 18, '2025-05-29 09:47:33', NULL, NULL),
(34, 'BA- Convenience allowance', 0.00, 'Decimal', 'Income', 2025, 'No', 'BA- Convenience allowance', 3, 18, '2025-05-29 09:47:33', NULL, NULL),
(35, 'BA- Travelling allowance', 0.00, 'Decimal', 'Income', 2025, 'No', 'Travelling allowance', 3, 18, '2025-05-29 09:47:33', NULL, NULL),
(36, 'BA-Performance bouns', 0.00, 'Decimal', 'Income', 2025, 'No', 'BA-Performance bouns', 3, 18, '2025-05-29 09:47:33', NULL, NULL),
(37, 'Basic Allowence - Z', 16800.00, 'Decimal', 'Income', 2025, 'No', 'Basic Allowence - Z', 4, 20, '2025-06-02 11:36:24', 20, '2025-06-02 11:43:56'),
(38, 'H. R. A - Z', 8400.00, 'Decimal', 'Income', 2025, 'No', 'H. R. A - Z', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(39, 'Conv. - Z', 1600.00, 'Decimal', 'Income', 2025, 'No', 'Conv. - Z', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(40, 'Children Allowance', 200.00, 'Decimal', 'Income', 2025, 'No', 'Children Allowance', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(41, 'Medical Allowance', 1250.00, 'Decimal', 'Income', 2025, 'No', 'Medical Allowance', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(42, 'Washing Allowance', 2000.00, 'Decimal', 'Income', 2025, 'No', 'Washing Allowance', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(43, 'Telephone & Internet Allowance', 2000.00, 'Decimal', 'Income', 2025, 'No', 'Telephone & Internet Allowance', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(44, 'Special Personal Allowance', 9750.00, 'Decimal', 'Income', 2025, 'No', 'Special Personal Allowance', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(45, 'PF12%', 1800.00, 'Decimal', 'Deduction', 2025, 'No', 'PF12%', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(46, 'PT', 200.00, 'Decimal', 'Deduction', 2025, 'No', 'PT', 4, 20, '2025-06-02 11:36:24', NULL, NULL),
(47, 'Basic -  Z', 100.00, 'Percentage', 'Income', 2025, 'No', 'Basic -  Z', 4, 20, '2025-06-02 11:42:47', NULL, NULL),
(48, 'Tax - Z', 20.00, 'Percentage', 'Deduction', 2025, 'No', 'Tax - Z', 4, 20, '2025-06-02 11:42:47', NULL, NULL),
(49, 'Education', 200.00, 'Decimal', 'Income', 2025, 'No', '---', 3, 2, '2025-06-02 13:30:53', NULL, NULL),
(50, 'Employee Provident Fund -Z', 100.00, 'Decimal', 'Taxes', 2025, 'No', 'Employee Provident Fund', 4, 20, '2025-06-02 15:30:01', NULL, NULL);

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

--
-- Dumping data for table `shift_master`
--

INSERT INTO `shift_master` (`id`, `company_id`, `shift_name`, `department_id`, `shift_type`, `start_time`, `end_time`, `added_by`, `added_on`, `updated_by`, `updated_on`, `status`) VALUES
(4, 1, 'DAY', 7, 'I', '8:30 AM', '8:30 PM', 0, '2025-04-14 14:02:35', NULL, NULL, 'Active'),
(5, 1, 'GENRAL', 1, 'II', '9:00 AM', '6:30 PM', 0, '2025-04-14 14:03:40', 0, '2025-04-16 07:12:42', 'Active'),
(6, 1, 'GENRAL', 3, 'II', '9:00 AM', '6:30 PM', 0, '2025-04-14 14:04:08', NULL, NULL, 'Active'),
(7, 1, 'GENRAL', 4, 'II', '9:00 AM', '6:30 PM', 0, '2025-04-14 14:04:38', NULL, NULL, 'Active'),
(8, 1, 'GENRAL', 5, 'II', '9:00 AM', '6:30 PM', 0, '2025-04-14 14:05:29', NULL, NULL, 'Active'),
(9, 1, 'GENRAL', 6, 'II', '9:30 AM', '6:30 PM', 0, '2025-04-14 14:06:04', NULL, NULL, 'Active'),
(10, 1, 'GENRAL', 7, 'III', '8:30 PM', '8:30 AM', 0, '2025-04-14 14:06:44', NULL, NULL, 'Active'),
(17, 3, 'Alpha Morning', 15, 'I', '9:30 AM', '6:30 PM', 0, '2025-05-28 16:16:53', NULL, NULL, 'Active'),
(18, 4, 'Genral Shift', 17, 'I', '9:00 AM', '7:00 PM', 0, '2025-06-02 11:13:00', NULL, NULL, 'Active');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  MODIFY `attendance_correction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_master`
--
ALTER TABLE `bank_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_variables`
--
ALTER TABLE `company_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `department_master`
--
ALTER TABLE `department_master`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `designation_master`
--
ALTER TABLE `designation_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `designation_salary_structure`
--
ALTER TABLE `designation_salary_structure`
  MODIFY `designation_salary_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `designation_salary_structure_component`
--
ALTER TABLE `designation_salary_structure_component`
  MODIFY `designation_salary_structure_component_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `employee_combo_off`
--
ALTER TABLE `employee_combo_off`
  MODIFY `employee_combo_off_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_extended_salary_structure`
--
ALTER TABLE `employee_extended_salary_structure`
  MODIFY `employee_extended_salary_structure_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_extended_salary_structure_component`
--
ALTER TABLE `employee_extended_salary_structure_component`
  MODIFY `employee_extended_salary_component_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `employee_leave`
--
ALTER TABLE `employee_leave`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_master`
--
ALTER TABLE `employee_master`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `employee_shift_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_week_off`
--
ALTER TABLE `employee_week_off`
  MODIFY `week_off_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `holiday_master`
--
ALTER TABLE `holiday_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_allocation`
--
ALTER TABLE `leave_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `salary_component`
--
ALTER TABLE `salary_component`
  MODIFY `salary_component_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `shift_master`
--
ALTER TABLE `shift_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `iStateId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
