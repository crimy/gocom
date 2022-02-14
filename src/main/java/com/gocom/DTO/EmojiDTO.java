package com.gocom.DTO;

public class EmojiDTO {
	private int con_no;
	private String emo_name;
	private String name;
	private int x_pos;
	private int y_pos;
	public int getX_pos() {
		return x_pos;
	}
	public void setX_pos(int x_pos) {
		this.x_pos = x_pos;
	}
	public int getY_pos() {
		return y_pos;
	}
	public void setY_pos(int y_pos) {
		this.y_pos = y_pos;
	}

	@Override
	public String toString() {
		return "EmojiDTO [con_no=" + con_no + ", emo_name=" + emo_name + ", name=" + name + ", x_pos=" + x_pos
				+ ", y_pos=" + y_pos + "]";
	}
	public int getCon_no() {
		return con_no;
	}
	public void setCon_no(int con_no) {
		this.con_no = con_no;
	}
	public String getEmo_name() {
		return emo_name;
	}
	public void setEmo_name(String emo_name) {
		this.emo_name = emo_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
