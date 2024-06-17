package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 한글 인코딩
		// 데이터를 가져오기 전에 데이터 전송 방식이 Post라면 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 가지고 오기
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		MemberDAO dao = new MemberDAO();

		// 로그인 시,데이터베이스에서 조회된 회원정보를
		// 웹페이지에서 사용할 수 있도록 WebMember객체에 저장
		MemberDTO member = dao.login(new MemberDTO(mem_id, mem_pw, null, null, null, null, null));
		if (member != null) {
			// 로그인 성공 시, 세션에 로그인 정보 저장
			HttpSession session = request.getSession();// 세션 생성
			session.setAttribute("loginMember", member);
			response.sendRedirect("LoginForm.html");
			System.out.println("로그인 성공");

		} else {
			// 로그인 실패
			response.sendRedirect("LoginForm.html");
			System.out.println("로그인 실패");
		}
	}

}
