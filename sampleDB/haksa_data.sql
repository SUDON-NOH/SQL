/**********************************************************
*  Department ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Department VALUES ('�İ�','��ǻ�Ͱ��а�',  '765-4100');
INSERT INTO Department VALUES ('����','������Ű��а�','765-4200');
INSERT INTO Department VALUES ('�濵','�濵�а�',      '765-4400');
INSERT INTO Department VALUES ('����','���������а�',  '765-4500');

/**********************************************************
*  Student ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Student  VALUES
('�İ�','1','C1001','�����','920101-1******','����� ���ı�', '01-932-9999', 
 'c1001@cyber.ac.kr',Null,'2010/03/01');
INSERT INTO Student  VALUES
('�İ�','1','C1002','������','920521-2******','������ �����', '041-343-8838',
 'c10032cyber.ac.kr','H', '2010/03/01');
INSERT INTO Student  VALUES
('�İ�','2','C0901','������','911109-2******','�뱸�� ������', Null,          
 'c0901@cyber.ac.kr',Null,'2009/03/06');
INSERT INTO Student  VALUES
('�İ�','2','C0902','���ֿ�','920917-1******','�泲 ���ؽ�',   '010-555-1616',          
 'c0902@cyber.ac.kr',Null,'2009/03/06');
INSERT INTO Student  VALUES
('�İ�','3','C0801','�ѿ���','900708-1******','�λ�� ������', '016-999-0101',          
 'c0801@cyber.ac.kr',Null,'2008/03/05');
INSERT INTO Student  VALUES
('�İ�','3','C0802','�����','890205-2******','����� ��������','010-333-0707',         
 'c0802@cyber.ac.kr',Null,'2008/03/05');
INSERT INTO Student  VALUES
('����','1','T1001','�躴ȣ','891124-1******','�뱸�� �޼���',  '011-222-0303',         
  Null,              Null,'2010/03/05');
INSERT INTO Student  VALUES
('����','2','T0901','������','901117-1******','�泲 õ�Ƚ�',    Null,          
 't0901@cyber.ac.kr',Null,'2009/03/06');
INSERT INTO Student  VALUES
('�濵','1','B1001','�����','930422-2******','����� ����',  Null,
  Null,              Null,'2010/03/05');
INSERT INTO Student  VALUES
('�濵','2','B0901','���','761225-1******','������ ������',  Null,         
 'b0901@cyber.ac.kr',Null,'2009/03/06');
INSERT INTO Student  VALUES
('����','1','A1001','�̹̳�','901217-2******','���� �����',    '010-888-5050',         
  Null,              Null,'2008/03/05');

/**********************************************************
*  Professor ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Professor VALUES
 ('P11', '�ű��', '����',    '�İ�','765-4111','ksshin@cyber.ac.kr','�а���','P00');
INSERT INTO Professor VALUES
 ('P12', '�̴�ȣ', '�α���',  '�İ�','765-4112','dhlee@cyber.ac.kr', Null,    'P11');
INSERT INTO Professor VALUES
 ('P13', '���ҿ�', '���Ӱ���','�İ�','765-4113','syyoo@cyber.ac.kr',Null,    'P11');
INSERT INTO Professor VALUES
 ('P21', '������', '�α���',  '����','765-4211','jspark@cyber.ac.kr','�а���','P00');
INSERT INTO Professor VALUES
 ('P22', '���ϴ�', '������',  '����','765-4212','hnkim@cyber.ac.kr',  Null,    'P21');
INSERT INTO Professor VALUES
 ('P23', '�̻���', '���Ӱ���','����','765-4213','shlee@cyber.ac.kr', Null,    'P21');
INSERT INTO Professor VALUES
 ('P41', '�ȿ�ȫ', '�α���',  '�濵','765-4411','yhahn@cyber.ac.kr','�а���', 'P00');
INSERT INTO Professor VALUES
 ('P51', '�Կ���', '�α���',  '����','765-4511','yaham@cyber.ac.kr','�а���', 'P00');

/**********************************************************
*  Course ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Course VALUES ('L1011','��ǻ�ͱ���',    2,'P11',Null);
INSERT INTO Course VALUES ('L1012','��������',      2, Null,20000);
INSERT INTO Course VALUES ('L1021','�����ͺ��̽�',  2,'P12',Null);
INSERT INTO Course VALUES ('L1022','������Ű���',  2,'P21',Null);
INSERT INTO Course VALUES ('L1031','SQL',           3,'P12',30000);
INSERT INTO Course VALUES ('L1032','�ڹ����α׷���',3,'P13',Null);
INSERT INTO Course VALUES ('L1041','��ǻ�ͳ�Ʈ��ũ',2,'P21',Null);
INSERT INTO Course VALUES ('L1042','Delphi',        3,'P13',50000);
INSERT INTO Course VALUES ('L1051','����������',    2,'P11',Null);
INSERT INTO Course VALUES ('L1052','���ڻ�ŷ�',    3,'P22',30000);
INSERT INTO Course VALUES ('L2031','�����̷�',      3,'P23',50000);
INSERT INTO Course VALUES ('L0011','TOEIC����',     2, Null,Null);
INSERT INTO Course VALUES ('L0012','���а� ����',   2, Null,Null);
INSERT INTO Course VALUES ('L0013','���а���',      2, Null,Null);

/**********************************************************
*  SG_Scores ���̺� �ߺ� ������
***********************************************************/
INSERT INTO SG_Scores VALUES ('C0901','L1011', 97, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0902','L1011', 89, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0901','L1012', 82, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0902','L1012', 94, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0801','L1031', 96, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0802','L1031', 96, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0801','L1032', 78, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0802','L1032', 90, Null, '2009/06/29');
INSERT INTO SG_Scores VALUES ('C0901','L1021', 96, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0902','L1021', 86, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0901','L1022', 97, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0902','L1022', 87, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0801','L1041', 87, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0802','L1041', 99, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0801','L1042', 83, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0802','L1042', 98, Null, '2009/12/23');
INSERT INTO SG_Scores VALUES ('C0901','L1031', 85, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0902','L1031', 77, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0901','L1032', 93, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0902','L1032', 97, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0801','L1051', 87, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0802','L1051', 77, Null, '2010/06/28');
INSERT INTO SG_Scores VALUES ('C0801','L1052', 89, Null, '2010/06/28'); 
INSERT INTO SG_Scores VALUES ('C0802','L1052', 89, Null, '2010/06/28'); 
INSERT INTO SG_Scores VALUES ('C0901','L1041', 93, Null, '2010/12/27');
INSERT INTO SG_Scores VALUES ('C0902','L1041', 87, Null, '2010/12/27');
INSERT INTO SG_Scores VALUES ('C0901','L1042',105, Null, '2010/12/27');
INSERT INTO SG_Scores VALUES ('C0902','L1042', 98, Null, '2010/12/27');
INSERT INTO SG_Scores VALUES ('C0801','L0011', 68, Null, '2010/12/27');
INSERT INTO SG_Scores VALUES ('C0802','L0011', 98, Null, '2010/12/27');

 /**********************************************************
*  Course_Temp ���̺� �ߺ� ������
***********************************************************/
INSERT INTO Course_Temp VALUES ('L1031','SQL����',       3,'P12',50000);
INSERT INTO Course_Temp VALUES ('L1032','JAVA',          3,'P13',30000);
INSERT INTO Course_Temp VALUES ('L1043','JSP ���α׷���',3, NULL,50000);
INSERT INTO Course_Temp VALUES ('L2033','�������α׷���',3,'P23',40000);
INSERT INTO Course_Temp VALUES ('L4011','�濵�����ý���',3,'P41',30000);
INSERT INTO Course_Temp VALUES ('L4012','����������',    3,'P51',50000);

 /**********************************************************
*  Course_Grade ���̺� �ߺ� ������
***********************************************************/
INSERT INTO SCORE_GRADE VALUES (90,100,'A');
INSERT INTO SCORE_GRADE VALUES (80,89,'B');
INSERT INTO SCORE_GRADE VALUES (70,79,'C');
INSERT INTO SCORE_GRADE VALUES (60,69,'D');
INSERT INTO SCORE_GRADE VALUES (0,59,'F');

COMMIT;