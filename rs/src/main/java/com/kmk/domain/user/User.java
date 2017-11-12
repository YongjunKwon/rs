package com.kmk.domain.user;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class User {
	private String user_id;
	private String pwd;
	private String nick_nm;
	private String mgr_nm;
	private String sex;
	private String birthday;
	private String tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date act_s_time;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date act_e_time;
	private String addr;
	private String mem_type;
	private String del_flag;
	private String entry_path_cd;
	private String biz_nm;
	private String category;
	private String area_cd;
	private String biz_reg_flag;
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date reg_dtime;
	private String user_role;
}
