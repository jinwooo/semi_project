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

SELECT * FROM "PLAN";


SELECT PNO 
FROM PLAN 
WHERE PTITLE = 'bbb' AND ID = #{id} AND ID = aaa;