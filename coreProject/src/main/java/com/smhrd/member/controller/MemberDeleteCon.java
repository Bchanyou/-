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

public class MemberDeleteCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       System.out.println("회원탈퇴컨트롤러");

        // 1. 한글 인코딩
        request.setCharacterEncoding("UTF-8");

        // 2. 데이터 가져오기
        // 로그인정보는 세션에서 가져옴
        HttpSession session = request.getSession();
        MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

        // 추가로 입력받은 비밀번호 가져오기
        String mem_pw = request.getParameter("pw");

        // 3. 세션 또는 쿠키에서 아이디 가져오기
        String mem_id = null;
        if (loginMember == null) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("savedId")) {
                        mem_id = cookie.getValue();
                        break;
                    }
                }
            }

            if (mem_id == null) {
                // 쿠키에 저장된 아이디가 없는 경우
                response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉트
                return;
            }
        } else {
            mem_id = loginMember.getMem_id();
        }

        // 4. 입력받은 비밀번호와 회원의 실제 비밀번호 비교
        MemberDAO dao = new MemberDAO();
        System.out.println(mem_id);
        System.out.println(mem_pw);
        MemberDTO member = dao.login(new MemberDTO(mem_id, mem_pw, null, null, null, null, null));

        if (member != null) {
            // 비밀번호가 일치하면 회원 삭제 처리
            int deleteCnt = dao.delete(mem_id);

            if (deleteCnt > 0) {
                // 회원 삭제 성공 시
                session.invalidate(); // 세션 무효화
                System.out.println("회원 탈퇴 성공");
                response.sendRedirect("mem_exit_succ.jsp"); // 메인 페이지로 리다이렉트 또는 탈퇴 완료 메시지 출력
            } else {
                // 회원 삭제 실패 시
                response.sendRedirect(""); // 에러 페이지로 리다이렉트 또는 실패 메시지 출력
            }
        } else {
            // 비밀번호가 일치하지 않으면 다시 입력 폼으로 이동
           System.out.println("비밀번호를 확인해주세요");
            response.sendRedirect("mem_exit.jsp"); // 비밀번호 다시 입력받는 페이지로 리다이렉트
        }
    }
}
