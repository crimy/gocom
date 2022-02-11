package com.gocom.DTO;

import java.util.Date;

public class MemberDTO {

	private String userid;
	private String password;
	private String name;
	private Date regi_date;
	
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", password=" + password + ", name=" + name + ", regi_date=" + regi_date
				+ "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegi_date() {
		return regi_date;
	}
	public void setRegi_date(Date regi_date) {
		this.regi_date = regi_date;
	}
}

/*
CREATE TABLE member(
userid VARCHAR(50) NOT NULL PRIMARY KEY,
password VARCHAR(50) NOT NULL,
name VARCHAR(50) NOT NULL,
regi_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

COMMIT;

insert into member (userid,password,name)
values ('admin','1234','관리자');

commit;
*/