package com.kmk.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.user.User;
import com.kmk.mapper.admin.AdminMapper;

@Service
@Transactional
public class AdminService {
    // private final Logger logger = LoggerFactory.getLogger(this.getC ass());

    @Autowired
    AdminMapper adminMapper;

    public List<User> selectUserList(User user) {
        // logger.info("query test: {}", testMapper.getList());
        return adminMapper.selectUserList(user);
    }

//    public Board selectDetailBoard(int seq) {
//        // logger.info("query test: {}", testMapper.getList());
//        return boardMapper.selectDetailBoard(seq);
//    }
//
//    public List<Reply> selectReplyList(String user_id, int seq) {
//        return boardMapper.selectReplyList(user_id, seq);
//    }	
//
//    public int bizBoardReplyReg(Reply reply) {
//        return boardMapper.insertReply(reply);
//    }
//
//    public int delFlagUpadateReply(int reply_seq) {
//        return boardMapper.delFlagUpadateReply(reply_seq);
//    }
//
//    public int updateCnt(int seq) {
//        return boardMapper.updateCnt(seq);
//    }
//
//    public String selectReplyUserId(int reply_seq) {
//        return boardMapper.selectReplyUserId(reply_seq);
//    }
//
//    public void insertBoard(Board board) {
//        boardMapper.insertBoard(board);
//    }
//
//    public int delFlagUpadateBoard(int reply_seq) {
//        return boardMapper.delFlagUpadateBoard(reply_seq);
//    }
//
//    public void updateBoard(Board board) {
//        boardMapper.upadateBoard(board);
//    }

}
