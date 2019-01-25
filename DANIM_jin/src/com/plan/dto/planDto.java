package com.plan.dto;

public class planDto {

	private String pno;
	private String ptitle;
	private String psdate;
	private String pldate;
	private String pdata;
	private String id;
	
	public planDto() {
		
	}
	
	public planDto(String pno, String ptitle, String psdate, String pldate, String pdata, String id) {
		super();
		this.pno = pno;
		this.ptitle = ptitle;
		this.psdate = psdate;
		this.pldate = pldate;
		this.pdata = pdata;
		this.id = id;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPsdate() {
		return psdate;
	}

	public void setPsdate(String psdate) {
		this.psdate = psdate;
	}

	public String getPldate() {
		return pldate;
	}

	public void setPldate(String pldate) {
		this.pldate = pldate;
	}

	public String getPdata() {
		return pdata;
	}

	public void setPdata(String pdata) {
		this.pdata = pdata;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
}
