/* ��λ�� */
create table units (
  id                    int(10)       not null auto_increment comment '��λ���',
  unit_name             varchar(100)  not null default ''     comment '��λ����',
  tel_no                varchar(100)  not null default ''     comment '�绰',
  fax_no                varchar(100)  not null default ''     comment '����',
  post_no               varchar(50)   not null default ''     comment '�ʱ�',
  address               varchar(200)  not null default ''     comment '��ַ',
  website               varchar(200)  not null default ''     comment '��վ',
  email                 varchar(200)  not null default ''     comment '��������',
  bank_name             varchar(200)  not null default ''     comment '������',
  bank_no               varchar(200)  not null default ''     comment '�˺�',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��λ';


/* ���ű� */
create table departments(
  id                    int(10)       not null auto_increment comment '���ű��',
  parent_id             int(10)                               comment '�ϼ�����',
  department_name       varchar(100)                          comment '��������',
  english_name          varchar(100)                          comment 'Ӣ����',
  tel_no                varchar(100)                          comment '���ŵ绰',
  fax_no                varchar(100)                          comment '���Ŵ���',
  order_list            int(2)                                comment '��������',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='����';


/* ��ѧ¥ */
create table teaching_buildings(
  id                    int(10)       not null auto_increment comment '����',
  building_no           varchar(100)                          comment '��ѧ¥���',
  building_name         varchar(100)                          comment '��ѧ¥����',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��ѧ¥';


/* �������� */
create table classroom_types(
  id               int(10)       not null auto_increment comment '���ͱ��',
  type_name        varchar(100)                          comment '��������',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��������';


/* ������Ϣ */
create table classrooms(
  id                    int(10)       not null auto_increment comment '���ұ��',
  classroom_name        varchar(100)                          comment '��������',
  classroom_type_id     int(10)                               comment '��������',
  teaching_building_id  int(10)                               comment '���ڽ�ѧ¥',
  seating               int(3)                                comment '��λ��',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='������Ϣ';


/* �γ̱� */
create table courses(
  id                    int(10)       not null auto_increment comment '�γ̱��',
  course_name           varchar(20)                           comment '�γ�����',
  teaching_material     varchar(100)                          comment '�γ̲̽�',
  course_code           varchar(20)                           comment '�γ̴���',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�γ�';


/* ѧ�����ͱ� */
create table semester_types(
  id                    int(10)       not null auto_increment comment 'ѧ�����ͱ��',
  type_name             varchar(20)                           comment 'ѧ������',
  flag                  int(1)                                comment '��־(1:ѧ�� 2:����)',
  start_date            date                                  comment '��ʼʱ��',
  end_date              date                                  comment '����ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ������';


/* ѧ�ڱ� */
create table semesters(
  id                    int(10)       not null auto_increment comment 'ѧ�ڱ��',
  semester_name         varchar(50)                           comment 'ѧ������',
  is_current            int(1)                                comment '��ǰѧ��',
  semester_type_id      int(10)                               comment 'ѧ������',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ��';


/* ��ʦ�� */
create table teachers(
  id                    int(10)       not null auto_increment comment '��ʦ���',
  user_id               int(10)                               comment '�û�',
  teacher_type          int(1)        not null default 1      comment '��ְ������(1:��ʦ 2:ְ��)',
  teacher_name          varchar(20)   not null                comment '����',
  is_work               int(1)                                comment '�Ƿ��ڸ�', 
  birthday              timestamp                             comment '��������',
  sex                   int(1)                                comment '�Ա�',
  people_id             int(10)                               comment '����',
  degree_id             int(10)                               comment 'ѧλ',
  duty                  varchar(100)                          comment 'ְ��',
  cert_number           varchar(18)                           comment '���֤��',
  get_busy_date         timestamp                             comment '�μӹ���ʱ��',
  address               varchar(100)                          comment '������ϵ��ʽ',
  email                 varchar(100)                          comment '��������',
  graduate_the_college  varchar(100)                          comment '��ҵԺУ',
  specialty             varchar(100)                          comment '��ѧרҵ',
  office_phone          varchar(100)                          comment '�칫�绰',
  department_id         int(10)                               comment '��������',
  file_id               int(10)                               comment '��Ƭ',
  password              varchar(32)                           comment '����',
  flag                  int(1)                                comment '״̬(1:�ڸ� 0:��ְ)',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��ʦ';


/* ��ְ����ְ(��ְ)��Ϣ���� */
create table teacher_is_works(
  id                    int(10)       not null auto_increment comment '��ְ����ְ(��ְ)���',
  teacher_id            int(10)       not null                comment '��ʦ',
  flag                  int(1)        not null                comment '������Ϊ', 
  created               timestamp                             comment '��ְ(��ְ)ʱ��',
  reason                varchar(1000)                         comment '��ְ(��ְ)ԭ��',
  assessor              varchar(100)                          comment '�����',
  remark                varchar(2000)                         comment '��ע',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��ְ����ְ(��ְ)��Ϣ����';


/* �̹�������Ϣ�� */
create table teacher_rewards(
  id                    int(10)       not null auto_increment comment '�̹�������Ϣ���',
  teacher_id            int(10)       not null                comment '��ʦ����',
  created               timestamp                             comment '��������',
  flag                  int(1)        not null                comment '���ͱ��', 
  content               varchar(200)                          COMMENT '��������',
  reason                varchar(1000)                         comment '����ԭ��',
  remark                varchar(2000)                         comment '��ע',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�̹�������Ϣ';


/* �̹�����������Ϣ�� */
create table teacher_continuing_educations(
  id                    int(10)       not null auto_increment comment '�̹�����������Ϣ���',
  teacher_id            int(10)       not null                comment '��ʦ����',
  start_date            date                                  comment '������ʼ����',
  end_date              date                                  comment '������������',
  organization          varchar(100)                          comment '������������', 
  address               varchar(100)                          comment '������ʦ����',
  content               varchar(2000)                         comment '������������',
  certificate_info      varchar(2000)                         comment '���֤�����',
  remark                varchar(2000)                         comment '��ע��Ϣ',
  created               timestamp                             comment '��������',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�̹���������';


/* �༶ */
create table banjis(
  id                    int(10)       not null auto_increment comment '�ڲ����',
  class_no              varchar(10)                           comment '�༶���',
  class_name            varchar(100)  not null                comment '�༶����',
  entrance_year         int(4)        not null                comment '��ѧ���',
  teacher_id            int(10)       not null                comment '������',
  academic_year_id      int(10)                               comment 'ѧ����',
  classroom_id          int(10)                               comment '�̶�����',
  class_size            int(3)                                comment '�༶����',
  order_list            int(2)                                comment '�༶����',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�༶';


/* ��ʦ�ν���Ϣ�� */
create table tearcher_work_infos(
  id                    int(10)       not null auto_increment comment '���',
  teacher_id            int(10)       not null                comment '��ʦ',
  banji_id              int(10)       not null                comment '�༶',
  course_id             int(10)       not null                comment '�γ�',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��ʦ�ν���Ϣ';


/* ѧ������ */
create table students(
  id                    int(10)       not null auto_increment comment '�ڲ����',
  student_no            int(12)                               comment 'ѧ��(sp��)',
  file_no               varchar(20)                           comment 'ѧ��(�������)',
  banji_id              int(10)                               comment '���ڰ༶',
  birthday              date                                  comment '��������',
  sex                   int(1)                                comment '�Ա�',
  people_id             int(10)                               comment '����',
  native_place          varchar(30)                           comment '����',
  total_score           varchar(10)                           comment '�ܷ�',
  political_feature     varchar(30)                           comment '������ò',
  physical_condition    varchar(30)                           comment '����״��',
  cert_number           varchar(18)                           comment '���֤��',
  graduate_the_college  varchar(100)                          comment '��ҵѧУ',
  foreign_language      varchar(30)                           comment '��������',
  enter_the_way         varchar(30)                           comment '��ѧ��ʽ',
  origin                varchar(30)                           comment 'ѧ����Դ',
  address               varchar(100)                          comment '��ͥסַ',
  zip                   varchar(6)                            comment '��ͥ�ʱ�',
  telphone              varchar(50)                           comment '��ͥ�绰',
  email                 varchar(100)                          comment '��������',
  enter_date            date                                  comment '��ѧ����',
  remark                varchar(2000)                         comment '��ע',
  student_phone         varchar(50)                           comment 'ѧ���绰',
  father_name           varchar(30)                           comment '��������',
  father_unit           varchar(100)                          comment '���׵�λ',
  father_phone          varchar(50)                           comment '���׵绰',
  mother_name           varchar(30)                           comment 'ĸ������',
  mother_unit           varchar(100)                          comment 'ĸ�׵�λ',
  mother_phone          varchar(50)                           comment 'ĸ�׵绰',
  file_id               int(10)                               comment '��Ƭ',
  password              varchar(32)                           comment '����',
  status                int(1)                                comment '״̬(9:���� 1:���� 2:��ҵ)',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ������';


/* ѧ���ɳ��������� */
create table grow_file_types(
  id                    int(10)       not null auto_increment comment '�������ͱ��',
  type_name             varchar(20)   not null                comment '������������',
  flag                  int(1)        not null default 1      comment '��Ч��־',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ���ɳ���������';


/* ѧ���ɳ����� */
create table student_grow_files(
  id                    int(10)       not null auto_increment comment '�������',
  student_id            int(10)       not null                comment 'ѧ��',
  semester_id           int(10)                               comment 'ѧ��',
  grow_file_type_id     int(10)       not null                comment '��������',
  title                 varchar(200)                          comment '����',
  description           text                                  comment '����',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ���ɳ�����';


/* ѧ���༶���� */
create table student_particular_changes(
  id                    int(10)       not null auto_increment comment '�ڲ����',
  student_id            int(10)       not null                comment 'ѧ��',
  old_banji_id          int(10)       not null                comment 'ԭ�༶',
  new_banji_id          int(10)       not null                comment '�°༶',
  change_reason         varchar(200)                          comment '����ԭ��',
  ratifier              varchar(100)                          comment '��׼��',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ���༶����';


/* ��ʱ�� */
create table hours(
  id                    int(10)       not null auto_increment comment '��ʱ���',
  hour_name             varchar(30)   not null                comment '��ʱ����',
  order_list            int(1)                                comment '����',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='��ʱ��';


/* ���ڱ� */
create table weeks(
  id                    int(10)       not null auto_increment comment '��ʱ���',
  week_name             varchar(10)   not null                comment '����',
  primary key (id)  
)engine=MyISAM default charset=utf8 comment='���ڱ�';


/* �γ̱� */
create table curriculum_schedules(
  id                    int(10)       not null auto_increment comment '�ڲ����',
  class_id              int(10)       not null                comment '�༶'
  hour_id               int(10)       not null                comment '��ʱ',
  week_id               int(10)       not null                comment '����',
  teacher_id            int(10)       not null                comment '��ʦ����',
  primary key (id)  
)engine=MyISAM default charset=utf8 comment='�γ̱�';


/* ���Թ��� */
create table exams(
  id                    int(10)       not null auto_increment comment '���Ա��',
  semester_id           int(10)                               comment 'ѧ��',
  exam_name             varchar(100)                          comment '��������',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='����';


/* ѧ�����Գɼ� */
create table exam_results(
  id                    int(10)       not null auto_increment comment '�ڲ����',
  student_id            int(10)       not null                comment 'ѧ��',
  exam_id               int(10)                               comment '������',
  semester_id           int(10)                               comment 'ѧ��',
  course_id             int(10)                               comment '�γ�',
  score                 decimal(3,2)                          comment '����',                  
  primary key (id)
)engine=MyISAM default charset=utf8 comment='ѧ�����Գɼ�';


/* �ĵ����ͱ� */
create table document_types(
  id                    int(10)       not null auto_increment comment '�ĵ����ͱ��',
  type_name             varchar(100)  not null                comment '�ĵ���������',
  flag                  int(1)                                comment '��Ч��־',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�ĵ�����';


/* �ĵ��� */
create table documents(
  id                    int(10)       not null auto_increment comment '�ĵ����',
  document_type_id      int(10)                               comment '�ĵ�����',
  rate_id               int(10)                               comment '����',
  course_id             int(10)                               comment '�γ�',
  title                 varchar(2000)                         comment '����', 
  subhead               varchar(2000)                         comment '������',
  keyword               varchar(200)                          comment '�����',
  content               text                                  comment '����',
  is_commons            int(1)                                comment '�Ƿ񹫹�',
  is_sms                int(1)                                comment '�Ƿ����',
  sms_date              timestamp                             comment '����ʱ��',
  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�ĵ�';


/* �ĵ������� */
create table doc_files(
  id                    int(10)       not null auto_increment comment '�����ڲ����',
  document_id           int(10)       not null                comment '�ĵ�',
  file_id               int(10)       not null                comment '����',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�ĵ�����';


/* �ĵ��༶���ձ� */
create table doc_class_receiving_logs(
  id                    int(10)       not null auto_increment comment '�����ڲ����',
  document_id           int(10)       not null                comment '�ĵ�',

  created               timestamp                             comment '����ʱ��',
  modified              timestamp                             comment '�޸�ʱ��',
  primary key (id)
)engine=MyISAM default charset=utf8 comment='�ĵ��༶����';