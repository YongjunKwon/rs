package com.kmk.controller.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
import com.kmk.domain.sample.SampleBoard;
import com.kmk.service.common.CommonService;
import com.kmk.serviece.sample.SampleBoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("board/sample/")
@Controller
public class SampleBoardController {
	
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
	public String sampleDetail(@RequestParam int seq, Model model) {
		
		model.addAttribute("contents", sampleBoardService.selectDetailSampleBoard(seq));
		model.addAttribute("classActiveSettings","게시판 상세내용");
		
		return "board/sample/sampleDetail";
	}
	
//	@RequestMapping("sample_w_index")
//	public String sample_w_index(Model model) {
//		return "page/test/index";
//	}
//	
//	@RequestMapping("sample_write_insert")
//	//public String sample_write_insert(@ModelAttribute("SampleBoard") SampleBoard sampleBoard) {
//	public String sample_write_insert(SampleBoard sampleBoard) {
//		chickenService.insertBoard(sampleBoard);
//		return "redirect:sampleList";
//	}
    
 }
