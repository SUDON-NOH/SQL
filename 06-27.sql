-- 10 ��

-- DML : INSERT / UPDATE / DELETE

-- ���̺� �纻 ����
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

SELECT *
    FROM DEPT_TEMP;

-- INSERT : ���̺� ���� �߰�
INSERT INTO DEPT_TEMP
        VALUES (60, 'NETWORK', 'DAEJEON');

INSERT INTO DEPT_TEMP
        VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
        VALUES (80, NULL , NULL);
        
SELECT * FROM DEPT_TEMP;

-- DELETE : ���̺��� ���� ���� : ���ǽ��� ���Խ��Ѿ� �Ѵ�.

DELETE FROM DEPT_TEMP
    WHERE DNAME = 'NETWORK;';

DELETE FROM DEPT_TEMP
    WHERE DEPTNO = 50;

DELETE FROM DEPT_TEMP
    WHERE DEPTNO = 80;

SELECT * FROM DEPT_TEMP;

-- UPDATE ���̺� �� SET  �� �̸� = �ٲ� ���� WHERE ���� : ���̺��� �����͸� ����

UPDATE DEPT_TEMP
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 60;

SELECT * FROM DEPT_TEMP;

-- TCL
-- Ʈ������� ��� �Ϸ� : ���� �� ���� ���� �� �� �ִ�. COMMIT ������ �ӽ� ���� ����
COMMIT;

-- Ʈ������� ��� ���
ROLLBACK;

-- DDL : CREATE / DROP / ALTER / TRUNCATE / RENAME

-- ���̺� ����
CREATE TABLE EMP_DDL ( 
    EMPNO    NUMBER(4) PRIMARY KEY, --PRIMARY KEY(PK) : NOT NULL + UNIQUE �� ������ �Ӽ�
    ENAME    VARCHAR2(10) NOT NULL, --������ 9�ڸ� ���� / ������ ���� = CHAR()
    JOB      VARCHAR2(9) UNIQUE,    --NOT NULL(NN) : NULL DATA ��� �Ұ��� / UNIQUE : �ߺ��� ������� ����
    HIREDATE DATE,
    SAL      NUMBER(7, 2), --��ü 7�ڸ�, �Ҽ��� 2�ڸ����� ǥ��   EX)12345.67
    DEPTNO   NUMBER(4) DEFAULT 0 -- ���� �������� ������ ���� 0���� �Է�
);

DESC EMP_DDL;

-- ���̺� ����
DROP TABLE EMP_DDL; -- ���̺� ���� & ����� ROLLBACK; �� ������ �ʴ´�

-- ALTER ���̺��� ����
ALTER TABLE EMP_DDL
    ADD HP VARCHAR2(20); -- ���ο� ���� �߰�
    
ALTER TABLE EMP_DDL
    RENAME COLUMN HP TO TEL; -- ���� �̸��� ����
    
ALTER TABLE EMP_DDL
    DROP COLUMN TEL; -- ���� ����
    
DESC EMP_DDL;


-- ���̺� �����͸� ��� ����
TRUNCATE TABLE DEPT_TEMP;

SELECT * 
    FROM DEPT_TEMP;


-- ���̺� ����
DROP TABLE EMP_DDL;

DROP TABLE DEPT_TEMP;

DROP TABLE DEPT_RENAME;

DESC EMP_DDL; -- ������ ���� ������ ���̺��� DROP�߱� ����

-- ���̺� �̸� �ٲٱ�

RENAME DEPT_TEMP TO DEPT_RENAME;

DESC DEPT_RENAME;