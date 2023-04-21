-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2022 at 04:46 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_carrer`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-03-16 10:11:48.254263'),
(2, 'auth', '0001_initial', '2022-03-16 10:12:00.634911'),
(3, 'admin', '0001_initial', '2022-03-16 10:12:02.776230'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-16 10:12:02.940563'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-16 10:12:03.052105'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-16 10:12:05.301293'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-03-16 10:12:07.462738'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-03-16 10:12:07.587672'),
(9, 'auth', '0004_alter_user_username_opts', '2022-03-16 10:12:07.636416'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-03-16 10:12:08.429153'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-03-16 10:12:08.584259'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-03-16 10:12:08.829100'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-03-16 10:12:09.442687'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-03-16 10:12:09.599662'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-03-16 10:12:09.721846'),
(16, 'auth', '0011_update_proxy_permissions', '2022-03-16 10:12:09.771742'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-03-16 10:12:09.951014'),
(18, 'sessions', '0001_initial', '2022-03-16 10:12:10.566757');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7mxf0rynpm7nig2627upwrdxxfdtfkzr', 'eyJ1c2VyIjoiYmF2ZGhhbmthcnByYW5hdjFAZ21haWwuY29tIn0:1nVR5R:IMyhlhHaEAmAGBT3CwrvFjiIjXcUaW1OD77zpsPYcEE', '2022-04-02 04:53:09.314456'),
('afi1a2jk01jsdxj5uyguoqioxd20ivie', 'eyJ1c2VyIjoicHJhbmFsaWJhdmRoYW5rYXIxMkBnbWFpbC5jb20ifQ:1oNDMa:J6nKYGBRGZiRM89dAXEbsZLctXo5Du4eqlchoXMrsxk', '2022-08-28 13:09:08.644213'),
('emf5b0bab0euirxoflyu8v0hgkt2i0u4', 'eyJ1c2VyIjoiZGRhd2FzZWthckB3aXRzb2xhcHVyLm9yZyJ9:1nVBB2:Gaa6mX_CM92LqKC_JBIC5z9GnHo1dDM1P2BqjPXf8Do', '2022-04-01 11:53:52.598380'),
('n5ne4kebuwl0w4q18t4mf80o6w91apkl', 'eyJ1c2VyIjoiYmF2ZGhhbmthcnByYW5hdjJAZ21haWwuY29tIn0:1oMoMo:2cg1ITtznGeOG9c6worh1XXZj-S5tkvGJJbmUQMq_mc', '2022-08-27 10:27:42.482865'),
('o2dsne3zip597afv50tgig0bqvhe68by', 'eyJ1c2VyIjoicHJhbmFsaWJhdmRoYW5rYXIxMkBnbWFpbC5jb20ifQ:1o6PqE:j36bpnP3ztmGehbm5X2njYcMnpI-CDWO0lDrCVTTt8E', '2022-07-13 05:02:18.855251'),
('p1qutkyyusdq06hpvu1xyyr7fzhvi0ss', 'eyJ1c2VyIjoicHJhbmFsaWJhdmRoYW5rYXIxMkBnbWFpbC5jb20ifQ:1nY83e:b-bzVfVFEPKFMtALfAIHiOaisHHZurrGbBsp3pH3RFk', '2022-04-09 15:10:26.112321'),
('r66m9a21bo4dszrc3ayuytfmllz0gyoz', 'eyJ1c2VyIjoicHJhbmFsaWJhdmRoYW5rYXIxMkBnbWFpbC5jb20ifQ:1o5nZL:8ul8ggRClCHKN8gBJE3y2v2S7GeHGA9rdLar7Am6DKM', '2022-07-11 12:10:19.881511'),
('sjtowga0lvzd1yt8mlx211053sml2ejk', 'eyJ1c2VyIjoiYmF2ZGhhbmthcnByYW5hdjFAZ21haWwuY29tIn0:1nVDYu:5v0kUQo9cVEa1BOuOMEtUQ1ReMFmVtmCt_e3-qbgvAw', '2022-04-01 14:26:40.857548'),
('udhyq4ikcofuiqrithnxnms92iqtvm68', 'eyJ1c2VyIjoic2FydGhha3BldGhrYXJAZ21haWwuY29tIn0:1nqc54:A7e8rmFrurscAlxecrseCAuIZ9WMfpMPB_gQtaE-2J4', '2022-05-30 14:52:18.737523');

-- --------------------------------------------------------

--
-- Table structure for table `quest`
--

CREATE TABLE `quest` (
  `qid` int(11) NOT NULL,
  `email` varchar(225) NOT NULL,
  `qcat` char(2) NOT NULL,
  `response` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quest`
--

INSERT INTO `quest` (`qid`, `email`, `qcat`, `response`) VALUES
(289, 'ddawasekar@witsolapur.org', 'c1', '5'),
(290, 'ddawasekar@witsolapur.org', 'c1', '2'),
(291, 'ddawasekar@witsolapur.org', 'c1', '3'),
(292, 'ddawasekar@witsolapur.org', 'c1', '3'),
(293, 'ddawasekar@witsolapur.org', 'c1', '2'),
(294, 'ddawasekar@witsolapur.org', 'c1', '4'),
(295, 'ddawasekar@witsolapur.org', 'c1', '4'),
(296, 'ddawasekar@witsolapur.org', 'c1', '5'),
(297, 'ddawasekar@witsolapur.org', 'c2', '3'),
(298, 'ddawasekar@witsolapur.org', 'c2', '4'),
(299, 'ddawasekar@witsolapur.org', 'c2', '5'),
(300, 'ddawasekar@witsolapur.org', 'c2', '2'),
(301, 'ddawasekar@witsolapur.org', 'c2', '1'),
(302, 'ddawasekar@witsolapur.org', 'c2', '1'),
(303, 'ddawasekar@witsolapur.org', 'c2', '1'),
(304, 'ddawasekar@witsolapur.org', 'c2', '5'),
(305, 'ddawasekar@witsolapur.org', 'c3', '5'),
(306, 'ddawasekar@witsolapur.org', 'c3', '2'),
(307, 'ddawasekar@witsolapur.org', 'c3', '3'),
(308, 'ddawasekar@witsolapur.org', 'c3', '1'),
(309, 'ddawasekar@witsolapur.org', 'c3', '2'),
(310, 'ddawasekar@witsolapur.org', 'c3', '5'),
(311, 'ddawasekar@witsolapur.org', 'c3', '2'),
(312, 'ddawasekar@witsolapur.org', 'c3', '5'),
(313, 'ddawasekar@witsolapur.org', 'c4', '3'),
(314, 'ddawasekar@witsolapur.org', 'c4', '2'),
(315, 'ddawasekar@witsolapur.org', 'c4', '4'),
(316, 'ddawasekar@witsolapur.org', 'c4', '5'),
(317, 'ddawasekar@witsolapur.org', 'c4', '1'),
(318, 'ddawasekar@witsolapur.org', 'c4', '1'),
(319, 'ddawasekar@witsolapur.org', 'c4', '2'),
(320, 'ddawasekar@witsolapur.org', 'c4', '4'),
(321, 'ddawasekar@witsolapur.org', 'c5', '2'),
(322, 'ddawasekar@witsolapur.org', 'c5', '5'),
(323, 'ddawasekar@witsolapur.org', 'c5', '1'),
(324, 'ddawasekar@witsolapur.org', 'c5', '3'),
(325, 'ddawasekar@witsolapur.org', 'c5', '5'),
(326, 'ddawasekar@witsolapur.org', 'c5', '1'),
(327, 'ddawasekar@witsolapur.org', 'c5', '5'),
(328, 'ddawasekar@witsolapur.org', 'c5', '2'),
(329, 'ddawasekar@witsolapur.org', 'c6', '2'),
(330, 'ddawasekar@witsolapur.org', 'c6', '4'),
(331, 'ddawasekar@witsolapur.org', 'c6', '5'),
(332, 'ddawasekar@witsolapur.org', 'c6', '2'),
(333, 'ddawasekar@witsolapur.org', 'c6', '1'),
(334, 'ddawasekar@witsolapur.org', 'c6', '3'),
(335, 'ddawasekar@witsolapur.org', 'c6', '3'),
(336, 'ddawasekar@witsolapur.org', 'c6', '5'),
(337, 'ddawasekar@witsolapur.org', 'c7', '5'),
(338, 'ddawasekar@witsolapur.org', 'c7', '2'),
(339, 'ddawasekar@witsolapur.org', 'c7', '5'),
(340, 'ddawasekar@witsolapur.org', 'c7', '2'),
(341, 'ddawasekar@witsolapur.org', 'c7', '2'),
(342, 'ddawasekar@witsolapur.org', 'c7', '1'),
(343, 'ddawasekar@witsolapur.org', 'c7', '4'),
(344, 'ddawasekar@witsolapur.org', 'c7', '1'),
(345, 'ddawasekar@witsolapur.org', 'c8', '4'),
(346, 'ddawasekar@witsolapur.org', 'c8', '4'),
(347, 'ddawasekar@witsolapur.org', 'c8', '4'),
(348, 'ddawasekar@witsolapur.org', 'c8', '3'),
(349, 'ddawasekar@witsolapur.org', 'c8', '3'),
(350, 'ddawasekar@witsolapur.org', 'c8', '4'),
(351, 'ddawasekar@witsolapur.org', 'c8', '2'),
(352, 'ddawasekar@witsolapur.org', 'c8', '3'),
(529, 'test@gmail.com', 'c1', '2'),
(530, 'test@gmail.com', 'c1', '4'),
(531, 'test@gmail.com', 'c1', '3'),
(532, 'test@gmail.com', 'c1', '4'),
(533, 'test@gmail.com', 'c1', '5'),
(534, 'test@gmail.com', 'c1', '5'),
(535, 'test@gmail.com', 'c1', '1'),
(536, 'test@gmail.com', 'c1', '3'),
(537, 'test@gmail.com', 'c2', '3'),
(538, 'test@gmail.com', 'c2', '4'),
(539, 'test@gmail.com', 'c2', '3'),
(540, 'test@gmail.com', 'c2', '2'),
(541, 'test@gmail.com', 'c2', '5'),
(542, 'test@gmail.com', 'c2', '5'),
(543, 'test@gmail.com', 'c2', '5'),
(544, 'test@gmail.com', 'c2', '1'),
(545, 'test@gmail.com', 'c3', '2'),
(546, 'test@gmail.com', 'c3', '1'),
(547, 'test@gmail.com', 'c3', '1'),
(548, 'test@gmail.com', 'c3', '1'),
(549, 'test@gmail.com', 'c3', '1'),
(550, 'test@gmail.com', 'c3', '5'),
(551, 'test@gmail.com', 'c3', '2'),
(552, 'test@gmail.com', 'c3', '5'),
(553, 'test@gmail.com', 'c4', '3'),
(554, 'test@gmail.com', 'c4', '5'),
(555, 'test@gmail.com', 'c4', '5'),
(556, 'test@gmail.com', 'c4', '4'),
(557, 'test@gmail.com', 'c4', '3'),
(558, 'test@gmail.com', 'c4', '1'),
(559, 'test@gmail.com', 'c4', '5'),
(560, 'test@gmail.com', 'c4', '2'),
(561, 'test@gmail.com', 'c5', '5'),
(562, 'test@gmail.com', 'c5', '2'),
(563, 'test@gmail.com', 'c5', '2'),
(564, 'test@gmail.com', 'c5', '1'),
(565, 'test@gmail.com', 'c5', '5'),
(566, 'test@gmail.com', 'c5', '4'),
(567, 'test@gmail.com', 'c5', '4'),
(568, 'test@gmail.com', 'c5', '2'),
(569, 'test@gmail.com', 'c6', '5'),
(570, 'test@gmail.com', 'c6', '2'),
(571, 'test@gmail.com', 'c6', '5'),
(572, 'test@gmail.com', 'c6', '1'),
(573, 'test@gmail.com', 'c6', '3'),
(574, 'test@gmail.com', 'c6', '3'),
(575, 'test@gmail.com', 'c6', '2'),
(576, 'test@gmail.com', 'c6', '4'),
(577, 'test@gmail.com', 'c7', '3'),
(578, 'test@gmail.com', 'c7', '3'),
(579, 'test@gmail.com', 'c7', '4'),
(580, 'test@gmail.com', 'c7', '5'),
(581, 'test@gmail.com', 'c7', '5'),
(582, 'test@gmail.com', 'c7', '3'),
(583, 'test@gmail.com', 'c7', '5'),
(584, 'test@gmail.com', 'c7', '2'),
(585, 'test@gmail.com', 'c8', '3'),
(586, 'test@gmail.com', 'c8', '1'),
(587, 'test@gmail.com', 'c8', '1'),
(588, 'test@gmail.com', 'c8', '1'),
(589, 'test@gmail.com', 'c8', '3'),
(590, 'test@gmail.com', 'c8', '5'),
(591, 'test@gmail.com', 'c8', '1'),
(592, 'test@gmail.com', 'c8', '3'),
(593, 'pranalibavdhankar12@gmail.com', 'c1', '4'),
(594, 'pranalibavdhankar12@gmail.com', 'c1', '3'),
(595, 'pranalibavdhankar12@gmail.com', 'c1', '1'),
(596, 'pranalibavdhankar12@gmail.com', 'c1', '3'),
(597, 'pranalibavdhankar12@gmail.com', 'c1', '1'),
(598, 'pranalibavdhankar12@gmail.com', 'c1', '5'),
(599, 'pranalibavdhankar12@gmail.com', 'c1', '1'),
(600, 'pranalibavdhankar12@gmail.com', 'c1', '2'),
(601, 'pranalibavdhankar12@gmail.com', 'c2', '2'),
(602, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(603, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(604, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(605, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(606, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(607, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(608, 'pranalibavdhankar12@gmail.com', 'c2', '5'),
(609, 'pranalibavdhankar12@gmail.com', 'c3', '5'),
(610, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(611, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(612, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(613, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(614, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(615, 'pranalibavdhankar12@gmail.com', 'c3', '1'),
(616, 'pranalibavdhankar12@gmail.com', 'c3', '2'),
(617, 'pranalibavdhankar12@gmail.com', 'c4', '1'),
(618, 'pranalibavdhankar12@gmail.com', 'c4', '3'),
(619, 'pranalibavdhankar12@gmail.com', 'c4', '2'),
(620, 'pranalibavdhankar12@gmail.com', 'c4', '3'),
(621, 'pranalibavdhankar12@gmail.com', 'c4', '3'),
(622, 'pranalibavdhankar12@gmail.com', 'c4', '1'),
(623, 'pranalibavdhankar12@gmail.com', 'c4', '1'),
(624, 'pranalibavdhankar12@gmail.com', 'c4', '1'),
(625, 'pranalibavdhankar12@gmail.com', 'c5', '1'),
(626, 'pranalibavdhankar12@gmail.com', 'c5', '5'),
(627, 'pranalibavdhankar12@gmail.com', 'c5', '5'),
(628, 'pranalibavdhankar12@gmail.com', 'c5', '1'),
(629, 'pranalibavdhankar12@gmail.com', 'c5', '2'),
(630, 'pranalibavdhankar12@gmail.com', 'c5', '2'),
(631, 'pranalibavdhankar12@gmail.com', 'c5', '5'),
(632, 'pranalibavdhankar12@gmail.com', 'c5', '4'),
(633, 'pranalibavdhankar12@gmail.com', 'c6', '5'),
(634, 'pranalibavdhankar12@gmail.com', 'c6', '2'),
(635, 'pranalibavdhankar12@gmail.com', 'c6', '1'),
(636, 'pranalibavdhankar12@gmail.com', 'c6', '1'),
(637, 'pranalibavdhankar12@gmail.com', 'c6', '1'),
(638, 'pranalibavdhankar12@gmail.com', 'c6', '2'),
(639, 'pranalibavdhankar12@gmail.com', 'c6', '1'),
(640, 'pranalibavdhankar12@gmail.com', 'c6', '2'),
(641, 'pranalibavdhankar12@gmail.com', 'c7', '2'),
(642, 'pranalibavdhankar12@gmail.com', 'c7', '5'),
(643, 'pranalibavdhankar12@gmail.com', 'c7', '1'),
(644, 'pranalibavdhankar12@gmail.com', 'c7', '2'),
(645, 'pranalibavdhankar12@gmail.com', 'c7', '3'),
(646, 'pranalibavdhankar12@gmail.com', 'c7', '3'),
(647, 'pranalibavdhankar12@gmail.com', 'c7', '2'),
(648, 'pranalibavdhankar12@gmail.com', 'c7', '1'),
(649, 'pranalibavdhankar12@gmail.com', 'c8', '5'),
(650, 'pranalibavdhankar12@gmail.com', 'c8', '5'),
(651, 'pranalibavdhankar12@gmail.com', 'c8', '1'),
(652, 'pranalibavdhankar12@gmail.com', 'c8', '2'),
(653, 'pranalibavdhankar12@gmail.com', 'c8', '5'),
(654, 'pranalibavdhankar12@gmail.com', 'c8', '3'),
(655, 'pranalibavdhankar12@gmail.com', 'c8', '3'),
(656, 'pranalibavdhankar12@gmail.com', 'c8', '3'),
(657, 'vp@gmail.com', 'c1', '5'),
(658, 'vp@gmail.com', 'c1', '5'),
(659, 'vp@gmail.com', 'c1', '4'),
(660, 'vp@gmail.com', 'c1', '4'),
(661, 'vp@gmail.com', 'c1', '1'),
(662, 'vp@gmail.com', 'c1', '5'),
(663, 'vp@gmail.com', 'c1', '1'),
(664, 'vp@gmail.com', 'c1', '5'),
(665, 'vp@gmail.com', 'c2', '4'),
(666, 'vp@gmail.com', 'c2', '4'),
(667, 'vp@gmail.com', 'c2', '3'),
(668, 'vp@gmail.com', 'c2', '4'),
(669, 'vp@gmail.com', 'c2', '5'),
(670, 'vp@gmail.com', 'c2', '3'),
(671, 'vp@gmail.com', 'c2', '5'),
(672, 'vp@gmail.com', 'c2', '3'),
(673, 'vp@gmail.com', 'c3', '4'),
(674, 'vp@gmail.com', 'c3', '4'),
(675, 'vp@gmail.com', 'c3', '5'),
(676, 'vp@gmail.com', 'c3', '4'),
(677, 'vp@gmail.com', 'c3', '1'),
(678, 'vp@gmail.com', 'c3', '5'),
(679, 'vp@gmail.com', 'c3', '4'),
(680, 'vp@gmail.com', 'c3', '5'),
(681, 'vp@gmail.com', 'c4', '1'),
(682, 'vp@gmail.com', 'c4', '2'),
(683, 'vp@gmail.com', 'c4', '5'),
(684, 'vp@gmail.com', 'c4', '4'),
(685, 'vp@gmail.com', 'c4', '3'),
(686, 'vp@gmail.com', 'c4', '4'),
(687, 'vp@gmail.com', 'c4', '1'),
(688, 'vp@gmail.com', 'c4', '4'),
(689, 'vp@gmail.com', 'c5', '5'),
(690, 'vp@gmail.com', 'c5', '1'),
(691, 'vp@gmail.com', 'c5', '3'),
(692, 'vp@gmail.com', 'c5', '3'),
(693, 'vp@gmail.com', 'c5', '1'),
(694, 'vp@gmail.com', 'c5', '5'),
(695, 'vp@gmail.com', 'c5', '1'),
(696, 'vp@gmail.com', 'c5', '1'),
(697, 'vp@gmail.com', 'c6', '5'),
(698, 'vp@gmail.com', 'c6', '5'),
(699, 'vp@gmail.com', 'c6', '5'),
(700, 'vp@gmail.com', 'c6', '5'),
(701, 'vp@gmail.com', 'c6', '5'),
(702, 'vp@gmail.com', 'c6', '5'),
(703, 'vp@gmail.com', 'c6', '4'),
(704, 'vp@gmail.com', 'c6', '5'),
(705, 'vp@gmail.com', 'c7', '4'),
(706, 'vp@gmail.com', 'c7', '5'),
(707, 'vp@gmail.com', 'c7', '4'),
(708, 'vp@gmail.com', 'c7', '3'),
(709, 'vp@gmail.com', 'c7', '5'),
(710, 'vp@gmail.com', 'c7', '5'),
(711, 'vp@gmail.com', 'c7', '5'),
(712, 'vp@gmail.com', 'c7', '5'),
(713, 'vp@gmail.com', 'c8', '4'),
(714, 'vp@gmail.com', 'c8', '5'),
(715, 'vp@gmail.com', 'c8', '5'),
(716, 'vp@gmail.com', 'c8', '4'),
(717, 'vp@gmail.com', 'c8', '5'),
(718, 'vp@gmail.com', 'c8', '4'),
(719, 'vp@gmail.com', 'c8', '5'),
(720, 'vp@gmail.com', 'c8', '5'),
(721, 'pb@gmail.com', 'c1', '3'),
(722, 'pb@gmail.com', 'c1', '2'),
(723, 'pb@gmail.com', 'c1', '4'),
(724, 'pb@gmail.com', 'c1', '4'),
(725, 'pb@gmail.com', 'c1', '1'),
(726, 'pb@gmail.com', 'c1', '2'),
(727, 'pb@gmail.com', 'c1', '1'),
(728, 'pb@gmail.com', 'c1', '4'),
(729, 'pb@gmail.com', 'c2', '3'),
(730, 'pb@gmail.com', 'c2', '5'),
(731, 'pb@gmail.com', 'c2', '3'),
(732, 'pb@gmail.com', 'c2', '5'),
(733, 'pb@gmail.com', 'c2', '4'),
(734, 'pb@gmail.com', 'c2', '2'),
(735, 'pb@gmail.com', 'c2', '2'),
(736, 'pb@gmail.com', 'c2', '4'),
(737, 'pb@gmail.com', 'c3', '4'),
(738, 'pb@gmail.com', 'c3', '4'),
(739, 'pb@gmail.com', 'c3', '5'),
(740, 'pb@gmail.com', 'c3', '3'),
(741, 'pb@gmail.com', 'c3', '4'),
(742, 'pb@gmail.com', 'c3', '3'),
(743, 'pb@gmail.com', 'c3', '4'),
(744, 'pb@gmail.com', 'c3', '5'),
(745, 'pb@gmail.com', 'c4', '2'),
(746, 'pb@gmail.com', 'c4', '4'),
(747, 'pb@gmail.com', 'c4', '3'),
(748, 'pb@gmail.com', 'c4', '1'),
(749, 'pb@gmail.com', 'c4', '1'),
(750, 'pb@gmail.com', 'c4', '3'),
(751, 'pb@gmail.com', 'c4', '1'),
(752, 'pb@gmail.com', 'c4', '5'),
(753, 'pb@gmail.com', 'c5', '4'),
(754, 'pb@gmail.com', 'c5', '2'),
(755, 'pb@gmail.com', 'c5', '2'),
(756, 'pb@gmail.com', 'c5', '4'),
(757, 'pb@gmail.com', 'c5', '2'),
(758, 'pb@gmail.com', 'c5', '4'),
(759, 'pb@gmail.com', 'c5', '1'),
(760, 'pb@gmail.com', 'c5', '2'),
(761, 'pb@gmail.com', 'c6', '5'),
(762, 'pb@gmail.com', 'c6', '3'),
(763, 'pb@gmail.com', 'c6', '4'),
(764, 'pb@gmail.com', 'c6', '4'),
(765, 'pb@gmail.com', 'c6', '2'),
(766, 'pb@gmail.com', 'c6', '3'),
(767, 'pb@gmail.com', 'c6', '2'),
(768, 'pb@gmail.com', 'c6', '2'),
(769, 'pb@gmail.com', 'c7', '2'),
(770, 'pb@gmail.com', 'c7', '1'),
(771, 'pb@gmail.com', 'c7', '3'),
(772, 'pb@gmail.com', 'c7', '2'),
(773, 'pb@gmail.com', 'c7', '3'),
(774, 'pb@gmail.com', 'c7', '3'),
(775, 'pb@gmail.com', 'c7', '5'),
(776, 'pb@gmail.com', 'c7', '4'),
(777, 'pb@gmail.com', 'c8', '3'),
(778, 'pb@gmail.com', 'c8', '5'),
(779, 'pb@gmail.com', 'c8', '4'),
(780, 'pb@gmail.com', 'c8', '4'),
(781, 'pb@gmail.com', 'c8', '3'),
(782, 'pb@gmail.com', 'c8', '4'),
(783, 'pb@gmail.com', 'c8', '5'),
(784, 'pb@gmail.com', 'c8', '4'),
(785, 'godhamanthan@gmail.com', 'c1', '4'),
(786, 'godhamanthan@gmail.com', 'c1', '3'),
(787, 'godhamanthan@gmail.com', 'c1', '1'),
(788, 'godhamanthan@gmail.com', 'c1', '5'),
(789, 'godhamanthan@gmail.com', 'c1', '5'),
(790, 'godhamanthan@gmail.com', 'c1', '4'),
(791, 'godhamanthan@gmail.com', 'c1', '2'),
(792, 'godhamanthan@gmail.com', 'c1', '5'),
(793, 'godhamanthan@gmail.com', 'c2', '4'),
(794, 'godhamanthan@gmail.com', 'c2', '1'),
(795, 'godhamanthan@gmail.com', 'c2', '5'),
(796, 'godhamanthan@gmail.com', 'c2', '4'),
(797, 'godhamanthan@gmail.com', 'c2', '3'),
(798, 'godhamanthan@gmail.com', 'c2', '5'),
(799, 'godhamanthan@gmail.com', 'c2', '3'),
(800, 'godhamanthan@gmail.com', 'c2', '4'),
(801, 'godhamanthan@gmail.com', 'c3', '5'),
(802, 'godhamanthan@gmail.com', 'c3', '2'),
(803, 'godhamanthan@gmail.com', 'c3', '4'),
(804, 'godhamanthan@gmail.com', 'c3', '4'),
(805, 'godhamanthan@gmail.com', 'c3', '4'),
(806, 'godhamanthan@gmail.com', 'c3', '5'),
(807, 'godhamanthan@gmail.com', 'c3', '2'),
(808, 'godhamanthan@gmail.com', 'c3', '5'),
(809, 'godhamanthan@gmail.com', 'c4', '4'),
(810, 'godhamanthan@gmail.com', 'c4', '5'),
(811, 'godhamanthan@gmail.com', 'c4', '5'),
(812, 'godhamanthan@gmail.com', 'c4', '2'),
(813, 'godhamanthan@gmail.com', 'c4', '3'),
(814, 'godhamanthan@gmail.com', 'c4', '1'),
(815, 'godhamanthan@gmail.com', 'c4', '2'),
(816, 'godhamanthan@gmail.com', 'c4', '3'),
(817, 'godhamanthan@gmail.com', 'c5', '5'),
(818, 'godhamanthan@gmail.com', 'c5', '4'),
(819, 'godhamanthan@gmail.com', 'c5', '2'),
(820, 'godhamanthan@gmail.com', 'c5', '4'),
(821, 'godhamanthan@gmail.com', 'c5', '3'),
(822, 'godhamanthan@gmail.com', 'c5', '3'),
(823, 'godhamanthan@gmail.com', 'c5', '4'),
(824, 'godhamanthan@gmail.com', 'c5', '4'),
(825, 'godhamanthan@gmail.com', 'c6', '3'),
(826, 'godhamanthan@gmail.com', 'c6', '1'),
(827, 'godhamanthan@gmail.com', 'c6', '2'),
(828, 'godhamanthan@gmail.com', 'c6', '3'),
(829, 'godhamanthan@gmail.com', 'c6', '4'),
(830, 'godhamanthan@gmail.com', 'c6', '2'),
(831, 'godhamanthan@gmail.com', 'c6', '1'),
(832, 'godhamanthan@gmail.com', 'c6', '1'),
(833, 'godhamanthan@gmail.com', 'c7', '3'),
(834, 'godhamanthan@gmail.com', 'c7', '4'),
(835, 'godhamanthan@gmail.com', 'c7', '4'),
(836, 'godhamanthan@gmail.com', 'c7', '4'),
(837, 'godhamanthan@gmail.com', 'c7', '4'),
(838, 'godhamanthan@gmail.com', 'c7', '4'),
(839, 'godhamanthan@gmail.com', 'c7', '4'),
(840, 'godhamanthan@gmail.com', 'c7', '5'),
(841, 'godhamanthan@gmail.com', 'c8', '5'),
(842, 'godhamanthan@gmail.com', 'c8', '4'),
(843, 'godhamanthan@gmail.com', 'c8', '4'),
(844, 'godhamanthan@gmail.com', 'c8', '3'),
(845, 'godhamanthan@gmail.com', 'c8', '5'),
(846, 'godhamanthan@gmail.com', 'c8', '5'),
(847, 'godhamanthan@gmail.com', 'c8', '4'),
(848, 'godhamanthan@gmail.com', 'c8', '3'),
(849, 'shivanisk373@gmail.com', 'c1', '3'),
(850, 'shivanisk373@gmail.com', 'c1', '3'),
(851, 'shivanisk373@gmail.com', 'c1', '3'),
(852, 'shivanisk373@gmail.com', 'c1', '4'),
(853, 'shivanisk373@gmail.com', 'c1', '4'),
(854, 'shivanisk373@gmail.com', 'c1', '3'),
(855, 'shivanisk373@gmail.com', 'c1', '5'),
(856, 'shivanisk373@gmail.com', 'c1', '5'),
(857, 'shivanisk373@gmail.com', 'c2', '2'),
(858, 'shivanisk373@gmail.com', 'c2', '2'),
(859, 'shivanisk373@gmail.com', 'c2', '5'),
(860, 'shivanisk373@gmail.com', 'c2', '5'),
(861, 'shivanisk373@gmail.com', 'c2', '5'),
(862, 'shivanisk373@gmail.com', 'c2', '3'),
(863, 'shivanisk373@gmail.com', 'c2', '4'),
(864, 'shivanisk373@gmail.com', 'c2', '2'),
(865, 'shivanisk373@gmail.com', 'c3', '5'),
(866, 'shivanisk373@gmail.com', 'c3', '4'),
(867, 'shivanisk373@gmail.com', 'c3', '3'),
(868, 'shivanisk373@gmail.com', 'c3', '3'),
(869, 'shivanisk373@gmail.com', 'c3', '5'),
(870, 'shivanisk373@gmail.com', 'c3', '4'),
(871, 'shivanisk373@gmail.com', 'c3', '2'),
(872, 'shivanisk373@gmail.com', 'c3', '5'),
(873, 'shivanisk373@gmail.com', 'c4', '4'),
(874, 'shivanisk373@gmail.com', 'c4', '4'),
(875, 'shivanisk373@gmail.com', 'c4', '4'),
(876, 'shivanisk373@gmail.com', 'c4', '2'),
(877, 'shivanisk373@gmail.com', 'c4', '2'),
(878, 'shivanisk373@gmail.com', 'c4', '1'),
(879, 'shivanisk373@gmail.com', 'c4', '3'),
(880, 'shivanisk373@gmail.com', 'c4', '3'),
(881, 'shivanisk373@gmail.com', 'c5', '4'),
(882, 'shivanisk373@gmail.com', 'c5', '2'),
(883, 'shivanisk373@gmail.com', 'c5', '1'),
(884, 'shivanisk373@gmail.com', 'c5', '2'),
(885, 'shivanisk373@gmail.com', 'c5', '1'),
(886, 'shivanisk373@gmail.com', 'c5', '5'),
(887, 'shivanisk373@gmail.com', 'c5', '2'),
(888, 'shivanisk373@gmail.com', 'c5', '4'),
(889, 'shivanisk373@gmail.com', 'c6', '4'),
(890, 'shivanisk373@gmail.com', 'c6', '3'),
(891, 'shivanisk373@gmail.com', 'c6', '5'),
(892, 'shivanisk373@gmail.com', 'c6', '2'),
(893, 'shivanisk373@gmail.com', 'c6', '2'),
(894, 'shivanisk373@gmail.com', 'c6', '5'),
(895, 'shivanisk373@gmail.com', 'c6', '4'),
(896, 'shivanisk373@gmail.com', 'c6', '2'),
(897, 'shivanisk373@gmail.com', 'c7', '3'),
(898, 'shivanisk373@gmail.com', 'c7', '3'),
(899, 'shivanisk373@gmail.com', 'c7', '4'),
(900, 'shivanisk373@gmail.com', 'c7', '1'),
(901, 'shivanisk373@gmail.com', 'c7', '5'),
(902, 'shivanisk373@gmail.com', 'c7', '2'),
(903, 'shivanisk373@gmail.com', 'c7', '2'),
(904, 'shivanisk373@gmail.com', 'c7', '5'),
(905, 'shivanisk373@gmail.com', 'c8', '4'),
(906, 'shivanisk373@gmail.com', 'c8', '5'),
(907, 'shivanisk373@gmail.com', 'c8', '3'),
(908, 'shivanisk373@gmail.com', 'c8', '5'),
(909, 'shivanisk373@gmail.com', 'c8', '2'),
(910, 'shivanisk373@gmail.com', 'c8', '3'),
(911, 'shivanisk373@gmail.com', 'c8', '5'),
(912, 'shivanisk373@gmail.com', 'c8', '4'),
(913, 'sarthakpethkar@gmail.com', 'c1', '2'),
(914, 'sarthakpethkar@gmail.com', 'c1', '4'),
(915, 'sarthakpethkar@gmail.com', 'c1', '4'),
(916, 'sarthakpethkar@gmail.com', 'c1', '2'),
(917, 'sarthakpethkar@gmail.com', 'c1', '1'),
(918, 'sarthakpethkar@gmail.com', 'c1', '5'),
(919, 'sarthakpethkar@gmail.com', 'c1', '3'),
(920, 'sarthakpethkar@gmail.com', 'c1', '3'),
(921, 'sarthakpethkar@gmail.com', 'c2', '4'),
(922, 'sarthakpethkar@gmail.com', 'c2', '2'),
(923, 'sarthakpethkar@gmail.com', 'c2', '1'),
(924, 'sarthakpethkar@gmail.com', 'c2', '5'),
(925, 'sarthakpethkar@gmail.com', 'c2', '1'),
(926, 'sarthakpethkar@gmail.com', 'c2', '4'),
(927, 'sarthakpethkar@gmail.com', 'c2', '1'),
(928, 'sarthakpethkar@gmail.com', 'c2', '5'),
(929, 'sarthakpethkar@gmail.com', 'c3', '5'),
(930, 'sarthakpethkar@gmail.com', 'c3', '5'),
(931, 'sarthakpethkar@gmail.com', 'c3', '2'),
(932, 'sarthakpethkar@gmail.com', 'c3', '4'),
(933, 'sarthakpethkar@gmail.com', 'c3', '3'),
(934, 'sarthakpethkar@gmail.com', 'c3', '1'),
(935, 'sarthakpethkar@gmail.com', 'c3', '4'),
(936, 'sarthakpethkar@gmail.com', 'c3', '5'),
(937, 'sarthakpethkar@gmail.com', 'c4', '3'),
(938, 'sarthakpethkar@gmail.com', 'c4', '4'),
(939, 'sarthakpethkar@gmail.com', 'c4', '3'),
(940, 'sarthakpethkar@gmail.com', 'c4', '2'),
(941, 'sarthakpethkar@gmail.com', 'c4', '3'),
(942, 'sarthakpethkar@gmail.com', 'c4', '4'),
(943, 'sarthakpethkar@gmail.com', 'c4', '3'),
(944, 'sarthakpethkar@gmail.com', 'c4', '3'),
(945, 'sarthakpethkar@gmail.com', 'c5', '2'),
(946, 'sarthakpethkar@gmail.com', 'c5', '5'),
(947, 'sarthakpethkar@gmail.com', 'c5', '1'),
(948, 'sarthakpethkar@gmail.com', 'c5', '1'),
(949, 'sarthakpethkar@gmail.com', 'c5', '2'),
(950, 'sarthakpethkar@gmail.com', 'c5', '4'),
(951, 'sarthakpethkar@gmail.com', 'c5', '1'),
(952, 'sarthakpethkar@gmail.com', 'c5', '3'),
(953, 'sarthakpethkar@gmail.com', 'c6', '4'),
(954, 'sarthakpethkar@gmail.com', 'c6', '3'),
(955, 'sarthakpethkar@gmail.com', 'c6', '4'),
(956, 'sarthakpethkar@gmail.com', 'c6', '3'),
(957, 'sarthakpethkar@gmail.com', 'c6', '2'),
(958, 'sarthakpethkar@gmail.com', 'c6', '1'),
(959, 'sarthakpethkar@gmail.com', 'c6', '4'),
(960, 'sarthakpethkar@gmail.com', 'c6', '1'),
(961, 'sarthakpethkar@gmail.com', 'c7', '2'),
(962, 'sarthakpethkar@gmail.com', 'c7', '4'),
(963, 'sarthakpethkar@gmail.com', 'c7', '2'),
(964, 'sarthakpethkar@gmail.com', 'c7', '5'),
(965, 'sarthakpethkar@gmail.com', 'c7', '5'),
(966, 'sarthakpethkar@gmail.com', 'c7', '4'),
(967, 'sarthakpethkar@gmail.com', 'c7', '5'),
(968, 'sarthakpethkar@gmail.com', 'c7', '3'),
(969, 'sarthakpethkar@gmail.com', 'c8', '4'),
(970, 'sarthakpethkar@gmail.com', 'c8', '3'),
(971, 'sarthakpethkar@gmail.com', 'c8', '2'),
(972, 'sarthakpethkar@gmail.com', 'c8', '4'),
(973, 'sarthakpethkar@gmail.com', 'c8', '2'),
(974, 'sarthakpethkar@gmail.com', 'c8', '5'),
(975, 'sarthakpethkar@gmail.com', 'c8', '3'),
(976, 'sarthakpethkar@gmail.com', 'c8', '3'),
(977, 'riyasharma@gmail.com', 'c1', '3'),
(978, 'riyasharma@gmail.com', 'c1', '3'),
(979, 'riyasharma@gmail.com', 'c1', '1'),
(980, 'riyasharma@gmail.com', 'c1', '5'),
(981, 'riyasharma@gmail.com', 'c1', '5'),
(982, 'riyasharma@gmail.com', 'c1', '5'),
(983, 'riyasharma@gmail.com', 'c1', '1'),
(984, 'riyasharma@gmail.com', 'c1', '5'),
(985, 'riyasharma@gmail.com', 'c2', '5'),
(986, 'riyasharma@gmail.com', 'c2', '2'),
(987, 'riyasharma@gmail.com', 'c2', '2'),
(988, 'riyasharma@gmail.com', 'c2', '2'),
(989, 'riyasharma@gmail.com', 'c2', '5'),
(990, 'riyasharma@gmail.com', 'c2', '2'),
(991, 'riyasharma@gmail.com', 'c2', '5'),
(992, 'riyasharma@gmail.com', 'c2', '5'),
(993, 'riyasharma@gmail.com', 'c3', '1'),
(994, 'riyasharma@gmail.com', 'c3', '1'),
(995, 'riyasharma@gmail.com', 'c3', '2'),
(996, 'riyasharma@gmail.com', 'c3', '5'),
(997, 'riyasharma@gmail.com', 'c3', '5'),
(998, 'riyasharma@gmail.com', 'c3', '5'),
(999, 'riyasharma@gmail.com', 'c3', '4'),
(1000, 'riyasharma@gmail.com', 'c3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(225) NOT NULL,
  `pwd` varchar(225) NOT NULL,
  `test` char(1) DEFAULT '0',
  `mobileno` varchar(10) NOT NULL,
  `DOB` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int(50) DEFAULT NULL,
  `currentEducation` varchar(100) DEFAULT NULL,
  `income` int(11) DEFAULT NULL,
  `goals` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `fname`, `lname`, `email`, `pwd`, `test`, `mobileno`, `DOB`, `gender`, `age`, `currentEducation`, `income`, `goals`) VALUES
(6, 'Dipali', 'Awasekar', 'ddawasekar@witsolapur.org', '$2b$12$pd.t502Kj0GAkS3s4R6iEebG3LzYpAs96R/KOYbADbDSycfwspxTu', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Bob', 'Taylor', 'test@gmail.com', '$2b$12$DDCATrRIG4vMsyxk/FFEruSGAZ5NVJEeo4gd70xmESelLVNlioL62', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Pranali', 'Bavdhankar', 'pranalibavdhankar12@gmail.com', '$2b$12$X.8UzZdc28HNWXfe0CwUWuLjXe7ztgtfrYQM.l/apcFUNM.jk3kmK', '1', '9373661157', '2001-10-10', 'female', 50, 'B.E', 93900, 'asdf'),
(10, '`Valdimir', 'Putin', 'vp@gmail.com', '$2b$12$sxZ48f.D5pSpRcIowjawh.ZyriW9ku23YjjYb96ybqfiW7CzthUa2', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'p', 'b', 'pb@gmail.com', '$2b$12$bEvFKbviRl8T34pHDiXIquq3POlN4o.u99U3xE1Q2I7QaZJkQNOyC', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Manthan ', 'Godha', 'godhamanthan@gmail.com', '$2b$12$JckqSzGN6k7BKXwsVtpAKeqYjKsdHqyxWTxpjr7laGy.WxazttJIy', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Shivani', 'Kulkarni', 'shivanisk373@gmail.com', '$2b$12$ahc7VsCul5r4HXVVFi9Mo.F.xfCF5MfYqZA/2UribU9uy/lrIDFeO', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Riya', 'Sharma', 'riya@gmail.com', '$2b$12$Cr9Cw3mdxLbAYFIyOtN.sO/V0hy7AhPEmZo0VaaUStHdWefsxMode', '0', '', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Sarthak', 'Pethkar', 'sarthakpethkar@gmail.com', '$2b$12$.WVGpYi6q/T9HcloNIxSAud8iesCKwftfEq.5xsgKhbexKAbRQMVK', '1', '', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Lavanya', 'Aken', 'lavanyaaken128@gmail.com', '$2b$12$/QwCk4hdZVifM8XJjtoiO.aXdMCcsMB9gi7QXmr1ZcsT0BC4E9d3e', '0', '', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Riya', 'Sharma', 'riyasharma@gmail.com', '$2b$12$goNeuQ361Qn2UwOhrikkJuByH4kl5KTjcfuVNPvAYOEaUGldrBcXi', '0', '', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Pranav', 'Bavdhankar', 'bavhdankarpranav1@gmail.com', '$2b$12$aZbH1FoB13ee9BHz8SHSZuD6q5v3MTnyqAU0intilqjplP3dnSMei', '0', '', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'abc', 'xyz', 'abc@gmail.com', '$2b$12$XUxblNdhCArj27PCKSf0u.nnsaB3J97.2MmHmmoci6ozZchbVRoCK', '0', '', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'qwert', 'tyuiop', 'abcd@gmail.com', '$2b$12$B7.GEWvKoNNoyfa69UArje2bij.FDrT4s3fOw93RnqjYFWQQ1w3kK', '0', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'qwert', 'tyuio', 'zxc@gmail.com', '$2b$12$9VFsDb.fPmZ33l4f6ax/TuKYXvsfgmUt43aP6Ivsxr51EoD.meBy2', '0', '2132435465', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Pranav', 'Pranav B', 'bavhdnakar@gmail.com', '$2b$12$jId/LfoNkVUTeAAc17KAkOoc7nvbwFnjHArNatXYq1bwvIDIDyMEu', '0', '745', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'asdf', 'qwer', 'asdf@gmail.com', '$2b$12$9r6sr1NSdidVqT.gaNWUxuG5vDT1oYKY9BfcC/WA03rqn0itswy8u', '0', '125', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Pranas', 'abas', 'asdf123@gmail.com', '$2b$12$3mKuF/D.jqfNh2TsmTuhvunrvWZuLHwOaQuqGbAFWlk99AAh6HGgy', '0', '12', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'anc', 'addg', 'sdf@gmail.com', '$2b$12$9t2orifR6MNJwE22./bO1OFVsNXAtZj4At1tfrhD3ljY8NiZGKgqe', '0', '56783456', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'Pranav ', 'B', 'bavdhankarpranav2@gmail.com', '$2b$12$3vqgWzvflDOBxU4ipYfVrOFtptqcsU6Ol3S7u20c/J0/qRQm0Ux7e', '0', '9309095133', '2022-08-13', 'male', 17, 'Diploma', 96524, 'asdf'),
(32, 'pranav', 'B', 'adf@gmail.com', '$2b$12$56XdxpjsaV7BTQq2kg39HehlBRyIAMAmu3m2bTDTs05eU1Xy/Citm', '0', '1234', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'àsdf', '1234', 'asdfg@gmail.com', '$2b$12$9zpEmviwPOFEeNHHWr79au0RQe.E.JzOMaWAc9dRhNjFBHxdoC7si', '0', '154', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'àsdf', '1234', 'aasdfsdfg@gmail.com', '$2b$12$Y7BxX.FqRz38L4h9OrPB/uLosfj4LQ6QFqfW7k/RGL4/6vV8Ujgzu', '0', '154', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'àsdf', '1234', 'aaasdfsdfsdfg@gmail.com', '$2b$12$VcjrILekvWFtxRR6Qrqbb.t4oQ584jHtgz4LJvI/35.N2Cy77tDwW', '0', '154', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Pranav', 'Bavdhankar', 'pranav@gmail.com', '$2b$12$cXPol5jazJfNsi1eYQ3znefWJKBiTFbOPb4NPHzHCGjQAxUK5/1ci', '0', '1234', '2022-08-12', 'male', 14, 'None', 78851, 'None');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `quest`
--
ALTER TABLE `quest`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `quest`
--
ALTER TABLE `quest`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
