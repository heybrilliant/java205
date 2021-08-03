package com.bitcamp.firstSpring;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
public class IndexController {

	@RequestMapping("/")
	public String index() {
		return "index";	// 	/WEB-INF/views/index.jsp
	}
}
