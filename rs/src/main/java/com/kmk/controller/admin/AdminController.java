package com.kmk.controller.admin;

import java.util.ArrayList;
import java.util.List;

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
import com.kmk.service.BoardService;
import com.kmk.service.common.CommonService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("admin")
@Controller
public class AdminController {
	
	@Autowired BoardService boardService;
	
	@Autowired CommonService commonService;

	@ModelAttribute("commCodeSearch")
    public CommCodeSearch getCommCodeSearch() {
    	return new CommCodeSearch();
    }
	
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/")
	public String home(Model model) {
	    return "admin/home";
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
