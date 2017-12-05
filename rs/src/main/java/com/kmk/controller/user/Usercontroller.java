package com.kmk.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kmk.domain.user.LoginUser;
import com.kmk.domain.user.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin
@Controller
public class Usercontroller {

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
    
    @RequestMapping(value = "/register/emailCheck")
    @ResponseBody
    public Map<String, String> emailCheck(User user) {
    	Map<String, String> map = new HashMap<String, String>();
    	map.put("result", "success!");
    	map.put("test", "test!");
    	
    	
        return map;
    }
}
