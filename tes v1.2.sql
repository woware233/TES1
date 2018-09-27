# Host: localhost  (Version 5.0.96-community-nt)
# Date: 2018-09-27 10:52:39
# Generator: MySQL-Front 6.0  (Build 2.29)


#
# Structure for table "classes"
#

DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `ClassID` int(11) NOT NULL auto_increment,
  `ClassCode` varchar(255) default NULL,
  `ClassMajor` varchar(255) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "classes"
#

INSERT INTO `classes` VALUES (1,'001','软件工程','0'),(2,'002','金融管理','0'),(3,'003','对外贸易','0');

#
# Structure for table "curriculum"
#

DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum` (
  `CurriculumID` int(11) NOT NULL auto_increment,
  `CurriculumCode` int(11) default NULL,
  `CurriculumName` varchar(255) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`CurriculumID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "curriculum"
#

INSERT INTO `curriculum` VALUES (1,111,'软件工程','0'),(2,222,'金融管理','0'),(3,333,'对外贸易','0');

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DeptID` int(11) NOT NULL auto_increment,
  `DeptCode` int(11) default NULL,
  `DeptName` varchar(255) default NULL,
  `DeptDesn` varchar(255) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`DeptID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "department"
#

INSERT INTO `department` VALUES (1,159,'软件系',NULL,'0'),(2,158,'金融系',NULL,'0'),(3,157,'贸易系',NULL,'0');

#
# Structure for table "menu"
#

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MenuID` int(11) NOT NULL auto_increment,
  `MenuName` varchar(255) default NULL,
  `ParentID` int(11) default NULL,
  `Url` varchar(255) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "menu"
#


#
# Structure for table "relation"
#

DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `Id` int(11) NOT NULL auto_increment,
  `StudentCode` varchar(255) default NULL,
  `ClassCode` varchar(255) default NULL,
  `CurriculumCode` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "relation"
#


#
# Structure for table "rolepermissions"
#

DROP TABLE IF EXISTS `rolepermissions`;
CREATE TABLE `rolepermissions` (
  `RoleID` int(11) NOT NULL default '0',
  `TreeID` int(11) default NULL,
  `ParentID` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "rolepermissions"
#

INSERT INTO `rolepermissions` VALUES (1,8,7),(2,10,10),(3,9,7),(4,1,0),(2,9,7),(3,8,7),(1,10,0),(1,7,0),(3,8,7),(3,10,10),(4,2,1),(4,3,1),(4,4,1),(4,5,0),(4,6,0);

#
# Structure for table "roles"
#

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL auto_increment,
  `RoleName` varchar(255) default NULL,
  `RoleDesc` varchar(255) default NULL,
  `PerMission` varchar(255) default NULL,
  `Baoliu` char(1) default '1',
  PRIMARY KEY  (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "roles"
#

INSERT INTO `roles` VALUES (1,'学生','学生','三级','1'),(2,'教师','教师','二级','1'),(3,'主任','主任','二级','1'),(4,'教务处','管理员','一级','1');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL auto_increment,
  `StudentCode` int(11) default NULL,
  `StudentName` varchar(255) default NULL,
  `SudentSex` int(1) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (1,159000713,'李达尧',0,'0'),(2,159000701,'牟博维',0,'0'),(3,159000720,'江震宇',0,'0');

#
# Structure for table "teacher"
#

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `TeacherID` int(11) NOT NULL auto_increment,
  `TeacherCode` int(11) default NULL,
  `TeacherName` varchar(255) default NULL,
  `TeacherSex` char(1) default NULL,
  `level` varchar(255) default NULL,
  `State` char(1) default '0',
  PRIMARY KEY  (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "teacher"
#

INSERT INTO `teacher` VALUES (1,12123,'木子','0','2','0'),(2,12121,'子木','1','1','0'),(3,12122,'木木子','1','3','0');

#
# Structure for table "tree"
#

DROP TABLE IF EXISTS `tree`;
CREATE TABLE `tree` (
  `TreeID` int(11) NOT NULL auto_increment,
  `Text` varchar(255) default NULL,
  `Desn` varchar(255) default NULL,
  `ParentID` int(11) default NULL,
  `Url` varchar(255) default NULL,
  PRIMARY KEY  (`TreeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "tree"
#

INSERT INTO `tree` VALUES (1,'用户管理','用户信息管理',0,'11'),(2,'学生管理','学生信息管理',1,'22'),(3,'教师管理','教师信息管理',1,'33'),(4,'主任管理','主任信息管理',1,'44'),(5,'问卷管理','问卷信息管理',0,'55'),(6,'问题管理','问题信息管理',0,'44'),(7,'评教管理','评教信息管理',0,'11'),(8,'评价教师','评价教师',7,'11'),(9,'评价同行','评价同行',7,'11'),(10,'个人信息','个人信息管理',0,'11');

#
# Structure for table "userroles"
#

DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles` (
  `RoleID` int(11) NOT NULL default '0',
  `UserID` int(11) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userroles"
#

INSERT INTO `userroles` VALUES (1,1),(1,2),(4,3),(2,4),(3,5);

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL default '0',
  `UserName` varchar(255) default NULL,
  `Password` varchar(255) default NULL,
  `UserType` int(11) default NULL,
  `RealName` varchar(255) default NULL,
  `Email` varchar(255) default NULL,
  `State` int(11) default '0',
  `Baoliu` char(1) default '1',
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'159000701','123',NULL,'mbw','123',0,'1'),(2,'159000713','123',NULL,'dsa','123',0,'1'),(3,'123','123',NULL,'qwfd','123',0,'1'),(4,'12123','123',NULL,'wdq','123',0,'1'),(5,'213','123',NULL,'wwqw','123',0,'1');
