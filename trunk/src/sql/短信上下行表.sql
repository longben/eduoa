/* �������б� */
create table phs_submit(
	id				int(10)			NOT NULL auto_increment		COMMENT '�������',
	sSchoolCode		varchar(32)		NOT NULL 					COMMENT 'ѧУ���',
	nNeddReport		tinyint(1)		DEFAULT '0'					COMMENT '�Ƿ�Ҫ�󷵻�״̬����(0��Ҫ��1Ҫ��)',
	nPriority		tinyint(1)									COMMENT '�������ȼ�(0-3,���ȼ�Խ�ߵȴ�ʱ��Խ��)',
	sServerID		varchar(10)									COMMENT 'ҵ�����',
	nMsgFormat		int(4)										COMMENT '����Ϣ��ʽ(����д15)',
	sFeeType		varchar(2)									COMMENT '�շ�����(00���01�����շ�02����03�ⶥ)',
	sFeeCode		varchar(6)									COMMENT '�����ʷѴ���(��λΪ��)',
	sFixedFee		varchar(6)		DEFAULT '000000'			COMMENT 'Ĭ��000000',
	sSendTime		datetime									COMMENT '����ʱ��',
	sChargeTermID	varchar(21)									COMMENT '���żƷ��û����룬С��ͨ������',
	sDestTermID		varchar(21)									COMMENT '���Ž��պ���',
	sReplyPath		varchar(21)									COMMENT '�ظ�·����key�к��룬С��ͨ�����ţ���ʾ�ķ��ͷ�����',
	nMsgLength		int(4)										COMMENT '��Ϣ���ȣ���2����',
	cMsgCont		varchar(252)								COMMENT '��������',
	nMsgType		tinyint(1)		DEFAULT '0'					COMMENT '����Ϣ����',
	sInsertTime		datetime									COMMENT '��Ϣд��ʱ��',
	sError			varchar(32)									COMMENT '���ʹ������(Ĭ��0)',
	sState			tinyint(1)									COMMENT '����״̬��0δ���ͣ�1�ѷ���)',
	sDoor			varchar(20)		NOT NULL DEFAULT 'T02'		COMMENT 'ͨ������',
	sStay1			varchar(256)								COMMENT 'Ԥ���ֶ�1',
	sStay2			varchar(256)								COMMENT 'Ԥ���ֶ�2',
	primary key (id)
)engine=MyISAM default charset=utf8 comment='�������б�';


/* �������б� */
create table phs_deliver(
	id				int(10)       not null auto_increment		COMMENT '�������',
	sMsgID			varchar(32)									COMMENT '�������ɵĶ���Ϣ��ˮ��',
	nIsReport		int(4)										COMMENT '�Ƿ�״̬����',
	nMsgFormat		int(4)										COMMENT '����Ϣ��ʽ(����д15)',
	SRecvTime		varchar(14)									COMMENT '���Ž���ʱ��(��ʽyyyymmddhhmiss)',
	sSrcTermID		varchar(21)									COMMENT '���ŷ��ͺ���',
	sDestTermID		varchar(21)									COMMENT '���Ž��պ���',
	nMsgLength		int(4)										COMMENT '��Ϣ���ȣ���2����',
	sMsgContent		varchar(252)								COMMENT '��������',
	sInsertTime		datetime									COMMENT '��Ϣд��ʱ��',
	nSpDealResult	int(4)			DEFAULT '0'					COMMENT 'Ĭ��ֵ0',
	sLinkID			varchar(64)									COMMENT '����ʶ����',
	primary key (id)
)engine=MyISAM default charset=utf8 comment='�������б�';