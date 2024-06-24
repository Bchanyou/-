<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "header.jsp" %>

        <!-- Util Page -->
        <main class="py120 util_page">

            <section id="util_box">

                <div class="big_tit">
                    <h3><strong>임시 비밀번호 전송 완료</strong></h3>
                </div>

                <div class="bdr_wrap">

                    <!-- 이메일주소 반환 -->
                    <div class="find_result">
                        <p class="font"><%= request.getAttribute("userName") %>님의 아이디는 <strong>&#34;<%= request.getAttribute("userId") %>&#34;</strong></p>
                    </div>

                    <p class="find_guide">
                        입력하신 이메일로 임시 비밀번호를 발송하였습니다. <br>
                        이메일을 확인하여 로그인해주세요.
                    </p>
                    <div class="find_result">

                    </div>
                    <div class="btn_wrap center my30">
                        <a href="login.jsp" class="btn grn w200">로그인 하기</a>
                    </div>
                </div>

            </section>

        </main>
        <!-- // Util Page -->

<%@include file = "footer.jsp" %>