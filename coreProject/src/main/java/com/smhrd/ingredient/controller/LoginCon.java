package com.smhrd.ingredient.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");

		
		// Calendal ---------------------------------------------------------
		
		// 여기에 로그인 검증 로직을 추가합니다.
		boolean isValidUser = validateUser(mem_id);

		if(isValidUser)
		{
			request.getSession().setAttribute("id", mem_id);
			response.sendRedirect("dashboard.jsp");
		}else
		{
			response.sendRedirect("login.jsp?error=invalid");
		}

	}

	private boolean validateUser(String mem_id) {
		// 간단한 예제로 모든 사용자를 유효하다고 가정합니다.
		// 실제로는 데이터베이스 조회 등을 통해 검증해야 합니다.
		return mem_id != null && !mem_id.isEmpty();
	}
	
}
