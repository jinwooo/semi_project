package com.cmt.dto;

public class BoardCmtDto {

	private int cmtno;
	private int boardno;
	private String cmt;
	private String id;
	
	
	public BoardCmtDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardCmtDto(int cmtno, int boardno, String cmt, String id) {
		super();
		this.cmtno = cmtno;
		this.boardno = boardno;
		this.cmt = cmt;
		this.id = id;
	}


	public int getCmtno() {
		return cmtno;
	}


	public void setCmtno(int cmtno) {
		this.cmtno = cmtno;
	}


	public int getBoardno() {
		return boardno;
	}


	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}


	public String getCmt() {
		return cmt;
	}


	public void setCmt(String cmt) {
		this.cmt = cmt;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
}
