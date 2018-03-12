package com.kmk.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kmk.domain.user.User;

public interface AdminMapper {
    static final String BASE_QUERY = "";

    // 업체리스트 조회
    @Select({ "<script>" 
            + "     SELECT A.USER_ID         "
            + "          , A.PWD             "
       	    + "          , A.NICK_NM         "
       	    + "          , A.MGR_NM          "
       	    + "          , A.SEX             "
       	    + "          , A.BIRTHDAY        "
       	    + "          , A.TEL             "
       	    + "          , A.MOBILE          "
       	    + "          , A.ACT_S_TIME      "
       	    + "          , A.ACT_E_TIME      "
       	    + "          , A.ADDR            "
       	    + "          , A.MEM_TYPE        "
       	    + "          , A.DEL_FLAG        "
       	    + "          , A.ENTRY_PATH_CD   "
       	    + "          , A.BIZ_NM          "
       	    + "          , A.CATEGORY        "
       	    + "          , A.AREA_CD         "
       	    + "          , A.BIZ_REG_FLAG    "
       	    + "          , A.REG_DTIME       "
       	    + "          , DATE_FORMAT(A.EXPIRE_DATE, '%Y-%m-%d') AS EXPIRE_DATE "
            + "  FROM (" 

          	+ " 	 SELECT X.* "
          	+ " 	 		, ( "
          	+ " 			 		SELECT COUNT(*)     "
          	+ " 					  FROM USER         "
          	+ " 			 		 WHERE MEM_TYPE = 1 "
          
            + "                   <if test=\"category != null and category !='' \"> "
            + "                     AND CATEGORY = #{category}" 
            + "                   </if>"
            
            + "       			   <if test=\"area_cd != null and area_cd !='' \"> "
            + "        			   	 AND AREA_CD = #{area_cd} " 
            + "       			   </if> "
            
            + "       			   <if test=\"biz_nm != null and biz_nm !='' \"> "
            + "        			   	AND BIZ_NM LIKE CONCAT('%',#{biz_nm},'%') " 
            + "       			   </if> "
          	
          	+ " 			  ) AS TOT_CNT "
          	+ " 	 		, @ROWNUM:=@ROWNUM+1 AS ROWNUM "
          	+ " 	   FROM USER X ,(SELECT @ROWNUM := 0) AS R "
          	+ " 	   WHERE MEM_TYPE = 1"
          	
          	+ "      <if test=\"category != null and category !='' \"> "
            + "        AND CATEGORY = #{category}" 
            + "      </if>"
            
            + "       <if test=\"area_cd != null and area_cd !='' \"> "
            + "       	 AND AREA_CD = #{area_cd} " 
            + "       </if> "
            
            + "       <if test=\"biz_nm != null and biz_nm !='' \"> "
            + "       	AND BIZ_NM LIKE CONCAT('%',#{biz_nm},'%') " 
            + "       </if> "
            + "   ) A "
            + "WHERE ROWNUM &lt;= #{pagination.lastRecordIndex} " 
            + "  AND ROWNUM &gt;  #{pagination.firstRecordIndex} "
            + " ORDER BY A.EXPIRE_DATE ASC" 
            //+ "ORDER BY ROWNUM ASC" 
            + "</script>" })
    List<User> selectUserList(User user);

//    // 게시판 상세조회
//    @Select({ "<script>" 
//            + " SELECT b.*,	" 
//            + "        u.nick_nm	 " 
//            + "	  FROM BOARD b" 
//            + "  INNER JOIN USER u"
//            + "     ON b.user_id = u.user_id" 
//            + "  WHERE 1=1 " 
//            + "    AND b.SEQ=#{seq} " 
//            + "</script>" })
//    Board selectDetailBoard(int seq);
//
//    // 리플조회
//    @Select({ "<script>" 
//            + " SELECT " 
//            + "        R.REPLY_SEQ" 
//            + ",       R.SEQ" 
//            + ",       R.CONTENT" 
//            + ",       R.DEL_FLAG" 
//            + ",       R.USER_ID"
//            + ",       R.REG_DTIME" 
//            + ",       DATE_FORMAT(R.REG_DTIME, '%Y.%m.%d %H:%i:%s') AS YYYYMMDD " 
//            + ",       U.NICK_NM  "
//            + ",       CASE WHEN R.USER_ID = #{user_id} THEN 'true' ELSE 'false' END AS CHECK_DEL_FLAG "
//            + "	  FROM REPLY R "
//            + "  INNER JOIN USER U "
//            + "     ON R.USER_ID = U.USER_ID "
//            + "  WHERE 1=1 "
//            + "    AND R.SEQ=#{seq} AND R.DEL_FLAG = 'N' ORDER BY R.SEQ ASC " 
//            + "</script>" })
//    List<Reply> selectReplyList(@Param("user_id") String user_id, @Param("seq") int seq);
//
//    @Select({ "<script>" 
//            + " SELECT USER_ID		 " 
//            + "	  FROM REPLY " 
//            + "  WHERE 1=1 "
//            + "    AND REPLY_SEQ=#{reply_seq} " 
//            + "</script>" })
//    String selectReplyUserId(int reply_seq);
//
//    // 게시판등록
//    @Insert("INSERT INTO BOARD "
//            + "(TITLE, CONTENT, CNT, CATEGORY, AREA_CD, BIZ_NM, RECOMM_CNT, DEL_FLAG, IMG_URL, USER_ID, REG_DTIME)"
//            + " VALUES(#{title}, #{content}, #{cnt}, #{category}, #{area_cd}, #{biz_nm}, #{recomm_cnt}, 'N', #{img_url}, #{user_id}, NOW())")
//    void insertBoard(Board board);
//
//    // 리플등록
//    @Insert("INSERT INTO REPLY " 
//          + "(SEQ, CONTENT, DEL_FLAG, USER_ID, REG_DTIME)"
//          + " VALUES(#{seq}, #{content}, 'N', #{user_id}, NOW())")
//    int insertReply(Reply reply);
//
//    // 리플삭제(DEL_FLAG 업데이트)
//    @Update("UPDATE REPLY SET DEL_FLAG = 'Y' WHERE REPLY_SEQ =#{reply_seq} ")
//    int delFlagUpadateReply(int reply_seq);
//
//    @Update("UPDATE BOARD B, (SELECT MAX(IFNULL(CNT, 0)) +1 AS CNT FROM BOARD WHERE SEQ=#{seq}) C SET B.CNT = C.CNT WHERE B.SEQ=#{seq}")
//    int updateCnt(int reply_seq);
//
//    // 게시글 삭제
//    @Update("UPDATE BOARD SET DEL_FLAG = 'Y' WHERE SEQ =#{seq} ")
//    int delFlagUpadateBoard(int seq);
//
//    // 게시글 수정
//    @Update("UPDATE BOARD SET TITLE=#{title}, CONTENT=#{content}, AREA_CD=#{area_cd}, IMG_URL=#{img_url}  WHERE SEQ =#{seq} ")
//    void upadateBoard(Board board);

}
