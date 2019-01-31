package com.pay.dto;

public class payDto {

	private String paynum;
	private String id;
	private int paymoney;
	private String buydate;
	
	public payDto() {
		super();
	}

	public payDto(String paynum, String id, int paymoney) {
		super();
		this.paynum = paynum;
		this.id = id;
		this.paymoney = paymoney;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}
	
	public String getPaynum() {
		return paynum;
	}  

	public void setPaynum(String paynum) {
		this.paynum = paynum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}
	
	
	
	
	
}
