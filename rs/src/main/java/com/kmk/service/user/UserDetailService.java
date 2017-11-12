package com.kmk.service.user;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.user.LoginUser;
import com.kmk.domain.user.User;
import com.kmk.mapper.user.UserMapper;

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
        //if (loginUser.getIsAdmin().equals("Y")) {
            loginUser.setRoles(Arrays.asList("ROLE_ADMIN"));
        //} else {
       //     loginUser.setRoles(Arrays.asList("ROLE_USER"));
       // }
        return loginUser;
    }
}
