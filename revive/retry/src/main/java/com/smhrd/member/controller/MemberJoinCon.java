package com.smhrd.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

	    // 한글 인코딩 설정
	    request.setCharacterEncoding("UTF-8");

	    // 폼 데이터에서 필요한 값 추출
	    String mem_id = request.getParameter("id");
	    String mem_pw = request.getParameter("pw");
	    String mem_name = request.getParameter("name");
	    String mem_phone = request.getParameter("phone");
	    String mem_email = request.getParameter("mail") + "@" + request.getParameter("slt_mail");
	    String id_check = request.getParameter("id_check");

	    // 폼에서 받아온 id_check 값을 기준으로 중복 확인 로직 추가
	    if ("중복확인완료".equals(id_check)) {
	        // 중복 확인 완료 후 회원 객체 생성
	        LocalDateTime joined_At = LocalDateTime.now();
	        MemberDTO member = new MemberDTO(mem_id, mem_pw, mem_name, mem_phone, mem_email, joined_At, null);

	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();

	        MemberDAO dao = new MemberDAO();
	        int row = dao.join(member);
	        if (row > 0) {
	            // 회원가입 성공
	            System.out.println("회원가입 성공!!!!!");
	        } else {
	            // 회원가입 실패
	            System.out.println("회원가입 실패");
	        }
	        out.close();
	    } else {
	        // 중복 확인을 하지 않은 경우
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.close();
	    }
	}
}