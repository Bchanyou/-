package com.smhrd.ingredient.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.ingredient.model.IngredientDAO;
import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;

public class IngredientEditCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       System.out.println("품목소모컨트롤러");
       request.setCharacterEncoding("UTF-8");

       HttpSession session = request.getSession(true);

       String ingre_name = request.getParameter("name");
       String ingre_unit = request.getParameter("unit");
       String ingre_bundle = request.getParameter("unit_stock");
       String ingre_stock = request.getParameter("stock");
       String purchased_at = request.getParameter("date_buy");
       String expired_at = request.getParameter("date_exp");
       String ingre_loc = request.getParameter("location");
       int ingre_idx = Integer.parseInt(request.getParameter("idx"));

       // 세션에서 회원 정보 가져오기
       MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

       // 쿠키에서 아이디 가져오기
       String mem_id = null;
       if (member == null) {
           Cookie[] cookies = request.getCookies();
           if (cookies != null) {
               for (Cookie cookie : cookies) {
                   if (cookie.getName().equals("savedId")) {
                       mem_id = cookie.getValue();
                       System.out.println(mem_id);
                       System.out.println("Saved Id from cookie: " + mem_id);
                       break;
                   }
               }
           }

           if (mem_id == null) {
               // 쿠키에 저장된 아이디가 없는 경우
               System.out.println("쿠키에 저장된 아이디가 없습니다.");
               response.sendRedirect("login.jsp"); // 예시로 로그인 페이지로 리다이렉트
               return;
           }
       } else {
           // 세션에 저장된 회원 정보로 mem_id 설정
           mem_id = member.getMem_id();
           System.out.println("Saved Id from session: " + mem_id);
       }

       // 품목 정보 DTO 생성
       IngredientDTO ingredient = new IngredientDTO(mem_id, ingre_idx, ingre_name, purchased_at, expired_at,
               ingre_unit, ingre_stock, ingre_bundle, ingre_loc);
       IngredientDAO dao = new IngredientDAO();
       int row = dao.editIngredient(ingredient);

       if (row > 0) {
           System.out.println("품목 수정 성공");
           System.out.println(row);
           response.sendRedirect("my_fridge.jsp");
       } else {
           System.out.println("품목 수정 실패");
           System.out.println(row);
           response.sendRedirect("my_fridge.jsp");
       }
   }
}