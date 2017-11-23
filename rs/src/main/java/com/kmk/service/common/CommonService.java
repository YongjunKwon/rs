package com.kmk.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmk.domain.common.CommCode;
import com.kmk.mapper.common.CommonMapper;

@Service
@Transactional
public class CommonService {
	//private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CommonMapper commonMapper;
	
	public List<CommCode> findComboAreaCdList(CommCode commCode){
		//logger.info("query test: {}", testMapper.getList());
			
		return commonMapper.findComboAreaCdList(commCode);
	}
}
