/*********************************************************************************************
/*  ���������Ϊ id ��������
/*  ������а��� created �� modified �У�cakephp ���Զ�����ֶΣ�������ã���
/*  ��������Ϊ������(users��products)������Ӧ��ģ�ͽ����е���������(user��product)��
/*  ���Ҫ����������������Ӧ����ѭ table_id ��ʽ����ʹ�õ����ı�����
/*  ���磬user_id��product_id ���Ǳ� user��product�������
/*  �ֶ�flag�����ҽ���������ʾ����״̬���磺0����Ч 1�� ��Ч
/*  ��������״̬��status�ֶΡ��磺0:��Ч 1:��Ч 2:��ת�� 9:�����
/*  ��ʹ��0��1��ʾ״̬��ʱ����������˵��0ʼ�ձ�ʾ��Ч��1ʼ�ձ�ʾ��Ч��
/*********************************************************************************************

/* ��ɫ�� */
create table roles (
  id                   int(10)         not null auto_increment comment '����',
  role_name            varchar(200)    not null                comment '��ɫ����',
  type_id              int(1)          not null default 1      comment '����',
  hierarchy            int(1)                                  comment '��ɫ�ȼ�',
  father_id            int(1)                                  comment '���׽�ɫ',
  valid_from           date                                    comment '��Ч����',
  valid_thru           date                                    comment '��ֹ����',
  flag                 int(1)          not null default 1      comment '��Ч��־(1: ��Ч; 0: ��Ч)',
  memo                 varchar(2000)                           comment '��ע',
  primary key  (id)
) engine=MyISAM default charset=utf8 comment='��ɫ';


/* ��Ŀ�� */
create table modules (
  id              int(10)         not null auto_increment comment '����',
  module_name     varchar(60)     not null                comment '��Ŀ(����) ����',
  module_type     int(3)                                  comment '��Ŀ(����) ���� (1:ϵͳģ�� 2:oaϵͳ�̶�ģ�� 3:��վ��Ŀ)',
  parent_id       int(10)                                 comment '�ϼ���Ŀid',
  hierarchy       int(3)          default 1               comment '����',	
  node            int(1)          default 0               comment '�ڵ� (1:��  0:�ڵ� )',
  image_uri       varchar(200)                            comment '��Ŀͼ�� (��ֹ��С�����ȡ����)',
  url             varchar(200)                            comment '���ӵ�ַ',
  target          varchar(20)                             comment '�򿪷�ʽ (_top/_self/_parent/_winname/_blank)',
  allow_del       int(1)                                  comment '����Ŀ�Ƿ�����ɾ��(1������ 0��������)',
  allow_add       int(1)                                  comment '����Ŀ�Ƿ�������������Ŀ(1������ 0��������)',
  allow_publish   int(1)                                  comment '����Ŀ�Ƿ�����������',
  duty_person     varchar(200)                            comment '��Ŀ������',
  duty_company    int(10)	                          comment '��Ŀ���ε�λ',
  duty_lead       varchar(200)                            comment '��Ŀ�����쵼',
  order_list      int(10)                                 comment '��Ŀ������',
  max_num         int(10)         default 5               comment 'ÿҳ�����ʾ��¼��',
  visit_count     int(10)                                 comment '��Ŀ�����ʵĴ���',
  page_type       int(1)                                  comment 'ҳ�����(1���˵�  2����Ŀ)',
  memo            varchar(2000)                           comment '��ע',
  flag            int(1)          default 1               comment '��Ч��־',
  primary key  (id)
 ) engine=MyISAM default charset=utf8 comment='��Ŀ��';


/* ��Ա�ȼ� */
create table member_grades(
  id               int(2)        not null auto_increment comment '����',
  grade_name       varchar(20)   not null                comment '��Ա�ȼ�����',
  member_per       decimal(2,2)  not null default 0      comment '��Ա',
  ws_per           decimal(2,2)  not null default 0      comment '��Ա',
  primary key (id)
) engine=MyISAM default charset=utf8 comment='��Ա�ȼ�';


/* ��Ա������Ϣ�� */
create table users(
  id               int(8)        not null                comment '������ֵͬmembers����ֵ',
  login_name       varchar(15)   not null  default ''    comment '�û���¼��',
  password         varchar(32)   not null  default ''    comment '�û�����',  
  user_name        varchar(20)   not null                comment '��ʵ����',
  sex              int(1)        not null  default 1     comment '�Ա�: 1:�� 0:Ů',
  member_no        varchar(25)   not null  default ''    comment 'ʡ���+���֤�����Ϊ��Ա���',
  cert_int         varchar(18)   not null  default ''    comment '���֤����',
  referees         int(8)                                comment '�Ƽ���',
  member_grades_id int(2)        not null default 1      comment '��Ա�ȼ���Ĭ��Ϊ��ͨ��Ա',
  region_id        int(11)                               comment '��Ա��������',
  telephone        varchar(30)                           comment '��ϵ�绰',
  mobile           varchar(11)                           comment '�ƶ��绰',
  office_phone     varchar(30)                           comment '�칫�绰',
  home_phone       varchar(30)                           comment '��ͥ�绰',
  email            varchar(30)                           comment '�����ʼ�',
  bank_accounts    varchar(30) DEFAULT '��������'	 comment '��������',
  accounts         varchar(20)                           comment '�����ʺ�',
  created          timestamp                             comment '��Ա��������',
  role_id          int(6)        default 1               comment '�û���ɫ',       
  flag             int(1)        not null default 1      comment '��Ա״̬',
  primary key (id)
) engine=MyISAM default charset=utf8 comment='��Ա������Ϣ';
