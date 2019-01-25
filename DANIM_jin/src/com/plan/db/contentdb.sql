DROP SEQUENCE MYCONTENT;
DROP TABLE MYCON;

CREATE SEQUENCE PLANSEQUENCE;

CREATE TABLE PLAN(
	PNO VARCHAR2(1000) PRIMARY KEY,
	PTITLE VARCHAR2(100) NOT NULL,
	PSDATE VARCHAR2(500) NOT NULL,
	PLDATE VARCHAR2(500) NOT NULL,
	PDATA VARCHAR2(1000) NOT NULL,
	ID VARCHAR2(500) NOT NULL
);

INSERT INTO PLAN
VALUES('1','TESTTITLE1','20190121','20190121','TESTDATA','USER2');

INSERT INTO PLAN
VALUES('2','TESTTITLE2','20190121','20190121','TESTDATA','USER2');

INSERT INTO PLAN
VALUES('3','TESTTITLE3','20190121','20190121','TESTDATA','USER2');

SELECT * FROM PLAN ORDER BY PNO ASC;

UPDATE PLAN SET PTITLE = 'TESTTITLE5' WHERE PNO = '3';