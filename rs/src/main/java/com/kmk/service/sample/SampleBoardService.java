package com.kmk.service.sample;

import java.util.List;

import org.hibernate.validator.internal.util.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.sample.Reply;
import com.kmk.domain.sample.SampleBoard;
import com.kmk.mapper.sample.SampleBoardMapper;

import ch.qos.logback.classic.Logger;

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
	
	public int saveReply(Reply reply){
		return sampleBoardMapper.insertReply(reply);
	}
	
	public int delFalgUpadaeReply(int reply_seq){
		return sampleBoardMapper.delFalgUpadaeReply(reply_seq);
	}
	
	public List<Reply> selectReplyList(String user_id, int seq){
		return sampleBoardMapper.selectReplyList(user_id, seq);
	}
	
	public String selectReplyUserId(int reply_seq){
		return sampleBoardMapper.selectReplyUserId(reply_seq);
	}
	
	public void insertBoard(SampleBoard sampleBoard){
		sampleBoardMapper.insertBoard(sampleBoard);
	}
}
			