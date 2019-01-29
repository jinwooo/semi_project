package com.map.dto;

public class detailPlanDto {
	
	private int dpsq;
	private String dptime;
	private String pno;
	private String dploc;
	private String dpplace;
	private String dpcont;
	
	
	public detailPlanDto() {
		super();
	}
	
	public detailPlanDto(int dpsq, String dptime, String pno, String dploc, String dpplace, String dpcont) {
		super();
		this.dpsq = dpsq;
		this.dptime = dptime;
		this.pno = pno;
		this.dploc = dploc;
		this.dpplace = dpplace;
		this.dpcont = dpcont;
	}
	
	public int getDpsq() {
		return dpsq;
	}
	public void setDpsq(int dpsq) {
		this.dpsq = dpsq;
	}
	public String getDptime() {
		return dptime;
	}
	public void setDptime(String dptime) {
		this.dptime = dptime;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getDploc() {
		return dploc;
	}
	public void setDploc(String dploc) {
		this.dploc = dploc;
	}
	public String getDpplace() {
		return dpplace;
	}
	public void setDpplace(String dpplace) {
		this.dpplace = dpplace;
	}
	public String getDpcont() {
		return dpcont;
	}
	public void setDpcont(String dpcont) {
		this.dpcont = dpcont;
	}
}
