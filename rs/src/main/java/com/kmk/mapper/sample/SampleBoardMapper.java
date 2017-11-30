package com.kmk.mapper.sample;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kmk.domain.sample.Reply;
import com.kmk.domain.sample.SampleBoard;


public interface SampleBoardMapper {
	static final String BASE_QUERY = ""; 
	
	// 게시판 리스트 조회
	@Select({
		"<script>"
		+ " SELECT *		 "
		+ "	 FROM BOARD WHERE 1=1  "
		
		+ " <if test='title != null'> "
		+ "  AND TITLE LIKE CONCAT('%',#{title},'%') "
		+ " </if>"
		
		+ " <if test='category != null'> "
		+ "  AND CATEGORY = #{category}"
		+ " </if>"
		
		+ " <if test='area_cd != null'> "
		+ "  AND AREA_CD = #{area_cd}"
		+ " </if>"
		
		+ " <if test='content != null'> "
		+ "  AND CONTENT LIKE CONCAT('%',#{content},'%') "
		+ " </if>"
		+ " ORDER BY SEQ DESC"
		+ "</script>"
	})
	List<SampleBoard> selectSampleBoard(SampleBoard sampleBoard);
	
	// 게시판 상세조회
	@Select({
	"<script>"
	+ " SELECT *		 "
	+ "	  FROM BOARD "
	+ "  WHERE 1=1 "
	+ "    AND SEQ=#{seq} "
	+ "</script>"
	})
	SampleBoard selectDetailSampleBoard(int seq);
	
	// 게시판등록
	@Insert("INSERT INTO BOARD "
			+ "(TITLE, CONTENT, CNT, CATEGORY, AREA_CD, BIZ_NM, RECOMM_CNT, DEL_FLAG, IMG_URL, USER_ID, REG_DTIME)"
			+ " VALUES(#{title}, #{content}, #{cnt}, #{category}, #{area_cd}, #{biz_nm}, #{recomm_cnt}, #{del_flag}, #{img_url}, #{user_id}, NOW())")
	void insertBoard(SampleBoard sampleBoard);
	
	// 리플등록
	@Insert("INSERT INTO REPLY "
			+ "(SEQ, CONTENT, DEL_FLAG, USER_ID, REG_DTIME)"
			+ " VALUES(#{seq}, #{content}, 'N', #{user_id}, NOW())")
	int insertReply(Reply reply);
	
	// 리플조회
	@Select({
	"<script>"
	+ " SELECT "
	+ "  R.REPLY_SEQ"
	+ ", R.SEQ"
	+ ", R.CONTENT"
	+ ", R.DEL_FLAG"
	+ ", R.USER_ID"
	+ ", R.REG_DTIME"
	+ ", DATE_FORMAT(R.REG_DTIME, '%Y.%m.%d %H:%i:%s') AS YYYYMMDD "
	+ ", U.NICK_NM  "
	+ "	  FROM REPLY R INNER JOIN USER U ON R.USER_ID = U.USER_ID "
	+ "  WHERE 1=1 "
	+ "    AND R.SEQ=#{seq} AND R.DEL_FLAG = 'N' ORDER BY R.SEQ ASC "
	+ "</script>"
	})
	List<Reply> selectReplyList(int seq);
	
	
	@Update("UPDATE BOARD SET name=#{villageName}, district =#{district} WHERE id =#{vid}")
	void updateBoard(SampleBoard sampleBoard);
	

	
}
