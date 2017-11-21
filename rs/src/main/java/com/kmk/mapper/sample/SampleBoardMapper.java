package com.kmk.mapper.sample;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kmk.domain.sample.SampleBoard;


public interface SampleBoardMapper {
	static final String BASE_QUERY = ""; 
	
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
			
	@Select({
	"<script>"
	+ " SELECT *		 "
	+ "	  FROM BOARD "
	+ "  WHERE 1=1 "
	+ "    AND SEQ=#{seq} "
	+ "</script>"
	})
	SampleBoard selectDetailSampleBoard(int seq);
	
	
	@Insert("INSERT INTO BOARD "
			+ "(TITLE, CONTENT, CNT, CATEGORY, AREA_CD, BIZ_NM, RECOMM_CNT, DEL_FLAG, IMG_URL, USER_ID, REG_DTIME)"
			+ " VALUES(#{title}, #{content}, #{cnt}, #{category}, #{areaCd}, #{bizNm}, #{recommCnt}, #{delFlag}, #{imgUrl}, #{userId}, NOW())")
	void insertBoard(SampleBoard sampleBoard);
	
	@Update("UPDATE BOARD SET name=#{villageName}, district =#{district} WHERE id =#{vid}")
	void updateBoard(SampleBoard sampleBoard);
	

	
}
