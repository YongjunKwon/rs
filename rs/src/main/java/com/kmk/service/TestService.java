package com.kmk.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.Test;
import com.kmk.mapper.TestMapper;

@Service
@Transactional
public class TestService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TestMapper testMapper;
	
	public List<Test> getList(){
		//logger.info("query test: {}", testMapper.getList());
		return testMapper.getList();
	}
}
