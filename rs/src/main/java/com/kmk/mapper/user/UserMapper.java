package com.kmk.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	
	@Select({
		"SELECT COUNT(*)   "
	   ,"  FROM USER      "
	   ," WHERE user_id = #{user_id}   "
	})
	Integer checkEmail(@Param("user_id") String user_id);

	
	@Select({
		"SELECT COUNT(*)   "
	   ,"  FROM USER      "
	   ," WHERE nick_nm = #{nick_nm}   "
	})
	Integer checkNickNm(@Param("nick_nm") String nick_nm);


	@Insert({
		 "  INSERT INTO USER           "
		,"      (                      "
		,"         USER_ID             "
		,"        ,PWD                 "
		,"        ,NICK_NM             "
		,"        ,MGR_NM              "
		,"        ,SEX                 "
		,"        ,BIRTHDAY            "
		,"        ,TEL                 "
		,"        ,ACT_S_TIME          "
		,"        ,ACT_E_TIME          "
		,"        ,ADDR                "
		,"        ,MEM_TYPE            "
		,"        ,DEL_FLAG            "
		,"        ,ENTRY_PATH_CD       "
		,"        ,BIZ_NM              "
		,"        ,CATEGORY            "
		,"        ,AREA_CD             "
		,"        ,BIZ_REG_FLAG        "
		,"      )                      "
		,"  VALUES                     "
		,"      (                      "
		,"         #{user_id}          "
		,"        ,#{pwd}              "
		,"        ,#{nick_nm}          "
		,"        ,#{mgr_nm}           "
		,"        ,#{sex}              "
		,"        ,#{birthday}         "
		,"        ,#{tel}              "
		,"        ,#{act_s_time}       "
		,"        ,#{act_e_time}       "
		,"        ,#{addr}             "
		,"        ,#{mem_type}         "
		,"        ,#{del_flag}         "
		,"        ,#{entry_path_cd}    "
		,"        ,#{biz_nm}           "
		,"        ,#{category}         "
		,"        ,#{area_cd}          "
		,"        ,#{biz_reg_flag}     "
		,"      )                      "
	})
	void addUser(User user);

	@Update({
	  "<script>"
		,"UPDATE USER"
		,"  SET nick_nm=#{nick_nm}"
    , " <if test=\"pwd != null and pwd !='' \"> "
    , " ,pwd=#{pwd}"
    , " </if>"
		,"WHERE user_id=#{user_id}"
		,"</script>"
	})
	void setUser(User user);
	
	
	@Insert({                           
		 "	  INSERT INTO LOGIN           "                
		,"	  	(                         "  
		,"	  		 USER_ID              "             
		,"			,LOGIN_DTIME          "                 
		,"			,IP                   "        
		,"		)                         "  
		,"  	  VALUES (                "           
		,"			 #{user_id}           "             
		,"			,CURRENT_TIMESTAMP    "                       
		,"			,#{ip}                "         
		,"	  )                           "
	})                              
	void setLoginUserInfo(@Param("user_id") String user_id, @Param("ip") String ip);
	
}
