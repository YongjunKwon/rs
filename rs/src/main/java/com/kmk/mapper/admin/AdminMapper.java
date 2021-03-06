package com.kmk.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kmk.domain.user.User;

public interface AdminMapper {
    static final String BASE_QUERY = "";

    // 업체리스트 조회
    @Select({ "<script>" 
            + "     SELECT *                "
            + "            , C.CD_NM AS AREA_NM "
            + "       FROM (         "            
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
       	    + "          , DATE_FORMAT(A.IMG_VISIBLE_DATE, '%Y-%m-%d') AS IMG_VISIBLE_DATE "
            + "  FROM (" 

          	+ " 	 SELECT X.* "
          	+ " 	 		, ( "
          	+ " 			 		SELECT COUNT(*)     "
          	+ " 					  FROM USER         "
            + " 			 		 WHERE MEM_TYPE = 1 "
            + "                   <if test=\"category != null and category !='' \"> "
            + "                     AND CATEGORY = #{category}" 
            + "                   </if>"            
            + "                   <if test=\"area_cd != null and area_cd !='' \"> "
            + "                   <if test=\"dtl_area_cd != null and dtl_area_cd !='' \"> "
            + "                     AND AREA_CD = #{dtl_area_cd} " 
            + "                   </if> "
            + "                   <if test=\"dtl_area_cd == null and dtl_area_cd =='' \"> "
            + "                     AND AREA_CD = #{area_cd} " 
            + "                   </if> "
            + "                   </if> "            
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
            
            + "     <if test=\"area_cd != null and area_cd !='' \"> "
            + "       <if test=\"dtl_area_cd != null and dtl_area_cd !='' \"> "
            + "         AND AREA_CD = #{dtl_area_cd} " 
            + "       </if> "
            + "       <if test=\"dtl_area_cd == null and dtl_area_cd =='' \"> "
            + "         AND AREA_CD = #{area_cd} " 
            + "       </if> "
            + "     </if> "
            
            + "       <if test=\"biz_nm != null and biz_nm !='' \"> "
            + "       	AND BIZ_NM LIKE CONCAT('%',#{biz_nm},'%') " 
            + "       </if> "
            + "   ) A "
            + "WHERE ROWNUM &lt;= #{pagination.lastRecordIndex} " 
            + "  AND ROWNUM &gt;  #{pagination.firstRecordIndex} "
            +") Z"
            + "             LEFT JOIN COMM_CODE C"
            + "               ON Z.AREA_CD = C.CD"
            + " ORDER BY Z.EXPIRE_DATE ASC" 
            //+ "ORDER BY ROWNUM ASC" 
            + "</script>" })
    List<User> selectUserList(User user);


    @Update(" UPDATE USER SET EXPIRE_DATE = #{expire_date}, IMG_VISIBLE_DATE = #{img_visible_date} WHERE USER_ID = #{user_id} ")
    int updateUserExpireDate(User user);


}
