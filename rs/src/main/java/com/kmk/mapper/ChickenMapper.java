package com.kmk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kmk.domain.SampleBoard;


public interface ChickenMapper {
	static final String BASE_QUERY = ""; 
			
	@Insert("INSERT INTO BOARD "
			+ "(TITLE, CONTENT, CNT, CATEGORY, AREA_CD, BIZ_NM, RECOMM_CNT, DEL_FLAG, IMG_URL, USER_ID, REG_DTIME)"
			+ " VALUES(#{title}, #{content}, #{cnt}, #{category}, #{areaCd}, #{bizNm}, #{recommCnt}, #{delFlag}, #{imgUrl}, #{userId}, NOW())")
	void insertBoard(SampleBoard sampleBoard);
	
	@Update("UPDATE BOARD SET name=#{villageName}, district =#{district} WHERE id =#{vid}")
	void updateBoard(SampleBoard sampleBoard);
	
	@Select({
		 " SELECT *		 "
		,"	 FROM BOARD WHERE 1=1  "
	})
	List<SampleBoard> selectSampleBoard();
	
}
