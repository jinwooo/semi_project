
DROP TABLE BOARDCMT;
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

INSERT INTO BOARDCMT
VALUES(CMTSEQ.NEXTVAL,1,'댓글댓글댓글댓글내용이야','rlawlsdn',SYSDATE);

INSERT INTO BOARDCMT
VALUES(CMTSEQ.NEXTVAL,1,'댓글댓글댓글댓글내용이야','rlawlsdn2',SYSDATE);

INSERT INTO BOARDCMT
VALUES(CMTSEQ.NEXTVAL,1,'댓글댓글댓글댓글내용이야','rlawlsdn3');

INSERT INTO BOARDCMT
VALUES(CMTSEQ.NEXTVAL,2,'댓글댓글댓글댓글내용이야','rlawlsdn3');

SELECT * FROM BOARDCMT;

SELECT * FROM BOARDCMT WHERE BOARDNO = 1 ORDER BY CMTNO;

SELECT COUNT(*) FROM BOARDCMT WHERE BOARDNO = 1;

DELETE FROM BOARDCMT WHERE CMTNO = 35;
