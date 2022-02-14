package com.gocom.DTO;

import java.util.Date;

public class GuestbookDTO {
	private int gb_no;
	private String name;
	private String ment;
	private Date reg_date;
	@Override
	public String toString() {
		return "GuestbookDTO [gb_no=" + gb_no + ", name=" + name + ", ment=" + ment + ", reg_date=" + reg_date + "]";
	}
	public int getGb_no() {
		return gb_no;
	}
	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMent() {
		return ment;
	}
	public void setMent(String ment) {
		this.ment = ment;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
