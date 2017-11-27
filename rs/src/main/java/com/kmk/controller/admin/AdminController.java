package com.kmk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.service.board.chicken.ChickenService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("admin")
@Controller
public class AdminController {
	@Autowired ChickenService chickenService;
	
	@RequestMapping("home")
	public String Home(Model model) {
		
	    return "admin/home";
	}
	
}
