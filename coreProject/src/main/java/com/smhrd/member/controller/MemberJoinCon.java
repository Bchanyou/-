package com.smhrd.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class MemberJoinCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      
      System.out.println("회원가입컨트롤러");
       request.setCharacterEncoding("UTF-8");

       String mem_id = request.getParameter("id");
       String mem_pw = request.getParameter("pw");
       String mem_name = request.getParameter("name");
       String mem_phone = request.getParameter("phone");
       String mem_email = request.getParameter("mail") + "@" + request.getParameter("slt_mail");
       System.out.println(mem_id + " " + mem_pw);
       
       // 비밀번호 규칙 검증
       String pwPattern = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
       if (!Pattern.matches(pwPattern, mem_pw)) {
           response.setCharacterEncoding("UTF-8");
           response.setContentType("text/html; charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.println("<script>alert('비밀번호는 8자 이상, 영문자, 숫자, 특수문자를 포함해야 합니다.'); history.back();</script>");
           out.close();
           return;
       }

       LocalDateTime joined_At = LocalDateTime.now();
       MemberDTO member = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_email, joined_At, null);

       response.setCharacterEncoding("UTF-8");
       response.setContentType("text/html; charset=UTF-8");
       PrintWriter out = response.getWriter();

       MemberDAO dao = new MemberDAO();
       int row = dao.join(member);
       if (row > 0) {
           System.out.println("회원가입 성공!!!!!");
           response.sendRedirect("join_succ.jsp");
       } else {
           System.out.println("회원가입 실패");
           out.println("<script>alert('회원가입에 실패했습니다. 다시 시도해 주세요.'); history.back();</script>");
       }
       out.close();
   }
}
