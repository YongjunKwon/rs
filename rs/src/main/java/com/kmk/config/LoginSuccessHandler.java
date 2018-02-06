package com.kmk.config;

import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.kmk.domain.user.LoginUser;
import com.kmk.mapper.user.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private UserMapper userMapper;

	/**
	 * 로그인 성공후에 해당 URL로 이동한다
	 * 
	 * @param request
	 * @param response
	 * @param authentication
	 * @throws IOException
	 * @throws ServletException
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		response.setStatus(HttpServletResponse.SC_OK);

		LoginUser loginUser = (LoginUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.info("==============test lshandle222 {}", loginUser);
		request.getSession().setAttribute("loginUser", loginUser);
		
		userMapper.setLoginUserInfo(loginUser.getUser_id(), getLocalServerIp());
		response.sendRedirect("/");
	}

	private String getLocalServerIp() {
		try {
			for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
				NetworkInterface intf = en.nextElement();
				for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
					InetAddress inetAddress = enumIpAddr.nextElement();
					if (!inetAddress.isLoopbackAddress() && !inetAddress.isLinkLocalAddress()
							&& inetAddress.isSiteLocalAddress()) {
						return inetAddress.getHostAddress().toString();
					}
				}
			}
		} catch (SocketException ex) {
		}
		return null;
	}
}
