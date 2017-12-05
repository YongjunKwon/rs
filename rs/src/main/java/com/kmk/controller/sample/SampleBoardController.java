package com.kmk.controller.sample;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmk.controller.TestController;
import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
import com.kmk.domain.sample.Reply;
import com.kmk.domain.sample.SampleBoard;
import com.kmk.domain.user.LoginUser;
import com.kmk.service.common.CommonService;
import com.kmk.service.sample.SampleBoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("board/sample/")
@Controller
public class SampleBoardController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@Autowired SampleBoardService sampleBoardService;
		
	@Autowired CommonService commonService;
	
	
//    @ModelAttribute("commCode")
//    public CommCode getCommCode() {
//        return new CommCode();
//    }
    
    @ModelAttribute("commCodeSearch")
    public CommCodeSearch getCommCodeSearch() {
    	return new CommCodeSearch();
    }
	
	/**
	 * 조회
	 * @param model
	 * @return
	 */
	@RequestMapping("sampleList")
	public String sampleList(SampleBoard sampleBoard, Model model) {
		CommCode commCode = new CommCode();
		commCode.setCd_grp("AA");
		commCode.setCd(null); 
		
		model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
		model.addAttribute("list", sampleBoardService.selectSampleBoard(sampleBoard));
		model.addAttribute("sampleBoard", sampleBoard);
		model.addAttribute("classActiveSettings","샘플 게시판");
		
		return "board/sample/sampleList";
	}
	
	@RequestMapping("sampleDetail")
	public String sampleDetail(@RequestParam int seq, @RequestParam(defaultValue="0") int success, Model model) {
		
		model.addAttribute("contents", sampleBoardService.selectDetailSampleBoard(seq));
		model.addAttribute("replyList", sampleBoardService.selectReplyList(seq));
		model.addAttribute("success",success);
		
		return "board/sample/sampleDetail";
	}
	
    @RequestMapping("saveReply")
    public String saveReply(Reply reply, RedirectAttributes redirectAttributes, Model model, HttpSession session) {
    	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
    	reply.setUser_id(loginUser.getUser_id());
        redirectAttributes.addAttribute("success", sampleBoardService.saveReply(reply));
        redirectAttributes.addAttribute("seq", reply.getSeq());
        return "redirect:sampleDetail";
    	
    }

    
    @RequestMapping(value="delFalgUpadaeReply", method=RequestMethod.POST)
	public ModelAndView delFalgUpadaeReply(Reply reply, HttpSession session) {
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ " + reply.toString());
    	logger.debug("TestForm : {}", reply);
    	
    	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
    	
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.user_id  " + loginUser.getUser_id());
    	logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.pwd  " + loginUser.getPwd());
    	
    	String replyUserId = sampleBoardService.selectReplyUserId(reply.getReply_seq());
    	if(!replyUserId.equals(loginUser.getUser_id())) {
    		mav.addObject("seq", reply.getSeq());
    		mav.addObject("success", -99);
    	} else {
    		// check password
    		if(!reply.getPwd().equals(loginUser.getPwd())){
        		mav.addObject("seq", reply.getSeq());
        		mav.addObject("success", -98);
    		} else {
    			mav.addObject("seq", reply.getSeq());
    			mav.addObject("success", sampleBoardService.delFalgUpadaeReply(reply.getReply_seq())); // not access
    		}
    	}
        return mav;
    }
    
    @RequestMapping("selectReplyList")
    public String selectReplyList(@RequestParam int seq, Model model) {
    	
    	model.addAttribute("replyList", sampleBoardService.selectReplyList(seq));
    	return "board/sample/sampleDetail";
    }
 }
