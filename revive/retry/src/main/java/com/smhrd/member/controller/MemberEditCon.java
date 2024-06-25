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

public class MemberEditCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("회원정보수정컨트롤러");

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 가지고 오기
		// 로그인정보는 어디에서 가져와야 하는지: session

		// 세션에서 회원 정보 가져오기
		HttpSession session = request.getSession(true);

		String mem_id = (String) session.getAttribute("savedId");
		String mem_pw = request.getParameter("pw");
		if (mem_id == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if ("savedId".equals(cookie.getName())) {
						mem_id = cookie.getValue();
						break;
					}
				}
			}
		}
		System.out.println(mem_id);
        
        
		String currentPassword = request.getParameter("pw");
		String newPassword = request.getParameter("new_pw");
		String newPasswordConfirm = request.getParameter("new_pw_check");
		String newName = request.getParameter("name");
		String newPhone = request.getParameter("phone");
		String newEmail = request.getParameter("mail")+"@"+request.getParameter("slt_mail");

		MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.login(new MemberDTO(mem_id, currentPassword, null, null, null, null, null));
		System.out.println(member);
		if(member!=null) {
			MemberDTO updateMember = new MemberDTO();
			updateMember.setMem_id(mem_id);
			updateMember.setMem_name(newName);
			updateMember.setMem_phone(newPhone);
			updateMember.setMem_email(newEmail);
			if (!newPassword.isEmpty()) {
				updateMember.setMem_pw(newPassword);
			}
			
			int result = dao.update(updateMember);
			if (result > 0) {
				System.out.println("회원정보수정에성공했습니다");
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("error", "회원 정보 수정에 실패했습니다.");
				request.getRequestDispatcher("mem_info_modify.jsp").forward(request, response);
			}
			
		}

	}
}