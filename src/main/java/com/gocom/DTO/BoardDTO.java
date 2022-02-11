package com.gocom.DTO;

import java.util.Date;

public class BoardDTO {
	private int con_no; // 글번호
	private String title;
	private String name; // 작성자
	private int view_cnt; // 조회수
	private int rec_cnt; //추천수
	private int warn_cnt; // 반대수
	private Date reg_date;
	
	public int getCon_no() {
		return con_no;
	}
	@Override
	public String toString() {
		return "BoardDTO [con_no=" + con_no + ", title=" + title + ", userid=" + name + ", view_cnt=" + view_cnt
				+ ", rec_cnt=" + rec_cnt + ", warn_cnt=" + warn_cnt + "]";
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public int getRec_cnt() {
		return rec_cnt;
	}
	public void setRec_cnt(int rec_cnt) {
		this.rec_cnt = rec_cnt;
	}
	public int getWarn_cnt() {
		return warn_cnt;
	}
	public void setWarn_cnt(int warn_cnt) {
		this.warn_cnt = warn_cnt;
	}
}
/*

CREATE TABLE board(
	con_no INT NOT NULL,
	title VARCHAR(500) NOT NULL,
	userid VARCHAR(50) NOT NULL,
	view_cnt INT NULL DEFAULT 0,
	rec_cnt INT NULL DEFAULT 0,
	warn_cnt INT NULL DEFAULT 0

);
 */
