<%@ page import="javax.servlet.http.HttpSession"%>
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
						<li><a href="my_fridge.jsp">my냉장고</a></li>
						<li><a href="calendar.jsp">캘린더</a></li>
						<li><a href="recipe.jsp">레시피</a></li>
						<li><a href="cs_center.jsp">고객센터</a></li>
					</ul>
				</nav>
				<!-- //Gnb -->

				<div class="hdr_util">
					<ul>
						<%
						HttpSession loginSession = request.getSession(false);

						// 세션과 쿠키를 동시에 확인하여 로그인 상태를 판별
						if (loginSession != null && loginSession.getAttribute("loginMember") != null) {%>
							<li><a href="mem_info.jsp">회원정보관리</a></li>
							<li><a href="MemberLogoutCon">로그아웃</a></li>
						<%} else {
						%>
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.html">회원가입</a></li>
						<%
						}
						%>
					</ul>
				</div>

			</div>
		</header>
		<!-- //Header -->