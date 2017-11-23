package com.kmk.mapper.common;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kmk.domain.common.CommCode;


public interface CommonMapper {
	static final String BASE_QUERY = ""; 
	
	@Select({
		" <script> "
		+ " SELECT CD, CD_NM		 "
		+ "	 FROM COMM_CODE "
		+ " WHERE CD_GRP = #{cd_grp} "
		+ " <if test='cd != null '> "
		+ "  AND CD = #{cd}"
		+ " </if>"
		+ "  ORDER BY SORT_SEQ "
		+ "</script>"
	})
	List<CommCode> findComboAreaCdList(CommCode commCode);
	

	
}
