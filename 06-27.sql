-- 10 장

-- DML : INSERT / UPDATE / DELETE

-- 테이블 사본 생성
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

SELECT *
    FROM DEPT_TEMP;

-- INSERT : 테이블에 행을 추가
INSERT INTO DEPT_TEMP
        VALUES (60, 'NETWORK', 'DAEJEON');

INSERT INTO DEPT_TEMP
        VALUES (50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP
        VALUES (80, NULL , NULL);
        
SELECT * FROM DEPT_TEMP;

-- DELETE : 테이블에서 행을 삭제 : 조건식을 포함시켜야 한다.

DELETE FROM DEPT_TEMP
    WHERE DNAME = 'NETWORK;';

DELETE FROM DEPT_TEMP
    WHERE DEPTNO = 50;

DELETE FROM DEPT_TEMP
    WHERE DEPTNO = 80;

SELECT * FROM DEPT_TEMP;

-- UPDATE 테이블 명 SET  열 이름 = 바꿀 내용 WHERE 선택 : 테이블의 데이터를 수정

UPDATE DEPT_TEMP
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 60;

SELECT * FROM DEPT_TEMP;

-- TCL
-- 트랜잭션을 모두 완료 : 실제 그 값을 유지 할 수 있다. COMMIT 전에는 임시 저장 상태
COMMIT;

-- 트랜잭션을 모두 취소
ROLLBACK;

-- DDL : CREATE / DROP / ALTER / TRUNCATE / RENAME

-- 테이블 생성
CREATE TABLE EMP_DDL ( 
    EMPNO    NUMBER(4) PRIMARY KEY, --PRIMARY KEY(PK) : NOT NULL + UNIQUE 를 포함한 속성
    ENAME    VARCHAR2(10) NOT NULL, --가변형 9자리 문자 / 고정형 문자 = CHAR()
    JOB      VARCHAR2(9) UNIQUE,    --NOT NULL(NN) : NULL DATA 사용 불가능 / UNIQUE : 중복을 허용하지 않음
    HIREDATE DATE,
    SAL      NUMBER(7, 2), --전체 7자리, 소수점 2자리까지 표시   EX)12345.67
    DEPTNO   NUMBER(4) DEFAULT 0 -- 값이 지정되지 않으면 값을 0으로 입력
);

DESC EMP_DDL;

-- 테이블 삭제
DROP TABLE EMP_DDL; -- 테이블 삭제 & 수행시 ROLLBACK; 이 먹히지 않는다

-- ALTER 테이블을 변경
ALTER TABLE EMP_DDL
    ADD HP VARCHAR2(20); -- 새로운 열을 추가
    
ALTER TABLE EMP_DDL
    RENAME COLUMN HP TO TEL; -- 열의 이름을 변경
    
ALTER TABLE EMP_DDL
    DROP COLUMN TEL; -- 열을 삭제
    
DESC EMP_DDL;


-- 테이블에 데이터를 모두 삭제
TRUNCATE TABLE DEPT_TEMP;

SELECT * 
    FROM DEPT_TEMP;


-- 테이블 삭제
DROP TABLE EMP_DDL;

DROP TABLE DEPT_TEMP;

DROP TABLE DEPT_RENAME;

DESC EMP_DDL; -- 오류가 나옴 위에서 테이블을 DROP했기 때문

-- 테이블 이름 바꾸기

RENAME DEPT_TEMP TO DEPT_RENAME;

DESC DEPT_RENAME;