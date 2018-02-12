package com.kmk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.Board;
import com.kmk.domain.Reply;
import com.kmk.mapper.BoardMapper;

@Service
@Transactional
public class BoardService {
	//private final Logger logger = LoggerFactory.getLogger(this.getC	ass());
	
	@Autowired BoardMapper boardMapper;
	
	public List<Board> selectBoard(Board board){
		//logger.info("query test: {}", testMapper.getList());
		return boardMapper.selectBoard(board);
	}
	
	public Board selectDetailBoard(int seq){
		//logger.info("query test: {}", testMapper.getList());
		return boardMapper.selectDetailBoard(seq);
	}
	
	public List<Reply> selectReplyList(String user_id, int seq){
		return boardMapper.selectReplyList(user_id, seq);
	}
	
	public int bizBoardReplyReg(Reply reply){
		return boardMapper.insertReply(reply);
	}
	
	public int delFalgUpadaeReply(int reply_seq){
		return boardMapper.delFalgUpadaeReply(reply_seq);
	}
	
	public int updateCnt(int seq){
		return boardMapper.updateCnt(seq);
	}

	public String selectReplyUserId(int reply_seq){
		return boardMapper.selectReplyUserId(reply_seq);
	}
	
	public void insertBoard(Board board){	
		boardMapper.insertBoard(board);
	}
	
//	
//	public List<Board> selectSampleBoard(){
//		//logger.info("query test: {}", testMapper.getList());
//		return chickenMapper.selectSampleBoard();
//	}
}
			