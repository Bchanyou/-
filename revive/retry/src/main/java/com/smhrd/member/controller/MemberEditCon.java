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
		
		String saveId=member.getMem_id();//login.jsp 참고해서 id칸 자동으로 채우기 구현
		System.out.println("Saved Id from session: " + saveId);
		
		
		
	      
		String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordConfirm = request.getParameter("newPasswordConfirm");
        String newName = request.getParameter("newName");
        String newPhone = request.getParameter("newPhone");
        String newEmail = request.getParameter("newEmail");

        MemberDAO memberDAO = new MemberDAO();
        boolean passwordMatch = memberDAO.checkPassword(saveId, currentPassword);
        if (!passwordMatch) {
            request.setAttribute("error", "현재 비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
            return;
        }

        if (!newPassword.equals(newPasswordConfirm)) {
            request.setAttribute("error", "신규 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
            return;
        }

        MemberDTO updateMember = new MemberDTO();
        updateMember.setMem_id(saveId);
        updateMember.setMem_name(newName);
        updateMember.setMem_phone(newPhone);
        updateMember.setMem_email(newEmail);
        if (!newPassword.isEmpty()) {
            updateMember.setMem_pw(newPassword);
        }

        int result = memberDAO.updateMember(updateMember);
        if (result > 0) {
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("error", "회원 정보 수정에 실패했습니다.");
            request.getRequestDispatcher("edit_profile.jsp").forward(request, response);
        }
    }
}