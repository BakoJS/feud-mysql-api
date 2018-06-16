/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost
 Source Database       : developer_feud

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : utf-8

 Date: 06/16/2018 13:58:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `answers`
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `AnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `FK_QuestionID` int(11) NOT NULL,
  `AnswerText` text NOT NULL,
  `AnswerVotes` int(11) NOT NULL,
  `createDate` datetime NOT NULL,
  `deleteDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AnswerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionText` text NOT NULL,
  `FK_UserID` int(11) NOT NULL,
  `createDate` datetime NOT NULL,
  `deleteDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`QuestionID`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `questions`
-- ----------------------------
BEGIN;
INSERT INTO `questions` VALUES ('1', 'What is the Best Javascript Library', '1', '2018-06-14 21:37:32', null, null), ('2', 'How many JS libraries is the perfect amount', '1', '2018-06-14 21:37:32', null, null), ('3', 'Code optimization, what makes the biggest impact', '1', '2018-06-14 21:37:32', null, null), ('4', 'What is the best database engine', '1', '2018-06-14 21:37:32', null, null), ('5', 'Best way to search for solutions', '1', '2018-06-14 21:37:32', null, null), ('6', 'Best source control tool', '1', '2018-06-14 21:37:32', null, null), ('7', 'What is the most secure encryption', '1', '2018-06-14 21:37:32', null, null), ('8', 'When should you decide to create a microservice', '1', '2018-06-14 21:37:32', null, null), ('9', 'What is the best testing suite', '1', '2018-06-14 21:37:32', null, null), ('10', 'Name something that gets stale.', '1', '2018-06-14 21:37:32', null, null), ('11', 'On what day of the week is it hardest to get out of bed?', '1', '2018-06-14 21:37:32', null, null), ('12', 'Name something that a developer who just got hired might be hesitant to do.', '1', '2018-06-14 21:37:32', null, null), ('13', 'What\'s something a young developer argues about the most in their first year of programming?', '1', '2018-06-14 21:37:32', null, null), ('14', 'What is the best place to buy all of your tech/supplies?', '1', '2018-06-14 21:37:32', null, null), ('15', 'Name something you don\'t like people doing to your code', '1', '2018-06-14 21:37:32', null, null), ('16', 'What\'s something a developer can get away with if they don?t work on a team', '1', '2018-06-14 21:37:32', null, null), ('17', 'Name a state where you\'d expect to find the least amount of progarmmers', '1', '2018-06-14 21:37:32', null, null), ('18', 'On which day are most bugs reported?', '1', '2018-06-14 21:37:32', null, null), ('19', 'Name something that female developer do better than men', '1', '2018-06-14 21:37:32', null, null), ('20', 'Name something you might ask someone to do to your code', '1', '2018-06-14 21:37:32', null, null), ('21', 'Name something that project managers are not supposed to be able to do.', '1', '2018-06-14 21:37:32', null, null), ('22', 'If you were given a 6 year old code base, what would you have a hard time doing to it', '1', '2018-06-14 21:37:32', null, null), ('23', 'Tell me something programmers do for hours and hours.', '1', '2018-06-14 21:37:32', null, null), ('24', 'Name a JavaScript library starting with the letter \"J\"', '1', '2018-06-14 21:37:32', null, null), ('25', 'Name a job that you could automate away', '1', '2018-06-14 21:37:32', null, null), ('26', 'Name something a programmer might lose that can ruin their day', '1', '2018-06-14 21:37:32', null, null), ('27', 'How many hours on average are spent tracking down a bug', '1', '2018-06-14 21:37:32', null, null), ('28', 'What could the phrase \"is it in\" be referring to', '1', '2018-06-14 21:37:32', null, null), ('29', 'Name something gaurenteed to turn excite a programmer', '1', '2018-06-14 21:37:32', null, null), ('30', 'Tell me something developers do to pass the time', '1', '2018-06-14 21:37:32', null, null), ('31', 'Name something that turns programmers into grouches if they try to go too long without it.', '1', '2018-06-14 21:37:32', null, null), ('32', 'Tell me something you hope won\'t happen when you\'re driving.', '1', '2018-06-14 21:37:32', null, null), ('33', 'When a client breaks the direction of a project, name something of the clients you would like to break.', '1', '2018-06-14 21:37:32', null, null), ('34', 'What is the most common error that appears in code', '1', '2018-06-14 21:37:32', null, null), ('35', 'Tell me something that a developer might lie about on a resume', '1', '2018-06-14 21:37:32', null, null), ('36', 'Give me a word that rhymes with \"charts.\"', '1', '2018-06-14 21:37:32', null, null), ('37', 'What is the biggest complaint when taking over a code base', '1', '2018-06-14 21:37:32', null, null), ('38', 'What is the most productive time for a programmer', '1', '2018-06-14 21:37:32', null, null), ('39', 'What\'s a developers worst enemy?', '1', '2018-06-14 21:37:32', null, null), ('40', 'If you got fired from your job on Monday, name something you might do on Tuesday.', '1', '2018-06-14 21:37:32', null, null), ('41', 'Name something everybody knows about JavaScript', '1', '2018-06-14 21:37:32', null, null), ('42', 'Name something a programmer keeps near them when they work.', '1', '2018-06-14 21:37:32', null, null), ('43', 'Name something about their jobs that developers hate.', '1', '2018-06-14 21:37:32', null, null), ('44', 'Name something at which many developers fail the first time they try it.', '1', '2018-06-14 21:37:32', null, null), ('45', 'Name something developers have second thoughts about after they decide to do it.', '1', '2018-06-14 21:37:32', null, null), ('46', 'Name something you spend more money on the older you get.', '1', '2018-06-14 21:37:32', null, null), ('47', 'Name the worst thing someone could find during a code review', '1', '2018-06-14 21:37:32', null, null), ('48', 'Name something people say when they first see a new website', '1', '2018-06-14 21:37:32', null, null), ('49', 'Name something that could happen when you don\'t meet your project deadline', '1', '2018-06-14 21:37:32', null, null), ('50', 'Name something that wouldn\'t get done right if you didn\'t do it.', '1', '2018-06-14 21:37:32', null, null), ('51', 'Name something developers like to critique', '1', '2018-06-14 21:37:32', null, null), ('52', 'Tell me something with the word \"Code\" in it.', '1', '2018-06-14 21:37:32', null, null), ('53', 'hello', '0', '2018-06-15 00:09:05', null, '2018-06-15 00:09:05'), ('54', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:15:34', null, '2018-06-15 00:15:34'), ('55', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:17:00', null, '2018-06-15 00:17:00'), ('56', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:17:35', null, '2018-06-15 00:17:35'), ('57', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:19:52', null, '2018-06-15 00:19:52'), ('58', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:21:58', null, '2018-06-15 00:21:58'), ('59', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:22:33', null, '2018-06-15 00:22:33'), ('60', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:24:33', null, '2018-06-15 00:24:33'), ('61', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:29:34', null, '2018-06-15 00:29:34'), ('62', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:31:16', null, '2018-06-15 00:31:16'), ('63', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:31:27', null, '2018-06-15 00:31:27'), ('64', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:32:29', null, '2018-06-15 00:32:29'), ('65', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:32:51', '2018-06-15 00:37:24', '2018-06-15 00:32:51'), ('66', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:50:28', null, '2018-06-15 00:50:28'), ('67', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:53:45', null, '2018-06-15 00:53:45'), ('68', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:54:29', null, '2018-06-15 00:54:29'), ('69', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:55:02', null, '2018-06-15 00:55:02'), ('70', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:56:16', null, '2018-06-15 00:56:16'), ('71', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:56:28', null, '2018-06-15 00:56:28'), ('72', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:57:05', null, '2018-06-15 00:57:05'), ('73', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 00:59:13', null, '2018-06-15 00:59:13'), ('74', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:03:33', null, '2018-06-15 01:03:33'), ('75', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:03:57', null, '2018-06-15 01:03:57'), ('76', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:05:02', null, '2018-06-15 01:05:02'), ('77', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:05:34', null, '2018-06-15 01:05:34'), ('78', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:06:15', null, '2018-06-15 01:06:15'), ('79', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:13:51', null, '2018-06-15 01:13:51'), ('80', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:14:13', null, '2018-06-15 01:14:13'), ('81', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:15:06', null, '2018-06-15 01:15:06'), ('82', 'Name something you don\'t like people doing to your code', '0', '2018-06-15 01:17:18', null, '2018-06-15 01:17:18');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fName` varchar(255) DEFAULT NULL,
  `lName` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createDate` datetime NOT NULL,
  `deleteDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'Admin', null, 'bakojs@gmail.com', 'bakojs', '2018-06-14 15:16:09', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `votes`
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `AnswerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  UNIQUE KEY `unique_key` (`AnswerID`,`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
