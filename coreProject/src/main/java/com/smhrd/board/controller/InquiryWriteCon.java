package com.smhrd.board.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.smhrd.board.model.questionsDAO;
import com.smhrd.board.model.questionsDTO;
import com.smhrd.member.model.MemberDTO;
@MultipartConfig
public class InquiryWriteCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);
        String que_title = request.getParameter("title");
        String que_content = request.getParameter("content");

        Part filePart = request.getPart("photo");
        String fileName = filePart.getSubmittedFileName();
        String filePath = "uploads/" + fileName;
        File uploads = new File(request.getServletContext().getRealPath("/") + "uploads");
        if (!uploads.exists()) {
            uploads.mkdirs();
        }
        filePart.write(uploads.getPath() + File.separator + fileName);
        
        // 현재 날짜와 시간 가져오기
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String created_at = now.format(formatter);
        
        MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

        if (member == null) {
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("savedId")) {
                        String savedId = cookie.getValue();
                        System.out.println("Saved Id from cookie: " + savedId);

                        // 쿠키에서 가져온 아이디로 questionsDTO 생성
                        questionsDTO questions = new questionsDTO(savedId, que_title, que_content, filePath, created_at);

                        // 품목 추가 처리
                        questionsDAO dao = new questionsDAO();
                        int row = dao.add(questions);

                        if (row > 0) {
                            System.out.println("문의 추가 성공");
                            response.sendRedirect("InquirySearchCon");
                        } else {
                            System.out.println("문의 추가 실패 - 로그인 이상");
//                          response.sendRedirect("InquiryWrite.jsp");
                        }
                        response.sendRedirect("cs_center.jsp");

                        return; // 처리 완료 후 리턴
                    }
                }
            }

            // 쿠키에 저장된 아이디가 없는 경우
            System.out.println("쿠키에 저장된 아이디가 없습니다.");
            response.sendRedirect("login.jsp"); // 예시로 로그인 페이지로 리다이렉트
        } else {
            // 세션에 저장된 회원 정보로 questionsDTO 생성
            String id = member.getMem_id();
            System.out.println("Saved Id from session: " + id);

            questionsDTO questions = new questionsDTO(id, que_title, que_content, filePath, created_at);

            // 품목 추가 처리
            questionsDAO dao = new questionsDAO();
            int row = dao.add(questions);

            if (row > 0) {
                System.out.println("문의 추가 성공");
                response.sendRedirect("InquirySearchCon");
            } else {
                System.out.println("문의 추가 실패 - 뭐지 이건");
                response.sendRedirect("inquiry_write.jsp");
            }
        }
    }
}
