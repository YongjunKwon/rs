package com.kmk.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kmk.domain.user.LoginUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin
@RequestMapping("/")
@Controller
public class Usercontroller {

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(Model model) {
        return "login/login";
    }
/*
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index(LoginUser loginUser) {
        ModelAndView model = new ModelAndView("index");
        model.addObject("user", loginUser);
        return model;
    }*/

}
