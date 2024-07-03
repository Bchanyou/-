<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.temporal.ChronoUnit"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.smhrd.ingredient.model.IngredientDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>

<title>냉장고를부탁해</title>

<!--Add Js-->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/b9310abc97.js"
	crossorigin="anonymous"></script>
<script src='https://unpkg.com/@fullcalendar/core@5.10.1/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/daygrid@5.10.1/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.14/index.global.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tooltipster/4.2.8/js/tooltipster.bundle.min.js"></script>
<script type="text/javascript" src="js/swiper.min.js" charset="utf-8"></script>
<script type="text/javascript" src="js/slider.js" charset="utf-8"></script>


<!--Basic Js-->
<script type="text/javascript" src="js/common.js" charset="utf-8"></script>


<!--Favicon-->
<link rel="shortcut icon" href="images/common/favicon.png"
	type="image/x-icon">
<link rel="icon" href="images/common/favicon.png" type="image/x-icon">


<!--Add Css-->
<link rel="stylesheet" href="css/swiper.min.css" media="all" />
<link href='https://unpkg.com/@fullcalendar/core@5.10.1/main.min.css'
	rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/daygrid@5.10.1/main.min.css'
	rel='stylesheet' />


<%
// 인덱스페이지에서 헤더 변경
String currentPage = request.getRequestURI();
if (currentPage.endsWith("/index.jsp")) {
%>
<link rel="stylesheet" href="css/main.css">
<%
}
%>


<%
// 알람
List<IngredientDTO> alarm = (List<IngredientDTO>) session.getAttribute("alarm");
LocalDate today = LocalDate.now();
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

// 데이터 확인
if (alarm != null) {
	for (IngredientDTO ingredient : alarm) {
		System.out.println("Ingredient: " + ingredient.getIngre_name() + ", Expired At: " + ingredient.getExpired_at());
	}
} else {
	System.out.println("ingredientList is null");
}
%>


<!-- <link rel="stylesheet" href="resources/styles.css" type="text/css"> -->


<!--Basic Css-->
<link rel="stylesheet" href="css/style.css" media="all" />


</head>

<body>
	<div id="wrap">

		<!-- Header -->
		<header id="header" class="px50">
			<div class="hdr_inner">

				<h1 id="hdr_logo">
					<a href="index.jsp"><strong><span>냉장고를 </span>부탁해</strong></a>
				</h1>

				<!-- Gnb -->
				<nav id="gnb">
					<ul>
						<li><a href="IngredientSearchCon">my냉장고</a></li>
						<li><a href="CalendarCon">캘린더</a></li>
						<li><a href="search3">레시피</a></li>
						<li><a href="InquirySearchCon">고객센터</a></li>
					</ul>
				</nav>
				<!-- //Gnb -->

				<div class="hdr_util">
					<ul>
						<%
						HttpSession loginSession = request.getSession(false);

						// 세션과 쿠키를 동시에 확인하여 로그인 상태를 판별
						if (loginSession != null && loginSession.getAttribute("loginMember") != null) {
						%>
						<li id="bell"><button class="bell_modal">notification</button></li>
						<li class="mem"><a href="#;">회원정보관리</a>
							<ul class="dep2">
								<li><a href="mem_info.jsp">회원정보수정</a></li>
								<li><a href="mem_pw_modify.jsp">비밀번호변경</a></li>
							</ul></li>
						<li><a href="MemberLogoutCon">로그아웃</a></li>

						<%
						} else {
						%>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
						<%
						}
						%>
					</ul>
				</div>

			</div>
		</header>
		<!-- //Header -->


		<!-- 알람 -->
		<div id="util_box">

			<section class="modal_box alarm">
				<div class="bdr_wrap">
					<div class="imgBlock btn_modal_close">
						<a href="#;"><img src="./images/sub/modal_close.png"
							alt="팝업창 닫기"></a>
					</div>

					<div class="mid_tit">
						<h4>
							<strong>유통기한 임박 알림</strong>
						</h4>
						<p class="ico_info">유통기한이 임박한 식재료 리스트입니다.</p>
					</div>

					<ul class="noti_list my30">
						<%
						if (alarm != null && !alarm.isEmpty()) {
							for (IngredientDTO alarmlist : alarm) {
								try {
							LocalDate expiryDate = LocalDate.parse(alarmlist.getExpired_at(), formatter);
							long daysLeft = ChronoUnit.DAYS.between(today, expiryDate);
						%>
						<li>
							<p>
								<strong class="food"><%=alarmlist.getIngre_name()%></strong>의
								유통기한이 <strong class="day"><%=daysLeft%>일</strong> 남았습니다.
							</p> <span class="data">유통기한 <%=expiryDate%></span>
						</li>
						<%
						} catch (Exception e) {
						e.printStackTrace();
						}
						}
						} else {
						%>
						<li>유통기한이 임박한 식재료가 없습니다.</li>
						<%
						}
						%>
					</ul>

					<div class="btn_wrap center">
						<a href="IngredientSearchCon" class="btn grn">품목 살펴보기</a>
						<a href="search3" class="btn bg">레시피 보기</a>
					</div>
				</div>
			</section>

			<!-- 팝업창 백그라운드 -->
			<div class="modal_back"></div>
		</div>