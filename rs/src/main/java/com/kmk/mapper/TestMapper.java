package com.kmk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kmk.domain.Test;


public interface TestMapper {
	static final String BASE_QUERY = ""; 
			
	@Select({
		 " SELECT *		 "
		,"	 FROM test    "
//		,"  WHERE name = #{test} "
	})
	List<Test> getList();
//	List<Test> getList(@Param("test") String test);
	
	
}
