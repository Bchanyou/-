package com.smhrd.ingredient.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.ingredient.model.IngredientDAO;
import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;

public class IngredientSelectDeleteCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("품목체크박스삭제컨트롤러");
      request.setCharacterEncoding("UTF-8");
      
      HttpSession session = request.getSession(true);

      String ingre_name = request.getParameter("name");
      String purchased_at = request.getParameter("date_buy");
      // 4. 세션에서 회원 정보 가져오기
      MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

      // 5. 쿠키에서 아이디 가져오기
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

        // URL 인코딩된 파라미터 읽기
        String[] ingredientIdxs = request.getParameterValues("ingre_idx");

        // JSON 데이터가 제대로 수신되었는지 확인
        if (ingredientIdxs != null) {
            System.out.println("Received ingredientIdxs: " + Arrays.toString(ingredientIdxs));
            
            IngredientDAO dao = new IngredientDAO();
            int totalDeleted = 0;
            for (String idx : ingredientIdxs) {
                int ingreIdx = Integer.parseInt(idx);
                int row = dao.deleteIngredientByIdx(ingreIdx);
                totalDeleted += row;
            }

            if (totalDeleted > 0) {
                System.out.println("품목 삭제 성공");
                response.sendRedirect("IngredientSearchCon");
            } else {
                System.out.println("품목 삭제 실패");
                response.sendRedirect("IngredientSearchCon");
            }
        } else {
            System.out.println("No items received for deletion.");
            response.sendRedirect("IngredientSearchCon");
        }
    }
}
