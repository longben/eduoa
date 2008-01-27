/*
MySQL Data Transfer
Source Host: localhost
Source Database: eduoa
Target Host: localhost
Target Database: eduoa
Date: 2008-01-28 04:22:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for modules
-- ----------------------------
CREATE TABLE `modules` (
  `id` int(10) NOT NULL auto_increment COMMENT '主键',
  `module_name` varchar(60) NOT NULL COMMENT '栏目(功能) 名称',
  `module_type` int(3) default NULL COMMENT '栏目(功能) 类型 (1:系统模块 2:oa系统固定模板 3:网站栏目)',
  `parent_id` int(10) default NULL COMMENT '上级栏目id',
  `hierarchy` int(3) default '1' COMMENT '级别',
  `node` int(1) default '0' COMMENT '节点 (1:根  0:节点 )',
  `image_uri` varchar(200) default NULL COMMENT '栏目图标 (限止大小、长度、宽度)',
  `url` varchar(200) default NULL COMMENT '链接地址',
  `target` varchar(20) default NULL COMMENT '打开方式 (_top/_self/_parent/_winname/_blank)',
  `allow_del` int(1) default NULL COMMENT '此栏目是否允许删除(1：允许 0：不允许)',
  `allow_add` int(1) default NULL COMMENT '此栏目是否允许新增子栏目(1：允许 0：不允许)',
  `allow_publish` int(1) default NULL COMMENT '此栏目是否允许上文章',
  `duty_person` varchar(200) default NULL COMMENT '栏目责任人',
  `duty_company` int(10) default NULL COMMENT '栏目责任单位',
  `duty_lead` varchar(200) default NULL COMMENT '栏目责任领导',
  `order_list` int(10) default NULL COMMENT '栏目的排序',
  `max_num` int(10) default '5' COMMENT '每页最大显示记录数',
  `visit_count` int(10) default NULL COMMENT '栏目被访问的次数',
  `page_type` int(1) default NULL COMMENT '页面类别(1：菜单  2：栏目)',
  `memo` varchar(2000) default NULL COMMENT '备注',
  `flag` int(1) default '1' COMMENT '有效标志',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=140202 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `modules` VALUES ('1', '我的办公桌', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('101', '内部邮件', '1', '1', '1', '0', null, '/email_boxes/my', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('102', '短消息', '1', '1', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('103', '公告通知', '1', '1', '1', '0', null, '/documents/index/?type=5', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('104', '个人设置', '1', '1', '1', '0', null, '', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('10401', '个人资料', '1', '104', '1', '0', null, '/members/profile', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('10404', '修改密码', '1', '104', '1', '0', null, '/members/password', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('2', '日常事务', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('201', '公告通知管理', '1', '2', '1', '0', null, '', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('20101', '公告管理', '1', '201', '1', '0', null, '/documents/index/?type=5', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('20102', '新建公告', '1', '201', '1', '0', null, '/documents/add/?type=5', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('20103', '公告分组管理 ', '1', '201', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('202', '新闻管理', '1', '2', '1', '0', null, '', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('20201', '新建新闻', '1', '202', '1', '0', null, '/documents/add/?type=6', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('20202', '管理发布', '1', '202', '1', '0', null, '/documents/index/?type=6', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('203', '用户信息', '1', '2', '1', '0', null, '/teachers/public_index', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('204', '部门信息', '1', '2', '1', '0', null, '/departments/?action=view', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('205', '学校信息', '1', '2', '1', '0', null, '/units/view/1', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('4', '资产管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('401', '资产类别', '1', '4', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('40101', '类别管理', '1', '401', '1', '0', null, '/asset_types/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('40102', '使用状态', '1', '401', '1', '0', null, '/asset_statuses/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('40103', '增加方式', '1', '401', '1', '0', null, '/asset_in_methods/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('402', '资产管理', '1', '4', '1', '0', null, '/assets/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('403', '资产借出', '1', '4', '1', '0', null, '/asset_outs/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('404', '资产归还', '1', '4', '1', '0', null, '/asset_ins/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('405', '资产维修', '1', '4', '1', '0', null, '/asset_maintenances/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('5', '教职工管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('501', '基本信息维护', '1', '5', '1', '0', null, '/teachers/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('502', '离职复职查阅', '1', '5', '1', '0', null, '/teacher_is_works/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('503', '奖惩信息查阅', '1', '5', '1', '0', null, '/teacher_rewards/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('504', '教工继续教育', '1', '5', '1', '0', null, '/teacher_continuing_educations/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('505', '任教信息管理', '1', '5', '1', '0', null, '/teachers/teaching', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('6', '教室管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('601', '教学楼管理', '1', '6', '1', '0', null, '/teaching_buildings', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('602', '教室类型设置', '1', '6', '1', '0', null, '/classroom_types', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('603', '教室信息管理', '1', '6', '1', '0', null, '/classrooms', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('604', '教室信息查阅', '1', '6', '1', '0', null, '/classrooms/vlist', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('7', '学籍管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('701', '班级管理', '1', '7', '1', '0', null, '', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('70101', '班级管理', '1', '701', '1', '0', null, '/banjis/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('70102', '班级查阅', '1', '701', '1', '0', null, '/banjis/vlist', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('702', '学生档案', '1', '7', '1', '0', null, '/pages/student_frame', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('703', '调班管理', '1', '7', '1', '0', null, '/pages/student_change_frame', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('704', '学籍异动', '1', '7', '1', '0', null, '/students/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('705', '毕业生管理', '1', '7', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('706', '毕业生信息', '1', '7', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('8', '成长档案', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('801', '成长档案管理', '1', '8', '1', '0', null, '/pages/student_grow_files_frame', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('802', '成长档案查看', '1', '8', '1', '0', null, '/pages/student_grow_files_view_frame', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('9', '成绩管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('901', '班级成绩录入', '1', '9', '1', '0', null, '/exam_results/import', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('902', '班级成绩管理', '1', '9', '1', '0', null, '/exam_results/change', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('903', '班级成绩查询', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('904', '学期成绩查询', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('905', '学期成绩统计', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('906', '不及格名单', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('907', '不及格人数', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('908', '单科成绩排序', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('909', '全年级平均成绩', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('910', '分班不分科成绩平均', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('911', '分科不分班成绩平均', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('912', '分班分科成绩平均', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('913', '尖子生各教师所占比例', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('914', '尖子生各班所占比例', '1', '9', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('10', '金色校园', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1001', '学期信息管理', '1', '10', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('100101', '学期类型', '1', '1001', '1', '0', null, '/semester_types', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('100102', '学期信息', '1', '1001', '1', '0', null, '/semesters', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1002', '课程信息管理', '1', '10', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('100201', '课程管理', '1', '1002', '1', '0', null, '/courses', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('100202', '课程查看', '1', '1002', '1', '0', null, '/courses/vlist', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1003', '教师密码管理', '1', '10', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1004', '学生密码管理', '1', '10', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1005', '班级公告管理', '1', '10', '1', '0', null, '/documents/index/?type=1', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1006', '学生作业管理', '1', '10', '1', '0', null, '/documents/index/?type=2', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1007', '课件下载管理', '1', '10', '1', '0', null, '/documents/index/?type=3', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1008', '同步练习管理', '1', '10', '1', '0', null, '/documents/index/?type=4', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1009', '班级公告(全校)', '1', '10', '1', '0', null, '/documents/all_index/?type=1', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1010', '课件管理(全校)', '1', '10', '1', '0', null, '/documents/all_index/?type=3', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('11', '课表管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1101', '按班级排课', '1', '11', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('110101', '按班排课', '1', '1101', '1', '0', null, '/pages/curriculum_schedule_frame', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1102', '课表信息查询', '1', '11', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('110201', '按教师查', '1', '1102', '1', '0', null, '/curriculum_schedules/teacher', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('110202', '按班级查', '1', '1102', '1', '0', null, '/curriculum_schedules/banji', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('110203', '按教室查', '1', '1102', '1', '0', null, '/curriculum_schedules/classroom', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('110204', '课时统计', '1', '1102', '1', '0', null, '/curriculum_schedules/statistics', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('12', '学生管理', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1201', '学生档案查询', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1202', '学生评语(班级)', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1203', '学生评语(个人)', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1204', '学生作业(班级)', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1205', '学生作业(个人)', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1206', '学生留言回复', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1207', '发布班级通知', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1208', '教辅资料上传', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1209', '发布同步联系', '1', '12', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('13', '图书阅览室', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1302', '书籍管理', '1', '13', '1', '0', null, '/assets/book_index', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1303', '书籍借还', '1', '13', '1', '0', null, '/assets/book_in_out', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1304', '书籍查询', '1', '13', '1', '0', null, '/assets/book_search', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('14', '系统设置', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1401', '组织机构设置', '1', '14', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('140101', '学校信息', '1', '1401', '1', '0', null, '/units/', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('140102', '部门管理', '1', '1401', '1', '0', null, '/departments/?action=edit', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('140103', '用户管理', '1', '1401', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('140104', '用户权限', '1', '1401', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1402', '菜单信息设定', '1', '14', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('140201', '功能菜单管理', '1', '1402', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1403', '界面信息设置', '1', '14', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1404', '系统访问日志', '1', '14', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1405', '数据库备份', '1', '14', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1406', '统计功能', '1', '14', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('15', '控制面板', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1501', '更改登录密码', '1', '15', '1', '0', null, '/members/password', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1502', '管理学生密码', '1', '15', '1', '0', null, '/students/password', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('16', '辅助办公', '1', '0', '1', '0', null, null, null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1601', '科学计算器', '1', '16', '1', '0', null, '/pages/calculate', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1602', '度衡量换算', '1', '16', '1', '0', null, '/pages/unit_converter', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1603', '手机归属查询', '1', '16', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1604', '游戏', '1', '16', '1', '0', null, '/building.php', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1605', '万年历', '1', '16', '1', '0', null, '/pages/calendar', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
INSERT INTO `modules` VALUES ('1606', '世界时间', '1', '16', '1', '0', null, '/pages/world_time', null, null, null, null, null, null, null, null, '5', null, null, null, '1');
