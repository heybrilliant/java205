package com.bitcamp.firstSpring;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {

	@RequestMapping("/view/view1")
	public void getPage1() {
		
	}
	
	@RequestMapping("/view/view2")
	public void getPage2() {
		
	}
	
	@RequestMapping("/view/view3")
	public Map getPage3() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "COOL");
		
		return map;
		
	}
	
}
