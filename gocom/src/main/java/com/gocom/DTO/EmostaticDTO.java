package com.gocom.DTO;

public class EmostaticDTO {
	private String emo_name;
	private int use_cnt;
	@Override
	public String toString() {
		return "EmostaticDTO [emo_name=" + emo_name + ", use_cnt=" + use_cnt + "]";
	}
	public String getEmo_name() {
		return emo_name;
	}
	public void setEmo_name(String emo_name) {
		this.emo_name = emo_name;
	}
	public int getUse_cnt() {
		return use_cnt;
	}
	public void setUse_cnt(int use_cnt) {
		this.use_cnt = use_cnt;
	}
}
