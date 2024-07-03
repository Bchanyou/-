<%@page import="com.smhrd.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDTO member = (MemberDTO) session.getAttribute("loginMember");
%>

<%@include file="header.jsp"%>

<!-- Util Page -->
<main class="py120 util_page">

	<section id="util_box">

		<div class="big_tit">
			<h3>
				<strong>아이디 찾기 완료</strong>
			</h3>
		</div>

		<div class="bdr_wrap">
			<div class="find_result">

				<!-- 이름, 아이디 반환 -->
				<p class="font">
					회원님의 아이디는 &#34;<strong><%
								String savedId = null;

								if (session != null) {
									savedId = (String) session.getAttribute("savedId");
								}

								if (savedId == null) {
									Cookie[] cookies = request.getCookies();
									if (cookies != null) {
										for (Cookie cookie : cookies) {
									if ("savedId".equals(cookie.getName())) {
										savedId = cookie.getValue();
										break;
									}
										}
									}
								}
								%> <%=savedId != null ? savedId : ""%></strong>&#34;
					입니다.
				</p>

			</div>
			<div class="btn_wrap center my30">
				<a href="find_pw.jsp" class="btn bdr w200">비밀번호 찾기</a> <a
					href="login.jsp" class="btn grn w200">로그인 하기</a>
			</div>
		</div>

	</section>

</main>
<!-- // Util Page -->


<%@include file="footer.jsp"%>