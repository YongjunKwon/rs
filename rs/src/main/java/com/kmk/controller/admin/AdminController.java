package com.kmk.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.kmk.domain.Board;
import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
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
	    return "admin/home";
	}
	
	 @RequestMapping("upToMember")
	  public String upToMember(User user,Model model) {
	    
	    logger.info(" @@@@@@@@@@@@@ User >>>  " + user.getBiz_nm());
	    
    	    CommCode commCode = new CommCode();
          CommCode commCode2 = new CommCode();
          commCode.setCd_grp("ZZ");
          commCode.setCd(null);
          
          commCode2.setCd_grp("AA");
          commCode2.setParent_cd(user.getArea_cd());
          
	        List<User> list = adminService.selectUserList(user);
	        Board board = new Board();
	        board.setCategorynm("AD0101");
	        
	        PaginationUtils.bindTotalRecordCount(user.getPagination(), list, "tot_cnt");
	        
	        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
	        model.addAttribute("comboDtlAreaCdList", commonService.findComboAreaCdList(commCode2));
	        
	        model.addAttribute("list", list);
	        model.addAttribute("user", user);
	        model.addAttribute("board", board);
	      return "admin/upToMember";
	  }
	
	@RequestMapping("/saveData")
    public String saveData(HttpServletRequest req, UserListWrapper userListWrapper, HttpSession session, HttpServletResponse response) throws IOException {
        
        String[] chkValues = req.getParameterValues("hiddenChkval"); 
        String[] userIds = req.getParameterValues("user_id"); 
        String[] expireDates = req.getParameterValues("expire_date"); 
        String[] imgVisibleDate = req.getParameterValues("img_visible_date"); 
        
        logger.info(" chkValues.length : {} ", chkValues.length);
        
        // 1번반복됨...
        for(int i=0; i<userIds.length; i++) {
        	if("Y".equals(chkValues[i])) {
        		logger.info(" chkValues["+i+"] : {} ", chkValues[i]);
        		logger.info(" expire_date : {} ", expireDates[i].replaceAll("-", ""));
        		logger.info(" img_visible_date : {} ", imgVisibleDate[i].replaceAll("-", ""));
        		logger.info(" user_id : {} ", userIds[i]);
        		
        		User user = new User();
        		user.setUser_id(userIds[i]);
        		user.setExpire_date(expireDates[i].replaceAll("-", ""));
        		user.setImg_visible_date(imgVisibleDate[i].replaceAll("-", ""));
        		adminService.updateUserExpireDate(user);
        		
        	}
        	
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        //String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();
        String return_url = "/admin/";

        out.println("<script>alert('정상적으로 등록 되었습니다.');location.href='" + return_url + "'; </script>");
        out.flush();
        
        return "admin/upToMember";
    }
}
