package com.bitcamp.firstSpring.dao;

import org.springframework.stereotype.Repository;

@Repository // 파일업로드처럼 자동 처리 해줌
public class FileUploadDao implements Dao{

	@Override
	public void insert() {
		System.out.println("파일 정보를 저장합니다.");
	}

}
