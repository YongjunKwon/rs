package com.kmk.config;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.kmk.service.user.UserDetailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ComponentScan("com.kmk")
@EnableWebSecurity  //웹보안 설정
@EnableGlobalMethodSecurity(prePostEnabled=true)
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Autowired
    private LoginSuccessHandler loginSuccessHandler;

	@Autowired
	private LoginFailureHandler loginFailureHandler;
	
    @Autowired
    private UserDetailService userDetailService;
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }
    
	@Override
	public void configure(WebSecurity web) throws Exception
	{
		//메인페이지, css, script 인증 해제
		web.ignoring().antMatchers("/WEB-INF/css/**", "/WEB-INF/script/**","/AdminLTE-2.3.11/**","/se2/**", "/js/**", "/css/**", "/images/**");
	}
	
    @Override
    protected void configure(HttpSecurity http) throws  Exception {
        http.authorizeRequests().antMatchers("/", "/register/**", "/biz/register/**","/login/**", "/favicon.ico").permitAll()
        		.antMatchers("/logoutSuccess").permitAll().antMatchers("/admin/**").hasAnyAuthority("ROLE_ADMIN").anyRequest()
        		.authenticated().and().formLogin().loginPage("/login")
                .loginProcessingUrl("/login").successHandler(loginSuccessHandler).failureHandler(loginFailureHandler)
                .usernameParameter("user_id").passwordParameter("pwd").permitAll().and().logout().deleteCookies("remove")
                .invalidateHttpSession(true).logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/logoutSuccess").and().csrf().disable();
    }
	
    
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailService);
       // authenticationProvider.setPasswordEncoder(passwordEncoder()); //패스워드를 암호활 경우 사용한다
        return authenticationProvider;
    }
}
