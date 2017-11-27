package com.kmk.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler  {
	/**
     * 로그인 성공후에 해당 URL로 이동한다
     * @param request
     * @param response
     * @param authentication
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_OK);
        log.info("==============test lshandle {}", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        request.getSession().setAttribute("loginUser", SecurityContextHolder.getContext().getAuthentication().getPrincipal());
        response.sendRedirect("/");
    }
}
