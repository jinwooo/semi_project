package com.pay.dto;

public class payDto {

	private String paynum;
	private String id;
	private String buycount;
	private String buydate;
	private int paymoney;
	
	public payDto() {
		super();
	}

	public payDto(String paynum, String id, String buycount, String buydate, int paymoney) {
		super();
		this.paynum = paynum;
		this.id = id;
		this.buycount = buycount;
		this.buydate = buydate;
		this.paymoney = paymoney;
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

	public String getBuycount() {
		return buycount;
	}

	public void setBuycount(String buycount) {
		this.buycount = buycount;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	public int getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(int paymoney) {
		this.paymoney = paymoney;
	}
	
	
	
	
	
}