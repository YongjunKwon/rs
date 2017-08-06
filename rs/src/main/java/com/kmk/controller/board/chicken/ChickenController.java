package com.kmk.controller.board.chicken;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.service.TestService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("board/chicken/")
@Controller
public class ChickenController {
	@Autowired TestService testService;
	
	@RequestMapping("list")
	public String list(Model model) {
	    model.addAttribute("classActiveSettings","active");
	    return "board/chicken/list";
	}
	

}
