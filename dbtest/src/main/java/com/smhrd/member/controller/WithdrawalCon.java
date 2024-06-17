package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.member.model.MemberDAO;

public class WithdrawalCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String deleteEmail=request.getParameter("email");
		
		MemberDAO dao=new MemberDAO();
		int cnt=dao.withdrawal(deleteEmail);
		
		if(cnt>0) {
			System.out.println("삭제완료");
			response.sendRedirect("LoginFrom.html");
		}else {
			System.out.println("삭제실패");
			response.sendRedirect("Withdrawal.html");
		}
	}

}