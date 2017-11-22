package com.kmk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kmk.domain.user.User;
import com.kmk.service.TestService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("/test")
@RestController
public class TestController {
	@Autowired TestService testService;
	
	@RequestMapping("/test")
	public List<User> index(Model model) {
		List<User> lu = new ArrayList<User>();
		User user = new User();
		lu.add(user);
		return lu;
	}
	

}
