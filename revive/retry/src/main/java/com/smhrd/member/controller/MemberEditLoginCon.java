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

public class MemberEditLoginCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(true);
        
        String mem_id = (String) session.getAttribute("savedId");
        String mem_pw = request.getParameter("pw");
        if(mem_id==null) {
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
        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.login(new MemberDTO(mem_id, mem_pw, null, null, null, null, null));
        System.out.println(mem_id);
        System.out.println(mem_pw);
        System.out.println(member);
        if (member != null) {
            // 로그인 성공 시 세션에 로그인 회원 정보 저장
            response.sendRedirect("mem_info_modify.jsp");
        } else {
            // 로그인 실패 시 오류 메시지 설정
        	System.out.println("로그인 실패");
            response.sendRedirect("mem_info.jsp");
        }
    }
}
