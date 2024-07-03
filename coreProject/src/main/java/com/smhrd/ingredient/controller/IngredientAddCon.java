package com.smhrd.ingredient.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.ingredient.model.IngredientDAO;
import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;

public class IngredientAddCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("fsdfsad");
		// 1. 한글 인코딩 설정
		request.setCharacterEncoding("UTF-8");

		// 2. 세션 가져오기
		HttpSession session = request.getSession(true);

		// 3. 데이터 가져오기
		String[] ingre_name = request.getParameterValues("name");
		String[] ingre_unit = request.getParameterValues("unit");
		String[] ingre_bundle = request.getParameterValues("unit_stock");
		String[] ingre_stock = request.getParameterValues("stock");
		String[] purchased_at = request.getParameterValues("date_buy");
		String[] expired_at = request.getParameterValues("date_exp");
		String[] ingre_loc = request.getParameterValues("location");

		System.out.println(ingre_name);
		System.out.println(ingre_unit);
		// System.out.println(ingre_bundle);
		System.out.println(ingre_stock);
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

		// ingre_bundle null 유무
		for (int i = 0; i < ingre_name.length; i++) {
			if (ingre_bundle != null) {
				IngredientDTO ingredient = new IngredientDTO(mem_id, null, null, 0, ingre_name[i], purchased_at[i],
						expired_at[i], ingre_unit[i], ingre_stock[i], ingre_bundle[i], ingre_loc[i]);
				IngredientDAO dao = new IngredientDAO();
				int row = dao.add(ingredient);
				if (row > 0) {
					System.out.println("품목 추가 성공");
				} else {
					System.out.println("품목 추가 실패");
				}
			}else {
				IngredientDTO ingredient = new IngredientDTO(mem_id, null, null, 0, ingre_name[i], purchased_at[i],
						expired_at[i], ingre_unit[i], ingre_stock[i], null, ingre_loc[i]);
				IngredientDAO dao = new IngredientDAO();
				int row = dao.add(ingredient);
				if (row > 0) {
					System.out.println("품목 추가 성공");
				} else {
					System.out.println("품목 추가 실패");
				}
			}
		}// bundle
		

		response.sendRedirect("my_fridge.jsp");
	}
}
