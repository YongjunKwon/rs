package com.kmk.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kmk.domain.user.User;


public interface UserMapper {
	static final String BASE_QUERY = ""; 
			
	@Select({
		 " SELECT *		 "
		,"	 FROM user    "
		,"  WHERE name = #{user_id} "
	})
	User getUser(@Param("user_id") String user_id);
	
	@Select({
		 " SELECT *		 "
		,"	 FROM user_role    "
		,"  WHERE name = #{user_id} "
	})
	List<String> getUserRole(@Param("user_id") String user_id);
}
