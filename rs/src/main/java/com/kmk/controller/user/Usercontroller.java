package com.kmk.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kmk.domain.user.LoginUser;
import com.kmk.domain.user.User;
import com.kmk.service.user.UserDetailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin
@Controller
public class Usercontroller {
	
	@Autowired
	UserDetailService userDetailService = new UserDetailService(); 
	
    @RequestMapping(value = "/login")
    public ModelAndView login(@RequestParam(value="error", defaultValue="false") Boolean error) {
    	log.info("==============login controller{}", error);
    	ModelAndView model = new ModelAndView();
    	model.addObject("error", error);
    	model.setViewName("login/login");
        return model;
    }

    @RequestMapping(value = "/logoutSuccess")
    public String logout(Model model) {
    	log.info("==============logout controller");
        return "/login/logoutSuccess";
    }
    
    @RequestMapping(value = "/")
    public ModelAndView index(HttpSession session) {
        ModelAndView model = new ModelAndView("index");
        
        LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
        
        log.info("===================loginUser:{}", loginUser);
        
        if(loginUser != null) 
        	model.addObject("isLogin", true);
        else
        	model.addObject("isLogin", false);
        
        model.addObject("user", loginUser);
        return model;
    }

    @RequestMapping(value = "/register")
    public String register(Model model) {
        return "/login/register";
    }
    
    @RequestMapping(value = "/biz/register")
    public String bizRegister(Model model) {
        return "/login/bizRegister";
    }
    
    
    @RequestMapping(value = "/register/checkEmail")
    public ModelAndView checkEmail(User user) {
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	if(userDetailService.checkEmail(user.getUser_id()) > 0)
    		mav.addObject("isDuplicated", true);
    	else
    		mav.addObject("isDuplicated", false);
    	
        return mav;
    }
    
    @RequestMapping(value = "/register/checkNickNm")
    public ModelAndView checkNickNm(User user) {
    	
    	ModelAndView mav = new ModelAndView("jsonView");
    	if(userDetailService.checkNickNm(user.getNick_nm()) > 0)
    		mav.addObject("isDuplicated", true);
    	else
    		mav.addObject("isDuplicated", false);
    	
    	return mav;
    }
    
    @RequestMapping(value = "/register/add")
    public void addUser(User user, HttpServletResponse response) throws IOException {
    	log.info("========kwon user:{}", user);
    	
    	//권한 변조 방지
    	if("1".equals(user.getMem_type()) || "2".equals(user.getMem_type()))
    		userDetailService.addUser(user);
    	else return;
    	
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	out.println("<script>alert('회원가입이 정상적으로 처리되었습니다.'); location.href='/';</script>");
    	out.flush();

    }
    
    @RequestMapping(value = "/register/changeLoginUser")
    public ModelAndView changeLoginUser(User user, HttpSession session) {
    	LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
    	ModelAndView mav = new ModelAndView("jsonView");
    	log.info("======kwon user:{}", user);
    	log.info("======kwon loginUser:{}", loginUser);
    	
    	if(!loginUser.getPwd().equals(user.getBefore_pwd())){
    		mav.addObject("isCheckPassword", false);
    		return mav;
    	}
    	
    	userDetailService.setUser(user);
    	mav.addObject("isSuccesses", true);
    	
        return mav;
    }
    
    @RequestMapping(value = "/findPassword")
    public ModelAndView findPassword() {
    	ModelAndView mav = new ModelAndView("jsonView");
    	log.info("===========kwon findPassword");
        return mav;
    }
    
}
