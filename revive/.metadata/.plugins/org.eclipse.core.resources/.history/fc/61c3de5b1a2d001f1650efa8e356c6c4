package com.smhrd.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class EditMemberCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. 한글 인코딩
        request.setCharacterEncoding("UTF-8");

        // 2. 데이터 가져오기
        HttpSession session = request.getSession(); // 세션 생성
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

        if (member != null) {
            String email = member.getMem_email();
            String pw = request.getParameter("pw");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");

            // 업데이트할 정보 설정
            MemberDTO updateMember = new MemberDTO(member.getMem_id(), pw, member.getMem_name(), tel, email, member.getJoined_at(), address);

            // 3. DB 기능 호출
            MemberDAO dao = new MemberDAO();
            int cnt = dao.update(updateMember);

            if (cnt > 0) {
                // 세션에 저장된 회원 정보를 업데이트
                session.setAttribute("loginMember", updateMember);
                System.out.println("정보수정 성공");
                response.sendRedirect("index.jsp");
            } else {
                System.out.println("정보수정 실패");
                response.sendRedirect("update.jsp");
            }
        } else {
            System.out.println("로그인 정보 없음");
            response.sendRedirect("login.jsp");
        }
    }
}
