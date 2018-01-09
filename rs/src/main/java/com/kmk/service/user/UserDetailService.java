package com.kmk.service.user;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.controller.user.Usercontroller;
import com.kmk.domain.user.LoginUser;
import com.kmk.domain.user.User;
import com.kmk.mapper.user.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class UserDetailService implements UserDetailsService {
	
	@Autowired
    private UserMapper userMapper;
	
	@Override
    public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
        //조회해온 내용으로 권한 체크 후  리턴한다
		User user = userMapper.getUser(user_id);
        if (user == null) {
            throw new UsernameNotFoundException("UsernameNotFound [" + user_id + "]");
        }
        LoginUser loginUser = createUser(user);
        return loginUser;
    }

    private LoginUser createUser(User user) {
        LoginUser loginUser = new LoginUser(user);
        if (loginUser.getMem_type().equals("0")) {
            loginUser.setRoles(Arrays.asList("ROLE_ADMIN"));
        } else if(loginUser.getMem_type().equals("1")) {
            loginUser.setRoles(Arrays.asList("ROLE_CUSTOMER"));
        } else {
        	loginUser.setRoles(Arrays.asList("ROLE_USER"));
        }
        return loginUser;
    }
    
    public int checkEmail(String user_id){
    	return userMapper.checkEmail(user_id);
    }

	public int checkNickNm(String nick_nm) {
		return userMapper.checkNickNm(nick_nm);
	}

	public void addUser(User user) {
		user.setMem_type("2"); //회원구분(0;ADMIN, 1;업소회원, 2;일반회원) 기본 0
		userMapper.addUser(user);
	}
	
	public void setUser(User user) {
		userMapper.setUser(user);
	}
}
