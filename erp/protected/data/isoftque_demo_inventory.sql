-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 01, 2014 at 01:15 PM
-- Server version: 5.5.37-log
-- PHP Version: 5.4.23

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `isoftque_demo_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `country` varchar(62) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=242 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso2`, `iso3`, `country`) VALUES
(1, 'AF', 'AFG', 'Afghanistan'),
(2, 'AX', 'ALA', 'Åland Islands'),
(3, 'AL', 'ALB', 'Albania'),
(4, 'DZ', 'DZA', 'Algeria (El Djazaïr)'),
(5, 'AS', 'ASM', 'American Samoa'),
(6, 'AD', 'AND', 'Andorra'),
(7, 'AO', 'AGO', 'Angola'),
(8, 'AI', 'AIA', 'Anguilla'),
(9, 'AQ', 'ATA', 'Antarctica'),
(10, 'AG', 'ATG', 'Antigua and Barbuda'),
(11, 'AR', 'ARG', 'Argentina'),
(12, 'AM', 'ARM', 'Armenia'),
(13, 'AW', 'ABW', 'Aruba'),
(14, 'AU', 'AUS', 'Australia'),
(15, 'AT', 'AUT', 'Austria'),
(16, 'AZ', 'AZE', 'Azerbaijan'),
(17, 'BS', 'BHS', 'Bahamas'),
(18, 'BH', 'BHR', 'Bahrain'),
(19, 'BD', 'BGD', 'Bangladesh'),
(20, 'BB', 'BRB', 'Barbados'),
(21, 'BY', 'BLR', 'Belarus'),
(22, 'BE', 'BEL', 'Belgium'),
(23, 'BZ', 'BLZ', 'Belize'),
(24, 'BJ', 'BEN', 'Benin'),
(25, 'BM', 'BMU', 'Bermuda'),
(26, 'BT', 'BTN', 'Bhutan'),
(27, 'BO', 'BOL', 'Bolivia'),
(28, 'BA', 'BIH', 'Bosnia and Herzegovina'),
(29, 'BW', 'BWA', 'Botswana'),
(30, 'BV', 'BVT', 'Bouvet Island'),
(31, 'BR', 'BRA', 'Brazil'),
(32, 'IO', 'IOT', 'British Indian Ocean Territory'),
(33, 'BN', 'BRN', 'Brunei Darussalam'),
(34, 'BG', 'BGR', 'Bulgaria'),
(35, 'BF', 'BFA', 'Burkina Faso'),
(36, 'BI', 'BDI', 'Burundi'),
(37, 'KH', 'KHM', 'Cambodia'),
(38, 'CM', 'CMR', 'Cameroon'),
(39, 'CA', 'CAN', 'Canada'),
(40, 'CV', 'CPV', 'Cape Verde'),
(41, 'KY', 'CYM', 'Cayman Islands'),
(42, 'CF', 'CAF', 'Central African Republic'),
(43, 'TD', 'TCD', 'Chad (T''Chad)'),
(44, 'CL', 'CHL', 'Chile'),
(45, 'CN', 'CHN', 'China'),
(46, 'CX', 'CXR', 'Christmas Island'),
(47, 'CC', 'CCK', 'Cocos (Keeling) Islands'),
(48, 'CO', 'COL', 'Colombia'),
(49, 'KM', 'COM', 'Comoros'),
(50, 'CG', 'COG', 'Congo, Republic Of'),
(51, 'CD', 'COD', 'Congo, The Democratic Republic of the (formerly Zaire)'),
(52, 'CK', 'COK', 'Cook Islands'),
(53, 'CR', 'CRI', 'Costa Rica'),
(54, 'CI', 'CIV', 'CÔte D''Ivoire (Ivory Coast)'),
(55, 'HR', 'HRV', 'Croatia (hrvatska)'),
(56, 'CU', 'CUB', 'Cuba'),
(57, 'CY', 'CYP', 'Cyprus'),
(58, 'CZ', 'CZE', 'Czech Republic'),
(59, 'DK', 'DNK', 'Denmark'),
(60, 'DJ', 'DJI', 'Djibouti'),
(61, 'DM', 'DMA', 'Dominica'),
(62, 'DO', 'DOM', 'Dominican Republic'),
(63, 'EC', 'ECU', 'Ecuador'),
(64, 'EG', 'EGY', 'Egypt'),
(65, 'SV', 'SLV', 'El Salvador'),
(66, 'GQ', 'GNQ', 'Equatorial Guinea'),
(67, 'ER', 'ERI', 'Eritrea'),
(68, 'EE', 'EST', 'Estonia'),
(69, 'ET', 'ETH', 'Ethiopia'),
(70, 'FO', 'FRO', 'Faeroe Islands'),
(71, 'FK', 'FLK', 'Falkland Islands (Malvinas)'),
(72, 'FJ', 'FJI', 'Fiji'),
(73, 'FI', 'FIN', 'Finland'),
(74, 'FR', 'FRA', 'France'),
(75, 'GF', 'GUF', 'French Guiana'),
(76, 'PF', 'PYF', 'French Polynesia'),
(77, 'TF', 'ATF', 'French Southern Territories'),
(78, 'GA', 'GAB', 'Gabon'),
(79, 'GM', 'GMB', 'Gambia, The'),
(80, 'GE', 'GEO', 'Georgia'),
(81, 'DE', 'DEU', 'Germany (Deutschland)'),
(82, 'GH', 'GHA', 'Ghana'),
(83, 'GI', 'GIB', 'Gibraltar'),
(84, 'GB', 'GBR', 'Great Britain'),
(85, 'GR', 'GRC', 'Greece'),
(86, 'GL', 'GRL', 'Greenland'),
(87, 'GD', 'GRD', 'Grenada'),
(88, 'GP', 'GLP', 'Guadeloupe'),
(89, 'GU', 'GUM', 'Guam'),
(90, 'GT', 'GTM', 'Guatemala'),
(91, 'GN', 'GIN', 'Guinea'),
(92, 'GW', 'GNB', 'Guinea-bissau'),
(93, 'GY', 'GUY', 'Guyana'),
(94, 'HT', 'HTI', 'Haiti'),
(95, 'HM', 'HMD', 'Heard Island and Mcdonald Islands'),
(96, 'HN', 'HND', 'Honduras'),
(97, 'HK', 'HKG', 'Hong Kong (Special Administrative Region of China)'),
(98, 'HU', 'HUN', 'Hungary'),
(99, 'IS', 'ISL', 'Iceland'),
(100, 'IN', 'IND', 'India'),
(101, 'ID', 'IDN', 'Indonesia'),
(102, 'IR', 'IRN', 'Iran (Islamic Republic of Iran)'),
(103, 'IQ', 'IRQ', 'Iraq'),
(104, 'IE', 'IRL', 'Ireland'),
(105, 'IL', 'ISR', 'Israel'),
(106, 'IT', 'ITA', 'Italy'),
(107, 'JM', 'JAM', 'Jamaica'),
(108, 'JP', 'JPN', 'Japan'),
(109, 'JO', 'JOR', 'Jordan (Hashemite Kingdom of Jordan)'),
(110, 'KZ', 'KAZ', 'Kazakhstan'),
(111, 'KE', 'KEN', 'Kenya'),
(112, 'KI', 'KIR', 'Kiribati'),
(113, 'KP', 'PRK', 'Korea (Democratic Peoples Republic pf [North] Korea)'),
(114, 'KR', 'KOR', 'Korea (Republic of [South] Korea)'),
(115, 'KW', 'KWT', 'Kuwait'),
(116, 'KG', 'KGZ', 'Kyrgyzstan'),
(117, 'LA', 'LAO', 'Lao People''s Democratic Republic'),
(118, 'LV', 'LVA', 'Latvia'),
(119, 'LB', 'LBN', 'Lebanon'),
(120, 'LS', 'LSO', 'Lesotho'),
(121, 'LR', 'LBR', 'Liberia'),
(122, 'LY', 'LBY', 'Libya (Libyan Arab Jamahirya)'),
(123, 'LI', 'LIE', 'Liechtenstein (Fürstentum Liechtenstein)'),
(124, 'LT', 'LTU', 'Lithuania'),
(125, 'LU', 'LUX', 'Luxembourg'),
(126, 'MO', 'MAC', 'Macao (Special Administrative Region of China)'),
(127, 'MK', 'MKD', 'Macedonia (Former Yugoslav Republic of Macedonia)'),
(128, 'MG', 'MDG', 'Madagascar'),
(129, 'MW', 'MWI', 'Malawi'),
(130, 'MY', 'MYS', 'Malaysia'),
(131, 'MV', 'MDV', 'Maldives'),
(132, 'ML', 'MLI', 'Mali'),
(133, 'MT', 'MLT', 'Malta'),
(134, 'MH', 'MHL', 'Marshall Islands'),
(135, 'MQ', 'MTQ', 'Martinique'),
(136, 'MR', 'MRT', 'Mauritania'),
(137, 'MU', 'MUS', 'Mauritius'),
(138, 'YT', 'MYT', 'Mayotte'),
(139, 'MX', 'MEX', 'Mexico'),
(140, 'FM', 'FSM', 'Micronesia (Federated States of Micronesia)'),
(141, 'MD', 'MDA', 'Moldova'),
(142, 'MC', 'MCO', 'Monaco'),
(143, 'MN', 'MNG', 'Mongolia'),
(144, 'MS', 'MSR', 'Montserrat'),
(145, 'MA', 'MAR', 'Morocco'),
(146, 'MZ', 'MOZ', 'Mozambique (Moçambique)'),
(147, 'MM', 'MMR', 'Myanmar (formerly Burma)'),
(148, 'NA', 'NAM', 'Namibia'),
(149, 'NR', 'NRU', 'Nauru'),
(150, 'NP', 'NPL', 'Nepal'),
(151, 'NL', 'NLD', 'Netherlands'),
(152, 'AN', 'ANT', 'Netherlands Antilles'),
(153, 'NC', 'NCL', 'New Caledonia'),
(154, 'NZ', 'NZL', 'New Zealand'),
(155, 'NI', 'NIC', 'Nicaragua'),
(156, 'NE', 'NER', 'Niger'),
(157, 'NG', 'NGA', 'Nigeria'),
(158, 'NU', 'NIU', 'Niue'),
(159, 'NF', 'NFK', 'Norfolk Island'),
(160, 'MP', 'MNP', 'Northern Mariana Islands'),
(161, 'NO', 'NOR', 'Norway'),
(162, 'OM', 'OMN', 'Oman'),
(163, 'PK', 'PAK', 'Pakistan'),
(164, 'PW', 'PLW', 'Palau'),
(165, 'PS', 'PSE', 'Palestinian Territories'),
(166, 'PA', 'PAN', 'Panama'),
(167, 'PG', 'PNG', 'Papua New Guinea'),
(168, 'PY', 'PRY', 'Paraguay'),
(169, 'PE', 'PER', 'Peru'),
(170, 'PH', 'PHL', 'Philippines'),
(171, 'PN', 'PCN', 'Pitcairn'),
(172, 'PL', 'POL', 'Poland'),
(173, 'PT', 'PRT', 'Portugal'),
(174, 'PR', 'PRI', 'Puerto Rico'),
(175, 'QA', 'QAT', 'Qatar'),
(176, 'RE', 'REU', 'RÉunion'),
(177, 'RO', 'ROU', 'Romania'),
(178, 'RU', 'RUS', 'Russian Federation'),
(179, 'RW', 'RWA', 'Rwanda'),
(180, 'SH', 'SHN', 'Saint Helena'),
(181, 'KN', 'KNA', 'Saint Kitts and Nevis'),
(182, 'LC', 'LCA', 'Saint Lucia'),
(183, 'PM', 'SPM', 'Saint Pierre and Miquelon'),
(184, 'VC', 'VCT', 'Saint Vincent and the Grenadines'),
(185, 'WS', 'WSM', 'Samoa (formerly Western Samoa)'),
(186, 'SM', 'SMR', 'San Marino (Republic of)'),
(187, 'ST', 'STP', 'Sao Tome and Principe'),
(188, 'SA', 'SAU', 'Saudi Arabia (Kingdom of Saudi Arabia)'),
(189, 'SN', 'SEN', 'Senegal'),
(190, 'CS', 'SCG', 'Serbia and Montenegro (formerly Yugoslavia)'),
(191, 'SC', 'SYC', 'Seychelles'),
(192, 'SL', 'SLE', 'Sierra Leone'),
(193, 'SG', 'SGP', 'Singapore'),
(194, 'SK', 'SVK', 'Slovakia (Slovak Republic)'),
(195, 'SI', 'SVN', 'Slovenia'),
(196, 'SB', 'SLB', 'Solomon Islands'),
(197, 'SO', 'SOM', 'Somalia'),
(198, 'ZA', 'ZAF', 'South Africa (zuid Afrika)'),
(199, 'GS', 'SGS', 'South Georgia and the South Sandwich Islands'),
(200, 'ES', 'ESP', 'Spain (españa)'),
(201, 'LK', 'LKA', 'Sri Lanka'),
(202, 'SD', 'SDN', 'Sudan'),
(203, 'SR', 'SUR', 'Suriname'),
(204, 'SJ', 'SJM', 'Svalbard and Jan Mayen'),
(205, 'SZ', 'SWZ', 'Swaziland'),
(206, 'SE', 'SWE', 'Sweden'),
(207, 'CH', 'CHE', 'Switzerland (Confederation of Helvetia)'),
(208, 'SY', 'SYR', 'Syrian Arab Republic'),
(209, 'TW', 'TWN', 'Taiwan ("Chinese Taipei" for IOC)'),
(210, 'TJ', 'TJK', 'Tajikistan'),
(211, 'TZ', 'TZA', 'Tanzania'),
(212, 'TH', 'THA', 'Thailand'),
(213, 'TL', 'TLS', 'Timor-Leste (formerly East Timor)'),
(214, 'TG', 'TGO', 'Togo'),
(215, 'TK', 'TKL', 'Tokelau'),
(216, 'TO', 'TON', 'Tonga'),
(217, 'TT', 'TTO', 'Trinidad and Tobago'),
(218, 'TN', 'TUN', 'Tunisia'),
(219, 'TR', 'TUR', 'Turkey'),
(220, 'TM', 'TKM', 'Turkmenistan'),
(221, 'TC', 'TCA', 'Turks and Caicos Islands'),
(222, 'TV', 'TUV', 'Tuvalu'),
(223, 'UG', 'UGA', 'Uganda'),
(224, 'UA', 'UKR', 'Ukraine'),
(225, 'AE', 'ARE', 'United Arab Emirates'),
(226, 'GB', 'GBR', 'United Kingdom (Great Britain)'),
(227, 'US', 'USA', 'United States'),
(228, 'UM', 'UMI', 'United States Minor Outlying Islands'),
(229, 'UY', 'URY', 'Uruguay'),
(230, 'UZ', 'UZB', 'Uzbekistan'),
(231, 'VU', 'VUT', 'Vanuatu'),
(232, 'VA', 'VAT', 'Vatican City (Holy See)'),
(233, 'VE', 'VEN', 'Venezuela'),
(234, 'VN', 'VNM', 'Viet Nam'),
(235, 'VG', 'VGB', 'Virgin Islands, British'),
(236, 'VI', 'VIR', 'Virgin Islands, U.S.'),
(237, 'WF', 'WLF', 'Wallis and Futuna'),
(238, 'EH', 'ESH', 'Western Sahara (formerly Spanish Sahara)'),
(239, 'YE', 'YEM', 'Yemen (Arab Republic)'),
(240, 'ZM', 'ZMB', 'Zambia'),
(241, 'ZW', 'ZWE', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `credit_limit`
--

DROP TABLE IF EXISTS `credit_limit`;
CREATE TABLE IF NOT EXISTS `credit_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_credit_limit` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `criteria_values`
--

DROP TABLE IF EXISTS `criteria_values`;
CREATE TABLE IF NOT EXISTS `criteria_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_or_size` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `FK_criteria_values` (`color_or_size`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `criteria_values`
--

INSERT INTO `criteria_values` (`id`, `color_or_size`, `value`, `remarks`) VALUES
(1, 16, 'XXL', ''),
(2, 15, 'DARK BLUE', ''),
(3, 16, 'XL', ''),
(4, 15, 'BLACK', ''),
(5, 15, 'MILD BLUE', ''),
(6, 15, 'WHITE', ''),
(7, 15, 'GREEN', ''),
(8, 15, 'GRAY', ''),
(9, 15, 'RED', ''),
(10, 15, 'PURPLE', ''),
(11, 16, '16', 'Inch'),
(12, 16, '16.5', 'Inch'),
(13, 16, 'LARGE', ''),
(14, 16, 'SMALL', ''),
(15, 15, 'PRINTED', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depot_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ab_validation`
--

DROP TABLE IF EXISTS `customer_ab_validation`;
CREATE TABLE IF NOT EXISTS `customer_ab_validation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_field` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer_ab_validation`
--

INSERT INTO `customer_ab_validation` (`id`, `validation_field`, `is_active`) VALUES
(1, 'Customer Available Balance Validation On Sale Orders', 1),
(2, 'Sell Price Editable On Sale Orders & Quick Sales', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_contact_persons`
--

DROP TABLE IF EXISTS `customer_contact_persons`;
CREATE TABLE IF NOT EXISTS `customer_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contact_persons2` (`company_id`),
  KEY `FK_contact_persons_designation` (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `department_name`) VALUES
(9, 'Support'),
(10, 'Marketing'),
(11, 'inventory'),
(14, 'Admin'),
(15, 'Account & Finance'),
(17, 'Sales'),
(18, 'Purchase');

-- --------------------------------------------------------

--
-- Table structure for table `depot`
--

DROP TABLE IF EXISTS `depot`;
CREATE TABLE IF NOT EXISTS `depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_num` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `gureenty_money` double DEFAULT '0',
  `trade_licence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `designation`) VALUES
(9, 'Marketing Executive'),
(11, 'Executive Sales'),
(12, 'Technician'),
(16, 'Accounts Officer'),
(17, 'C.E.O');

-- --------------------------------------------------------

--
-- Table structure for table `discount_tab`
--

DROP TABLE IF EXISTS `discount_tab`;
CREATE TABLE IF NOT EXISTS `discount_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT '0',
  `no_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `discount_type`
--

DROP TABLE IF EXISTS `discount_type`;
CREATE TABLE IF NOT EXISTS `discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `discount_type`
--

INSERT INTO `discount_type` (`id`, `title`, `is_active`) VALUES
(1, 'PERCENTAGE', 2),
(2, 'AMOUNT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `designation_id`, `department_id`, `id_no`, `contact_no`, `email`, `address`) VALUES
(1, 'Employee One', 17, 14, '', '0000000000000', '', ''),
(2, 'Employee Two', 11, 17, '', '0000000000000', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `stock_in` double DEFAULT '0',
  `stock_out` double DEFAULT '0',
  `sell_price` double DEFAULT '0',
  `transaction_date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Table structure for table `lookup`
--

DROP TABLE IF EXISTS `lookup`;
CREATE TABLE IF NOT EXISTS `lookup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `lookup`
--

INSERT INTO `lookup` (`id`, `name`, `code`, `type`) VALUES
(1, 'ACTIVE', 1, 'is_active'),
(2, 'INACTIVE', 2, 'is_active'),
(3, 'NOT RECEIVED', 5, 'is_received'),
(4, 'RECEIVED', 6, 'is_received'),
(5, 'CURRENCY', 7, 'unit_type'),
(6, 'QUANTITY', 8, 'unit_type'),
(7, 'PENDING', 9, 'approved_status'),
(8, 'APPROVED', 10, 'approved_status'),
(9, 'COLOR', 15, 'color_or_size'),
(10, 'SIZE', 16, 'color_or_size'),
(11, 'MEASUREMENT', 17, 'unit_type'),
(12, 'WEIGHT', 18, 'unit_type'),
(13, 'NOT ADDED', 21, 'isAddedToInventory'),
(14, 'ADDED', 22, 'isAddedToInventory'),
(15, 'ALL NOT DELIVERED', 23, 'is_all_delivered'),
(16, 'ALL DELIVERED', 24, 'is_all_delivered'),
(17, 'PURCHASE ORDER', 27, 'report_type'),
(18, 'SALE ORDER', 28, 'report_type'),
(19, 'QUICK SELL', 29, 'report_type'),
(20, 'STOCK', 30, 'report_type'),
(21, 'DELIVERY VOUCHER', 31, 'report_type'),
(22, 'RECEIVE VOUCHER', 32, 'report_type'),
(23, 'PURCHASE ORDER', 33, 'operation_type'),
(24, 'SALE ORDER', 34, 'operation_type'),
(25, 'QUICK SALE', 35, 'operation_type'),
(26, 'ALL NOT RECEIVED', 36, 'is_all_received'),
(27, 'ALL RECEIVED', 37, 'is_all_received'),
(30, 'SALE ORDER', 40, 'no_type'),
(31, 'QUICK SALE', 41, 'no_type'),
(32, 'Dr', 42, 'amount_type'),
(33, 'Cr', 43, 'amount_type'),
(34, 'ESTABLISHED', 44, 'order_status'),
(36, 'CANCELED', 45, 'order_status');

-- --------------------------------------------------------

--
-- Table structure for table `manual`
--

DROP TABLE IF EXISTS `manual`;
CREATE TABLE IF NOT EXISTS `manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `manual`
--

INSERT INTO `manual` (`id`, `name`, `desc`) VALUES
(1, 'Product Information', 'Configure -> Products\r\n\r\nThen\r\n\r\nAdd Category, Sub-Category, Code, Model, Brand, Color, Size ETC\r\n\r\n<i>\r\nyou can add product code manually OR automatic by selecting "Manufacturer"\r\n</i>\r\n'),
(2, 'Sale Price', 'Configure -> Add sale price\r\n\r\n<u>OR</u>\r\n\r\nYou can add sale price while adding Products, check carefully,\r\n\r\nthere is a BLUE BUTTON named "Add Sale Price", after adding that product info.\r\n\r\nALSO,\r\n\r\nyou can add sale price from sale order window'),
(3, 'Add Products To The Inventory', 'There are two ways for adding the product to your inventory stock,\r\n\r\n<ol>\r\n<li>Adding through by purchasing products and approving then by <font =''red''><b><i>add to inventory option</i></b></font> (exist in the menu-> purchase)</li>\r\n<li>And Adding through manual</li>\r\n</ol>\r\n\r\n<b>1</b>. If products are purchased, then by approving process and add to inventory option, they will be automatically added to the inventory stock.\r\n\r\n<b>2</b>. If you want to add products into the inventory stock by manual, go through manu-> inventory -> manual stock entry'),
(4, 'Sale the products', 'Sale through "Credit Sale (Sale Order) then Deliver"\r\n\r\n<u>OR</u>\r\n\r\nSale through "Quick Sale (POS)" if you want to sale products through the retail process.'),
(5, 'Reports', 'All reports will be available in Manu -> Reports \r\n\r\nHere you can find these options-\r\n\r\n<ol>\r\n<li>Date Wise, Party Wise, Store Wise, Product Wise (For, Purchase, Credit Sales (Sale Order) AND Quick Sale (POS))</li>\r\n<li>Purchase-Sales Combined Report</li>\r\n<li>Stock Report (Product Quantity In Hand)</li>\r\n<li>Stock Report (Amount($) Of Product In Hand)</li>\r\n<li>Product Cost-Revenue Report</li>\r\n<li>Party Ledger (Customer AND Supplier)</li>\r\n<li>Costing Price (Product Wise)</li>\r\n<li>Make A Product Proposal For Your Company (Extra)</li>\r\n</ol>'),
(6, 'Sale Price Editable', 'If you want to edit sale prices while sales, you can turn this option <b><i>ON</i></b> from configure->sale price editable Option'),
(7, 'Customer Available Balance Validation', 'If you want that, the software will check the customer''s available balance in your company, and if his/her available balance is zero, you want that software will stop the sale process and notify you that his/her available balance is zero, can not sale to him.\r\n\r\n\r\nIf you want above type of scenario in you software, simply turn this option <b></i>ON</i></b> from configure -> customer AB'),
(8, 'Discount Type', 'You can set the Discount Type to AMOUNT/ PERCENTAGE, from\r\nconfigure -> Discount Type (If one is activate, the other will be automatically inactivated)'),
(9, 'Costing Method', 'You can choose your product costing price methods ( LIFO / FIFO / AVERAGE ), you can active you desired method from\r\n\r\nconfigure -> costing method'),
(10, 'Touch Pad', 'If you use touch screen for POS, simply turn ON touch pad from\r\n\r\nConfigure -> Touch Pad ON/OFF'),
(11, 'Number Format', 'Set your Purchase Order , Sale Order , POS , Delivery/Challan Voucher AND Purchase Receive Voucher Number Formats from\r\n\r\nConfigure -> Number Format'),
(12, 'Time Range For Edit / Delete', 'You can set the time range for update/edit and delete your transaction data (Purchase Order, Sale Order, Quick Sale) from\r\n\r\nConfigure -> Time Range EDIT / DELETE'),
(13, 'Product Description For Vouchers', 'You can choose which product options will be shown in you vouchers ( Brand, Model, Additional Features, Color, Sizes ETC ) \r\n\r\nfrom Configure -> Prod Desc For Report'),
(14, 'Software Basic Setup', '<u>If you are not understanding the process, do the following</u>\r\n\r\n<i>All the options will brief here, will found in menu -> configure (Check Carefully)</i>\r\n\r\n<b>First Of All</b>\r\n\r\n<ol>\r\n<li>Configure Your Company Information</li>\r\n<li>Configure Your Supplier AND Customer</li>\r\n<li>Create Your Stores</li>\r\n<li>Assign Your Stores To A User <b><i>( If You are a super admin, no need to assign, you have all the access of all process that means, you can have the access to all stores )</i></b></li>\r\n<li>Setup Your Products</li>\r\n<li>Set Your Product Sale Prices</li>\r\n<li>Add Product To Your Inventory Through Purchase -> Receive -> Approve -> Add To Inventory <b><i>OR</i></b> By Manual Stock Entry ( From Menu, Inventory - > Manual Stock Entry )</li>\r\n<li>Sale Through Sale Order (Credit Sale) -> Delivery <b><i>OR</i></b> By Quick Sale (POS) </li>\r\n<li>Generate Report (From menu, Reports)</li>\r\n</ol>\r\n\r\n\r\nWow.. you just ran the software as it should be. Thanks for being patient.  :) ');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `manufacturer`, `code`) VALUES
(2, 'Manufacturer One', '20649');

-- --------------------------------------------------------

--
-- Table structure for table `money_receipt`
--

DROP TABLE IF EXISTS `money_receipt`;
CREATE TABLE IF NOT EXISTS `money_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_money_receipt` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

DROP TABLE IF EXISTS `months`;
CREATE TABLE IF NOT EXISTS `months` (
  `id` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `month_name` varchar(8) DEFAULT NULL,
  `days` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `month_name`, `days`) VALUES
(01, 'JANUARY', 31),
(02, 'FEBRUARY', 30),
(03, 'MARCH', 31),
(04, 'APRIL', 30),
(05, 'MAY', 31),
(06, 'JUNE', 30),
(07, 'JULY', 31),
(08, 'AUGUST', 31),
(09, 'SEPTEMBE', 30),
(10, 'OCTOBER', 31),
(11, 'NOVEMBER', 30),
(12, 'DECEMBER', 31);

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipt`
--

DROP TABLE IF EXISTS `payment_receipt`;
CREATE TABLE IF NOT EXISTS `payment_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_receipt` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `po_sts_chng_history`
--

DROP TABLE IF EXISTS `po_sts_chng_history`;
CREATE TABLE IF NOT EXISTS `po_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `pp_selection_type`
--

DROP TABLE IF EXISTS `pp_selection_type`;
CREATE TABLE IF NOT EXISTS `pp_selection_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pp_selection_type`
--

INSERT INTO `pp_selection_type` (`id`, `title`, `is_active`) VALUES
(1, 'FIFO (First In First Out)', 1),
(2, 'LIFO (Last In First Out)', 2),
(3, 'AVERAGE', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prod_brands`
--

DROP TABLE IF EXISTS `prod_brands`;
CREATE TABLE IF NOT EXISTS `prod_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_brands` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `prod_desc_choice_for_report`
--

DROP TABLE IF EXISTS `prod_desc_choice_for_report`;
CREATE TABLE IF NOT EXISTS `prod_desc_choice_for_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` int(11) DEFAULT NULL,
  `option1` int(11) DEFAULT '0',
  `option2` int(11) DEFAULT '0',
  `option3` int(11) DEFAULT '0',
  `option4` int(11) DEFAULT '0',
  `option5` int(11) DEFAULT '0',
  `option6` int(11) DEFAULT '0',
  `option7` int(11) DEFAULT '0',
  `option8` int(11) DEFAULT '0',
  `option9` int(11) DEFAULT '0',
  `option10` int(11) DEFAULT '0',
  `option11` int(11) DEFAULT '0',
  `option12` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `prod_desc_choice_for_report`
--

INSERT INTO `prod_desc_choice_for_report` (`id`, `report_type`, `option1`, `option2`, `option3`, `option4`, `option5`, `option6`, `option7`, `option8`, `option9`, `option10`, `option11`, `option12`) VALUES
(1, 27, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 29, 0, 0, 3, 0, 0, 0, 7, 8, 9, 10, 0, 0),
(4, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 31, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 32, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `prod_items`
--

DROP TABLE IF EXISTS `prod_items`;
CREATE TABLE IF NOT EXISTS `prod_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `prod_models`
--

DROP TABLE IF EXISTS `prod_models`;
CREATE TABLE IF NOT EXISTS `prod_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `measurement` varchar(255) DEFAULT NULL,
  `measurement_unit_id` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_unit_id` int(11) DEFAULT NULL,
  `features` text,
  `pmodel` int(11) DEFAULT NULL,
  `pbrand` int(11) DEFAULT NULL,
  `warranty` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_models` (`brand_id`),
  KEY `FK_prod_models_2` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `prod_proposal`
--

DROP TABLE IF EXISTS `prod_proposal`;
CREATE TABLE IF NOT EXISTS `prod_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `to_whom` text,
  `why_writing` text,
  `prev_discusion` text,
  `before_product_list` text,
  `product_list` text,
  `after_product_list` text,
  `make_deal` text,
  `from` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE IF NOT EXISTS `purchase_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subj` varchar(255) DEFAULT NULL,
  `ref_no` varchar(255) DEFAULT NULL,
  `po_no` int(11) DEFAULT NULL,
  `order_by_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expected_receive_date` date DEFAULT NULL,
  `delivery_expired_day` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `curr_unit_id` int(11) DEFAULT NULL,
  `order_qty` double DEFAULT NULL,
  `qty_unit_id` int(11) DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `is_all_received` int(11) DEFAULT '36',
  `bill_to` text,
  `ship_to` text,
  `ship_by` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `order_status` int(11) DEFAULT '44',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_prices`
--

DROP TABLE IF EXISTS `purchase_prices`;
CREATE TABLE IF NOT EXISTS `purchase_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `p_brand`
--

DROP TABLE IF EXISTS `p_brand`;
CREATE TABLE IF NOT EXISTS `p_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `p_model`
--

DROP TABLE IF EXISTS `p_model`;
CREATE TABLE IF NOT EXISTS `p_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `quick_sell`
--

DROP TABLE IF EXISTS `quick_sell`;
CREATE TABLE IF NOT EXISTS `quick_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_no` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `stockQty` double DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `given_amount` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `quick_sell_return`
--

DROP TABLE IF EXISTS `quick_sell_return`;
CREATE TABLE IF NOT EXISTS `quick_sell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_id` int(11) DEFAULT NULL,
  `quick_sell_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `remarks` text,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quick_sell_return` (`quick_sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `received_purchase`
--

DROP TABLE IF EXISTS `received_purchase`;
CREATE TABLE IF NOT EXISTS `received_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receive_no` int(11) DEFAULT NULL,
  `purchase_id` int(11) unsigned DEFAULT NULL,
  `po_no` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `return_qty` double DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `isAddedToInventory` int(11) DEFAULT '21',
  `received_by_id` int(11) DEFAULT NULL,
  `approved_status` int(11) DEFAULT '9',
  `approved_by_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_received_purchase` (`purchase_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_delivery`
--

DROP TABLE IF EXISTS `sell_delivery`;
CREATE TABLE IF NOT EXISTS `sell_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_no` int(11) DEFAULT NULL,
  `sell_items_id` int(11) unsigned DEFAULT NULL,
  `so_no` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `delivery_qty` double DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sell_delivery` (`sell_items_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_items`
--

DROP TABLE IF EXISTS `sell_items`;
CREATE TABLE IF NOT EXISTS `sell_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `so_no` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_qty` double DEFAULT NULL,
  `qty_unit_id` int(11) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `initiated_by` int(11) DEFAULT NULL,
  `is_all_delivered` int(11) DEFAULT '23',
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `authorized_by` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT '44',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `sell_price`
--

DROP TABLE IF EXISTS `sell_price`;
CREATE TABLE IF NOT EXISTS `sell_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `ideal_qty` int(11) DEFAULT NULL,
  `warn_qty` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_sell_price` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `ship_by`
--

DROP TABLE IF EXISTS `ship_by`;
CREATE TABLE IF NOT EXISTS `ship_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `so_sts_chng_history`
--

DROP TABLE IF EXISTS `so_sts_chng_history`;
CREATE TABLE IF NOT EXISTS `so_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer_history`
--

DROP TABLE IF EXISTS `stock_transfer_history`;
CREATE TABLE IF NOT EXISTS `stock_transfer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_from_store_id` int(11) DEFAULT NULL,
  `sent_qty` double DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `received_to_store_id` int(11) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sent_by_id` int(11) DEFAULT NULL,
  `received_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `store_name`, `location`) VALUES
(2, 'Store One', 'Store Location');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_contact_persons`
--

DROP TABLE IF EXISTS `supplier_contact_persons`;
CREATE TABLE IF NOT EXISTS `supplier_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_supplier_contact_persons` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `touch_pad`
--

DROP TABLE IF EXISTS `touch_pad`;
CREATE TABLE IF NOT EXISTS `touch_pad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `touch_pad`
--

INSERT INTO `touch_pad` (`id`, `title`, `is_active`) VALUES
(1, 'TOUCH PAD', 2);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `value` double DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_type`, `label`, `value`, `remarks`) VALUES
(1, 7, 'USD', 77.58, '1 USD = 77.58 TK'),
(2, 7, 'AUS', 71.56, '1 AUS = 71.56 TK'),
(5, 8, 'Pcs', NULL, ''),
(6, 8, 'Packages', NULL, ''),
(14, 17, 'CM', NULL, ''),
(16, 17, 'INCH', NULL, ''),
(17, 18, 'KGs', NULL, ''),
(18, 18, 'GM', NULL, ''),
(20, 18, 'Pound', NULL, ''),
(21, 17, 'Feet', NULL, ''),
(22, 7, 'TK', 1, '1 TK = 1 TK'),
(25, 8, 'BOX', NULL, NULL),
(26, 7, 'RUPEE', 1.32, '1 RUPEE = 1.32 TK'),
(27, 7, 'EURO', 105.45, '1 EURO = 105.45 TK'),
(28, 7, 'RINGGIT', 24.04, '1 RINGGIT = 24.04 TK');

-- --------------------------------------------------------

--
-- Table structure for table `update_delete_time`
--

DROP TABLE IF EXISTS `update_delete_time`;
CREATE TABLE IF NOT EXISTS `update_delete_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` int(11) NOT NULL,
  `updatable_day` int(11) NOT NULL DEFAULT '0',
  `deletable_day` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `update_delete_time`
--

INSERT INTO `update_delete_time` (`id`, `operation_type`, `updatable_day`, `deletable_day`) VALUES
(1, 33, 7, 7),
(2, 34, 7, 7),
(3, 35, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `username`, `password`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
(1, 1, 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', NULL, NULL, 'superadmin', '2014-05-28 23:20:30'),
(2, 2, 'pos_ops', '4c3e11d885ebd69c44d8705c6c8a3e74', 'pruser.36437', '2014-05-20 22:13:08', 'pruser.36437', '2014-05-23 15:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_store`
--

DROP TABLE IF EXISTS `user_store`;
CREATE TABLE IF NOT EXISTS `user_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_store` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_store`
--

INSERT INTO `user_store` (`id`, `user_id`, `store_id`, `is_active`) VALUES
(3, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_no_formate`
--

DROP TABLE IF EXISTS `voucher_no_formate`;
CREATE TABLE IF NOT EXISTS `voucher_no_formate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `type_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `voucher_no_formate`
--

INSERT INTO `voucher_no_formate` (`id`, `type`, `type_format`) VALUES
(1, 27, 'PO'),
(2, 28, 'SO'),
(3, 29, 'INV'),
(4, 31, 'CHALLAN'),
(5, 32, 'RV');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
CREATE TABLE IF NOT EXISTS `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year_name`) VALUES
(1, 2013),
(2, 2014),
(3, 2015),
(4, 2016),
(5, 2017),
(6, 2018),
(7, 2019),
(8, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `your_company`
--

DROP TABLE IF EXISTS `your_company`;
CREATE TABLE IF NOT EXISTS `your_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `road` varchar(20) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `your_company`
--

INSERT INTO `your_company` (`id`, `company_name`, `location`, `road`, `house`, `contact`, `email`, `web`, `is_active`) VALUES
(1, 'Company Name', 'Company Location', 'Road', 'House', '0000000000000', 'email@email.com', 'http://www.web.com', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credit_limit`
--
ALTER TABLE `credit_limit`
  ADD CONSTRAINT `FK_credit_limit` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_contact_persons`
--
ALTER TABLE `customer_contact_persons`
  ADD CONSTRAINT `FK_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `money_receipt`
--
ALTER TABLE `money_receipt`
  ADD CONSTRAINT `FK_money_receipt` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_receipt`
--
ALTER TABLE `payment_receipt`
  ADD CONSTRAINT `FK_payment_receipt` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prod_brands`
--
ALTER TABLE `prod_brands`
  ADD CONSTRAINT `FK_prod_brands` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prod_models`
--
ALTER TABLE `prod_models`
  ADD CONSTRAINT `FK_prod_models` FOREIGN KEY (`brand_id`) REFERENCES `prod_brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_prod_models_2` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quick_sell_return`
--
ALTER TABLE `quick_sell_return`
  ADD CONSTRAINT `FK_quick_sell_return` FOREIGN KEY (`quick_sell_id`) REFERENCES `quick_sell` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `received_purchase`
--
ALTER TABLE `received_purchase`
  ADD CONSTRAINT `FK_received_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sell_delivery`
--
ALTER TABLE `sell_delivery`
  ADD CONSTRAINT `FK_sell_delivery` FOREIGN KEY (`sell_items_id`) REFERENCES `sell_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sell_price`
--
ALTER TABLE `sell_price`
  ADD CONSTRAINT `FK_sell_price` FOREIGN KEY (`model_id`) REFERENCES `prod_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier_contact_persons`
--
ALTER TABLE `supplier_contact_persons`
  ADD CONSTRAINT `FK_supplier_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_store`
--
ALTER TABLE `user_store`
  ADD CONSTRAINT `FK_user_store` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
