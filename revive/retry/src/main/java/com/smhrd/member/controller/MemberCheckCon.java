package com.smhrd.member.controller;

import com.smhrd.member.model.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemberCheckCon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mem_id = request.getParameter("id");
        MemberDAO dao = new MemberDAO();
        int count = dao.check(mem_id);

        if (count == -1) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } else if (count > 0) {
            response.getWriter().write("unavailable");
        } else {
            response.getWriter().write("available");
        }
    }
}
