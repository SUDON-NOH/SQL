-- NVL2(X, VALUE1, VALUE2)
SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X'),
    NVL2(COMM, SAL * 12 + COMM, SAL * 12) AS ANNSAL
    FROM EMP;
    
-- DECODE��, CASE��

-- DECODE ��
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB,
            'MANAGER', SAL * 1.1,
            'SALESMAN', SAL * 1.05,
            'ANALYST', SAL,
            SAL*1.03
            ) AS UPSAL -- ���� 3���� ������ �ƴ� ���� 3% �λ�
FROM EMP;

-- CASE�� ~ WHEN ~ THEN ...
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
        WHEN 'MANAGER' THEN SAL * 1.1
        WHEN 'SALESMAN' THEN SAL * 1.05
        WHEN 'ANALYST' THEN SAL
        ELSE SAL * 1.03
    END AS UPSAL
FROM EMP;

-- 7�� �������Լ�

-- SUM() , COUNT() : Ƚ��, MAX(), MIN(), AVG()
-- SUM()
SELECT SUM(COMM)
    FROM EMP;

SELECT COUNT(*) --���� ��
    FROM EMP;

SELECT COUNT(COMM) -- ����ġ�� ������ ���� ��
    FROM EMP;
    
SELECT MAX(SAL)
    FROM EMP;
    
SELECT MIN(SAL)
    FROM EMP;
    
SELECT MAX(SAL), MIN(SAL)
    FROM EMP;
    
SELECT AVG(SAL)
    FROM EMP
WHERE DEPTNO = 10;

SELECT AVG(SAL)
    FROM EMP
WHERE DEPTNO = 20;

SELECT AVG(SAL)
    FROM EMP
WHERE DEPTNO = 30;

SELECT AVG(SAL),
    '10' AS DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT AVG(SAL),
    '20' AS DEPTNO
    FROM EMP
    WHERE DEPTNO = 20
UNION
SELECT AVG(SAL),
    '30' AS DEPTNO
    FROM EMP
    WHERE DEPTNO = 30;
    
 
-- GROUP BY ��

SELECT AVG(SAL), DEPTNO
    FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

SELECT JOB, DEPTNO, AVG(SAL)
    FROM EMP
GROUP BY JOB, DEPTNO
ORDER BY JOB, DEPTNO;

-- ���ǻ��� " SELECT ���� GROUP BY���� �������� ���� ���� ����� �� ����.
SELECT ENAME, DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO; --> �����߻�

-- GROUP BY ~ HAVING ~

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB; --> �޿��� 2000 �̻��� �͵鸸 DEPTNO�� JOB�� ���� ����

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
WHERE AVG(SAL) <= 3000
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;   -- ����

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;  -- ����


SELECT DEPTNO, JOB, MAX(SAL)
    FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;


-- PIVOT : ���� ���� ��ȯ
SELECT *
    FROM(SELECT DEPTNO, JOB, SAL
         FROM EMP)
    PIVOT(MAX(SAL)
          FOR DEPTNO IN(10 AS A, 20 AS B, 30 AS C)
          ) -- FOR �� �����ٷ� ǥ���� ���� ��� / IN �� ����Ϸ��� �� �����͸� ����
ORDER BY JOB;

-- P.212 ��������
-- Q1
SELECT DEPTNO, 
    TRUNC(AVG(SAL)) AS AVG_SAL,
    MAX(SAL) AS AVG_MAX, 
    MIN(SAL) AS AVG_MIN, 
    COUNT(DEPTNO)
    FROM EMP
    GROUP BY DEPTNO;
    
-- Q2
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
    
-- Q3
SELECT *
    FROM EMP;

SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
    FROM EMP
    WHERE DEPTNO IS NOT NULL
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'),DEPTNO;
    
-- Q4
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*) AS CNT
       FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
    
-- Q5
SELECT 
    DEPTNO,
    TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
    COUNT(*) AS CNT,
    MAX(SAL) AS AVG_MAX,
    SUM(SAL) AS AVG_SUM,
    AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY')); -- ROLLUP�� �Ұ�, �Ѱ�
    
-- 8�� ����

-- [1] �����ڿ� ���� ���� : �����, ��Ƽ����
-- [2] ���� ��� ���� ���� : ��������
-- [3] �������ǿ� ���� ���� : ��������(INNER JOIN), �ܺ�����(OUTER JOIN)

SELECT *
    FROM EMP; -- 14 ROWS
    
SELECT *
    FROM DEPT; -- 4 ROWS

SELECT *
    FROM EMP, DEPT; -- 56 ROWS ���� 14*4 , ��� ���� ����

-- ��������
-- �� �̸� ����Ͽ� ���� ���ϴ� ���ǽ��� ���, NULL �����Ͱ� ����
SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO;

-- ���̺� ��Ī ���
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
ORDER BY EMPNO;

-- �������� --> ��������
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_NAME
    FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_NAME
    FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO; 
--KING(PRESIDENT) �� �Ŵ����� ��� NULL ������ �߻�. ���ǿ� �������� �ʾ� ��� ���� ������

-- �ܺ����� : LEFT/RIGHT �ܺ�����
-- LEFT �ܺ����� : WHERE Table1.Col1 = Table2.Col1(+)
-- Table1�� Col1 �� Table2�� Col1�� ������ ���� ������ ����

SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_NAME
    FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+) --> 14 ROWS KING�� �״�� �߰�(NULL���� �߰���)
ORDER BY E1.EMPNO; 

-- RIGHT �ܺ����� : WHERE Table1.Col1(+) = Table2.Col1

SELECT E1.EMPNO, E1.ENAME,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_NAME
    FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO
ORDER BY E1.EMPNO; --> 21 ROWS ���� KING�� ����, 8�� NULL�� ���ʿ� �߰�