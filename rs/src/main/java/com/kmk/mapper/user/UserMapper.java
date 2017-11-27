package com.kmk.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kmk.domain.user.User;


public interface UserMapper {
	static final String BASE_QUERY = ""; 
			
	@Select({
		 " SELECT *		 "
		,"	 FROM USER    "
		,"  WHERE user_id= #{user_id} "
	})
	User getUser(@Param("user_id") String user_id);
	
	@Select({
		 " SELECT *		 "
		,"	 FROM USER_ROLE    "
		,"  WHERE user_id = #{user_id} "
	})
	List<String> getUserRole(@Param("user_id") String user_id);
}
