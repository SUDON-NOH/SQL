-- IMPORT_EXCEL.SQL
-- excel_exam.xlsx 파일을 import 해서 EXAM 테이블 생성하기

-- [1] table 만들기
CREATE TABLE EXAM(
    ID      NUMBER(2) PRIMARY KEY,
    CLASS   NUMBER(2) NOT NULL,
    MATH    NUMBER(3),
    ENGLISH NUMBER(3),
    SCIENCE NUMBER(3) 
)

-- [2] 엑셀 데이터를 IMPORT 하기(TOAD 사용법)
-- Toad에서 Database --> Import --> Import Table Data 실행
-- Object Name : Exam(우리가 만든 테이블) 선택 후 -> NEXT
-- Excel file을 체크 선택하고 excel_exam.xlsx 파일을 선택해준다 -> NEXT
-- First Row:2 (헤더는 삭제) , Last Row : 입력 안하거나 원하는 값 -> NEXT
-- 이후 계속 NEXT 나 OK를 눌르고 EXCUTE를 눌러 완료한다

-- IMPORT된 데이터를 확인해본다
SELECT * FROM EXAM;

-- [3] 데이터 분석하기


-- (1) 프로젝션 : 테이블에서 열을 추출하기
SELECT ID, CLASS, MATH
FROM EXAM;

-- (2) 셀렉션 : 행을 추출하기
SELECT ID, CLASS, MATH
FROM EXAM
WHERE MATH > 60;

SELECT ID, CLASS, MATH
FROM EXAM
WHERE CLASS IN(1, 3, 5);

SELECT ID, CLASS, MATH
FROM EXAM
WHERE CLASS =5
   AND  MATH >= 70;


-- (3) 총점과 평균의 컬럼을 추가, 평균을 오름차순으로 출력하기
SELECT ID, CLASS, MATH, ENGLISH, SCIENCE,
   MATH + ENGLISH + SCIENCE AS 총점,
   ROUND((MATH + ENGLISH + SCIENCE)/3) AS 평균
   FROM EXAM
   ORDER BY ROUND((MATH + ENGLISH + SCIENCE)/3);
   
-- (4) 컬럼들의 평균 구하기
SELECT AVG(MATH) AS "수학평균",
       AVG(ENGLISH) AS "영어평균",
       AVG(SCIENCE) AS "과학평균"
    FROM EXAM;
    
    
-- (5) 반별 평균 구하기
SELECT CLASS, AVG(MATH) AS "수학평균"
    FROM EXAM
GROUP BY CLASS;

SELECT CLASS, AVG(MATH) AS "수학평균"
    FROM EXAM
GROUP BY CLASS
        HAVING AVG(MATH) >= 60;


-- (6) 반별 학생수(빈도) 구하기 
SELECT CLASS, COUNT(*)
FROM EXAM
GROUP BY CLASS
ORDER BY CLASS;

-- (7) NULL 결측치 처리
-- 테스트를 위한 결측 데이터를 삽입
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES(21, 6, NULL, NULL, 95);
        
INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE)
        VALUES(22, 6, 80, NULL, NULL);

INSERT INTO EXAM (ID,CLASS,MATH,ENGLISH,SCIENCE) --삭제는 DELETE FROM EXAM ~
        VALUES(23, 6, NULL, 15, NULL);

SELECT *
    FROM EXAM;

-- 결측치를 0으로 설정 후 총점 및 평균 구하기
SELECT ID, CLASS, MATH, ENGLISH, SCIENCE,
   MATH + ENGLISH + SCIENCE AS "NULL_총점",
   NVL(MATH, 0) + NVL(ENGLISH, 0) + NVL(SCIENCE,0) AS "NVL_총점",
   ROUND((NVL(MATH,0) + NVL(ENGLISH,0) + NVL(SCIENCE,0))/3) AS "NVL_평균"
   FROM EXAM;
