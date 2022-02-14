package com.gocom.DTO;

public class RecListDTO {
	private String userid;
	private int con_no;
	public RecListDTO(String userid2, int con_no2) {
		this.setUserid(userid2);
		this.setCon_no(con_no2);
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	@Override
	public String toString() {
		return "RecListDTO [userid=" + userid + ", con_no=" + con_no + "]";
	}
}
