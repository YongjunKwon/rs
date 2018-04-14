package com.kmk.domain.user;

import java.sql.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.kmk.base.Pagination;
import com.kmk.base.PaginationSearch;

import lombok.Data;

@Data
public class User implements PaginationSearch {
    private static final long serialVersionUID = -726859005688794223L;

    private String user_id;
    private String pwd;
    private String before_pwd;
    private String nick_nm;
    private String mgr_nm;
    private String sex;
    private String birthday;
    private String tel;
    private String mobile;
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
    private String area_nm;
    private String dtl_area_cd;
    private String biz_reg_flag;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date reg_dtime;
    private String us1er_role;
    private String expire_date;
    private String img_visible_date;
    private List<String> index_img;    
    
    private int tot_cnt;
    private int rownum;
    private String chkval;

    private Pagination pagination = new Pagination();
}
