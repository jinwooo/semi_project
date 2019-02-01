DROP TABLE USERBOARD CASCADE CONSTRAINT;

CREATE TABLE "USERBOARD" (
	"ID"	VARCHAR2(255) PRIMARY KEY,
	"NAME"	VARCHAR2(255) NOT NULL,
	"PW"	VARCHAR2(255) ,
	"ADDR"	VARCHAR2(255) ,
	"PHONE"	VARCHAR2(255) ,
	"EMAIL"	VARCHAR2(255) ,
	"GRADE"	VARCHAR2(255) NOT NULL,
	"YN"	VARCHAR2(2) NOT NULL,
	"PENCOUNT"	NUMBER NOT NULL,
	"CONFIRM" VARCHAR2(2) ,
	"SNS" VARCHAR2(255),
	"IMAGE" VARCHAR2(255) NULL
);


INSERT INTO USERBOARD VALUES('admin','admin','d1e9fddaa025fe5dc9f817c774bca132f2c8bc4ee8ec7387b12ea6eed41403e7',
'admin','admin','admin','admin','Y','0','Y','origin','');

SELECT * FROM "USERBOARD";

DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP SEQUENCE BOARDSEQ;

CREATE SEQUENCE BOARDSEQ;

CREATE TABLE BOARD (
	BOARDNO	NUMBER PRIMARY KEY,
	ID	VARCHAR2(200) NOT NULL,
	TITLE	VARCHAR2(500) NOT NULL,
	LIKENUM	NUMBER,
	REGDATE DATE NOT NULL,
	VIEWCOUNT	NUMBER ,
	FILENAME	VARCHAR2(500),
	CONTENT	VARCHAR2(1000)
);

SELECT * FROM "BOARD";

INSERT INTO BOARD VALUES(BOARDSEQ.NEXTVAL,'G1','박정성 세젤예','5',SYSDATE,50,'','테스트입니다');
INSERT INTO BOARD VALUES(BOARDSEQ.NEXTVAL,'세젤예','나 인싸 아니야','123',SYSDATE,10,'','테스트입니다');
INSERT INTO BOARD VALUES(BOARDSEQ.NEXTVAL,'G1','뚱땡이 장정훈','25',SYSDATE,2000,'','테스트입니다');
INSERT INTO BOARD VALUES(BOARDSEQ.NEXTVAL,'서철환','버스 태우기 힘들었다 다신 보지 말자','100',SYSDATE,300,'','테스트입니다');

DROP TABLE BOARDCMT CASCADE CONSTRAINT;
DROP SEQUENCE CMTSEQ;

CREATE SEQUENCE CMTSEQ;

CREATE TABLE BOARDCMT(
	CMTNO   NUMBER,
	BOARDNO   NUMBER ,
	CMT   VARCHAR2(1000) NOT NULL,
	ID   VARCHAR2(1000) NOT NULL,
	CMTDATE DATE NOT NULL,
	
	CONSTRAINT PK_CMTNO PRIMARY KEY(CMTNO, BOARDNO),
	CONSTRAINTS FK_BOARDNO FOREIGN KEY (BOARDNO)
	REFERENCES BOARD(BOARDNO)
);

SELECT * FROM BOARDCMT;

DROP TABLE "USERLIKE";

CREATE TABLE "USERLIKE" (
	"ID"	VARCHAR2(255)	NOT NULL,
	"BOARDNO"	NUMBER		NOT NULL
);

SELECT * FROM USERLIKE;

DROP TABLE DETAILPLAN;

CREATE TABLE "DETAILPLAN" (
	"DPSQ"	NUMBER		NOT NULL,
	"DPTIME"	VARCHAR2(1000)		NOT NULL,
	"PNO"	VARCHAR2(1000)		NOT NULL,
	"DPLOC"	VARCHAR2(1000)		NULL,
	"DPPLACE"	VARCHAR2(1000)		NULL,
	"DPCONT"	VARCHAR2(1000)		NULL
);

SELECT * FROM "DETAILPLAN";

DROP TABLE PLAN;
DROP SEQUENCE PLANSEQUENCE;

CREATE SEQUENCE PLANSEQUENCE;

CREATE TABLE PLAN(
   PNO VARCHAR2(1000) PRIMARY KEY,
   PTITLE VARCHAR2(100) NOT NULL,
   PSDATE VARCHAR2(500) NOT NULL,
   PLDATE VARCHAR2(500) NOT NULL,
   PDATA VARCHAR2(1000) NOT NULL,
   PIMAGE VARCHAR2(1000) NOT NULL,
   ID VARCHAR2(500) NOT NULL
);

INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE1','20190121','20190121','TESTDATA','travel2.jpg','USER2');


SELECT * FROM "PLAN";

DROP TABLE USEPAY;

CREATE TABLE USEPAY(
		PAYNUM VARCHAR2(100) PRIMARY KEY,
		ID VARCHAR2(200) NOT NULL,
		BUYDATE VARCHAR2(100) NOT NULL,
		PAYMONEY NUMBER NOT NULL
);

INSERT INTO USEPAY VALUES('1225','cjfdl','2019-01-01',1100);

SELECT * FROM USEPAY;