package com.kmk.controller.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmk.base.PaginationUtils;
import com.kmk.domain.Board;
import com.kmk.domain.Reply;
import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
import com.kmk.domain.sample.SampleBoard;
import com.kmk.domain.user.LoginUser;
import com.kmk.service.BoardService;
import com.kmk.service.common.CommonService;

import lombok.extern.slf4j.Slf4j;	
@Slf4j
@CrossOrigin
@RequestMapping("board/")
@Controller
public class BoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@Autowired BoardService boardService;
		
	@Autowired CommonService commonService;

	@ModelAttribute("commCodeSearch")
    public CommCodeSearch getCommCodeSearch() {
    	return new CommCodeSearch();
    }
	
	/**
	 * 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("bizBoardList")
	public String bizBoardList(Board board, Model model) {
		
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
		    	model.addAttribute("captionTitle", "오피스텔 후기");
		    	board.setCategory("CG0201");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    case "gunmah": 
		    	logger.info(" gunmah return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "건마 후기");
		    	board.setCategory("CG0202");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    case "anmah": 
		    	logger.info(" anmah return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "안마방 후기");
		    	board.setCategory("CG0203");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    case "playh": 
		    	logger.info(" playh return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "유흥주점 후기");
		    	board.setCategory("CG0204");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    case "telh": 
		    	logger.info(" telh return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "휴게텔 후기");
		    	board.setCategory("CG0205");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    case "libh": 
		    	logger.info(" libh return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "립카페/핸플/키스 후기");
		    	board.setCategory("CG0206");
		    	returnPage = "board/bizComment/bizCommentBoardList";
		    	break;
		    	
		    /*********************
		     * 업소언니정보 카테고리
		     */	
		    case "bizwm": 
		    	logger.info(" bizwm return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "업소언니정보");
		    	board.setCategory("CG03");
		    	returnPage = "board/bizWm/bizWmBoardList";
		    	break;
	    	
		    /*********************
		     * 파트너공유 카테고리
		     */	
		    case "partner": 
		    	logger.info(" partner return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "파트너공유");
		    	board.setCategory("CG04");
		    	returnPage = "board/partnerShare/partnerShareBoardList";
		    	break;
		    	
	    	/*********************
	    	 * 업체문의게시판 카테고리
	    	 */	
		    case "bizqna": 
		    	logger.info(" bizqna return page setting " + board.getCategorynm());
		    	model.addAttribute("captionTitle", "업체문의게시판");
		    	board.setCategory("CG05");
		    	returnPage = "board/bizQna/bizQnaBoardList";
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
		
		return returnPage;
	}
	
	@RequestMapping("bizBoardDetail")
	public String bizBoardDetail(@RequestParam int seq, @RequestParam String categorynm
				, @RequestParam(defaultValue="0") int success, Model model, HttpSession session) {
		
		logger.info(" @@@@@@@@@@@@@ boardDetail 공통분기처리::: 카데고리명 ::: " + categorynm);
		
		String returnPage = "";
		
		switch(categorynm) {
		
		    /*********************
		     * 업소정보 카테고리
		     */
			case "op": 
		    	logger.info(" op return page setting " + categorynm);
		    	model.addAttribute("categorynm","op");
		    	model.addAttribute("category_tiele","오피스텔");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		         
		    case "gunma": 
		    	logger.info(" gunma return page setting " + categorynm);
		    	model.addAttribute("categorynm","gunma");
		    	model.addAttribute("category_tiele","건마");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "anma": 
		    	logger.info(" anma return page setting " + categorynm);
		    	model.addAttribute("categorynm","anma");
		    	model.addAttribute("category_tiele","안마");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "play": 
		    	logger.info(" play return page setting " + categorynm);
		    	model.addAttribute("categorynm","play");
		    	model.addAttribute("category_tiele","유흥주점");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "tel": 
		    	logger.info(" tel return page setting " + categorynm);
		    	model.addAttribute("categorynm","tel");
		    	model.addAttribute("category_tiele","휴게텔");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "lib": 
		    	logger.info(" lib return page setting " + categorynm);
		    	model.addAttribute("categorynm","lib");
		    	model.addAttribute("category_tiele","립카페/핸플/키스");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    
		    	
		    /*********************
		     * 업소후기 카테고리
		     */	
		    case "oph": 
		    	logger.info(" oph return page setting " + categorynm);
		    	model.addAttribute("categorynm","oph");
		    	model.addAttribute("category_tiele","후기 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "gunmah": 
		    	logger.info(" gunmah return page setting " + categorynm);
		    	model.addAttribute("categorynm","gunmah");
		    	model.addAttribute("category_tiele","건마 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "anmah": 
		    	logger.info(" anmah return page setting " + categorynm);
		    	model.addAttribute("categorynm","anmah");
		    	model.addAttribute("category_tiele","안마 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "playh": 
		    	logger.info(" playh return page setting " + categorynm);
		    	model.addAttribute("categorynm","playh");
		    	model.addAttribute("category_tiele","유흥주점 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "telh": 
		    	logger.info(" telh return page setting " + categorynm);
		    	model.addAttribute("categorynm","telh");
		    	model.addAttribute("category_tiele","휴게텔 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "libh": 
		    	logger.info(" libh return page setting " + categorynm);
		    	model.addAttribute("categorynm","libh");
		    	model.addAttribute("category_tiele","립카페/핸플/키스 후기");
		    	returnPage = "board/bizComment/bizWmDetail";
		    	break;
		    	
		    /*********************
		     * 업소언니정보 카테고리
		     */	
		    case "bizwm": 
		    	logger.info(" bizwm return page setting " + categorynm);
		    	model.addAttribute("categorynm","bizwm");
		    	model.addAttribute("category_tiele","업소언니정보");
		    	returnPage = "board/bizWm/partnerShareBoardDetail";
		    	break;
		    	
		    /*********************
		     * 파트너공유 카테고리
		     */	
		    case "partner": 
		    	logger.info(" partner return page setting " + categorynm);
		    	model.addAttribute("categorynm","partner");
		    	model.addAttribute("category_tiele","업소언니정보");
		    	returnPage = "board/partnerShare/partnerShareBoardDetail";
		    	break;
		    	
		    /*********************
		     * 업소언니정보 카테고리
		     */	
		    case "bizqna": 
		    	logger.info(" bizqna return page setting " + categorynm);
		    	model.addAttribute("categorynm","bizqna");
		    	model.addAttribute("category_tiele","업체문의게시판");
		    	returnPage = "board/bizQna/bizQnaBoardDetail";
		    	break;
		    	
		}
		
		
		
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");

		logger.info(" @@@@@@@@@@@@@ boardDetail >>>>> loginUser @@@@@ " + loginUser.getUser_id());
		
		
		boardService.updateCnt(seq);
		
    	model.addAttribute("contents", boardService.selectDetailBoard(seq));
		model.addAttribute("replyList", boardService.selectReplyList(loginUser.getUser_id(), seq));
		model.addAttribute("success",success);
		
		return returnPage;
	}
	
    @RequestMapping("bizBoardReplyReg")
    public String bizBoardReplyReg(Reply reply, RedirectAttributes redirectAttributes, Model model, HttpSession session) {
    	
    	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
    	reply.setUser_id(loginUser.getUser_id());
    	
    	logger.info(" @@@@@@@@@@@@@ bizBoardReplyReg @@@@@@@@@@@@@@");
    	
    	
        redirectAttributes.addAttribute("success", boardService.bizBoardReplyReg(reply));
        redirectAttributes.addAttribute("seq", reply.getSeq());
        redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
        return "redirect:bizBoardDetail";
    	
    }

    
    @RequestMapping(value="delFalgUpadaeReply", method=RequestMethod.POST)
	public String delFalgUpadaeReply(Reply reply, RedirectAttributes redirectAttributes, HttpSession session) {
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ " + reply.toString());
    	logger.debug("TestForm : {}", reply);
    	
    	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
    	
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.user_id  " + loginUser.getUser_id());
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.pwd  " + loginUser.getPwd());
    	
    	String replyUserId = boardService.selectReplyUserId(reply.getReply_seq());
    	if(!replyUserId.equals(loginUser.getUser_id())) {
    		redirectAttributes.addAttribute("seq", reply.getSeq());
    		redirectAttributes.addAttribute("success", -99);
    		redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
    	} else {
    		redirectAttributes.addAttribute("seq", reply.getSeq());
    		redirectAttributes.addAttribute("success", boardService.delFalgUpadaeReply(reply.getReply_seq())); // not access
    		redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
    	}
    	
    	return "redirect:bizBoardDetail";
    }
    
	
   // 업소정보
   @RequestMapping("bizBoardWrite")
   public String bizBoardWrite(String categorynm, Model model) {
	  logger.info(" bizBoardWrite :::: >>>> categorynm ::: " + categorynm);
	  
	  String returnPage = "";
	  
	  switch(categorynm) {
		
		    /*********************
		     * 업소정보 카테고리
		     */
			case "op": 
		    	logger.info(" op return page setting " + categorynm);
		    	model.addAttribute("categorynm","op");
		    	model.addAttribute("category_tiele","오피스텔");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		         
		    case "gunma": 
		    	logger.info(" gunma return page setting " + categorynm);
		    	model.addAttribute("categorynm","gunma");
		    	model.addAttribute("category_tiele","건마");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "anma": 
		    	logger.info(" anma return page setting " + categorynm);
		    	model.addAttribute("categorynm","anma");
		    	model.addAttribute("category_tiele","안마");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "play": 
		    	logger.info(" play return page setting " + categorynm);
		    	model.addAttribute("categorynm","play");
		    	model.addAttribute("category_tiele","유흥주점");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "tel": 
		    	logger.info(" tel return page setting " + categorynm);
		    	model.addAttribute("categorynm","tel");
		    	model.addAttribute("category_tiele","휴게텔");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "lib": 
		    	logger.info(" lib return page setting " + categorynm);
		    	model.addAttribute("categorynm","lib");
		    	model.addAttribute("category_tiele","립카페/핸플/키스");
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    
		    	
		    /*********************
		     * 업소후기 카테고리
		     */	
		    case "oph": 
		    	logger.info(" oph return page setting " + categorynm);
		    	model.addAttribute("categorynm","oph");
		    	model.addAttribute("category_tiele","후기 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "gunmah": 
		    	logger.info(" gunmah return page setting " + categorynm);
		    	model.addAttribute("categorynm","gunmah");
		    	model.addAttribute("category_tiele","건마 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "anmah": 
		    	logger.info(" anmah return page setting " + categorynm);
		    	model.addAttribute("categorynm","anmah");
		    	model.addAttribute("category_tiele","안마 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "playh": 
		    	logger.info(" playh return page setting " + categorynm);
		    	model.addAttribute("categorynm","playh");
		    	model.addAttribute("category_tiele","유흥주점 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "telh": 
		    	logger.info(" telh return page setting " + categorynm);
		    	model.addAttribute("categorynm","telh");
		    	model.addAttribute("category_tiele","휴게텔 후기");
		    	returnPage = "board/bizComment/bizCommentBoardDetail";
		    	break;
		    	
		    case "libh": 
		    	logger.info(" libh return page setting " + categorynm);
		    	model.addAttribute("categorynm","libh");
		    	model.addAttribute("category_tiele","립카페/핸플/키스 후기");
		    	returnPage = "board/bizComment/bizWmDetail";
		    	break;
		    	
		    /*********************
		     * 업소언니정보 카테고리
		     */	
		    case "bizwm": 
		    	logger.info(" bizwm return page setting " + categorynm);
		    	model.addAttribute("categorynm","bizwm");
		    	model.addAttribute("category_tiele","업소언니정보");
		    	returnPage = "board/bizWm/bizWmDetail";
		    	break;
		    	
		    /*********************
		     * 파트너공유 카테고리
		     */	
		    case "partner": 
		    	logger.info(" partner return page setting " + categorynm);
		    	model.addAttribute("categorynm","partner");
		    	model.addAttribute("category_tiele","파트너공유");
		    	returnPage = "board/partnerShare/partnerShareBoardDetail";
		    	break;
		    	
		    /*********************
		     * 업체문의게시판
		     */	
		    case "bizqna": 
		    	logger.info(" bizqna return page setting " + categorynm);
		    	model.addAttribute("categorynm","bizqna");
		    	model.addAttribute("category_tiele","업체문의게시판");
		    	returnPage = "board/bizQna/bizQnaBoardDetail";
		    	break;
		}
	  
	  return returnPage;
      //return "board/bizInfo/bizInfoWrite";
   }
   
   // 업소후기
   @RequestMapping("bizCommentBoardWrite")
   public String bizCommentBoardWrite(String categorynm, Model model) {
	   logger.info(" bizCommentBoardWrite :::: >>>> categorynm ::: " + categorynm);
	   model.addAttribute("categorynm", categorynm);
	   return "board/bizComment/bizCommentWrite";
   }
   
   
   
	@RequestMapping("bizSaveBoard")
	public String bizSaveBoard(Board board,  HttpSession session) 
	{	
		LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
	   	String userId = loginUser.getUser_id();
	   	String areaCd = loginUser.getArea_cd(); 
	   	String bizNm = loginUser.getBiz_nm();
	   	//String category = loginUser.getCategory();		
		
	   	board.setUser_id(userId);
	   	board.setArea_cd(areaCd);
	   	board.setBiz_nm(bizNm);
		//sampleBoard.setCategory(category);
		
		boardService.insertBoard(board);
		
		return "redirect:bizBoardList";
	}
	
 }
