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
	
	@RequestMapping("home")
	public String home(Model model) {
	    return "admin/home";
	}
	
	@RequestMapping("customer")
	public String customer(Board board, Model model) {
		
		logger.info(" @@@@@@@@@@@@@ boardList start @@@@@@@@@@@@@@@ ");
		logger.info(" @@@@@@@@@@@@@ boardList 공통분기처리::: 카데고리명 ::: " + board.getCategorynm());
		
		String returnPage = "";
		
		switch(board.getCategorynm()) {
		    /*********************
		     * 업소정보 카테고리
		     */
			case "op": 
		    	logger.info(" op return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "오피스텔");
		    	
		    	board.setCategory("CG0101");
		    	//board.setCategorynm(board.getCategorynm());
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		         
		    case "gunma": 
		    	logger.info(" gunma return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "건마");
		    	
		    	board.setCategory("CG0102");
		    	//board.setCategorynm("op");
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		    	
		    case "anma": 
		    	logger.info(" anma return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "안마");
		    	
		    	board.setCategory("CG0103");
		    	//board.setCategorynm("op");
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		    	
		    case "play": 
		    	logger.info(" play return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "유흥주점");
		    	
		    	board.setCategory("CG0104");
		    	//board.setCategorynm("op");
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		    	
		    case "tel": 
		    	logger.info(" tel return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "휴게텔");
		    	
		    	board.setCategory("CG0105");
		    	//board.setCategorynm("op");
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		    	
		    case "lib": 
		    	logger.info(" lib return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "립카페/핸플/키스");
		    	
		    	board.setCategory("CG0106");
		    	//board.setCategorynm("op");
		    	returnPage = "board/bizInfo/bizBoardList";
		    	break;
		    
		    	
		    /*********************
		     * 업소후기 카테고리
		     */	
		    case "oph": 
		    	logger.info(" oph return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "gunmah": 
		    	logger.info(" gunmah return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "anmah": 
		    	logger.info(" anmah return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "playh": 
		    	logger.info(" playh return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "telh": 
		    	logger.info(" telh return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "libh": 
		    	logger.info(" libh return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "bizwm": 
		    	logger.info(" bizwm return page setting " + board.getCategorynm());
		    	break;
		    	
		    case "partner": 
		    	logger.info(" partner return page setting " + board.getCategorynm());
		    	break;
		}
		
		CommCode commCode = new CommCode();
		commCode.setCd_grp("AA");
		commCode.setCd(null); 
		
		//List<CamelCaseMap> recvList = vocmService.findRecvList(vocmWebSearch);
		List<Board> samList = new ArrayList<Board>();
		samList = boardService.selectBoard(board);
		PaginationUtils.bindTotalRecordCount(board.getPagination(), samList, "tot_cnt");
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getCurrentPageNo : {} ", board.getPagination().getCurrentPageNo());
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getPageSize : {} ", board.getPagination().getPageSize());
		logger.info(" @@@@@@@@@@@@@ board.getPagination(): getTotalRecordCount : {} ", board.getPagination().getTotalRecordCount());
		
		model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
		model.addAttribute("list", samList);
		model.addAttribute("board", board);
		
	    return "admin/customer";
	}
}
