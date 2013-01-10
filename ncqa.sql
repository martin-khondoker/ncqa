-- phpMyAdmin SQL Dump
-- version 3.5.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 04, 2012 at 09:27 PM
-- Server version: 5.5.28-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ncqa`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add scenario', 8, 'add_scenario'),
(23, 'Can change scenario', 8, 'change_scenario'),
(24, 'Can delete scenario', 8, 'delete_scenario'),
(25, 'Can add feature', 9, 'add_feature'),
(26, 'Can change feature', 9, 'change_feature'),
(27, 'Can delete feature', 9, 'delete_feature'),
(28, 'Can add module', 10, 'add_module'),
(29, 'Can change module', 10, 'change_module'),
(30, 'Can delete module', 10, 'delete_module'),
(31, 'Can add bug', 11, 'add_bug'),
(32, 'Can change bug', 11, 'change_bug'),
(33, 'Can delete bug', 11, 'delete_bug'),
(34, 'Can add team', 12, 'add_team'),
(35, 'Can change team', 12, 'change_team'),
(36, 'Can delete team', 12, 'delete_team'),
(37, 'Can add member', 13, 'add_member'),
(38, 'Can change member', 13, 'change_member'),
(39, 'Can delete member', 13, 'delete_member'),
(40, 'Can add sprint', 14, 'add_sprint'),
(41, 'Can change sprint', 14, 'change_sprint'),
(42, 'Can delete sprint', 14, 'delete_sprint'),
(43, 'Can add sprint job', 15, 'add_sprintjob'),
(44, 'Can change sprint job', 15, 'change_sprintjob'),
(45, 'Can delete sprint job', 15, 'delete_sprintjob'),
(46, 'Can add issue', 16, 'add_issue'),
(47, 'Can change issue', 16, 'change_issue'),
(48, 'Can delete issue', 16, 'delete_issue'),
(49, 'Can add comment', 17, 'add_comment'),
(50, 'Can change comment', 17, 'change_comment'),
(51, 'Can delete comment', 17, 'delete_comment');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'mamun', '', '', 'mamun@ncqa.com', 'pbkdf2_sha256$10000$Jpl4tPc7H4Bt$sYvaLKNH7yhbV/WOX03LPqNveA2IPI73mrOZW7rAQfM=', 1, 1, 1, '2012-11-29 16:18:55', '2012-11-28 20:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_bug`
--

CREATE TABLE IF NOT EXISTS `bugs_bug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `bug_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `screeshot` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `module_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_bug_f53ed95e` (`module_id`),
  KEY `bugs_bug_7be9b9ad` (`feature_id`),
  KEY `bugs_bug_3bb529ba` (`scenario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `bugs_bug`
--

INSERT INTO `bugs_bug` (`id`, `title`, `description`, `bug_type`, `screeshot`, `date`, `module_id`, `feature_id`, `scenario_id`) VALUES
(1, 'login menu does not work', 'login menu does not work', 'dev', '', '2012-11-29', 1, 1, 1),
(2, 'design issue for login form popup', 'elements in login form popup are not aligned', 'design', '', '2012-11-29', 1, 1, 3),
(3, 'login button in the login popup form not working', 'login button in the login popup form not working', 'dev', '', '2012-11-29', 1, 1, 5),
(4, 'Featured section is still available in the add module section.', 'Featured section is still available in the add module section.', 'dev', '', '2012-11-14', 3, 6, 16),
(5, 'block does not appear in popup', 'Third column block doesn''t appear in the move module popup.', 'design', '', '2012-11-14', 3, 9, 22),
(6, 'Can''t move article in Editor''s Picks.', 'Can''t move article in Editor''s Picks.', 'dev', '', '2012-11-14', 4, 12, 26),
(7, 'Page Title doesn''t work.', 'Page Title doesn''t work.', 'dev', '', '2012-11-14', 2, 5, 15),
(8, 'Can''t delete any module', 'Can''t delete any module from article page or topic page', 'dev', '', '2012-11-14', 3, 8, 20),
(9, 'Can''t open Editor''s Picks edit form', 'Can''t open Editor''s Picks edit module form/pop-up', 'dev', '', '2012-11-14', 4, 12, 26),
(10, 'enter button does not work for contact us', 'After giving the email in contact us field, hitting Enter doesn''t work. have to click the Contact Us button', 'dev', '', '2012-11-14', 5, 13, 29),
(11, 'line spacing', 'Line spacing for each article / paragraph are not same. See: Q.How can I find other content related to an article?', 'design', '', '2012-11-14', 5, 14, 30),
(12, 'Report is not generating while organizations are same', 'Provider Reports - Report is not generating while organizations are same', 'dev', '', '2012-11-14', 6, 15, 31),
(13, 'tset', 'tsetse', 'dev', '', '2012-11-14', 7, 16, 32),
(14, 'tset2', 'tsets', 'dev', '', '2012-11-14', 7, 15, 31),
(15, 'Video picks popup close button doesn''t work', 'Video picks popup close button doesn''t work and the popup appears on the top of the page.', 'dev', '', '2012-11-14', 8, 6, 17),
(16, 'video does not play in IE8', 'video does not play in IE8', 'dev', '', '2012-11-14', 8, 7, 18),
(17, 'page title is bold', 'tset', 'design', '', '2012-11-14', 2, 5, 15),
(18, 'test add module', 'eawstesw', 'dev', '', '2012-11-14', 9, 6, 17),
(19, 'tiwtter id does not work', 'saerfwse', 'dev', '', '2012-11-14', 9, 6, 17),
(20, 'desigin issue for twitter', 'sflkd', 'design', '', '2012-11-14', 9, 7, 18),
(21, 'test design bug for editor pic', 'twerw', 'design', '', '2012-11-14', 4, 7, 18);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_comment`
--

CREATE TABLE IF NOT EXISTS `bugs_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `issues_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_comment_302af3d2` (`issues_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_feature`
--

CREATE TABLE IF NOT EXISTS `bugs_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `bugs_feature`
--

INSERT INTO `bugs_feature` (`id`, `name`) VALUES
(1, 'login cms'),
(2, 'logout cms'),
(3, 'Add Page'),
(4, 'Delete Page'),
(5, 'Edit Page'),
(6, 'Add modules'),
(7, 'Edit modules'),
(8, 'delete modules'),
(9, 'Move modules'),
(10, 'List modules'),
(11, 'Add Editor picks module'),
(12, 'Edit Editor pics module'),
(13, 'about us'),
(14, 'blog'),
(15, 'pdf report'),
(16, 'article search');

-- --------------------------------------------------------

--
-- Table structure for table `bugs_feature_scenario`
--

CREATE TABLE IF NOT EXISTS `bugs_feature_scenario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_id` int(11) NOT NULL,
  `scenario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feature_id` (`feature_id`,`scenario_id`),
  KEY `bugs_feature_scenario_7be9b9ad` (`feature_id`),
  KEY `bugs_feature_scenario_3bb529ba` (`scenario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `bugs_feature_scenario`
--

INSERT INTO `bugs_feature_scenario` (`id`, `feature_id`, `scenario_id`) VALUES
(10, 1, 1),
(11, 1, 2),
(12, 1, 3),
(13, 1, 4),
(14, 1, 5),
(15, 1, 6),
(16, 1, 7),
(9, 2, 9),
(17, 3, 10),
(18, 3, 11),
(19, 3, 12),
(20, 4, 13),
(21, 4, 14),
(22, 5, 15),
(23, 6, 16),
(24, 6, 17),
(25, 7, 18),
(26, 8, 19),
(27, 8, 20),
(28, 9, 21),
(29, 9, 22),
(31, 10, 23),
(30, 10, 24),
(32, 11, 25),
(33, 12, 26),
(34, 12, 27),
(35, 12, 28),
(36, 13, 29),
(37, 14, 30),
(38, 15, 31),
(39, 16, 32);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_issue`
--

CREATE TABLE IF NOT EXISTS `bugs_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` int(11) NOT NULL,
  `desc` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `screeshot` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sprint_id` int(11) NOT NULL,
  `sprintjob_id` int(11) NOT NULL,
  `bugyman_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_issue_6bce1e8d` (`bug_id`),
  KEY `bugs_issue_d570799e` (`sprint_id`),
  KEY `bugs_issue_d613d3c` (`sprintjob_id`),
  KEY `bugs_issue_603c253a` (`bugyman_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `bugs_issue`
--

INSERT INTO `bugs_issue` (`id`, `bug_id`, `desc`, `status`, `date`, `screeshot`, `sprint_id`, `sprintjob_id`, `bugyman_id`) VALUES
(1, 1, 'login form does not work', 'notresolved', '2012-11-29', '', 4, 1, 7),
(2, 1, 'szetgsetgse', 'notresolved', '2012-11-14', '', 4, 1, 7),
(3, 5, 'setgstrg', 'notresolved', '2012-11-14', '', 4, 1, 1),
(4, 8, 'gseg', 'notresolved', '2012-11-14', '', 4, 1, 7),
(5, 15, 'close button does not work', 'notresolved', '2012-11-14', '', 4, 2, 8),
(6, 16, 'stset', 'notresolved', '2012-11-14', '', 4, 2, 8),
(7, 7, 'tsetgsetg', 'resolved', '2012-11-14', '', 4, 3, 8),
(8, 17, 'tsdrt', 'resolved', '2012-11-14', '', 4, 3, 8),
(9, 18, 'dawdqwa', 'notresolved', '2012-11-14', '', 4, 4, 8),
(10, 19, 'fdawdfaw', 'notresolved', '2012-11-14', '', 4, 4, 8),
(11, 20, 'dawdsad', 'notresolved', '2012-11-14', '', 4, 4, 1),
(12, 9, 'cascac', 'notresolved', '2012-11-14', '', 4, 5, 1),
(13, 6, 'vsdsd', 'notresolved', '2012-11-14', '', 4, 5, 1),
(14, 1, 'dsvsdv', 'notresolved', '2012-11-15', '', 5, 6, 7),
(15, 2, 'dadasdcas', 'notresolved', '2012-11-15', '', 5, 6, 2),
(16, 3, 'dadawd', 'notresolved', '2012-11-15', '', 5, 6, 7),
(17, 4, 'sdfvsdvc', 'notresolved', '2012-11-15', '', 5, 6, 7),
(18, 7, 'dawdaw', 'notresolved', '2012-11-15', '', 5, 6, 7),
(19, 5, 'fafdafdawfd', 'notresolved', '2012-11-15', '', 5, 6, 2),
(20, 13, 'dawdaw', 'notresolved', '2012-11-15', '', 5, 7, 3),
(21, 20, 'awdaw', 'notresolved', '2012-11-15', '', 5, 7, 3),
(22, 12, 'dadad', 'notresolved', '2012-11-15', '', 5, 8, 4),
(23, 13, 'tsetsesetseset', 'notresolved', '2012-11-15', '', 5, 8, 4),
(24, 10, 'sdfvsdfvc', 'notresolved', '2012-11-15', '', 5, 9, 8),
(25, 21, 'rwerwe', 'notresolved', '2012-11-15', '', 4, 5, 2),
(26, 14, 'tset sgesg', 'notresolved', '2012-11-14', '', 4, 10, 3),
(27, 13, 'setset', 'notresolved', '2012-11-14', '', 4, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_member`
--

CREATE TABLE IF NOT EXISTS `bugs_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `codename` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `team_lead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_member_fcf8ac47` (`team_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `bugs_member`
--

INSERT INTO `bugs_member` (`id`, `name`, `codename`, `avatar`, `team_id`, `team_lead`) VALUES
(1, 'Manaj', 'The Munna', 'avatar/krashid_odesk.jpg', 1, 1),
(2, 'Shawon', 'kupa', 'avatar/Photo0003.jpg', 1, 0),
(3, 'Ershadul', 'bird', 'avatar/Photo0004.jpg', 4, 1),
(4, 'Rasel', 'jbaker', 'avatar/Photo0005.jpg', 4, 0),
(5, 'Rubyet', 'velkayr', 'avatar/Photo0010.jpg', 2, 1),
(6, 'Imran', 'megamind', 'avatar/Photo0014.jpg', 2, 0),
(7, 'Rayen', '007', 'avatar/Photo0018.jpg', 3, 1),
(8, 'raju', 'coder', 'avatar/Photo0019.jpg', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_module`
--

CREATE TABLE IF NOT EXISTS `bugs_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `bugs_module`
--

INSERT INTO `bugs_module` (`id`, `name`) VALUES
(1, 'cms'),
(2, 'page'),
(3, 'cmsmodule'),
(4, 'editor picks'),
(5, 'newscred_site'),
(6, 'cdb'),
(7, 'cpanel'),
(8, 'video embed'),
(9, 'twitter');

-- --------------------------------------------------------

--
-- Table structure for table `bugs_module_feature`
--

CREATE TABLE IF NOT EXISTS `bugs_module_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_id` (`module_id`,`feature_id`),
  KEY `bugs_module_feature_f53ed95e` (`module_id`),
  KEY `bugs_module_feature_7be9b9ad` (`feature_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `bugs_module_feature`
--

INSERT INTO `bugs_module_feature` (`id`, `module_id`, `feature_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(8, 3, 6),
(9, 3, 7),
(5, 3, 8),
(6, 3, 9),
(7, 3, 10),
(10, 4, 11),
(11, 4, 12),
(12, 5, 13),
(13, 5, 14),
(14, 6, 15),
(15, 7, 16),
(19, 8, 6),
(20, 8, 7),
(16, 8, 8),
(17, 8, 9),
(18, 8, 10),
(24, 9, 6),
(25, 9, 7),
(21, 9, 8),
(22, 9, 9),
(23, 9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_scenario`
--

CREATE TABLE IF NOT EXISTS `bugs_scenario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `bugs_scenario`
--

INSERT INTO `bugs_scenario` (`id`, `title`, `desc`) VALUES
(1, 'click login menu', 'click login menu'),
(2, 'go to the /login url', 'go to the /login url'),
(3, 'show login form popup', 'show login form popup'),
(4, 'fill the login form with email id & password', 'fill the login form with email id & password'),
(5, 'click login button of the login form', 'click login button of the login form'),
(6, 'go to the redirect url', 'go to the redirect url'),
(7, 'show edit bar the top of the page', 'show edit bar the top of the page'),
(8, 'click logout menu', 'click logout menu'),
(9, 'go to the url /logout', 'go to the url /logout'),
(10, 'Show Add Page form', 'Show Add Page form'),
(11, 'Add Page with unique page url', 'Add Page with unique page url'),
(12, 'Add Page with previously added page url', 'Add Page with previously added page url'),
(13, 'Delete Page successfully', 'Delete Page successfully'),
(14, 'Delete Page not successful', 'Delete Page not successful'),
(15, 'Edit Page', 'Edit Page'),
(16, 'Get add module form', 'Get add module form'),
(17, 'Add modules button', 'Add modules button'),
(18, 'Edit modules button', 'Edit modules button'),
(19, 'Modules delete button', 'Modules delete button'),
(20, 'delete module', 'delete module'),
(21, 'Show move modules popup', 'Show move modules popup'),
(22, 'Load layout', 'Load layout'),
(23, 'List modules', 'List modules'),
(24, 'List modules in edit mode', 'List modules in edit mode'),
(25, 'Add editor pics module', 'Add editor pics module'),
(26, 'Show edit form for editor picks', 'Show edit form for editor picks'),
(27, 'Get Edit Button for Editor Picks Module in Page', 'Get Edit Button for Editor Picks Module in Page'),
(28, 'Add article for editor picks', 'Add article for editor picks'),
(29, 'test scenario', 'test'),
(30, 'test for blog', 'test'),
(31, 'generate pdf report for cdb', 'test'),
(32, 'test article search', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `bugs_sprint`
--

CREATE TABLE IF NOT EXISTS `bugs_sprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `release_date` date NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bugs_sprint`
--

INSERT INTO `bugs_sprint` (`id`, `start_date`, `release_date`, `description`) VALUES
(4, '2012-11-08', '2012-11-14', 'First week of November-12'),
(5, '2012-11-15', '2012-11-21', 'Second week of November-12');

-- --------------------------------------------------------

--
-- Table structure for table `bugs_sprintjob`
--

CREATE TABLE IF NOT EXISTS `bugs_sprintjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `job_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `project_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `project_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `jira_ticket` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `job_owner` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sprint_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_sprintjob_d570799e` (`sprint_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `bugs_sprintjob`
--

INSERT INTO `bugs_sprintjob` (`id`, `title`, `job_type`, `project_type`, `project_title`, `jira_ticket`, `description`, `job_owner`, `sprint_id`) VALUES
(1, 'pepsi cms', 'newproject', 'cms', 'New cms for pepsi', 'CMS-192', 'This is new cms for PEPSI', 'client', 4),
(2, 'video embed module', 'newfeature', 'cms', 'New video embed module', 'CMS-193', 'This is new feature for CMS', 'client', 4),
(3, 'Fix page title for NYDN cms', 'bugfix', 'cms', 'Fix page title for NYDN cms', 'CMS-194', 'Fix page title for NYDN cms', 'client', 4),
(4, 'New twitter module', 'newfeature', 'cms', 'Build new twitter module', 'CMS-195', 'Build new twitter module', 'client', 4),
(5, 'Fix editor pics for nydn ', 'bugfix', 'cms', 'Fix editor pics for nydn ', 'CMS-196', 'Fix editor pics for nydn ', 'client', 4),
(6, 'new bacardi cms', 'newproject', 'cms', 'New cms for bacardi', 'CMS-198', 'New cms for bacardi', 'management', 5),
(7, 'show Client Contracts and Pending Client Contracts', 'changefeature', 'cpanel', 'Client Contracts and Pending Client Contracts,', 'CP-100', 'Client Contracts and Pending Client Contracts,', 'management', 5),
(8, 'generate pdf report for cdb', 'newfeature', 'cpanel', 'generate pdf report for cdb', 'CP-101', 'generate pdf report for cdb', 'management', 5),
(9, 'newscred blog site', 'newproject', 'website', 'blog site for newscred', 'web-100', 'blog site for newscred', 'client', 5),
(10, 'test cpanel job', 'newfeature', 'cpanel', 'Test cpanel jobs', 'CP-102', 'tsewtest', 'client', 4);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_sprintjob_developers`
--

CREATE TABLE IF NOT EXISTS `bugs_sprintjob_developers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sprintjob_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sprintjob_id` (`sprintjob_id`,`member_id`),
  KEY `bugs_sprintjob_developers_d613d3c` (`sprintjob_id`),
  KEY `bugs_sprintjob_developers_56e38b98` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `bugs_sprintjob_developers`
--

INSERT INTO `bugs_sprintjob_developers` (`id`, `sprintjob_id`, `member_id`) VALUES
(1, 1, 1),
(2, 1, 7),
(3, 2, 8),
(4, 3, 8),
(8, 4, 1),
(7, 4, 8),
(9, 5, 2),
(10, 6, 2),
(11, 6, 7),
(12, 7, 3),
(13, 8, 4),
(14, 9, 8),
(15, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_team`
--

CREATE TABLE IF NOT EXISTS `bugs_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `slogan` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `team_icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `bugs_team`
--

INSERT INTO `bugs_team` (`id`, `team_name`, `slogan`, `team_icon`) VALUES
(1, 'design', 'This is design team', 'team_icon/zend-framework2.png'),
(2, 'platform', 'This is platform', 'team_icon/wordpress-logo.jpg'),
(3, 'dev-cms', 'This is CMS developer team', 'team_icon/django-logo-positive.png'),
(4, 'dev-cp', 'This is Control Panel dev team', 'team_icon/joomla.png');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=89 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2012-11-28 20:22:30', 1, 12, '1', 'design', 1, ''),
(2, '2012-11-28 20:22:50', 1, 12, '2', 'platform', 1, ''),
(3, '2012-11-28 20:23:39', 1, 12, '3', 'dev-cms', 1, ''),
(4, '2012-11-28 20:24:14', 1, 12, '4', 'dev-cp', 1, ''),
(5, '2012-11-28 20:25:16', 1, 13, '1', 'Manaj', 1, ''),
(6, '2012-11-28 20:26:48', 1, 13, '2', 'Shawon', 1, ''),
(7, '2012-11-28 20:27:22', 1, 13, '3', 'Ershadul', 1, ''),
(8, '2012-11-28 20:27:44', 1, 13, '4', 'Rasel', 1, ''),
(9, '2012-11-28 20:28:16', 1, 13, '5', 'Rubyet', 1, ''),
(10, '2012-11-28 20:28:40', 1, 13, '6', 'Imran', 1, ''),
(11, '2012-11-28 20:29:09', 1, 13, '7', 'Rayen', 1, ''),
(12, '2012-11-28 20:29:38', 1, 13, '8', 'raju', 1, ''),
(13, '2012-11-28 20:33:47', 1, 8, '1', 'click login menu', 1, ''),
(14, '2012-11-28 20:34:09', 1, 8, '2', 'go to the /login url', 1, ''),
(15, '2012-11-28 20:34:42', 1, 8, '3', 'show login form popup', 1, ''),
(16, '2012-11-28 20:35:29', 1, 8, '4', 'fill the login form with email id & password', 1, ''),
(17, '2012-11-28 20:36:31', 1, 8, '5', 'click login button of the login form', 1, ''),
(18, '2012-11-28 20:36:55', 1, 8, '6', 'go to the redirect url', 1, ''),
(19, '2012-11-28 20:37:18', 1, 8, '7', 'show edit bar the top of the page', 1, ''),
(20, '2012-11-28 20:37:49', 1, 9, '1', 'login', 1, ''),
(21, '2012-11-28 20:38:50', 1, 8, '8', 'click logout menu', 1, ''),
(22, '2012-11-28 20:39:09', 1, 8, '9', 'go to the url /logout', 1, ''),
(23, '2012-11-28 20:39:33', 1, 9, '2', 'logout', 1, ''),
(24, '2012-11-28 20:39:51', 1, 9, '2', 'logout cms', 2, 'Changed name.'),
(25, '2012-11-28 20:39:57', 1, 9, '1', 'login cms', 2, 'Changed name.'),
(26, '2012-11-28 20:40:56', 1, 10, '1', 'cms', 1, ''),
(27, '2012-11-28 21:02:41', 1, 14, '4', '2012-11-14', 1, ''),
(28, '2012-11-28 21:03:01', 1, 14, '5', '2012-11-21', 1, ''),
(29, '2012-11-28 21:03:20', 1, 14, '6', '2012-11-28', 1, ''),
(30, '2012-11-28 21:10:33', 1, 15, '1', 'pepsi cms', 1, ''),
(31, '2012-11-28 21:11:58', 1, 15, '2', 'video embed module', 1, ''),
(32, '2012-11-28 21:15:35', 1, 15, '3', 'Fix page title for NYDN cms', 1, ''),
(33, '2012-11-28 21:17:23', 1, 15, '4', 'New twitter module', 1, ''),
(34, '2012-11-28 21:20:26', 1, 11, '1', 'login menu does not work', 1, ''),
(35, '2012-11-28 21:22:28', 1, 11, '2', 'design issue for login form popup', 1, ''),
(36, '2012-11-28 21:23:31', 1, 11, '3', 'login button in the login popup form not working', 1, ''),
(37, '2012-11-28 21:26:58', 1, 16, '1', 'login menu does not work', 1, ''),
(38, '2012-12-01 14:02:26', 1, 8, '10', 'Show Add Page form', 1, ''),
(39, '2012-12-01 14:02:36', 1, 8, '11', 'Add Page with unique page url', 1, ''),
(40, '2012-12-01 14:02:50', 1, 8, '12', 'Add Page with previously added page url', 1, ''),
(41, '2012-12-01 14:03:01', 1, 8, '13', 'Delete Page successfully', 1, ''),
(42, '2012-12-01 14:03:09', 1, 8, '14', 'Delete Page not successful', 1, ''),
(43, '2012-12-01 14:04:40', 1, 9, '3', 'Add Page', 1, ''),
(44, '2012-12-01 14:07:26', 1, 9, '4', 'Delete Page', 1, ''),
(45, '2012-12-01 14:20:27', 1, 8, '15', 'Edit Page', 1, ''),
(46, '2012-12-01 14:20:35', 1, 9, '5', 'Edit Page', 1, ''),
(47, '2012-12-01 14:21:17', 1, 10, '2', 'page', 1, ''),
(48, '2012-12-01 14:22:26', 1, 8, '16', 'Get add module form', 1, ''),
(49, '2012-12-01 14:22:38', 1, 8, '17', 'Add modules button', 1, ''),
(50, '2012-12-01 14:22:44', 1, 9, '6', 'Add modules', 1, ''),
(51, '2012-12-01 14:23:08', 1, 8, '18', 'Edit modules button', 1, ''),
(52, '2012-12-01 14:23:14', 1, 9, '7', 'Edit modules', 1, ''),
(53, '2012-12-01 14:23:33', 1, 8, '19', 'Modules delete button', 1, ''),
(54, '2012-12-01 14:23:43', 1, 8, '20', 'delete module', 1, ''),
(55, '2012-12-01 14:23:46', 1, 9, '8', 'delete modules', 1, ''),
(56, '2012-12-01 14:28:31', 1, 8, '21', 'Show move modules popup', 1, ''),
(57, '2012-12-01 14:28:40', 1, 8, '22', 'Load layout', 1, ''),
(58, '2012-12-01 14:28:43', 1, 9, '9', 'Move modules', 1, ''),
(59, '2012-12-01 14:29:27', 1, 8, '23', 'List modules', 1, ''),
(60, '2012-12-01 14:29:35', 1, 8, '24', 'List modules in edit mode', 1, ''),
(61, '2012-12-01 14:29:38', 1, 9, '10', 'List modules', 1, ''),
(62, '2012-12-01 14:30:06', 1, 10, '3', 'cmsmodule', 1, ''),
(63, '2012-12-01 14:35:05', 1, 8, '25', 'Add editor pics module', 1, ''),
(64, '2012-12-01 14:35:11', 1, 9, '11', 'Add Editor picks module', 1, ''),
(65, '2012-12-01 14:35:43', 1, 8, '26', 'Show edit form for editor picks', 1, ''),
(66, '2012-12-01 14:35:57', 1, 8, '27', 'Get Edit Button for Editor Picks Module in Page', 1, ''),
(67, '2012-12-01 14:36:08', 1, 8, '28', 'Add article for editor picks', 1, ''),
(68, '2012-12-01 14:36:42', 1, 9, '12', 'Edit Editor pics module', 1, ''),
(69, '2012-12-01 14:37:13', 1, 10, '4', 'editor picks', 1, ''),
(70, '2012-12-01 14:38:26', 1, 15, '4', 'New twitter module', 2, 'No fields changed.'),
(71, '2012-12-01 14:39:53', 1, 15, '5', 'Fix editor pics for nydn ', 1, ''),
(72, '2012-12-01 14:42:04', 1, 15, '6', 'new bacardi cms', 1, ''),
(73, '2012-12-01 14:44:20', 1, 15, '7', 'show Client Contracts and Pending Client Contracts', 1, ''),
(74, '2012-12-01 14:45:45', 1, 15, '8', 'generate pdf report for cdb', 1, ''),
(75, '2012-12-01 14:47:02', 1, 15, '9', 'newscred blog site', 1, ''),
(76, '2012-12-01 15:25:52', 1, 8, '29', 'test scenario', 1, ''),
(77, '2012-12-01 15:26:30', 1, 9, '13', 'about us', 1, ''),
(78, '2012-12-01 15:26:47', 1, 8, '30', 'test for blog', 1, ''),
(79, '2012-12-01 15:26:52', 1, 9, '14', 'blog', 1, ''),
(80, '2012-12-01 15:27:31', 1, 10, '5', 'newscred_site', 1, ''),
(81, '2012-12-01 15:45:52', 1, 8, '31', 'generate pdf report for cdb', 1, ''),
(82, '2012-12-01 15:45:55', 1, 9, '15', 'pdf report', 1, ''),
(83, '2012-12-01 15:46:19', 1, 10, '6', 'cdb', 1, ''),
(84, '2012-12-01 15:47:36', 1, 8, '32', 'test article search', 1, ''),
(85, '2012-12-01 15:47:46', 1, 9, '16', 'article search', 1, ''),
(86, '2012-12-01 16:09:45', 1, 10, '7', 'cpanel', 1, ''),
(87, '2012-12-01 16:28:52', 1, 10, '8', 'video embed', 1, ''),
(88, '2012-12-01 16:50:05', 1, 10, '9', 'twitter', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'log entry', 'admin', 'logentry'),
(8, 'scenario', 'bugs', 'scenario'),
(9, 'feature', 'bugs', 'feature'),
(10, 'module', 'bugs', 'module'),
(11, 'bug', 'bugs', 'bug'),
(12, 'team', 'bugs', 'team'),
(13, 'member', 'bugs', 'member'),
(14, 'sprint', 'bugs', 'sprint'),
(15, 'sprint job', 'bugs', 'sprintjob'),
(16, 'issue', 'bugs', 'issue'),
(17, 'comment', 'bugs', 'comment');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('74556783625a1ad1d4a92dd14ff49625', 'ZDI4OTA3ZjM4MjQzODNhZDA4YTVhNzE0MzgzZjNkYTNkOGUyNzllMzqAAn1xAS4=\n', '2012-12-15 19:33:34'),
('9f7e43d1603c48f19fff3b8f2c1f7d3f', 'NzEzYTRhYTIxNmE2NmU2MWIwOWRlYzhjODYzZDE3YTVlYjcxODA0OTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n', '2012-12-12 20:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `bugs_bug`
--
ALTER TABLE `bugs_bug`
  ADD CONSTRAINT `feature_id_refs_id_7ef73979` FOREIGN KEY (`feature_id`) REFERENCES `bugs_feature` (`id`),
  ADD CONSTRAINT `module_id_refs_id_ace8c080` FOREIGN KEY (`module_id`) REFERENCES `bugs_module` (`id`),
  ADD CONSTRAINT `scenario_id_refs_id_2c98e180` FOREIGN KEY (`scenario_id`) REFERENCES `bugs_scenario` (`id`);

--
-- Constraints for table `bugs_comment`
--
ALTER TABLE `bugs_comment`
  ADD CONSTRAINT `issues_id_refs_id_559af9b3` FOREIGN KEY (`issues_id`) REFERENCES `bugs_issue` (`id`);

--
-- Constraints for table `bugs_feature_scenario`
--
ALTER TABLE `bugs_feature_scenario`
  ADD CONSTRAINT `feature_id_refs_id_8851620f` FOREIGN KEY (`feature_id`) REFERENCES `bugs_feature` (`id`),
  ADD CONSTRAINT `scenario_id_refs_id_7f60c6d8` FOREIGN KEY (`scenario_id`) REFERENCES `bugs_scenario` (`id`);

--
-- Constraints for table `bugs_issue`
--
ALTER TABLE `bugs_issue`
  ADD CONSTRAINT `bugyman_id_refs_id_14a749bf` FOREIGN KEY (`bugyman_id`) REFERENCES `bugs_member` (`id`),
  ADD CONSTRAINT `bug_id_refs_id_68bfb0aa` FOREIGN KEY (`bug_id`) REFERENCES `bugs_bug` (`id`),
  ADD CONSTRAINT `sprintjob_id_refs_id_50f980bd` FOREIGN KEY (`sprintjob_id`) REFERENCES `bugs_sprintjob` (`id`),
  ADD CONSTRAINT `sprint_id_refs_id_adfd587f` FOREIGN KEY (`sprint_id`) REFERENCES `bugs_sprint` (`id`);

--
-- Constraints for table `bugs_member`
--
ALTER TABLE `bugs_member`
  ADD CONSTRAINT `team_id_refs_id_b8ecabb4` FOREIGN KEY (`team_id`) REFERENCES `bugs_team` (`id`);

--
-- Constraints for table `bugs_module_feature`
--
ALTER TABLE `bugs_module_feature`
  ADD CONSTRAINT `feature_id_refs_id_6984e283` FOREIGN KEY (`feature_id`) REFERENCES `bugs_feature` (`id`),
  ADD CONSTRAINT `module_id_refs_id_b5556502` FOREIGN KEY (`module_id`) REFERENCES `bugs_module` (`id`);

--
-- Constraints for table `bugs_sprintjob`
--
ALTER TABLE `bugs_sprintjob`
  ADD CONSTRAINT `sprint_id_refs_id_2dc1dc81` FOREIGN KEY (`sprint_id`) REFERENCES `bugs_sprint` (`id`);

--
-- Constraints for table `bugs_sprintjob_developers`
--
ALTER TABLE `bugs_sprintjob_developers`
  ADD CONSTRAINT `member_id_refs_id_7cf684` FOREIGN KEY (`member_id`) REFERENCES `bugs_member` (`id`),
  ADD CONSTRAINT `sprintjob_id_refs_id_b07e1c4e` FOREIGN KEY (`sprintjob_id`) REFERENCES `bugs_sprintjob` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
