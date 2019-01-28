package com.like.dto;

public class LikeDto {

	private String id;
	private int boardno;
	
	public LikeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public LikeDto(String id, int boardno) {
		super();
		this.id = id;
		this.boardno = boardno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}

	
}
