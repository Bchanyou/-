package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("join controller!");
		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 가지고 오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String pn = request.getParameter("pn");
		String email = request.getParameter("email");
		String re = request.getParameter("re");
		
		MemberDTO member=new MemberDTO(id, pw, name, pn, email, re);
		
		MemberDAO dao=new MemberDAO();
		int row = dao.join(member);
		
		if(row>0) {
			//회원가입 성공
			System.out.println("회원가입 성공");
		}else {
			//회원가입 실패
			System.out.println("회원가입 실패");
		}
	}

}
