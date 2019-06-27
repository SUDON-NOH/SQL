-- INSERT
-- Q1
CREATE TABLE EC_Product1
    AS SELECT *
    FROM EC_Product;


DESC EC_Product1;

CREATE TABLE EC_Product2
AS SELECT PRODUCT_CODE, PRODUCT_NAME, STANDARD, UNIT_PRICE, LEFT_QTY, COMPANY, IMAGENAME
FROM EC_Product1;

SELECT *
FROM EC_Product2;

DESC EC_Product2;

INSERT INTO EC_Product2
    VALUES ('FL01', '�ɴٹ�', '�������', 45000, 20, '�۷θ���', 'ROSE_01.JPG');
    
INSERT INTO EC_Product2
    VALUES ('FL02', '���ղɺ�', '���Ձ�', 80000, 20, '�۷θ���', 'BOX_02.JPG');
    
INSERT INTO EC_Product2
    VALUES ('FL03', '�ɻ���', '���100����', 130000, 20, '�۷θ���', 'ROSE_03.JPG');
    
-- Q2
-- ������ ���̺� ���� (���� SHOW RECYCLEBIN ���� " " �κ� ��ġ Ȯ�� �ʿ�)
flashback table "BIN$Oy8CQdisSs2uZiyH5h+3uQ==$0" to before drop rename to ec_basket_re;

SELECT *
FROM EC_BASKET_RE;

CREATE TABLE EC_BASKET1
    AS SELECT * FROM EC_BASKET_RE;


DESC EC_BASKET1;

-- ���۾����� ���� EC_Basket2
CREATE TABLE EC_Basket2(
        ORDER_NO        NUMBER(10),
        ORDER_ID        VARCHAR2(10) NOT NULL,
        PRODUCT_CODE    VARCHAR2(10) NOT NULL,
        ORDER_QTY       NUMBER(3) NOT NULL,
        ORDER_DATE      DATE
);

SELECT *
    FROM EC_BASKET2;

INSERT INTO EC_Basket2 VALUES
 ('001228001','usko','LN-20A2',1,'02/05/06');
 
INSERT INTO EC_Basket2 VALUES
 ('001228002','hskim','SPH-X4200',1,'02/05/06');
 
INSERT INTO EC_Basket2 VALUES
 ('001228003','mhlee','SSMF10',1,'02/05/06')

-- Q2
SELECT ORDER_NO, ORDER_ID, PRODUCT_CODE, ORDER_QTY, ORDER_DATE
FROM EC_BASKET1;

INSERT INTO EC_ORDER(ORDER_NO, ORDER_ID, PRODUCT_CODE, ORDER_QTY)
        SELECT B.ORDER_NO, B.ORDER_ID, B.PRODUCT_CODE, B.ORDER_QTY
        FROM EC_BASKET1 B;

SELECT * FROM EC_ORDER;

-- Q3
UPDATE EC_Order
    SET GUBUN = '�̰���'
WHERE GUBUN IS NULL
OR GUBUN = '����';

SELECT *
FROM EC_ORDER;

-- Q4
DELETE FROM EC_BASKET1;

SELECT * FROM EC_BASKET1;

-- Q5
UPDATE EC_ORDER
    SET CSEL = '�����Ա�',
        GUBUN = '����',
        CDATE = '20150203'
WHERE ORDER_ID = 'jupark';

SELECT *
FROM EC_ORDER;