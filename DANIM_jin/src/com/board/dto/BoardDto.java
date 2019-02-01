package com.board.dto;

import java.util.Date;

public class BoardDto {

	private int boardno;
	private String id;
	private String title;
	private int likenum;
	private String regdate;
	private int viewcount;
	private String filename;
	private String content;
	
	public BoardDto() {
		
	}
	// select
	public BoardDto(int boardno, String id, String title, int likenum, String regdate, int viewcount, String filename,
			String content) {
		super();
		this.boardno = boardno;
		this.id = id;
		this.title = title;
		this.likenum = likenum;
		this.regdate = regdate;
		this.viewcount = viewcount;
		this.filename = filename;
		this.content = content;
	}
	
	// insert
	public BoardDto(String title, String filename, String content) {
		super();
		this.title = title;
		this.filename = filename;
		this.content = content;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
