package com.danim.dto;

public class DanimDto {

	private String id;
	private String name;
	private String pw;
	private String addr;
	private String phone;
	private String email;
	private String grade;
	private String yn;
	private int pencount;
	private String confirm;
	private String sns;
	private String image;
	
	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public DanimDto() {
		
	}

	public DanimDto(String id, String name, String pw, String addr, String phone, String email, String grade, String yn,
			int pencount) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.grade = grade;
		this.yn = yn;
		this.pencount = pencount;
	}
	
	

	public DanimDto(String id, String name, String pw, String addr, String phone, String email) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
	}

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getYn() {
		return yn;
	}

	public void setYn(String yn) {
		this.yn = yn;
	}

	public int getPencount() {
		return pencount;
	}

	public void setPencount(int pencount) {
		this.pencount = pencount;
	}
	
	
}


















