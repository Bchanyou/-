<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!-- Util Page -->
<main class="py120 util_page">

	<section id="util_box">

		<div class="big_tit">
			<h3>
				<strong class="font">로그인</strong>
			</h3>
		</div>

		<!-- Form_Login -->
		<form class="tb_wrap" method="post" action="MemberLoginCon"
			name="loginForm">
			<div class="bdr_wrap row" id="login">
				<table>
					<caption>로그인</caption>
					<colgroup>
						<col width="30%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" maxlength="50"
								placeholder="아이디를 입력해주세요"
								value="<%=session.getAttribute("savedId") != null ? session.getAttribute("savedId") : ""%>"
								autofocus></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw" maxlength="50"
								placeholder="비밀번호를 입력해주세요"></td>
						</tr>
					</tbody>
				</table>
				<div class="login_btns my20">
					<div class="lb">
						<div class="chk_box">
							<input type="checkbox" id="save_id" name="save_id"
								class="login_chk"> <label for="save_id">아이디 저장</label>
						</div>
						<div class="chk_box">
							<input type="checkbox" id="save_login" name="save_login"
								class="login_chk"> <label for="save_login">자동로그인</label>
						</div>
					</div>
					<div class="rb">
						<span><a href="find_id.jsp">아이디 찾기</a></span> <span><a href="find_pw.jsp">비밀번호
								찾기</a></span>
					</div>
				</div>
				<div class="btn_wrap my30">
					<button type="submit" class="btn grn">로그인</button>
					<div class="line">
						<a href="join.jsp" class="btn bg">회원가입</a>
					</div>
				</div>
			</div>
		</form>
		<!-- //Form_Login -->

	</section>

</main>
<!-- // Util Page -->

<%@include file="footer.jsp"%>