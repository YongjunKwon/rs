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
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "anma": 
		    	logger.info(" anma return page setting " + categorynm);
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "play": 
		    	logger.info(" play return page setting " + categorynm);
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "tel": 
		    	logger.info(" tel return page setting " + categorynm);
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    	
		    case "lib": 
		    	logger.info(" lib return page setting " + categorynm);
		    	returnPage = "board/bizInfo/bizBoardDetail";
		    	break;
		    
		    	
		    /*********************
		     * 업소후기 카테고리
		     */	
		    case "oph": 
		    	logger.info(" oph return page setting " + categorynm);
		    	break;
		    	
		    case "gunmah": 
		    	logger.info(" gunmah return page setting " + categorynm);
		    	break;
		    	
		    case "anmah": 
		    	logger.info(" anmah return page setting " + categorynm);
		    	break;
		    	
		    case "playh": 
		    	logger.info(" playh return page setting " + categorynm);
		    	break;
		    	
		    case "telh": 
		    	logger.info(" telh return page setting " + categorynm);
		    	break;
		    	
		    case "libh": 
		    	logger.info(" libh return page setting " + categorynm);
		    	break;
		    	
		    case "bizwm": 
		    	logger.info(" bizwm return page setting " + categorynm);
		    	break;
		    	
		    case "partner": 
		    	logger.info(" partner return page setting " + categorynm);
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
    
	
   @RequestMapping("bizBoardWrite")
   public String write(String categorynm, Model model) {
	  logger.info(" bizBoardWrite :::: >>>> categorynm ::: " + categorynm);
      return "board/bizInfo/bizInfoWrite";
   }
   
//   @RequestMapping("saveBoard")
//   public String saveBoard(Board board) {
//	  boardService.insertBoard(board);
//      return "redirect:sampleList";
//   }
	
 }
