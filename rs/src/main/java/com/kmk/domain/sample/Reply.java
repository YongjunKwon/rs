package com.kmk.domain.sample;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Reply {
	
	private int reply_seq;
	private int seq;
	private String content;
	private String del_flag;
	private String user_id;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date reg_dtime;
	private String yyyymmdd;
	
	private String nick_nm;
	private String pwd;
}
