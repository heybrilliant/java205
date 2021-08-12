package com.bitcamp.op.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.jdbc.jdbcUtil;
import com.bitcamp.op.member.dao.JdbcTemplateMemberDao;
import com.bitcamp.op.member.dao.mybatisMemberDao;
import com.bitcamp.op.member.domain.Member;
import com.bitcamp.op.member.domain.MemberRegRequest;

@Service
public class MemberRegService {
	
	final String UPLOAD_URI = "/uploadfile";

	//@Autowired
	//private MemberDao dao;
	
	// @Autowired
	//private JdbcTemplateMemberDao dao;
	
	@Autowired
	private mybatisMemberDao dao;
	
	public int memberReg(
			MemberRegRequest regRequest,
			HttpServletRequest request
			) {
		
		int resultCnt = 0;
		// Connection conn = null;
		File newFile = null;
		
		

		try {
			// 1. 파일 저장

			// Member 객체 생성 -> 저장된 파일의 이름을 set
			Member member = regRequest.toMember();

			// 파일 저장
			if (regRequest.getPhoto() != null && !regRequest.getPhoto().isEmpty()) {

				// 새로운 저장 폴더 : File
				File newDir = new File(request.getSession().getServletContext().getRealPath(UPLOAD_URI));

				// 폴더가 존재하지 않으면 폴더 생성
				if (!newDir.exists()) {
					newDir.mkdir();
					System.out.println("저장 폴더를 생성했습니다.");
				}
				// 파일 저장시에 파일 이름이 같으면 덮어쓴다 -> 회원별 고유한 파일 이름을 만들자!!, 새로운 파일이름에 확장자 추가
				String newFileName = regRequest.getMemberid() 
						+ System.currentTimeMillis()
						+ chkFileType(regRequest.getPhoto());
				// cool123128936798123987

				// 새로운 File 객체
				newFile = new File(newDir, newFileName);

				regRequest.getPhoto().transferTo(newFile);
				member.setMemberphoto(newFileName);
			} else {
				member.setMemberphoto("photo.png");
			}
			
			
			
			// 2. dao 저장
			//conn = ConnectionProvider.getConnection();
			
			resultCnt = dao.insertMember1(member);
			
			System.out.println("새롭게 등록된 idx => " + member.getIdx());
			
			// idx 값은 자식테이블의 insert시 외래키로 사용
			
			// 자식테이블 insert구문...
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// DB 예외 발생시 -> 저장된 파일을 삭제
			if(newFile != null && newFile.exists()) {
				newFile.delete();
				}
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return resultCnt;
	}

	private String chkFileType(MultipartFile photo) {
		// TODO Auto-generated method stub
		return null;
	}
}
