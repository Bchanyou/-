package com.smhrd.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class MemberEditInfo extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("비번빼고회원수정");

      // 1. 한글 인코딩
      request.setCharacterEncoding("UTF-8");

      // 세션에서 회원 정보 가져오기
      HttpSession session = request.getSession(true);
      MemberDTO memberShow = (MemberDTO) session.getAttribute("loginMember");

      String mem_id = (String) session.getAttribute("savedId");
      String mem_pw = (String) session.getAttribute("savedPw");
      String mem_name = request.getParameter("name");
      String mem_phone = request.getParameter("phone");
      String mail = request.getParameter("mail");
      String slt = request.getParameter("slt_mail");
      String mem_email = mail + "@" + slt;

      if (mem_id == null) {
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
      System.out.println(mem_id);

      MemberDAO dao = new MemberDAO();
      MemberDTO updateMember = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_email, null, null);

      int result = dao.updateName(updateMember);

      if (result > 0) {
         // jsp에 출력하기 위해 member에 속성 설정
         memberShow.setMem_name(mem_name);
         memberShow.setMem_phone(mem_phone);
         memberShow.setMail(mail);
         memberShow.setSlt_mail(slt);
         memberShow.setMem_email(mem_email);

         String alertMessage = "회원정보수정에 성공했습니다.";
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>alert('" + alertMessage + "'); location.href='" + request.getContextPath() + "/mem_info_modify.jsp';</script>");
      } else {
         String alertMessage = "회원정보수정에 실패했습니다.";
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>alert('" + alertMessage + "'); location.href='" + request.getContextPath() + "/mem_info_modify.jsp';</script>");
      }
   }
}
