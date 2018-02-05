package com.kmk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kmk.domain.Board;
import com.kmk.domain.Reply;


public interface BoardMapper {
	static final String BASE_QUERY = ""; 
	
	// 게시판 리스트 조회
	@Select({
		"<script>"
		+ "SELECT B.* FROM ( SELECT ROWNUM AS RNUM, A.*FROM ( "
		+ " SELECT @ROWNUM:=@ROWNUM+1 AS ROWNUM"
		+ "       , B.*"
		+ "		  , ("
		+ "				SELECT COUNT(*) FROM BOARD "
		+ "             WHERE 1=1 "
		
		+ " 			<if test=\"title != null and title !='' \"> "
		+ "  				AND TITLE LIKE CONCAT('%',#{title},'%') "
		+ " 			</if> "
		
		+ "             <if test=\"category != null and category !='' \"> "
		+ "                 AND CATEGORY = #{category}"
		+ "             </if>"
		
		+ " 			<if test=\"area_cd != null and area_cd !='' \"> "
		+ "  				AND AREA_CD = #{area_cd} "
		+ " 				</if> "
		
		+ "          ) AS TOT_CNT "
		+ "	 FROM BOARD B ,  ( SELECT @ROWNUM := 0 ) R  WHERE 1=1 "
		
		+ " <if test=\"title != null and title !='' \"> "
		+ "  AND TITLE LIKE CONCAT('%',#{title},'%') "
		+ " </if>"
		
		+ " <if test=\"category != null and category !='' \"> "
		+ "  AND CATEGORY = #{category}"
		+ " </if>"
		
		+ " <if test=\"area_cd != null and area_cd !='' \"> "
		+ "  AND AREA_CD = #{area_cd}"
		+ " </if>"
		
		+ " <if test=\"content != null and content != '' \"> "
		+ "  AND CONTENT LIKE CONCAT('%',#{content},'%') "
		+ " </if>"
		+ " ORDER BY SEQ DESC"
		+ ") A WHERE ROWNUM &lt;= #{pagination.lastRecordIndex} ) B WHERE B.RNUM &gt; #{pagination.firstRecordIndex} "
		+ "</script>"
	})
	List<Board> selectBoard(Board board);
	
	// 게시판 상세조회
	@Select({
	"<script>"
	+ " SELECT *		 "
	+ "	  FROM BOARD "
	+ "  WHERE 1=1 "
	+ "    AND SEQ=#{seq} "
	+ "</script>"
	})
	Board selectDetailBoard(int seq);
	
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
	+ ", CASE WHEN R.USER_ID = #{user_id} THEN 'true' ELSE 'false' END AS CHECK_DEL_FLAG "
	+ "	  FROM REPLY R INNER JOIN USER U ON R.USER_ID = U.USER_ID "
	+ "  WHERE 1=1 "
	+ "    AND R.SEQ=#{seq} AND R.DEL_FLAG = 'N' ORDER BY R.SEQ ASC "
	+ "</script>"
	})
	List<Reply> selectReplyList(@Param("user_id") String user_id,@Param("seq") int seq);
	
	@Select({
		"<script>"
		+ " SELECT USER_ID		 "
		+ "	  FROM REPLY "
		+ "  WHERE 1=1 "
		+ "    AND REPLY_SEQ=#{reply_seq} "
		+ "</script>"
	})
	String selectReplyUserId(int reply_seq);
	
//	// 게시판등록
//	@Insert("INSERT INTO BOARD "
//			+ "(TITLE, CONTENT, CNT, CATEGORY, AREA_CD, BIZ_NM, RECOMM_CNT, DEL_FLAG, IMG_URL, USER_ID, REG_DTIME)"
//			+ " VALUES(#{title}, #{content}, #{cnt}, #{category}, #{area_cd}, #{biz_nm}, #{recomm_cnt}, #{del_flag}, #{img_url}, #{user_id}, NOW())")
//	void insertBoard(Board board);
	
	// 리플등록
	@Insert("INSERT INTO REPLY "
			+ "(SEQ, CONTENT, DEL_FLAG, USER_ID, REG_DTIME)"
			+ " VALUES(#{seq}, #{content}, 'N', #{user_id}, NOW())")
	int insertReply(Reply reply);
	
	// 리플삭제(DEL_FLAG 업데이트)
	@Delete("UPDATE REPLY SET DEL_FLAG = 'Y' WHERE REPLY_SEQ =#{reply_seq} ")
	int delFalgUpadaeReply(int reply_seq);
	
	@Update("UPDATE BOARD B, (SELECT MAX(IFNULL(CNT, 0)) +1 AS CNT FROM BOARD WHERE SEQ=#{seq}) C SET B.CNT = C.CNT WHERE B.SEQ=#{seq}")
	int updateCnt(int reply_seq);
	
	

//	@Update("UPDATE BOARD SET name=#{villageName}, district =#{district} WHERE id =#{vid}")
//	void updateBoard(Board board);
	

	
}
