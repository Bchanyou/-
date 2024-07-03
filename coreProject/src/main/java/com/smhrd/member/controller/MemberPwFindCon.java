package com.smhrd.member.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;
import java.io.*;
import java.security.SecureRandom;
import com.smhrd.member.util.EmailUtil;

public class MemberPwFindCon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 2. 폼 데이터에서 회원 아이디, 이메일, 이름 가져오기
        String mem_id = request.getParameter("id");
        String mem_email = request.getParameter("mail") + "@" + request.getParameter("slt_mail");
        String mem_name = request.getParameter("name");
        System.out.println(mem_id + " " + mem_email + " " + mem_name);

        // 3. 입력된 정보로 회원 조회
        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.findMember(mem_id, mem_email, mem_name);
        System.out.println(member);

        // 4. 회원이 존재하면 새로운 비밀번호 생성 및 업데이트
        if (member != null) {
            String newPassword = generateRandomPassword(); // 임시 비밀번호 생성 메서드
            int passwordUpdated = memberDAO.updatePassword(mem_id, newPassword);
            System.out.println("임시 비밀번호 생성 성공");

            // 5. 비밀번호가 성공적으로 업데이트되었으면 이메일로 발송
            if (passwordUpdated > 0) {
                EmailUtil.sendPasswordResetEmail(member.getMem_email(), newPassword, mem_id);
                request.setAttribute("message", "비밀번호 재설정 메일이 발송되었습니다. 이메일을 확인하세요.");
                request.setAttribute("userName", member.getMem_name());
                request.setAttribute("userId", member.getMem_id());
                request.setAttribute("userEmail", member.getMem_email());
                System.out.println("비밀번호 재설정 메일이 발송되었습니다. 이메일을 확인하세요.");
            } else {
                request.setAttribute("message", "비밀번호 재설정에 실패했습니다. 다시 시도해주세요.");
                System.out.println("비밀번호 재설정에 실패했습니다. 다시 시도해주세요.");
            }
        } else {
            // 6. 회원이 존재하지 않는 경우 처리
            request.setAttribute("message", "회원 정보가 일치하지 않습니다. 다시 확인해주세요.");
            System.out.println("회원 정보가 일치하지 않습니다. 다시 확인해주세요.");
        }

        // 7. 결과 메시지를 출력할 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("find_pw_succ.jsp");
        dispatcher.forward(request, response);
    }

    // 새로운 비밀번호 생성 메서드
    private String generateRandomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-_+=<>?";
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder(12);
        for (int i = 0; i < 12; i++) {
            password.append(characters.charAt(random.nextInt(characters.length())));
        }
        return password.toString();
    }
}
