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
import com.smhrd.member.model.MemberDAO;
import com.smhrd.member.model.MemberDTO;

public class IngredientAddCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// 2. 세션 가져오기
		HttpSession session = request.getSession(true);
		
		// 3. 데이터 가져오기
		String ingre_name = request.getParameter("name");
		String ingre_unit = request.getParameter("unit");
		String ingre_bundle = request.getParameter("unit_stock");
		String ingre_stock = request.getParameter("stock");
		String purchased_at = request.getParameter("date_buy");
		String expired_at = request.getParameter("date_exp");
		String ingre_loc = request.getParameter("location");

		// 4. 세션에서 회원 정보 가져오기
		MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

		// 5. 쿠키에서 아이디 가져오기
		if (member == null) {
			Cookie[] cookies = request.getCookies();

			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("savedId")) {
						String savedId = cookie.getValue();
						System.out.println("Saved Id from cookie: " + savedId);

						// 쿠키에서 가져온 아이디로 IngredientDTO 생성
						IngredientDTO ingredient = new IngredientDTO(savedId, ingre_name, purchased_at, expired_at, ingre_unit, ingre_stock, ingre_bundle, ingre_loc);

						// 품목 추가 처리
						IngredientDAO dao = new IngredientDAO();
						int row = dao.add(ingredient);

						if (row > 0) {
							System.out.println("품목 추가 성공");
							response.sendRedirect("my_fridge.jsp");
						} else {
							System.out.println("품목 추가 실패");
							response.sendRedirect("my_fridge.jsp");
						}

						return; // 처리 완료 후 리턴
					}
				}
			}

			// 쿠키에 저장된 아이디가 없는 경우
			System.out.println("쿠키에 저장된 아이디가 없습니다.");
			response.sendRedirect("login.jsp"); // 예시로 로그인 페이지로 리다이렉트
		} else {
			// 세션에 저장된 회원 정보로 IngredientDTO 생성
			String id = member.getMem_id();
			System.out.println("Saved Id from session: " + id);

			IngredientDTO ingredient = new IngredientDTO(id, ingre_name, purchased_at, expired_at, ingre_unit, ingre_stock, ingre_bundle, ingre_loc);

			// 품목 추가 처리
			IngredientDAO dao = new IngredientDAO();
			int row = dao.add(ingredient);

			if (row > 0) {
				System.out.println("품목 추가 성공");
				response.sendRedirect("my_fridge.jsp");
			} else {
				System.out.println("품목 추가 실패");
				response.sendRedirect("my_fridge.jsp");
			}
		}
	}
}
