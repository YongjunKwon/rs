package com.kmk.controller.board.chicken;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.domain.Test;
import com.kmk.service.board.chicken.ChickenService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("board/chicken/")
@Controller
public class ChickenController {
	@Autowired ChickenService chickenService;
	
	@RequestMapping("list")
	public String list(Model model) {
		Test test = new Test();
		test.setName("testName");
		
//		log.info("test : {}", chickenService.getList());
		
		model.addAttribute("list", chickenService.getList());
	    model.addAttribute("classActiveSettings","active");
	    return "board/chicken/list";
	}
	

}
