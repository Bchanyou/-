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

public class IngredientDeleteCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("품목선택삭제컨트롤러");

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        // 요청 파라미터로부터 품목 인덱스를 가져옵니다.
        String ingre_idx_str = request.getParameter("ingre_idx");
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

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
        
        // ingre_idx를 정수로 변환
        int ingre_idx = Integer.parseInt(ingre_idx_str);
        
        // 품목 삭제 로직을 수행합니다.
        IngredientDTO ingredient = new IngredientDTO();
        ingredient.setMem_id(mem_id);
        ingredient.setIngre_idx(ingre_idx);
        
        IngredientDAO dao = new IngredientDAO();
        int result = dao.deleteIngredient(ingredient);
        
        if (result > 0) {
            System.out.println("품목 삭제에 성공했습니다");
            response.sendRedirect("my_fridge.jsp");
        } else {
            request.setAttribute("error", "품목 삭제에 실패했습니다");
            request.getRequestDispatcher("my_fridge.jsp").forward(request, response);
        }
    }
}
