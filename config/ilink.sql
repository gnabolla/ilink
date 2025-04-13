-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2025 at 03:56 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ilink`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_category`
--

CREATE TABLE `accounts_category` (
  `CatCode` smallint(6) NOT NULL COMMENT 'Primary key for Category',
  `Category` varchar(100) DEFAULT NULL COMMENT 'Name of the account category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accounts_category`
--

INSERT INTO `accounts_category` (`CatCode`, `Category`) VALUES
(3, 'BUSINESS'),
(4, 'CALDERON'),
(5, 'GOVERNMENT'),
(6, 'LDS'),
(7, 'RESIDENTIAL'),
(8, 'SAN MANUEL'),
(9, 'SCHOOL'),
(10, 'STO DOMINGO'),
(11, 'SAN MATEO'),
(12, 'Rizal, Quirino'),
(13, 'POBLACION RESIDENCES'),
(14, 'Simimbaan'),
(15, 'PAKAK'),
(20, 'SINAMAR'),
(21, 'NUESA'),
(22, 'CENTRO'),
(23, 'RIZAL ROXAS'),
(24, 'MALLIG'),
(25, 'QUILING ANAO MUNOZ'),
(26, 'DC with Unpaid Balance'),
(31, 'Pakak Accts with Len');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_rentals`
--

CREATE TABLE `accounts_rentals` (
  `LCode` smallint(6) NOT NULL COMMENT 'Internal primary key for the account record',
  `LID` varchar(10) NOT NULL COMMENT 'Unique Lessee/Account Identifier (Used as Foreign Key in SOA tables)',
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `BlockNo` varchar(50) DEFAULT NULL,
  `StallNo` varchar(50) DEFAULT NULL,
  `MRF` decimal(10,2) DEFAULT NULL COMMENT 'Monthly Rental Fee (?)',
  `YearsToPay` varchar(10) DEFAULT NULL,
  `BeginningDate` date DEFAULT NULL,
  `EndingDate` date DEFAULT NULL,
  `PaymentMode` varchar(10) DEFAULT 'Monthly',
  `Company` varchar(100) DEFAULT NULL,
  `SpeedRate` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Category` varchar(100) DEFAULT NULL COMMENT 'Category name, links logically to accounts_category.Category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `accounts_rentals`
--

INSERT INTO `accounts_rentals` (`LCode`, `LID`, `LastName`, `FirstName`, `MiddleName`, `Address`, `BlockNo`, `StallNo`, `MRF`, `YearsToPay`, `BeginningDate`, `EndingDate`, `PaymentMode`, `Company`, `SpeedRate`, `Status`, `Category`) VALUES
(130, '1703044', 'CORPUS', 'ROBERTO', '09178884142', 'ROXAS, ISABELA', '', '', 1500.00, '', '2017-03-15', '2017-03-11', 'Monthly', 'NELSTECH', '20Mbps', 'Cancelled', 'DC with Unpaid Balance'),
(132, '1702046', 'MANGUNAY', 'DARWIN', 'J', 'MUNOZ WEST, ROXAS, ISABELA', '', '', 4000.00, '', '2017-02-01', '2017-05-23', 'Monthly', 'ROXAS WEST CENTRAL SCHOOL', '30Mbps', 'Active', 'SCHOOL'),
(135, '1701049', 'BORROMEO', 'GEORGE', '', 'ROXAS, ISABELA', '', '', 1000.00, '', '2017-02-15', '2017-06-03', 'Monthly', 'GBG BOOKKEEPING SERVICES', '15Mbps', 'Active', 'CENTRO'),
(1005, '1701041', 'ACCOUNT', 'MISSING_ONE', 'A', 'SOME ADDRESS 1', '', '', 3000.00, '', '2017-01-15', NULL, 'Monthly', 'SOME COMPANY A', '10Mbps', 'Active', 'BUSINESS'),
(1006, '1610036', 'ACCOUNT', 'MISSING_TWO', 'B', 'SOME ADDRESS 2', '', '', 15000.00, '', '2016-10-15', NULL, 'Monthly', 'SOME COMPANY B', '50Mbps', 'Active', 'GOVERNMENT');

-- --------------------------------------------------------

--
-- Table structure for table `paymentlisting_rentals`
--

CREATE TABLE `paymentlisting_rentals` (
  `PID` int(11) NOT NULL,
  `LID` varchar(50) DEFAULT NULL,
  `Lessee` varchar(50) DEFAULT NULL,
  `TotalAmountPaid` decimal(10,2) DEFAULT NULL,
  `Advancepayment` decimal(10,2) DEFAULT 0.00,
  `ORNo` varchar(50) DEFAULT NULL,
  `ORDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `paymentlisting_rentals`
--

INSERT INTO `paymentlisting_rentals` (`PID`, `LID`, `Lessee`, `TotalAmountPaid`, `Advancepayment`, `ORNo`, `ORDate`) VALUES
(520, '1611039', 'CALDERON, DOK TOTEP ', 7000.00, 0.00, '002902', '2017-02-06'),
(521, '1611039', 'CALDERON, DOK TOTEP ', 7000.00, 0.00, '002913', '2017-02-22'),
(522, '1609035', 'DY, BM DONDON ', 25000.00, 0.00, '000000', '2017-03-17'),
(523, '1701045', 'CALDERON, JAN ENCISO', 1500.00, 0.00, '003034', '2017-01-19'),
(524, '1701045', 'CALDERON, JAN ENCISO', 1500.00, 0.00, '003035', '2017-01-19'),
(526, '1703038', 'IGNACIO, PRAXEDES ', 7000.00, 0.00, '003045', '2017-01-31'),
(527, '1703038', 'IGNACIO, PRAXEDES ', 14000.00, 0.00, '002914', '2017-02-24'),
(528, '1709034', 'DAYRIT, VILMA CADELIÑA', 2500.00, 0.00, '000000', '2017-01-01'),
(529, '1709034', 'DAYRIT, VILMA CADELIÑA', 8000.00, 0.00, '000000', '2017-02-01'),
(531, '1701042', 'FLORES, SAMUEL ', 4000.00, 0.00, '002927', '2017-03-17'),
(532, '1701040', 'DUMAGUING, ELECTOR ', 4000.00, 0.00, '002911', '2017-02-17'),
(533, '1610036', 'PARALLAG, ED.D., QUIRINO  ', 30000.00, 0.00, '000000', '2016-11-15'),
(534, '1610036', 'PARALLAG, ED.D., QUIRINO  ', 15000.00, 0.00, '003048', '2017-02-02'),
(535, '1610036', 'PARALLAG, ED.D., QUIRINO  ', 14096.00, 0.00, '3409', '2017-04-18'),
(536, '1610036', 'PARALLAG, ED.D., QUIRINO  ', 14976.00, 0.00, '3408', '2017-04-18'),
(537, '1701041', 'DAYAG, FLORENDO ', 3000.00, 0.00, '2922', '2017-03-09'),
(538, '1701041', 'DAYAG, FLORENDO ', 3000.00, 0.00, '15068', '2017-04-29'),
(539, '1701042', 'FLORES, SAMUEL ', 4000.00, 0.00, '2946', '2017-03-04'),
(540, '1703038', 'IGNACIO, PRAXEDES ', 7280.00, 0.00, '2932', '2017-03-22'),
(541, '1701040', 'DUMAGUING, ELECTOR ', 4000.00, 0.00, '2939', '2017-03-26'),
(542, '1701040', 'DUMAGUING, ELECTOR ', 4000.00, 0.00, '15066', '2017-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `soa_rentals`
--

CREATE TABLE `soa_rentals` (
  `SOAID` smallint(6) NOT NULL COMMENT 'Primary Key for the SOA record',
  `LID` varchar(10) NOT NULL COMMENT 'Links to the account in accounts_rentals (FK constraint removed)',
  `MCode` tinyint(2) DEFAULT NULL COMMENT 'Month Code (?) - Meaning unclear',
  `Month` varchar(50) DEFAULT NULL COMMENT 'Billing period description',
  `Amount` decimal(10,2) DEFAULT NULL COMMENT 'Billed amount for the period',
  `Interest` decimal(10,2) DEFAULT 0.00 COMMENT 'Interest charged for the period',
  `TotalAmount` decimal(10,2) DEFAULT 0.00 COMMENT 'Total amount due (Amount + Interest)',
  `Paid` decimal(10,2) DEFAULT 0.00 COMMENT 'Amount paid towards this specific SOA',
  `Unpaid` decimal(10,2) DEFAULT 0.00 COMMENT 'Unpaid balance (TotalAmount - Paid)',
  `PaymentDate` datetime DEFAULT NULL COMMENT 'Date the payment covering this SOA (or part of it) was made',
  `Status` varchar(10) DEFAULT 'unpaid' COMMENT 'Status of this specific SOA (e.g., unpaid, paid, partial)',
  `SOANo` smallint(6) DEFAULT NULL COMMENT 'Statement of Account Number (potentially per account sequence)',
  `DateGenerated` date DEFAULT NULL COMMENT 'Date the SOA record was created',
  `DueDate` date DEFAULT NULL COMMENT 'Due date for the payment',
  `Modified` varchar(5) DEFAULT 'no' COMMENT 'Flag indicating if record was manually modified',
  `DateModified` datetime DEFAULT NULL COMMENT 'Timestamp of the last modification'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `soa_rentals`
--

INSERT INTO `soa_rentals` (`SOAID`, `LID`, `MCode`, `Month`, `Amount`, `Interest`, `TotalAmount`, `Paid`, `Unpaid`, `PaymentDate`, `Status`, `SOANo`, `DateGenerated`, `DueDate`, `Modified`, `DateModified`) VALUES
(3499, '1701041', NULL, 'Jan. 15, 2017 - Feb. 15, 2017', 3000.00, 0.00, 3000.00, 3000.00, 0.00, '2017-03-17 06:30:51', 'paid', 1, '2017-01-15', '2017-02-15', 'no', NULL),
(3516, '1610036', NULL, 'Oct. 15, 2016 - Nov. 15, 2016', 15000.00, 0.00, 15000.00, 15000.00, 0.00, '2017-03-17 06:41:21', 'paid', 1, '2016-10-15', '2016-11-15', 'no', NULL),
(3517, '1610036', NULL, 'Nov. 15, 2016 - Dec. 15, 2016', 15000.00, 0.00, 15000.00, 15000.00, 0.00, '2017-03-17 06:41:21', 'paid', 2, '2016-11-15', '2016-12-15', 'no', NULL),
(3518, '1610036', NULL, 'Dec. 15, 2016 - Jan. 15, 2017', 15000.00, 0.00, 15000.00, 15000.00, 0.00, '2017-03-17 06:43:57', 'paid', 3, '2016-12-15', '2017-01-15', 'no', NULL),
(3519, '1610036', NULL, 'Jan. 15, 2017 - Feb. 15, 2017', 15000.00, 0.00, 15000.00, 15000.00, 0.00, '2017-05-22 12:54:30', 'paid', 4, '2017-01-15', '2017-02-15', 'yes', '2017-05-22 12:53:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `is_admin`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$O1Y.4c1O2Fq6fQyKrr4nDeBdBNKa.Ik.LZh3TxnA/YYPSSNqb1zoG', 1, '2025-04-13 02:25:10'),
(2, 'allobang', 'gnabolla@gmail.com', '$2y$10$YcDDlNaTOmmLI.2YQ33BueekbIFlsb4EP5jKj6SDfZYJCTxGxHsTm', 0, '2025-04-13 02:33:59'),
(3, 'Arlene', 'arlene@gmail.com', '$2y$10$CWdWRaSzqHHrUbQAbOPtveC75vvxs.7AkBsxMBYD31HbOtM3y8Aoa', 0, '2025-04-13 13:28:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_category`
--
ALTER TABLE `accounts_category`
  ADD PRIMARY KEY (`CatCode`);

--
-- Indexes for table `accounts_rentals`
--
ALTER TABLE `accounts_rentals`
  ADD PRIMARY KEY (`LCode`),
  ADD KEY `IDX_LID` (`LID`),
  ADD KEY `IDX_Category` (`Category`),
  ADD KEY `IDX_Status` (`Status`);

--
-- Indexes for table `paymentlisting_rentals`
--
ALTER TABLE `paymentlisting_rentals`
  ADD KEY `PID` (`LID`),
  ADD KEY `PID_2` (`PID`);

--
-- Indexes for table `soa_rentals`
--
ALTER TABLE `soa_rentals`
  ADD PRIMARY KEY (`SOAID`),
  ADD KEY `IDX_soa_rentals_LID` (`LID`),
  ADD KEY `IDX_Status` (`Status`),
  ADD KEY `IDX_DueDate` (`DueDate`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_category`
--
ALTER TABLE `accounts_category`
  MODIFY `CatCode` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for Category', AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `accounts_rentals`
--
ALTER TABLE `accounts_rentals`
  MODIFY `LCode` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Internal primary key for the account record', AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `paymentlisting_rentals`
--
ALTER TABLE `paymentlisting_rentals`
  MODIFY `PID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16055;

--
-- AUTO_INCREMENT for table `soa_rentals`
--
ALTER TABLE `soa_rentals`
  MODIFY `SOAID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key for the SOA record', AUTO_INCREMENT=32767;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
