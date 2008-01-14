-- 初始化 `modules` 数据
-- modules表，由于栏目数据太多，所以大类是采用从1开始，而接下来的都是按照两位排列的。

INSERT INTO `modules` (`id`, `module_name`, `module_type`, `parent_id`, `hierarchy`, `node`, `image_uri`, `url`, `target`, `allow_del`, `allow_add`, `allow_publish`, `duty_person`, `duty_company`, `duty_lead`, `order_list`, `max_num`, `visit_count`, `page_type`, `memo`, `flag`) VALUES 
(1, '我的办公桌', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(101, '内部邮件', 1, 1, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(102, '短消息', 1, 1, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(103, '公告通知', 1, 1, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(104, '个人设置', 1, 1, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(2, '日常事务', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(201, '公告通知管理', 1, 2, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(202, '新闻管理', 1, 2, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(203, '用户信息', 1, 2, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(204, '部门信息', 1, 2, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(205, '学校信息', 1, 2, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(4, '资产管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(401, '资产类别', 1, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(40101, '类别管理', 1, 401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(40102, '使用状态', 1, 401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(40103, '增加方式', 1, 401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(402, '资产管理', 1, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(403, '资产借出', 1, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(404, '资产归还', 1, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(405, '资产维修', 1, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(5, '教职工管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(501, '基本信息维护', 1, 5, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(502, '离职复职查阅', 1, 5, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(503, '奖惩信息查阅', 1, 5, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(504, '教工继续教育', 1, 5, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(505, '任教信息管理', 1, 5, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(6, '教室管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(601, '教学楼管理', 1, 6, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(602, '教室类型设置', 1, 6, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(603, '教室信息管理', 1, 6, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(604, '教室信息查阅', 1, 6, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(7, '学籍管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(701, '班级管理', 1, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(70101, '班级管理', 1, 701, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(70102, '班级查阅', 1, 701, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(702, '学生档案', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(703, '学籍管理', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(704, '调班管理', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(705, '学籍异动', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(706, '毕业生管理', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(707, '毕业生信息', 1, 7, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(8, '成长档案', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(801, '成长档案管理', 1, 8, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(802, '成长档案查看', 1, 8, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(9, '成绩管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(901, '班级成绩录入', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(902, '班级成绩管理', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(903, '班级成绩查询', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(904, '学期成绩查询', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(905, '学期成绩统计', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(906, '不及格名单', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(907, '不及格人数', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(908, '单科成绩排序', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(909, '全年级平均成绩', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(910, '分班不分科成绩平均', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(911, '分科不分班成绩平均', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(912, '分班分科成绩平均', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(913, '尖子生各教师所占比例', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(914, '尖子生各班所占比例', 1, 9, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(10, '金色校园', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1001, '学期信息管理', 1, 10, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(100101, '学期类型', 1, 1001, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(100102, '学期信息', 1, 1001, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1002, '课程信息管理', 1, 10, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(100201, '课程管理', 1, 1002, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(100202, '课程查看', 1, 1002, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1003, '教师密码管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1004, '学生密码管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1005, '班级公告管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1006, '学生作业管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1007, '课程下载管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1008, '同步练习管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1009, '班级公告(全校)', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1010, '课件管理(全校)', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1011, '学生考勤管理', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1012, '考勤历史查询', 1, 10, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(11, '课表管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1101, '按班级排课', 1, 11, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(110101, '按班排课', 1, 1101, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1102, '课表信息查询', 1, 11, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(110201, '按教师查', 1, 1102, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(110202, '按班级查', 1, 1102, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(110203, '按教室查', 1, 1102, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(110204, '课时统计', 1, 1102, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(12, '学生管理', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1201, '学生档案查询', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1202, '学生评语(班级)', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1203, '学生评语(个人)', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1204, '学生作业(班级)', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1205, '学生作业(个人)', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1206, '学生留言回复', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1207, '发布班级通知', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1208, '教辅资料上传', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1209, '发布同步联系', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1210, '考勤记录查询', 1, 12, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(13, '图书阅览室', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1301, '书籍管理', 1, 13, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1302, '书籍借还', 1, 13, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1303, '书籍查询', 1, 13, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(14, '系统设置', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1401, '组织机构设置', 1, 14, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140101, '学校信息', 1, 1401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140102, '部门管理', 1, 1401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140103, '用户管理', 1, 1401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140104, '用户权限', 1, 1401, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1402, '菜单信息设定', 1, 14, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140201, '一级菜单', 1, 1402, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(140202, '二级菜单', 1, 1402, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1403, '界面信息设置', 1, 14, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1404, '系统访问日志', 1, 14, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1405, '数据库备份', 1, 14, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1406, '统计功能', 1, 14, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(15, '控制面板', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1501, '更改登录密码', 1, 15, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1502, '管理学生密码', 1, 15, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),

(16, '辅助办公', 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1601, '科学计算器', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1602, '度衡量换算', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1603, '手机归属查询', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1604, '游戏', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1605, '万年历', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1),
(1606, '世界时间', 1, 16, 1, 0, NULL, '/building.php', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1);