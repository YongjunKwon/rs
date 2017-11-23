package com.kmk.domain.common;

import lombok.Data;

@Data
public class CommCode {
	
	private String cd_grp;
	private String cd_grp_nm;
	private String cd;
	private String cd_nm;
	private String parent_cd;
	private String description;
    private String use_flag;
    private String ext;
    private int sort_seq;
}
