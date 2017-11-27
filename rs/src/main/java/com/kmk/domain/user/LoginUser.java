package com.kmk.domain.user;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class LoginUser implements UserDetails {

    private static final long serialVersionUID = -1286609632181552601L;

    private String user_id;
    private String nick_nm;
    private String pwd;
    private String mem_type;
    private List<String> roles;


    public LoginUser(){
    }

    public LoginUser(User user) {
        this.user_id = user.getUser_id();
        this.nick_nm = user.getNick_nm();
        this.pwd = user.getPwd();
        this.mem_type = user.getMem_type();
        
    }
    @Override
    public String getPassword() {
		return this.pwd;
	}

	@Override
	public String getUsername() {
		return this.user_id;
	}
	
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (String role : roles) {
            authorities.add(new SimpleGrantedAuthority(role));
        }
        return authorities;
    }

}