package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class MemberEditCon extends HttpServlet {
    private static final long serialVersionUID = 1L;
    

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 가지고 오기
		//로그인정보는 어디에서 가져와야 하는지: session
		HttpSession session = request.getSession();// 세션 생성
		MemberDTO member=(MemberDTO)session.getAttribute("loginMember");
		
		String id=member.getMem_id();
		String pw=member.getMem_pw();
		
		
		String mem_id = request.getParameter("id");
		//login.jsp 참고해서 id칸 자동으로 채우기 구현
		String mem_pw= request.getParameter("pw");
		String mem_pw_new = request.getParameter("pw_new");
		String mem_pw_check = request.getParameter("pw_new_check");
		String mem_name = request.getParameter("name");
		String mem_phone = request.getParameter("phone");
		String mem_email = request.getParameter("email");
		
		MemberDTO updateMember = new MemberDTO(null, mem_pw, mem_name, mem_phone, mem_email, null, null );

		// 3. DB기능 호출
		MemberDAO dao = new MemberDAO();

		int cnt = dao.update(updateMember);
		
		if(pw==mem_pw) {
			//session에 저장된 회원정보를 업데이트하기
			session.setAttribute("loginMember", updateMember);
			
			System.out.println("정보수정 성공");
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("정보수정 실패");
			response.sendRedirect("update.jsp");
		}

	}

}
