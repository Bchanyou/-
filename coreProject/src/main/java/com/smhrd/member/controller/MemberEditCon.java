package com.smhrd.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		System.out.println("회원비밀번호수정컨트롤러");

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

		MemberDAO dao = new MemberDAO();
		MemberDTO member = dao.login(new MemberDTO(mem_id, currentPassword, null, null, null, null, null));
		System.out.println(member);
		if (member != null) {
			MemberDTO updateMember = new MemberDTO();
			updateMember.setMem_id(mem_id);

			if (!newPassword.isEmpty()) {
				updateMember.setMem_pw(newPassword);
			}

			int result = dao.update(updateMember);
			if (result > 0) {
				session.invalidate();
				String alertMessage = "비밀번호 변경에 성공했습니다. 다시 로그인해주세요.";
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('" + alertMessage + "');location.href='" + request.getContextPath() + "/login.jsp';</script>");
			} /*
				 * else { request.setAttribute("error", "회원 정보 수정에 실패했습니다.");
				 * request.getRequestDispatcher("mem_pw_modify.jsp").forward(request, response);
				 * }
				 */

		}else {
			String alertMessage = "입력하신 정보를 확인해주세요.";
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('" + alertMessage + "');location.href='" + request.getContextPath() + "/mem_pw_modify.jsp';</script>");
//			request.setAttribute("error", "회원 정보 수정에 실패했습니다.");
//			request.getRequestDispatcher("mem_pw_modify.jsp").forward(request, response);
		}

	}
}

// 세션 삭제 기능 추가





