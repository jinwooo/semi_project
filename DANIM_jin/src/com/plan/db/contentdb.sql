DROP SEQUENCE PLANSEQUENCE;
DROP TABLE PLAN;

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
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE1','20190121','20190121','TESTDATA','PIMAGE','USER2');

INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE2','20190121','20190121','TESTDATA','PIMAGE','USER2');

INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE3','20190121','20190121','TESTDATA','PIMAGE','USER2');


INSERT INTO PLAN
VALUES (PLANSEQUENCE.NEXTVAL , 'sampleDAta', 'sampledata', 'sampleData', 'sampleData','IMAGENAME', 'efg' );

INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE4','20190121','20190121','TESTDATA','PIMAGE','USER2');

INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE5','20190121','20190121','TESTDATA','PIMAGE','USER2');
INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE6','20190121','20190121','TESTDATA','PIMAGE','USER2');
INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE7','20190121','20190121','TESTDATA','PIMAGE','USER2');
INSERT INTO PLAN
VALUES(PLANSEQUENCE.NEXTVAL,'TESTTITLE8','20190121','20190121','TESTDATA','PIMAGE','USER2');

SELECT * FROM PLAN ORDER BY PNO ASC;

SELECT COUNT(*) FROM PLAN;

DELETE FROM PLAN;

SELECT PNO,PTITLE,PSDATE,PLDATE,PDATA,PIMAGE,ID
		FROM(SELECT A.*,ROW_NUMBER() OVER(ORDER BY PNO DESC) AS RNUM FROM PLAN A)
		WHERE RNUM BETWEEN 1 AND 4
		
SELECT PNO,PTITLE,PSDATE,PLDATE,PDATA,PIMAGE,ID
FROM(SELECT A.*,ROW_NUMBER() OVER(ORDER BY PNO DESC) AS RNUM FROM PLAN A)
WHERE RNUM BETWEEN 5 AND 8

UPDATE PLAN SET PTITLE = 'TESTTITLE5' WHERE PNO = '3';
