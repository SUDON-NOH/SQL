/**********************************************************
*  테이블 삭제
***********************************************************/
DROP TABLE EC_Order;
DROP TABLE EC_Basket;
DROP TABLE EC_Member;
DROP TABLE EC_Product;

/**********************************************************
*  EC_Product 테이블 생성
***********************************************************/
CREATE TABLE EC_Product (
Product_Code         VARCHAR2(10),
Product_Name         VARCHAR2(20)      NOT NULL,
Standard             VARCHAR2(20),
Unit                 VARCHAR2(10),
Unit_Price           NUMBER(7)         NOT NULL,
Left_Qty             NUMBER(5),
Company              VARCHAR2(20),
ImageName            VARCHAR2(20),
Info                 VARCHAR2(80),
Detail_Info          VARCHAR2(255),
CONSTRAINT  EC_Product_Pk1 PRIMARY KEY (Product_Code));

/**********************************************************
*  EC_Member 테이블 생성
***********************************************************/
CREATE TABLE EC_Member (
UserID               VARCHAR2(10),
Passwd               VARCHAR2(10)      NOT NULL,
Name                 VARCHAR2(10)      NOT NULL,
Regist_No            VARCHAR2(14)      NOT NULL,
Email                VARCHAR2(20),
Telephone            VARCHAR2(12)      NOT NULL,
Address              VARCHAR2(40),
Timestamp            DATE              DEFAULT SYSDATE,
CONSTRAINT  EC_Member_Pk PRIMARY KEY (UserID));

/**********************************************************
*  EC_Basket 테이블 생성
***********************************************************/
CREATE TABLE EC_Basket (
Order_No             VARCHAR2(10),
Order_ID             VARCHAR2(10)      NOT NULL,
Product_Code         VARCHAR2(10)      NOT NULL,
Order_Qty            NUMBER(3)         NOT NULL,
Order_date           Date              Default    SYSDATE,
CONSTRAINT  EC_Basket_Pk1 PRIMARY KEY (Order_NO),
CONSTRAINT  EC_Basket_Fk1 FOREIGN KEY (Order_ID)
            REFERENCES    EC_Member,
CONSTRAINT  EC_Basket_Fk2 FOREIGN KEY (Product_Code)
            REFERENCES    EC_Product);

/**********************************************************
*  EC_Order 테이블 생성
***********************************************************/
CREATE TABLE EC_Order (
Order_No             VARCHAR2(10)      NOT NULL,
Order_ID             VARCHAR2(10)      NOT NULL,
Product_Code         VARCHAR2(10)      NOT NULL,
Order_Qty            NUMBER(3)         NOT NULL,
CSel                 VARCHAR2(10),
CMoney               NUMBER(9),
CDate                DATE,
MDate                DATE,
Gubun                VARCHAR2(10),
CONSTRAINT  EC_Order_Pk1 PRIMARY KEY (Order_NO) )
/
