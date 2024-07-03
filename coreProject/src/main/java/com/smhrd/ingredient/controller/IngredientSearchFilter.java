package com.smhrd.ingredient.controller;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.ingredient.model.IngredientDAO;
import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "IngredientFilter", urlPatterns = { "/my_fridge.jsp" })
public class IngredientSearchFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 메서드
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	System.out.println("품목조회컨트롤러");
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 세션 가져오기
        HttpSession session = httpRequest.getSession(true);
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

        // 회원 아이디 확인
        if (member == null) {
            // 쿠키에서 아이디 가져오기
            Cookie[] cookies = httpRequest.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("savedId")) {
                        String savedId = cookie.getValue();
                        System.out.println("Saved Id from cookie: " + savedId);

                        // DAO를 사용하여 품목 리스트 조회
                        IngredientDAO dao = new IngredientDAO();
                        List<IngredientDTO> ingredientList = dao.search(savedId);
                        request.setAttribute("ingredientList", ingredientList);
                        System.out.println("저장된 품목 리스트 : " + ingredientList);
                        
                        // JSP 페이지로 포워드
                        request.getRequestDispatcher("/my_fridge.jsp").forward(request, response);
                        return; // 처리 완료 후 리턴
                    }
                }
            }

            // 쿠키에 저장된 아이디가 없는 경우 로그인 페이지로 리다이렉트
            System.out.println("쿠키에 저장된 아이디가 없습니다.");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        } else {
            // 세션에 저장된 회원 정보로 품목 리스트 조회
            String id = member.getMem_id();
            System.out.println("Saved Id from session: " + id);

            // DAO를 사용하여 품목 리스트 조회
            IngredientDAO dao = new IngredientDAO();
            List<IngredientDTO> ingredientList = dao.search(id);
            request.setAttribute("ingredientList", ingredientList);
            System.out.println("저장된 품목 리스트 : " + ingredientList);
            
            // JSP 페이지로 포워드
            request.getRequestDispatcher("/my_fridge.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        // 필터 소멸 메서드
    }
}