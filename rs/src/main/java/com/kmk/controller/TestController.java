package com.kmk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kmk.domain.Test;
import com.kmk.service.TestService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RestController
public class TestController {
	@Autowired TestService testService;
	
	@RequestMapping("list")
	public List<Test> test() {
		log.info("test====");		
		return testService.getList();
	}
}
