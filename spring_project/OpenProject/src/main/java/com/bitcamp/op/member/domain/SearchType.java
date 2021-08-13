package com.bitcamp.op.member.domain;

public class SearchType {
	
	
	private int p; // 페이징 처리할 때 페이지 번호
	private String searchType;
	private String keyword;
	
	public SearchType(int p, String searchType, String keyword) {
		this.p = p;
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	public SearchType() {
		this.p = 1;
	}
	
	
}
