package com.gocom.DTO;

public class ImageDTO {
	private int img_no;
	private int con_no;
	private String ofn;
	private String fsn;
	public int getImg_no() {
		return img_no;
	}
	public void setImg_no(int img_no) {
		this.img_no = img_no;
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	public String getOfn() {
		return ofn;
	}
	public void setOfn(String ofn) {
		this.ofn = ofn;
	}
	public String getFsn() {
		return fsn;
	}
	public void setFsn(String fsn) {
		this.fsn = fsn;
	}
	@Override
	public String toString() {
		return "ImageDTO [img_no=" + img_no + ", con_no=" + con_no + ", ofn=" + ofn + ", fsn=" + fsn + "]";
	}
	
}
/*
CREATE TABLE image(
	img_no INT NOT NULL PRIMARY KEY,
	con_co INT NOT NULL,
	ofn VARCHAR(500) NOT NULL,
	fsn VARCHAR(500) NOT NULL,
	size INT NOT NULL
);

*/