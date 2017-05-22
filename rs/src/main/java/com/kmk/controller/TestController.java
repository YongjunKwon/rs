package com.kmk.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kmk.domain.Test;

@RestController
public class TestController {
	
	@RequestMapping("/{name}/{message}")
	public Test test(@PathVariable String name,
					   @PathVariable String message) {
		Test test = new Test();
		test.setName(name);
		test.setMessage(message);
		return test;
	}
}


//svn 
// local -> staging - > repo(github)