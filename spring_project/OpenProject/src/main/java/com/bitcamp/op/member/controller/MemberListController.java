package com.bitcamp.op.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.op.member.domain.Member;
import com.bitcamp.op.member.domain.SearchType;
import com.bitcamp.op.member.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService listService;

	@RequestMapping("/member/list")
	public String getList(
			SearchType searchType,
			Model model
			
			) {

		List<Member> list = null;
		
		if(searchType.getKeyword() != null && searchType.getKeyword().trim().) {
			list = listService.getMemberList(searchType);
		} else {
			list = listService.getMemberList();
		}
		
		
		
		model.addAttribute("memberList", listService.getMemberList());
		return "member/list";
	}

}