package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class MemberDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩
				request.setCharacterEncoding("UTF-8");

				// 2. 데이터 가지고 오기
				//로그인정보는 어디에서 가져와야 하는지: session
				HttpSession session = request.getSession();// 세션 생성
				
				// 세션에서 회원 정보 가져오기
				MemberDTO member=(MemberDTO)session.getAttribute("loginMember");
				
				if (member == null) {//세션에 로그인 정보가 없으면
					Cookie[] cookies = request.getCookies();//쿠키를 가져와서
					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("savedId")) {
								String savedId = cookie.getValue();
								System.out.println("Saved Id from cookie: " + savedId);}
							}
						}
					}
				
				String deleteId=member.getMem_id();//login.jsp 참고해서 id칸 자동으로 채우기 구현
				System.out.println("Saved Id from session: " + deleteId);

		
		MemberDAO dao=new MemberDAO();
		int cnt=dao.delete(deleteId);
		
		if(cnt>0) {
			System.out.println("삭제완료");
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("삭제실패");
			response.sendRedirect("");
		}
	}

}
