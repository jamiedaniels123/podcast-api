-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 12, 2011 at 02:52 PM
-- Server version: 5.1.52
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `admin-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_datacheck`
--

DROP TABLE IF EXISTS `api_datacheck`;
CREATE TABLE IF NOT EXISTS `api_datacheck` (
  `dc_index` int(10) NOT NULL AUTO_INCREMENT,
  `dc_field1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc_field2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc_field3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc_field4` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc_field5` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dc_field6` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`dc_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `api_datacheck`
--

INSERT INTO `api_datacheck` (`dc_index`, `dc_field1`, `dc_field2`, `dc_field3`, `dc_field4`, `dc_field5`, `dc_field6`) VALUES
(1, 'source_path', 'source_filename', 'destination_path', 'destination_path', NULL, NULL),
(2, 'source_path', 'destination_path', NULL, NULL, NULL, NULL),
(3, 'destination_path', 'destination_filename', NULL, NULL, NULL, NULL),
(4, 'destination_path', NULL, NULL, NULL, NULL, NULL),
(5, 'title', 'description', 'weburl', 'count', NULL, NULL),
(6, 'title', 'containerID', 'count', NULL, NULL, NULL),
(7, 'containerID', 'source_path', 'destination_path', 'filename', 'workflow', 'count'),
(8, 'containerID', 'mediaID', 'count', NULL, NULL, NULL),
(9, 'containerID', 'mediaID', 'filename', 'title', 'podcast_title', 'count'),
(10, 'containerID', 'status', 'error', 'count', NULL, NULL),
(11, 'containerID', 'mediaID', 'status', 'error', 'count', NULL),
(12, 'containerID', 'mediaID', 'url', 'status', 'error', 'count'),
(13, 'destination_path', 'destination_filename', 'meta_data', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `api_destinations`
--

DROP TABLE IF EXISTS `api_destinations`;
CREATE TABLE IF NOT EXISTS `api_destinations` (
  `ad_index` int(10) NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_callback_url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ad_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_index`),
  KEY `ad_name` (`ad_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=7 ;

--
-- Dumping data for table `api_destinations`
--

INSERT INTO `api_destinations` (`ad_index`, `ad_name`, `ad_url`, `ad_ip`, `ad_callback_url`, `ad_update`) VALUES
(1, 'admin-api', 'http://podcast-api-dev.open.ac.uk', '137.108.130.170', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '2011-06-10 10:02:09'),
(2, 'media-api', 'http://media-podcast-api-dev.open.ac.uk', '137.108.130.115', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '2011-06-10 10:05:04'),
(3, 'encoder-api', 'http://kmi-encoder04/', '137.108.24.36', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '2011-06-10 10:05:04'),
(4, 'vle-api', 'http://podcast-api-dev.open.ac.uk/vle/', '137.108.130.170', 'http://podcast-admin-dev.open.ac.uk/vles/add/', '2011-06-10 10:05:04'),
(5, 'admin-vle', 'http://podcast-admin-dev.open.ac.uk/vles/add/', '137.108.130.70', NULL, '2011-06-10 10:01:59'),
(6, 'admin-app', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '137.108.130.70', NULL, '2011-06-10 10:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `api_end_points`
--

DROP TABLE IF EXISTS `api_end_points`;
CREATE TABLE IF NOT EXISTS `api_end_points` (
  `ep_index` int(10) NOT NULL AUTO_INCREMENT,
  `ep_filetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_path` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ep_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ep_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=8 ;

--
-- Dumping data for table `api_end_points`
--

INSERT INTO `api_end_points` (`ep_index`, `ep_filetype`, `ep_path`, `ep_update`) VALUES
(1, 'audio', '/audio', '2011-06-10 10:01:59'),
(2, 'video', '/video', '2011-06-10 10:01:59'),
(3, 'video-wide', '/video-wide', '2011-06-10 10:02:09'),
(4, 'screencast', '/screencast', '2011-06-10 10:01:59'),
(5, 'screencast-wide', '/screencast-wide', '2011-06-10 10:01:59'),
(6, 'multi-video', '/multi-video', '2011-06-10 10:01:59'),
(7, 'multi-video-wide', '/multi-video-wide', '2011-06-10 10:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

DROP TABLE IF EXISTS `api_log`;
CREATE TABLE IF NOT EXISTS `api_log` (
  `al_index` int(10) NOT NULL AUTO_INCREMENT,
  `al_message` text COLLATE utf8_unicode_ci,
  `al_reply` text COLLATE utf8_unicode_ci,
  `al_result_data` text COLLATE utf8_unicode_ci,
  `al_debug` text COLLATE utf8_unicode_ci NOT NULL,
  `al_dest` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `al_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`al_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `api_log`
--

INSERT INTO `api_log` (`al_index`, `al_message`, `al_reply`, `al_result_data`, `al_debug`, `al_dest`, `al_timestamp`) VALUES
(1, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml"},"cqIndex":"1","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(2, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml"},"cqIndex":"2","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(3, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml"},"cqIndex":"3","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(4, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml"},"cqIndex":"4","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(5, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml"},"cqIndex":"5","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(6, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml"},"cqIndex":"6","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(7, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml"},"cqIndex":"7","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(8, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml"},"cqIndex":"8","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:00'),
(9, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml"},"cqIndex":"9","mqIndex":"1","step":"3","timestamp":1313157120}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(10, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml"},"cqIndex":"10","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(11, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml"},"cqIndex":"11","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(12, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml"},"cqIndex":"12","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(13, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml"},"cqIndex":"13","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(14, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml"},"cqIndex":"14","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(15, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml"},"cqIndex":"15","mqIndex":"1","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(16, '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess"},"cqIndex":"16","mqIndex":"2","step":"3","timestamp":1313157121}', '{"command":"media-move-file","number":1,"data":{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess"},"status":"ACK","error":""}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:01'),
(17, '{"command":"poll-media","number":1,"data":{"command":"poll_media"},"timestamp":1313157124}', '{"command":"poll-media","status":"Y","number":12,"timestamp":1313157124,"data":[{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml","cqIndex":"1","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/1_HelloWorld%2F3gp%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/3gp/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml","cqIndex":"2","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/2_HelloWorld%2Faudio%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/audio/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml","cqIndex":"3","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/3_HelloWorld%2Fdesktop%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml","cqIndex":"4","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/4_HelloWorld%2Fhd%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/hd/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml","cqIndex":"5","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/5_HelloWorld%2Fiphone%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/iphone/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml","cqIndex":"6","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/6_HelloWorld%2Fipod%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml","cqIndex":"7","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/7_HelloWorld%2Flarge%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/large/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml","cqIndex":"8","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/8_HelloWorld%2Ftranscript%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/transcript/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml","cqIndex":"9","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/9_HelloWorld%2Fyoutube%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/youtube/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml","cqIndex":"10","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/10_HelloWorld%2Fextra%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/extra/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml","cqIndex":"11","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/11_HelloWorld%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/rss2.xml","status":"Y","mqIndex":"1","step":"3"}]}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:04'),
(18, '{"command":"poll-media","number":1,"data":{"command":"poll_media"},"timestamp":1313157126}', '{"command":"poll-media","status":"Y","number":6,"timestamp":1313157126,"data":[{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml","cqIndex":"12","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/12_HelloWorld%2Fhigh%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/high/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml","cqIndex":"13","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/13_HelloWorld%2Fipod-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml","cqIndex":"14","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/14_HelloWorld%2Fdesktop-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml","cqIndex":"15","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/15_HelloWorld%2Fepub%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/epub/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess","cqIndex":"16","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/16_HelloWorld%2Fhtaccess to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/.htaccess","status":"Y","mqIndex":"2","step":"3"}]}', NULL, '', 'http://media-podcast-api-dev.open.ac.uk', '2011-08-12 14:52:06'),
(19, '{"command":"transfer-file-to-media-server","number":"15","failed":"0","data":[{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml","cqIndex":"1","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/1_HelloWorld%2F3gp%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/3gp/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml","cqIndex":"2","number":2,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/2_HelloWorld%2Faudio%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/audio/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml","cqIndex":"3","number":3,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/3_HelloWorld%2Fdesktop%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml","cqIndex":"4","number":4,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/4_HelloWorld%2Fhd%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/hd/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml","cqIndex":"5","number":5,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/5_HelloWorld%2Fiphone%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/iphone/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml","cqIndex":"6","number":6,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/6_HelloWorld%2Fipod%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml","cqIndex":"7","number":7,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/7_HelloWorld%2Flarge%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/large/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml","cqIndex":"8","number":8,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/8_HelloWorld%2Ftranscript%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/transcript/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml","cqIndex":"9","number":9,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/9_HelloWorld%2Fyoutube%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/youtube/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml","cqIndex":"10","number":10,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/10_HelloWorld%2Fextra%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/extra/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml","cqIndex":"11","number":11,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/11_HelloWorld%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml","cqIndex":"12","number":12,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/12_HelloWorld%2Fhigh%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/high/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml","cqIndex":"13","number":13,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/13_HelloWorld%2Fipod-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml","cqIndex":"14","number":14,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/14_HelloWorld%2Fdesktop-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml","cqIndex":"15","number":15,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/15_HelloWorld%2Fepub%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/epub/rss2.xml","status":"Y","mqIndex":"1","step":"3"}],"timestamp":1313157127}', '{"status":"ACK","data":"Message received","timestamp":1313157127}', '', '', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '2011-08-12 14:52:07'),
(20, '{"command":"transfer-file-to-media-server","number":"1","failed":"0","data":[{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess","cqIndex":"16","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/16_HelloWorld%2Fhtaccess to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/.htaccess","status":"Y","mqIndex":"2","step":"3"}],"timestamp":1313157127}', '{"status":"ACK","data":"Message received","timestamp":1313157127}', '', '', 'http://podcast-admin-dev.open.ac.uk/callbacks/add/', '2011-08-12 14:52:07');

-- --------------------------------------------------------

--
-- Table structure for table `api_process`
--

DROP TABLE IF EXISTS `api_process`;
CREATE TABLE IF NOT EXISTS `api_process` (
  `ap_index` int(10) NOT NULL AUTO_INCREMENT,
  `ap_process_id` int(10) DEFAULT '0',
  `ap_script` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `ap_timestamp` datetime NOT NULL,
  `ap_last_checked` datetime NOT NULL,
  `ap_status` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ap_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=286038 ;

--
-- Dumping data for table `api_process`
--

INSERT INTO `api_process` (`ap_index`, `ap_process_id`, `ap_script`, `ap_timestamp`, `ap_last_checked`, `ap_status`) VALUES
(286007, 1093, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:47:40', '2011-08-12 14:47:50', 'N'),
(286008, 1100, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:47:50', '2011-08-12 14:48:00', 'N'),
(286009, 1143, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:00', '2011-08-12 14:48:10', 'N'),
(286010, 1161, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:10', '2011-08-12 14:48:20', 'N'),
(286011, 1174, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:20', '2011-08-12 14:48:30', 'N'),
(286012, 1191, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:30', '2011-08-12 14:48:40', 'N'),
(286013, 1198, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:40', '2011-08-12 14:48:50', 'N'),
(286014, 1209, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:48:50', '2011-08-12 14:49:00', 'N'),
(286015, 1216, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:00', '2011-08-12 14:49:10', 'N'),
(286016, 1223, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:10', '2011-08-12 14:49:20', 'N'),
(286017, 1230, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:20', '2011-08-12 14:49:30', 'N'),
(286018, 1237, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:30', '2011-08-12 14:49:40', 'N'),
(286019, 1248, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:40', '2011-08-12 14:49:50', 'N'),
(286020, 1255, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:49:50', '2011-08-12 14:50:00', 'N'),
(286021, 1262, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:00', '2011-08-12 14:50:10', 'N'),
(286022, 1278, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:10', '2011-08-12 14:50:20', 'N'),
(286023, 1285, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:20', '2011-08-12 14:50:30', 'N'),
(286024, 1292, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:30', '2011-08-12 14:50:40', 'N'),
(286025, 1299, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:40', '2011-08-12 14:50:50', 'N'),
(286026, 1306, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:50:50', '2011-08-12 14:51:01', 'N'),
(286027, 1314, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:01', '2011-08-12 14:51:11', 'N'),
(286028, 1322, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:11', '2011-08-12 14:51:21', 'N'),
(286029, 1335, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:21', '2011-08-12 14:51:31', 'N'),
(286030, 1342, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:31', '2011-08-12 14:51:41', 'N'),
(286031, 1357, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:41', '2011-08-12 14:51:51', 'N'),
(286032, 1380, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:51:51', '2011-08-12 14:52:00', 'N'),
(286033, 1457, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:52:00', '2011-08-12 14:52:10', 'N'),
(286034, 1475, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:52:10', '2011-08-12 14:52:20', 'N'),
(286035, 1484, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:52:20', '2011-08-12 14:52:30', 'N'),
(286036, 1495, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:52:30', '2011-08-12 14:52:40', 'N'),
(286037, 1503, 'curl -d "number=5&time=2" http://podcast-api-dev.o', '2011-08-12 14:52:40', '0000-00-00 00:00:00', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `api_workflows`
--

DROP TABLE IF EXISTS `api_workflows`;
CREATE TABLE IF NOT EXISTS `api_workflows` (
  `wf_index` int(10) NOT NULL AUTO_INCREMENT,
  `wf_cr_index` int(10) DEFAULT NULL,
  `wf_ad_index` int(10) DEFAULT NULL,
  `wf_step` int(10) DEFAULT NULL,
  `wf_steps` int(10) DEFAULT NULL,
  `wf_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wf_function` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wf_route_type` enum('queue','direct','wait') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wf_index`),
  KEY `wf_ad_index` (`wf_ad_index`),
  KEY `wf_cr_index` (`wf_cr_index`),
  KEY `wf_step` (`wf_step`),
  KEY `wf_route_type` (`wf_route_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `api_workflows`
--

INSERT INTO `api_workflows` (`wf_index`, `wf_cr_index`, `wf_ad_index`, `wf_step`, `wf_steps`, `wf_command`, `wf_function`, `wf_route_type`) VALUES
(1, 1, 1, 1, 8, 'push-next-command', 'doPushNextCommand', 'direct'),
(2, 1, 3, 2, 8, 'encoder-pull-file', 'doEncoderPullFile', 'wait'),
(3, 1, 1, 3, 8, 'push-next-command', 'doPushNextCommand', 'direct'),
(4, 1, 3, 4, 8, 'encoder-check-output', 'doEncoderCheckOutput', 'wait'),
(5, 1, 1, 5, 8, 'push-next-command', 'doPushNextCommand', 'direct'),
(6, 1, 3, 6, 8, 'encoder-push-to-media', 'doEncoderPushToMedia', 'wait'),
(7, 1, 1, 7, 8, 'push-next-command', 'doPushNextCommand', 'direct'),
(8, 1, 2, 8, 8, 'media-move-file', 'doMediaMoveFile', 'wait'),
(9, 3, 1, 1, 3, 'media-push-file', 'doMediaPushFile', 'queue'),
(10, 3, 1, 2, 3, 'push-next-command', 'doPushNextCommand', 'direct'),
(11, 3, 2, 3, 3, 'media-move-file', 'doMediaMoveFile', 'wait'),
(12, 5, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(13, 5, 2, 2, 2, 'media-delete-file', 'doMediaDeleteFile', 'wait'),
(14, 6, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(15, 6, 2, 2, 2, 'media-delete-folder', 'doMediaDeleteFolder', 'wait'),
(16, 7, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(17, 7, 2, 2, 2, 'media-update-metadata', 'doMediaUpdateMetadata', 'wait'),
(19, 10, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(20, 10, 2, 2, 2, 'media-update-permisssions', 'doMediaUpdatePermissions', 'wait'),
(21, 16, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(22, 16, 2, 2, 2, 'media-rename-file', 'doMediaRenameFile', 'wait'),
(23, 17, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(24, 17, 2, 2, 2, 'media-rename-folder', 'doMediaRenameFolder', 'wait'),
(25, 18, 1, 1, 3, 'media-push-file', 'doMediaPushFile', 'queue'),
(26, 18, 1, 2, 3, 'push-next-command', 'doPushNextCommand', 'direct'),
(27, 18, 2, 3, 3, 'media-move-file', 'doMediaMoveFile', 'wait'),
(28, 34, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(29, 34, 2, 2, 2, 'media-copy-folder', 'doMediaCopyFolder', 'wait'),
(30, 35, 1, 1, 3, 'media-push-file', 'doMediaPushFile', 'queue'),
(31, 35, 1, 2, 3, 'push-next-command', 'doPushNextCommand', 'direct'),
(32, 35, 2, 3, 3, 'media-move-file', 'doMediaMoveFile', 'wait'),
(33, 36, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(34, 36, 2, 2, 2, 'media-youtube-upload', 'doYoutubeUpload', 'wait'),
(35, 37, 1, 1, 2, 'push-next-command', 'doPushNextCommand', 'direct'),
(36, 37, 2, 2, 2, 'media-youtube-update', 'doYoutubeUpdate', 'wait');

-- --------------------------------------------------------

--
-- Table structure for table `command_routes`
--

DROP TABLE IF EXISTS `command_routes`;
CREATE TABLE IF NOT EXISTS `command_routes` (
  `cr_index` int(10) NOT NULL AUTO_INCREMENT,
  `cr_source` enum('admin-app','admin-api','vle-api') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_destination` enum('admin-app','admin-api','encoder-api','media-api','vle-api') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_execute` enum('admin-app','admin-api','encoder-api','media-api','vle-api') COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_function` varchar(50) CHARACTER SET ucs2 COLLATE ucs2_unicode_ci DEFAULT NULL,
  `cr_callback` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cr_delivery` enum('single','multiple') COLLATE utf8_unicode_ci DEFAULT 'single',
  `cr_datacheck` int(4) DEFAULT NULL,
  `cr_route_type` enum('queue','direct') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cr_index`),
  KEY `cr_destination` (`cr_destination`),
  KEY `cr_execute` (`cr_execute`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=38 ;

--
-- Dumping data for table `command_routes`
--

INSERT INTO `command_routes` (`cr_index`, `cr_source`, `cr_destination`, `cr_execute`, `cr_action`, `cr_function`, `cr_callback`, `cr_delivery`, `cr_datacheck`, `cr_route_type`) VALUES
(1, 'admin-app', 'encoder-api', 'encoder-api', 'transcode-media-and-deliver', 'doTranscodeMediaAndDeliver', 'transcode-media-and-deliver', 'multiple', 1, 'queue'),
(3, 'admin-app', 'media-api', 'admin-api', 'transfer-file-to-media-server', 'doTransferFileToMediaServer', 'transfer-file-to-media-server', 'single', 1, 'queue'),
(4, 'admin-app', 'media-api', 'admin-api', 'transfer-folder-to-media-server', 'doTransferFolderToMediaServer', 'transfer-folder-to-media-server', 'single', 1, 'queue'),
(5, 'admin-app', 'media-api', 'media-api', 'delete-file-on-media-server', 'doDeleteFileOnMediaServer', 'delete-file-on-media-server', 'single', 3, 'queue'),
(6, 'admin-app', 'media-api', 'media-api', 'delete-folder-on-media-server', 'doDeleteFolderOnMediaServer', 'delete-folder-on-media-server', 'single', 4, 'queue'),
(7, 'admin-app', 'media-api', 'media-api', 'update-file-metadata', 'doUpdateFileMetaData', 'update-file-metadata', 'single', 13, 'queue'),
(10, 'admin-app', 'media-api', 'media-api', 'set-permissions-folder', 'doSetPermisssionsFolder', 'set-permissions-folder', 'single', 1, 'queue'),
(11, 'admin-app', 'media-api', 'media-api', 'check-file-exists', 'doCheckFileExists', 'check-file-exists', 'single', 3, 'direct'),
(13, 'admin-app', 'media-api', 'media-api', 'check-folder-exists', 'doCheckFolderExists', 'check-folder-exists', 'single', 4, 'direct'),
(14, 'admin-app', 'media-api', 'media-api', 'status-media', 'doStatusMedia', 'status-media', 'single', NULL, 'direct'),
(15, 'admin-app', 'encoder-api', 'encoder-api', 'status-encoder', 'doStatusEncoder', 'status-encoder', 'single', NULL, 'direct'),
(16, 'admin-app', 'media-api', 'media-api', 'rename-file-on-media-server', 'doRenameFileOnMediaServer', 'rename-file-on-media-server', 'single', 1, 'queue'),
(17, 'admin-app', 'media-api', 'media-api', 'rename-folder-on-media-server', 'doRenameFolderOnMediaServer', 'rename-folder-on-media-server', 'single', 2, 'queue'),
(18, 'admin-app', 'media-api', 'media-api', 'move-file-on-media-server', 'doMoveFileOnMediaServer', 'move-file-on-media-server', 'single', 1, 'queue'),
(19, 'vle-api', 'admin-app', 'admin-app', 'create-container', 'doPassToAdmin', 'create-container', 'single', 5, 'direct'),
(20, 'vle-api', 'admin-app', 'admin-app', 'deletete-container', 'doPassToAdmin', 'deletete-container', 'single', 6, 'direct'),
(21, 'vle-api', 'admin-app', 'admin-app', 'submit-media', 'doPassToAdmin', 'submit-media', 'single', 8, 'direct'),
(22, 'vle-api', 'admin-app', 'admin-app', 'delete-media', 'doPassToAdmin', 'delete-media', 'single', 8, 'direct'),
(23, 'vle-api', 'admin-app', 'admin-app', 'get-media-endpoint-url', 'doPassToAdmin', 'get-media-endpoint-url', 'single', 12, 'direct'),
(24, 'vle-api', 'admin-app', 'admin-app', 'metadata-update', 'doPassToAdmin', 'metadata-update', 'single', 9, 'direct'),
(25, 'vle-api', 'admin-app', 'admin-app', 'clone-container', 'doPassToAdmin', 'clone-container', 'single', 5, 'direct'),
(26, 'admin-app', 'vle-api', 'vle-api', 'create-container', 'doPassToVLE', 'create-container', 'single', 10, 'direct'),
(27, 'admin-app', 'vle-api', 'vle-api', 'delete-container', 'doPassToVLE', 'delete-container', 'single', 10, 'direct'),
(28, 'admin-app', 'vle-api', 'vle-api', 'submit-media', 'doPassToVLE', 'submit-media', 'single', 8, 'direct'),
(29, 'admin-app', 'vle-api', 'vle-api', 'delete-media', 'doPassToVLE', 'delete-media', 'single', 8, 'direct'),
(31, 'admin-app', 'vle-api', 'vle-api', 'get-media-endpoint-url', 'doPassToVLE', 'get-media-endpoint-url', 'single', 8, 'direct'),
(32, 'admin-app', 'vle-api', 'vle-api', 'metadata-update', 'doPassToVLE', 'metadata-update', 'single', 11, 'direct'),
(33, 'admin-app', 'vle-api', 'vle-api', 'clone-container', 'doPassToVLE', 'clone-container', 'single', 6, 'direct'),
(34, 'admin-app', 'media-api', 'media-api', 'copy-folder-on-media-server', 'doCopyFolderOnMediaServer', 'copy-folder-on-media-server', 'single', 2, 'queue'),
(35, 'admin-app', 'media-api', 'media-api', 'deliver-without-transcoding', 'doDeliverWithoutTranscoding', 'deliver-without-transcoding', 'single', 1, 'queue'),
(36, 'admin-app', 'media-api', 'media-api', 'youtube-file-upload', 'doYoutubeFileUpload', 'youtube-file-upload', 'single', 1, 'queue'),
(37, 'admin-app', 'media-api', 'media-api', 'youtube-file-update', 'doYoutubeFileUpdate', 'youtube-file-update', 'single', 1, 'queue');

-- --------------------------------------------------------

--
-- Table structure for table `queue_commands`
--

DROP TABLE IF EXISTS `queue_commands`;
CREATE TABLE IF NOT EXISTS `queue_commands` (
  `cq_index` int(10) NOT NULL AUTO_INCREMENT,
  `cq_mq_index` int(10) DEFAULT '0',
  `cq_command` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `cq_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cq_data` text COLLATE utf8_unicode_ci,
  `cq_result` text COLLATE utf8_unicode_ci,
  `cq_time` datetime DEFAULT NULL,
  `cq_update` datetime DEFAULT NULL,
  `cq_wf_step` int(11) NOT NULL DEFAULT '1',
  `cq_status` enum('Y','N','F','R','C') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`cq_index`),
  KEY `cq_mq_index` (`cq_mq_index`),
  KEY `cq_time` (`cq_time`),
  KEY `cq_status` (`cq_status`),
  KEY `cq_wf_step` (`cq_wf_step`),
  KEY `cq_filename` (`cq_filename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=17 ;

--
-- Dumping data for table `queue_commands`
--

INSERT INTO `queue_commands` (`cq_index`, `cq_mq_index`, `cq_command`, `cq_filename`, `cq_data`, `cq_result`, `cq_time`, `cq_update`, `cq_wf_step`, `cq_status`) VALUES
(1, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml","cqIndex":"1","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/1_HelloWorld%2F3gp%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/3gp/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(2, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml","cqIndex":"2","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/2_HelloWorld%2Faudio%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/audio/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(3, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml","cqIndex":"3","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/3_HelloWorld%2Fdesktop%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(4, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml","cqIndex":"4","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/4_HelloWorld%2Fhd%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/hd/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(5, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml","cqIndex":"5","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/5_HelloWorld%2Fiphone%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/iphone/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(6, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml","cqIndex":"6","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/6_HelloWorld%2Fipod%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(7, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml","cqIndex":"7","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/7_HelloWorld%2Flarge%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/large/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(8, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml","cqIndex":"8","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/8_HelloWorld%2Ftranscript%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/transcript/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(9, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml","cqIndex":"9","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/9_HelloWorld%2Fyoutube%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/youtube/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(10, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml","cqIndex":"10","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/10_HelloWorld%2Fextra%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/extra/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(11, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml","cqIndex":"11","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/11_HelloWorld%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:04', 3, 'C'),
(12, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml","cqIndex":"12","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/12_HelloWorld%2Fhigh%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/high/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:06', 3, 'C'),
(13, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml","cqIndex":"13","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/13_HelloWorld%2Fipod-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:06', 3, 'C'),
(14, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml","cqIndex":"14","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/14_HelloWorld%2Fdesktop-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:06', 3, 'C'),
(15, 1, 'transfer-file-to-media-server', 'rss2.xml', '{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml"}', '{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml","cqIndex":"15","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/15_HelloWorld%2Fepub%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/epub/rss2.xml","status":"Y","mqIndex":"1","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:06', 3, 'C'),
(16, 2, 'transfer-file-to-media-server', 'htaccess', '{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess"}', '{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess","cqIndex":"16","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/16_HelloWorld%2Fhtaccess to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/.htaccess","status":"Y","mqIndex":"2","step":"3"}', '2011-08-12 14:51:52', '2011-08-12 14:52:06', 3, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `queue_messages`
--

DROP TABLE IF EXISTS `queue_messages`;
CREATE TABLE IF NOT EXISTS `queue_messages` (
  `mq_index` int(10) NOT NULL AUTO_INCREMENT,
  `mq_command` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mq_number` int(10) NOT NULL,
  `mq_returned` int(10) NOT NULL,
  `mq_failed` int(4) NOT NULL,
  `mq_time_start` datetime DEFAULT NULL,
  `mq_time_complete` datetime DEFAULT NULL,
  `mq_result` text COLLATE utf8_unicode_ci NOT NULL,
  `mq_retry_count` int(10) NOT NULL,
  `mq_status` enum('Y','N','R','F','C','S','T') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mq_index`),
  KEY `mq_time_start` (`mq_time_start`),
  KEY `mq_status` (`mq_status`),
  KEY `mq_command` (`mq_command`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=3 ;

--
-- Dumping data for table `queue_messages`
--

INSERT INTO `queue_messages` (`mq_index`, `mq_command`, `mq_number`, `mq_returned`, `mq_failed`, `mq_time_start`, `mq_time_complete`, `mq_result`, `mq_retry_count`, `mq_status`) VALUES
(1, 'transfer-file-to-media-server', 15, 0, 0, '2011-08-12 14:51:52', '2011-08-12 14:52:06', '[{"source_path":"HelloWorld/3gp/","source_filename":"rss2.xml","destination_path":"HelloWorld/3gp/","destination_filename":"rss2.xml","cqIndex":"1","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/1_HelloWorld%2F3gp%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/3gp/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/audio/","source_filename":"rss2.xml","destination_path":"HelloWorld/audio/","destination_filename":"rss2.xml","cqIndex":"2","number":2,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/2_HelloWorld%2Faudio%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/audio/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop/","destination_filename":"rss2.xml","cqIndex":"3","number":3,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/3_HelloWorld%2Fdesktop%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/hd/","source_filename":"rss2.xml","destination_path":"HelloWorld/hd/","destination_filename":"rss2.xml","cqIndex":"4","number":4,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/4_HelloWorld%2Fhd%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/hd/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/iphone/","source_filename":"rss2.xml","destination_path":"HelloWorld/iphone/","destination_filename":"rss2.xml","cqIndex":"5","number":5,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/5_HelloWorld%2Fiphone%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/iphone/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod/","destination_filename":"rss2.xml","cqIndex":"6","number":6,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/6_HelloWorld%2Fipod%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/large/","source_filename":"rss2.xml","destination_path":"HelloWorld/large/","destination_filename":"rss2.xml","cqIndex":"7","number":7,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/7_HelloWorld%2Flarge%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/large/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/transcript/","source_filename":"rss2.xml","destination_path":"HelloWorld/transcript/","destination_filename":"rss2.xml","cqIndex":"8","number":8,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/8_HelloWorld%2Ftranscript%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/transcript/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/youtube/","source_filename":"rss2.xml","destination_path":"HelloWorld/youtube/","destination_filename":"rss2.xml","cqIndex":"9","number":9,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/9_HelloWorld%2Fyoutube%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/youtube/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/extra/","source_filename":"rss2.xml","destination_path":"HelloWorld/extra/","destination_filename":"rss2.xml","cqIndex":"10","number":10,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/10_HelloWorld%2Fextra%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/extra/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/","source_filename":"rss2.xml","destination_path":"HelloWorld/","destination_filename":"rss2.xml","cqIndex":"11","number":11,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/11_HelloWorld%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/high/","source_filename":"rss2.xml","destination_path":"HelloWorld/high/","destination_filename":"rss2.xml","cqIndex":"12","number":12,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/12_HelloWorld%2Fhigh%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/high/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/ipod-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/ipod-all/","destination_filename":"rss2.xml","cqIndex":"13","number":13,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/13_HelloWorld%2Fipod-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/ipod-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/desktop-all/","source_filename":"rss2.xml","destination_path":"HelloWorld/desktop-all/","destination_filename":"rss2.xml","cqIndex":"14","number":14,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/14_HelloWorld%2Fdesktop-all%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/desktop-all/rss2.xml","status":"Y","mqIndex":"1","step":"3"},{"source_path":"HelloWorld/epub/","source_filename":"rss2.xml","destination_path":"HelloWorld/epub/","destination_filename":"rss2.xml","cqIndex":"15","number":15,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/15_HelloWorld%2Fepub%2Frss2.xml to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/epub/rss2.xml","status":"Y","mqIndex":"1","step":"3"}]', 1, 'C'),
(2, 'transfer-file-to-media-server', 1, 0, 0, '2011-08-12 14:51:52', '2011-08-12 14:52:06', '[{"source_path":"HelloWorld/","destination_path":"HelloWorld/","source_filename":"htaccess","destination_filename":".htaccess","cqIndex":"16","number":1,"result":"Y","debug":"/data/web/media-podcast-api-dev.open.ac.uk/file-transfer/destination/16_HelloWorld%2Fhtaccess to /data/web/media-podcast-dev.open.ac.uk/www/feeds/HelloWorld/.htaccess","status":"Y","mqIndex":"2","step":"3"}]', 1, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `workflow_map`
--

DROP TABLE IF EXISTS `workflow_map`;
CREATE TABLE IF NOT EXISTS `workflow_map` (
  `wm_index` int(10) NOT NULL AUTO_INCREMENT,
  `wm_workflow` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_aspect_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_watermark_bumper_trailer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_watermark_only` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_nothing_added` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_media_root` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_outputfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_mimetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_target_folder` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_flavour` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wm_target_filename` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wm_index`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=561 ;

--
-- Dumping data for table `workflow_map`
--

INSERT INTO `workflow_map` (`wm_index`, `wm_workflow`, `wm_type`, `wm_aspect_ratio`, `wm_height`, `wm_watermark_bumper_trailer`, `wm_watermark_only`, `wm_nothing_added`, `wm_media_root`, `wm_outputfile`, `wm_mimetype`, `wm_target_folder`, `wm_flavour`, `wm_target_filename`) VALUES
(1, 'video-wide-240-watermark-trailers', 'video', '16:9', '<= 240', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(2, 'video-wide-240-watermark-trailers', 'video', '16:9', '<= 240', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(3, 'video-wide-240-watermark-trailers', 'video', '16:9', '<= 240', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(4, 'video-wide-240-watermark', 'video', '16:9', '<= 240', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(5, 'video-wide-240-watermark', 'video', '16:9', '<= 240', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(6, 'video-wide-240-watermark', 'video', '16:9', '<= 240', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(7, 'video-wide-240', 'video', '16:9', '<= 240', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(8, 'video-wide-240', 'video', '16:9', '<= 240', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(9, 'video-wide-240', 'video', '16:9', '<= 240', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(10, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(11, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(12, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(13, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(14, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(15, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(16, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(17, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(18, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(19, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(20, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(21, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(22, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(23, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(24, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(25, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(26, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(27, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(28, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(29, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(30, 'video-wide-360', 'video', '16:9', '<= 360', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(31, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(32, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(33, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(34, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(35, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(36, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(37, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(38, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(39, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(40, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(41, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(42, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(43, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(44, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(45, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(46, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(47, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(48, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(49, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(50, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(51, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(52, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(53, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(54, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(55, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(56, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(57, 'video-wide-480', 'video', '16:9', '<= 480', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(58, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(59, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(60, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(61, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(62, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(63, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(64, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(65, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(66, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(67, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(68, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(69, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(70, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(71, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(72, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(73, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(74, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(75, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(76, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(77, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(78, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(79, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(80, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(81, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(82, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(83, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(84, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(85, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(86, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(87, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(88, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(89, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(90, 'video-wide-576', 'video', '16:9', '<= 576', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(91, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(92, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(93, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(94, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(95, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(96, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(97, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(98, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(99, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(100, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(101, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(102, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(103, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(104, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(105, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(106, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(107, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(108, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(109, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(110, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(111, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(112, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(113, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(114, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(115, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(116, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(117, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(118, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(119, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(120, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(121, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(122, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(123, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(124, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(125, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(126, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(127, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(128, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(129, 'video-wide-720', 'video', '16:9', '<= 720', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(130, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(131, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(132, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(133, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(134, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(135, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(136, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-1080', '.m4v', '/', '1080p', '-1080.m4v'),
(137, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(138, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(139, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(140, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(141, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(142, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(143, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-hd-1080', '.m4v', 'hd-1080/', 'hd-1080', '.m4v'),
(144, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(145, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(146, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(147, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(148, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(149, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(150, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(151, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-1080', '.m4v', '/', '1080p', '-1080.m4v'),
(152, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(153, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(154, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(155, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(156, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(157, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(158, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-hd-1080', '.m4v', 'hd-1080/', 'hd-1080', '.m4v'),
(159, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(160, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(161, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(162, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(163, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(164, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(165, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-720', '.m4v', '/', '720p', '-720.m4v'),
(166, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-1080', '.m4v', '/', '1080p', '-1080.m4v'),
(167, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(168, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(169, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(170, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(171, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(172, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-hd', '.m4v', 'hd/', 'hd', '.m4v'),
(173, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-hd-1080', '.m4v', 'hd-1080/', 'hd-1080', '.m4v'),
(174, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(175, 'video-240-watermark-trailers', 'video', '4:3', '<= 240', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(176, 'video-240-watermark-trailers', 'video', '4:3', '<= 240', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(177, 'video-240-watermark-trailers', 'video', '4:3', '<= 240', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(178, 'video-240-watermark', 'video', '4:3', '<= 240', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(179, 'video-240-watermark', 'video', '4:3', '<= 240', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(180, 'video-240-watermark', 'video', '4:3', '<= 240', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(181, 'video-240', 'video', '4:3', '<= 240', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(182, 'video-240', 'video', '4:3', '<= 240', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(183, 'video-240', 'video', '4:3', '<= 240', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(184, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(185, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(186, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(187, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(188, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(189, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(190, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(191, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(192, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(193, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(194, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(195, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(196, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(197, 'video-360-watermark', 'video', '4:3', '<= 360', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(198, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(199, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(200, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(201, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(202, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(203, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(204, 'video-360', 'video', '4:3', '<= 360', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(205, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(206, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(207, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(208, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(209, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(210, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(211, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(212, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(213, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(214, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(215, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(216, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(217, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(218, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(219, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(220, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(221, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(222, 'video-480-watermark', 'video', '4:3', '<= 480', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(223, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(224, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(225, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(226, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(227, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(228, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(229, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(230, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(231, 'video-480', 'video', '4:3', '<= 480', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(232, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(233, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(234, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(235, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(236, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(237, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(238, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(239, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(240, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(241, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(242, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', 'Y', '', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(243, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(244, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(245, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(246, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(247, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(248, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(249, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(250, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(251, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(252, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(253, 'video-576-watermark', 'video', '4:3', '<= 576', '', 'Y', '', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(254, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-240', '.m4v', '/', '240p', '-240.m4v'),
(255, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-270', '.m4v', '/', '270p', '-270.m4v'),
(256, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-360', '.m4v', '/', '360p', '-360.m4v'),
(257, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-480', '.m4v', '/', '480p', '-480.m4v'),
(258, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-540', '.m4v', '/', '540p', '-540.m4v'),
(259, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-ipod', '.m4v', 'ipod/', 'ipod', '.m4v'),
(260, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-iphone', '.m4v', 'iphone/', 'iphone', '.m4v'),
(261, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-iphonecellular', '.m4v', 'iphone/', 'iphonecellar', '.3gp'),
(262, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-desktop', '.m4v', 'desktop/', 'desktop', '.m4v'),
(263, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-large', '.m4v', 'large/', 'large', '.m4v'),
(264, 'video-576', 'video', '4:3', '<= 576', '', '', 'Y', './feeds', '-youtube', '.mov', 'youtube/', 'youtube', '.mov'),
(265, 'audio-trailers', 'audio', '-', '-', 'Y', '', '', './feeds', '-mp3', '.mp3', '/', 'default', '.mp3'),
(266, 'audio-trailers', 'audio', '', '', 'Y', '', '', './feeds', '-trailers-mp3', '.mp3', 'ipod-all/', 'ipod-all', '.mp3'),
(267, 'audio-trailers', 'audio', '', '', 'Y', '', '', '', '', '', 'desktop-all/', 'desktop-all', '.mp3'),
(268, 'audio-trailers', 'audio', '', '', 'Y', '', '', '', '', '', 'hd/', 'hd', '.mp3'),
(269, 'audio-trailers', 'audio', '', '', 'Y', '', '', '', '', '', 'hd-1080/', 'hd-1080', '.mp3'),
(270, 'audio-no-trailers', 'audio', '-', '-', '', '', 'Y', './feeds', '-mp3', '.mp3', '/', 'default', '.mp3'),
(271, 'audio-no-trailers', 'audio', '', '', '', '', 'Y', '', '', '', 'ipod-all/', 'ipod-all', '.mp3'),
(272, 'audio-no-trailers', 'audio', '', '', '', '', 'Y', '', '', '', 'desktop-all/', 'desktop-all', '.mp3'),
(273, 'audio-no-trailers', 'audio', '', '', '', '', 'Y', '', '', '', 'hd/', 'hd', '.mp3'),
(274, 'audio-no-trailers', 'audio', '', '', '', '', 'Y', '', '', '', 'hd-1080/', 'hd-1080', '.mp3'),
(275, 'video-wide', 'video', '', '', '', '', '', './feeds', '-360p', '.mov', '/', 'default', '.mov'),
(276, 'video', 'video', '', '', '', '', '', './feeds', '-480p', '.mov', '/', 'default', '.mov'),
(277, 'screencast-wide', 'video', '', '', '', '', '', './feeds', '-c', '.mov', '/', 'default', '.mov'),
(278, 'screencast', 'video', '', '', '', '', '', './feeds', '-c', '.mov', '/', 'default', '.mov'),
(279, 'multi-video-wide', 'video', '', '', '', '', '', './feeds', '-270p', '.mov', '/', '270p', '-270p.mov'),
(280, 'multi-video-wide', 'video', '', '', '', '', '', './feeds', '-360p', '.mov', '/', '360p', '-360p.mov'),
(281, 'multi-video-wide', 'video', '', '', '', '', '', './feeds', '-270p', '.webm', '/', '?', '-270p.webm'),
(282, 'multi-video-wide', 'video', '', '', '', '', '', './feeds', '-360p', '.webm', '/', '?', '-360p.webm'),
(283, 'multi-video', 'video', '', '', '', '', '', './feeds', '-360p', '.mov', '/', '270p', '-360p.mov'),
(284, 'multi-video', 'video', '', '', '', '', '', './feeds', '-480p', '.mov', '/', '360p', '-480p.mov'),
(285, 'multi-video', 'video', '', '', '', '', '', './feeds', '-360p', '.webm', '/', '?', '-360p.webm'),
(286, 'multi-video', 'video', '', '', '', '', '', './feeds', '-480p', '.webm', '/', '?', '-480p.webm'),
(287, 'audio', 'audio', '', '', '', '', '', './feeds', '-c', '.mp3', '/', 'default', '.mov'),
(289, 'video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(290, 'video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(291, 'video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(292, 'video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(293, 'video', 'video', '', '', '', '', '', './feeds-vle', '-480p', '.mov', 'desktop/', 'desktop', '.mov'),
(294, 'video', 'video', '', '', '', '', '', './feeds-vle', '-720p', '.mov', 'high/', '', '.mov'),
(295, 'video', 'video', '', '', '', '', '', './feeds-vle', '-1080p', '.mov', 'hd/', '', '.mov'),
(296, 'video', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(297, 'screencast-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(298, 'screencast-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(299, 'screencast-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(300, 'screencast-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(301, 'screencast', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(302, 'screencast', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(303, 'screencast', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(304, 'screencast', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(305, 'multi-video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(306, 'multi-video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(307, 'multi-video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(308, 'multi-video-wide', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(309, 'multi-video', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(310, 'multi-video', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(311, 'multi-video', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(312, 'multi-video', 'video', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(313, 'audio', 'audio', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(314, 'audio', 'audio', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(315, 'audio', 'audio', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(316, 'audio', 'audio', '', '', '', '', '', './feeds-vle', '', '', '/', '', ''),
(512, 'video-wide-240-watermark-trailers', 'video', '16:9', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(513, 'video-wide-240-watermark', 'video', '16:9', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(514, 'video-wide-240', 'video', '16:9', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(515, 'video-wide-360-watermark-trailers', 'video', '16:9', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(516, 'video-wide-360-watermark', 'video', '16:9', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(517, 'video-wide-360', 'video', '16:9', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(518, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(519, 'video-wide-480-watermark-trailers', 'video', '16:9', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(520, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(521, 'video-wide-480-watermark', 'video', '16:9', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(522, 'video-wide-480', 'video', '16:9', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(523, 'video-wide-480', 'video', '16:9', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(524, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(525, 'video-wide-576-watermark-trailers', 'video', '16:9', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(526, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(527, 'video-wide-576-watermark', 'video', '16:9', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(528, 'video-wide-576', 'video', '16:9', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(529, 'video-wide-576', 'video', '16:9', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(530, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(531, 'video-wide-720-watermark-trailers', 'video', '16:9', '<= 720', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(532, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(533, 'video-wide-720-watermark', 'video', '16:9', '<= 720', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(534, 'video-wide-720', 'video', '16:9', '<= 720', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(535, 'video-wide-720', 'video', '16:9', '<= 720', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(536, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(537, 'video-wide-1080-watermark-trailers', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(538, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(539, 'video-wide-1080-watermark', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(540, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(541, 'video-wide-1080', 'video', '16:9', '<= 1080', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(542, 'video-240-watermark-trailers', 'video', '4:3', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(543, 'video-240-watermark', 'video', '4:3', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(544, 'video-240', 'video', '4:3', '<= 240', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod', '.m4v'),
(545, 'video-360-watermark-trailers', 'video', '4:3', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(546, 'video-360-watermark', 'video', '4:3', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(547, 'video-360', 'video', '4:3', '<= 360', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(548, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(549, 'video-480-watermark-trailers', 'video', '4:3', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(550, 'video-480-watermark', 'video', '4:3', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(551, 'video-480-watermark', 'video', '4:3', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(552, 'video-480', 'video', '4:3', '<= 480', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(553, 'video-480', 'video', '4:3', '<= 480', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(554, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(555, 'video-576-watermark-trailers', 'video', '4:3', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(556, 'video-576-watermark', 'video', '4:3', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(557, 'video-576-watermark', 'video', '4:3', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(558, 'video-576', 'video', '4:3', '<= 576', '', '', '', './feeds', '-ipod', '.m4v', 'ipod-all/', 'ipod-all', '.m4v'),
(559, 'video-576', 'video', '4:3', '<= 576', '', '', '', './feeds', '-desktop', '.m4v', 'desktop-all/', 'desktop-all', '.m4v'),
(560, 'video', 'video', '', '', '', '', '', './feeds-vle', '-480p', '.mov', '/', 'default', '.mov');
