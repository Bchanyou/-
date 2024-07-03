package com.smhrd.ingredient.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smhrd.ingredient.model.IngredientDAO;
import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;

public class IngredientAddAllCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");

        // 2. 세션 가져오기 (로그인 상태 확인)
        HttpSession session = request.getSession(true);
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
        if (member == null) {
            // 로그인 되어 있지 않으면 처리 (예: 로그인 페이지로 리다이렉트)
            response.sendRedirect("login.jsp");
            return;
        }

        // 3. 클라이언트로부터 JSON 데이터 받기
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        reader.close();

        // JSON 데이터를 List<IngredientDTO> 객체로 변환
        ObjectMapper mapper = new ObjectMapper();
        List<IngredientDTO> ingredients = mapper.readValue(sb.toString(), mapper.getTypeFactory().constructCollectionType(List.class, IngredientDTO.class));

        // 4. 각 IngredientDTO 객체에 회원 ID 추가
        String mem_id = member.getMem_id();
        for (IngredientDTO ingredient : ingredients) {
            ingredient.setMem_id(mem_id);
        }

        // 5. DAO를 사용하여 여러 품목 데이터를 한 번에 데이터베이스에 저장
        IngredientDAO dao = new IngredientDAO();
        int[] rows = dao.addAll(ingredients);

        // 6. 처리 결과에 따라 응답
        if (rows != null && rows.length > 0) {
            System.out.println("품목 추가 성공");
            response.sendRedirect("IngredientSearchCon");
        } else {
            System.out.println("품목 추가 실패");
            response.sendRedirect("IngredientSearchCon");
        }
    }
}
