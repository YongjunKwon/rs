package com.kmk.service.board.chicken;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.SampleBoard;
import com.kmk.domain.Test;
import com.kmk.mapper.ChickenMapper;
import com.kmk.mapper.TestMapper;

@Service
@Transactional
public class ChickenService {
	//private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired TestMapper testMapper;
	@Autowired ChickenMapper chickenMapper;
	
	public List<Test> getList(){
		//logger.info("query test: {}", testMapper.getList());
		return testMapper.getList();
	}
	
	public void insertBoard(SampleBoard sampleBoard){	
		//logger.info("query test: {}", testMapper.getList());
		chickenMapper.insertBoard(sampleBoard);
	}
	
	public List<SampleBoard> selectSampleBoard(){
		//logger.info("query test: {}", testMapper.getList());
		return chickenMapper.selectSampleBoard();
	}
}
			