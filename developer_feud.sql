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

 Date: 06/16/2018 13:57:59 PM
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
--  Table structure for `votes`
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `AnswerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  UNIQUE KEY `unique_key` (`AnswerID`,`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
