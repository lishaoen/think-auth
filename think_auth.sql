-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?05 �?21 �?14:13
-- 服务器版本: 5.5.53
-- PHP 版本: 7.0.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `think_lishaoen`
--

-- --------------------------------------------------------

--
-- 表的结构 `app_auth_group`
--

CREATE TABLE IF NOT EXISTS `app_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则","隔开',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户组表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `app_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `app_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户uid',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户组明细表';

-- --------------------------------------------------------

--
-- 表的结构 `app_auth_member`
--

CREATE TABLE IF NOT EXISTS `app_auth_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户uid',
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户密码',
  `email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户手机',
  `gender` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL COMMENT '生日',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态，-1:回收删除；0：待审核；1：审核通过',
  `salt` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '头像',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `logintime` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `loginip` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `token` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Token',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `app_auth_member`
--

INSERT INTO `app_auth_member` (`uid`, `group_id`, `username`, `nickname`, `password`, `email`, `mobile`, `gender`, `birthday`, `status`, `salt`, `avatar`, `create_time`, `update_time`, `logintime`, `loginip`, `token`, `score`) VALUES
(1, 0, 'admin', '', '', '', '', 0, '0000-00-00', 1, '', '', 1517280353, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `app_auth_rule`
--

CREATE TABLE IF NOT EXISTS `app_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `condition` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `icon` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '图标',
  `sort` smallint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='规则表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
