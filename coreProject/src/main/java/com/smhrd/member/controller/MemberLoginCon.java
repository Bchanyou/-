package com.smhrd.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class MemberLoginCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       System.out.println("로그인 컨트롤러");
        // 1. 한글 인코딩
        request.setCharacterEncoding("UTF-8");

        // 2. 데이터 가져오기
        String mem_id = request.getParameter("id");
        String mem_pw = request.getParameter("pw");
        String save_login = request.getParameter("save_login");
        String save_id = request.getParameter("save_id");
        

        boolean isSaveLoginChecked = save_login != null;
        boolean isSaveIdChecked = save_id != null;

        MemberDAO dao = new MemberDAO();
        MemberDTO member = dao.login(new MemberDTO(mem_id, mem_pw, null, null, null, null, null));
        List<IngredientDTO> alarm = dao.checkIngreTime(mem_id);
        System.out.println(member);
        System.out.println(alarm);
        System.out.println("입력한 아이디: "+mem_id);
        System.out.println("입력한 비밀번호: "+mem_pw);

        if (member != null) {
            HttpSession session = request.getSession(true); // 세션이 없으면 새로 생성
            session.setAttribute("loginMember", member);
            session.setAttribute("alarm", alarm);

            // 아이디 저장 처리
            if (isSaveIdChecked) {
                session.setAttribute("savedId", mem_id);
                Cookie idCookie = new Cookie("savedId", mem_id);
                //idCookie.setMaxAge(0); // 쿠키 삭제
                response.addCookie(idCookie);
                System.out.println("아이디 저장");
            } else {
                session.removeAttribute("savedId");
                Cookie idCookie = new Cookie("savedId", mem_id);
                idCookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효기간 설정 (30일)
                response.addCookie(idCookie);
                System.out.println("아이디 저장 안됨");
                System.out.println("Cookie ID: " + idCookie.getValue());
            }

            // 자동 로그인 처리
            if (isSaveLoginChecked) {
                session.setMaxInactiveInterval(30 * 24 * 60 * 60); // 세션 유지 시간 설정 (30일)
                session.setAttribute("autoLogin", true);
                System.out.println("자동 로그인");
            } else {
                session.setAttribute("autoLogin", false);
                System.out.println("자동 로그인 안됨");
            }
            response.sendRedirect("IngredientSearchCon");
            System.out.println("로그인 성공");
            System.out.println("Session ID: " + member.getMem_id());
            System.out.println("Session Password: " + member.getMem_pw());
        } else {
            response.sendRedirect("login.jsp");
            System.out.println("로그인 실패");
        }
    }
}
