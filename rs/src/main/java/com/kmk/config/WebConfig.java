package com.kmk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;
	
@Configuration
	@ComponentScan("com.kmk")
public class WebConfig  {
    @Bean
    MappingJackson2JsonView jsonView(){
    	return new MappingJackson2JsonView();
    }
}


				