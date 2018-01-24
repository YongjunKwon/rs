package com.kmk.domain.sample;

import com.kmk.base.Pagination;
import com.kmk.base.PaginationSearch;

import lombok.Data;

@Data
public class SampleBoard implements PaginationSearch{
	private static final long serialVersionUID = -726859005688794223L;
	
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
	private int tot_cnt;
	private int rownum;
	
    private Pagination pagination = new Pagination();


}
