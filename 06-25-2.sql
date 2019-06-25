-- 6�� ���� �Լ�

-- 6-1 UPPER() �빮�� , LOWER() �ҹ���, INITCAP() ù���� �빮��

SELECT ENAME, 
    UPPER(ENAME), 
    LOWER(ENAME),
    INITCAP(ENAME)
    FROM EMP;

-- 6-4 LENGTH() , LENGTHB() ������ ����
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
    FROM DUAL;
    
SELECT *
    FROM DUAL; -- ����� ���̺�(����Ŭ ���� ���̺�)
    
-- 6-7 SUBSTR(���ڿ� ������, ������ġ, ������ ���� ��) ���ڿ� �Ϻ� ����

SELECT JOB,
SUBSTR(JOB, 1, 2)
FROM EMP;

-- 6-12 REPLACE()
SELECT '010-1234-5678' AS REPLACE_BEFORE,
 REPLACE('010-1234-5678', '-', ' ') AS REPLACE_AFTER,
 REPLACE('010-1234-5678', '-') AS REPLACE_AFTER2
 FROM DUAL;
 
-- 6-13 LPAD(), RPAD()
SELECT 'ORACLE'
 FROM DUAL;
 
-- 6-15 CONCAT()
SELECT CONCAT(EMPNO,ENAME),
CONCAT(EMPNO, CONCAT(':',ENAME))
FROM EMP;

SELECT EMPNO || ENAME,
    EMPNO || ':' || ENAME
FROM EMP;

-- 6-19 ROUND() : �ݿø�
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 3) AS ROUND,
       ROUND(1234.5678,-3) AS ROUND
FROM DUAL;

-- 6-23 SYSDATE : ������ ��¥�� �ð��� ����
SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMORROW
FROM DUAL;

-- 6-25 �Ի� 10�ֳ� ��¥�� ���ϱ�
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
-- 6-28 NEXY_DAY(), LAST_DAY()
SELECT SYSDATE,
       NEXT_DAY(SYSDATE, '������'),
       LAST_DAY(SYSDATE)
       FROM DUAL;

-- �� ��ȯ : TO_DAYE() : ���ڸ� ��¥�� ��ȯ
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
       TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2,
       TO_DATE('2018 07 14', 'YYYY-MM-DD') AS YODATE3
FROM DUAL;

-- NVL(X, VALUE) : NULL ó�� �Լ� : X�� NULL �϶� VALUE�� ����
SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM,
       NVL(COMM, 0),
       SAL * 12 + NVL(COMM, 0) AS ANNALSAL
       FROM EMP;
