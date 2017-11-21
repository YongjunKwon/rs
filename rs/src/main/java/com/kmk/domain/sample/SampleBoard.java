package com.kmk.domain.sample;

import lombok.Data;

@Data
public class SampleBoard {
	
	private int seq;
	private String title;
	private String content;
	private int cnt;
	private String category;
	private String area_cd;
	private String biz_nm;
	private int recomm_cnt;
	private String del_flag;
	private String img_url;
	private String user_id;
}
