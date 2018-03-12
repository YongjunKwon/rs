package com.kmk.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.base.PaginationUtils;
import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
import com.kmk.domain.user.LoginUser;
import com.kmk.domain.user.User;
import com.kmk.domain.user.UserListWrapper;
import com.kmk.service.admin.AdminService;
import com.kmk.service.common.CommonService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("admin")
@Controller
public class AdminController {
	
	@Autowired AdminService adminService;
	
	@Autowired CommonService commonService;

	@ModelAttribute("commCodeSearch")
    public CommCodeSearch getCommCodeSearch() {
    	return new CommCodeSearch();
    }
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/")
	public String home(User user,Model model) {
		
		logger.info(" @@@@@@@@@@@@@ User >>>  " + user.getBiz_nm());
		
        CommCode commCode = new CommCode();
        commCode.setCd_grp("AA");
        commCode.setCd(null);
        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
        
        List<User> list = new ArrayList<User>();
        list = adminService.selectUserList(user);

        PaginationUtils.bindTotalRecordCount(user.getPagination(), list, "tot_cnt");
        logger.info(" @@@@@@@@@@@@@ User.getPagination(): getCurrentPageNo : {} ", user.getPagination().getCurrentPageNo());
        logger.info(" @@@@@@@@@@@@@ User.getPagination(): getPageSize : {} ", user.getPagination().getPageSize());
        logger.info(" @@@@@@@@@@@@@ User.getPagination(): getTotalRecordCount : {} ", user.getPagination().getTotalRecordCount());
        
        model.addAttribute("list", list);
        model.addAttribute("user", user);
		
	    return "admin/home";
	}
	
	@RequestMapping("/saveData")
    public void saveData(UserListWrapper userListWrapper, HttpSession session, HttpServletResponse response) throws IOException {
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        //board.setBiz_nm(loginUser.getBiz_nm());     
        
		List<User> list = userListWrapper.getUserList();
		
		logger.info(" list.size() : {} ", list.size());
		
		if(null != list && list.size() > 0) {
			
			for (User user : list) {
				
				logger.info(" User user.getChkVal() : {} ", user.getChkVal());
				if("Y".equals( user.getChkVal())) {
					logger.info(" User user.getUser_id() : {} ", user.getUser_id());
					logger.info(" User user.getExpire_date() : {} ", user.getExpire_date());
				}
				//adminService.iBoard(board);
			}
		}
		
		
        
        

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        //String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();
        String return_url = "/admin/home";

        out.println("<script>alert('정상적으로 등록 되었습니다.');location.href='" + return_url + "'; </script>");
        out.flush();

    }
/*	@RequestMapping("biz/upToMember")
	public String upToMember(User user, Model model) {
		
			
		CommCode commCode = new CommCode();
		commCode.setCd_grp("AA");
		commCode.setCd(null); 
		
		//List<CamelCaseMap> recvList = vocmService.findRecvList(vocmWebSearch);
		List<Board> samList = new ArrayList<Board>();
		samList = boardService.selectBizUser(user);
		PaginationUtils.bindTotalRecordCount(user.getPagination(), samList, "tot_cnt");
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getCurrentPageNo : {} ", board.getPagination().getCurrentPageNo());
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getPageSize : {} ", board.getPagination().getPageSize());
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getTotalRecordCount : {} ", board.getPagination().getTotalRecordCount());
		
		model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
		model.addAttribute("list", samList);
		model.addAttribute("user", user);
		
	    return "admin/upToMember";
	}*/
}
