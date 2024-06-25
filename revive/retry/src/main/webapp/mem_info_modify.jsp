<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie"%>
<!doctype html>
<html lang="ko">

<%@include file="header.jsp"%>

<!-- Util Page -->
<main class="py120 util_page">

	<section id="util_box">

		<div class="big_tit">
			<h3>
				<strong class="font">회원정보수정</strong>
			</h3>
		</div>

		<!-- Form_Mem_Modify -->
		<form method="post" action="MemberEditCon" name="">
			<div class="bdr_wrap row">
				<table>
					<caption>회원정보수정</caption>
					<colgroup>
						<col width="30%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<!-- 아이디 반환 -->
							<td style="text-align: left;">
								<%
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
								%> <%=savedId != null ? savedId : ""%>
							</td>
						</tr>
						<tr>
							<th>현재 비밀번호</th>
							<td><input type="password" name="pw"
								placeholder="현재 비밀번호를 입력해주세요"></td>
						</tr>
						<tr>
							<th>신규 비밀번호</th>
							<td><input type="password" name="new_pw"
								placeholder="영문, 숫자 조합 최소 8자리이상 입력해주세요"></td>
						</tr>
						<tr>
							<th>신규 비밀번호 확인</th>
							<td><input type="password" name="new_pw_check"
								placeholder="비밀번호 확인을 위해 한 번 더 입력해주세요"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="name" placeholder="이름을 입력해주세요"></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="text" name="phone"
								placeholder="- 는 제외하고 숫자만 입력해주세요"></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="disf"><input type="text" name="mail"
								placeholder="이메일"> <span>@</span>
								<div class="select_wrap">
									<select name="slt_mail" class="select">
										<option selected>선택하세요</option>
										<option>naver.com</option>
										<option>gmail.com</option>
										<option>daum.net</option>
									</select>
								</div></td>
						</tr>
					</tbody>

				</table>
				<div class="btn_wrap center my30">
					<a href="MemberDeleteCon" class="btn bg w200">회원탈퇴</a>
					<button type="submit" class="btn grn w200">수정하기</button>
					<!-- <button onclick="submitFormEmail2('MemberEmailCheckCon')"
						type="button" class="btn grn w200">수정하기</button> -->
				</div>
			</div>

		</form>
		<!-- //Form_Mem_Modify -->

	</section>

</main>
<!-- // Util Page -->




</div>
</body>


</html>