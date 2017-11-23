package com.kmk.controller.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.domain.common.CommCode;
import com.kmk.service.common.CommonService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("common/")
@Controller
public class CommonController {
	
	@Autowired CommonService commonService;
	
	@RequestMapping("findComboAreaCdList")
	public List<CommCode> findComboAreaCdList(CommCode commCode, Model model) {
		return commonService.findComboAreaCdList(commCode);
	}
 }
