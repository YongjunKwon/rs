package com.kmk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.service.TestService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@Controller
@RequestMapping("test")
public class TestController {
	@Autowired TestService testService;
	
	@RequestMapping("list")
	public String test(Model model) {
		model.addAttribute("name", "Test Bootstrap!");
		return "hello";
	}
	
	@RequestMapping("admin")
	public String admin(Model model) {
		return "adminLTE";
	}
}
