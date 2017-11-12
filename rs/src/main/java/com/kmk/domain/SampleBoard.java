package com.kmk.domain;

import lombok.Data;

@Data
public class SampleBoard {
	
	private int seq;
	private String title;
	private String content;
	private int cnt;
	private String category;
	private String areaCd;
	private String bizNm;
	private int recommCnt;
	private String delFlag;
	private String imgUrl;
	private String userId;
}
