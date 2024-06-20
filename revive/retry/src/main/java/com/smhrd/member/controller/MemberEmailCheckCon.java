package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.member.model.MemberDAO;

public class MemberEmailCheckCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mem_email = request.getParameter("mail");
        MemberDAO dao = new MemberDAO();
        int count = -1;

        try {
            count = dao.check(mem_email);
        } catch (Exception e) {
            // 예외 상황 로그 기록 (로깅 프레임워크 사용 권장)
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        if (count > 0) {
            response.getWriter().write("available");
        } else {
        	response.getWriter().write("unavailable");
        }
    }
}
