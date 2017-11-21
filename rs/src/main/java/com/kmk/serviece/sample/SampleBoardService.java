package com.kmk.serviece.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.sample.SampleBoard;
import com.kmk.mapper.sample.SampleBoardMapper;

@Service
@Transactional
public class SampleBoardService {
	//private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SampleBoardMapper sampleBoardMapper;
	
	public List<SampleBoard> selectSampleBoard(SampleBoard sampleBoard){
		//logger.info("query test: {}", testMapper.getList());
		return sampleBoardMapper.selectSampleBoard(sampleBoard);
	}
	
	public SampleBoard selectDetailSampleBoard(int seq){
		//logger.info("query test: {}", testMapper.getList());
		return sampleBoardMapper.selectDetailSampleBoard(seq);
	}
	
//	public void insertBoard(SampleBoard sampleBoard){	
//		//logger.info("query test: {}", testMapper.getList());
//		chickenMapper.insertBoard(sampleBoard);
//	}
//	
//	public List<SampleBoard> selectSampleBoard(){
//		//logger.info("query test: {}", testMapper.getList());
//		return chickenMapper.selectSampleBoard();
//	}
}
			