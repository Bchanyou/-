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
       System.out.println("회원정보로그인컨트롤러");
       // 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(true);
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
        
        String mem_pw = request.getParameter("pw");
        String mem_id = null;
        if (member == null) {
            // 쿠키에서 사용자 ID를 가져옵니다.
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("savedId")) {
                        mem_id = cookie.getValue();
                        System.out.println("Saved Id from cookie: " + mem_id);
                        break;
                    }
                }
            }
            if (mem_id == null) {
                System.out.println("쿠키에 저장된 아이디가 없습니다.");
                response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉트
                return;
            }
        } else {
            // 세션에서 사용자 ID를 가져옵니다.
            mem_id = member.getMem_id();
            System.out.println("Saved Id from session: " + mem_id);
        }
        MemberDAO dao = new MemberDAO();
        member = dao.login(new MemberDTO(mem_id, mem_pw, null, null, null, null, null));
        session.setAttribute("savedPw", mem_pw);
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
