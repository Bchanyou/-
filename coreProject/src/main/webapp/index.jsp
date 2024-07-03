<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>


<!-- container -->
<main id="container">

	<!-- Fixed Sections -->
	<div class="text">
		<h1 class="cnt01" id="big_title">registration</h1>
		<div id="main_image">
			<img src="./images/main/image01.png" alt="식재료 유통기한 간편 등록"
				id="center_img01" class="active"> <img
				src="./images/main/image02.png" alt="한 눈에 보기 쉬운 유통기한 캘린더!"
				id="center_img02"> <img src="./images/main/image03.png"
				alt="유통기한 임박 알람 기능" id="center_img03">
		</div>

		<div id="bubble_wrap" class="bubble01">
			<div class="bubble">
				<img src="./images/main/bubble.png" alt="냉장고를 부탁해 기능">
			</div>

			<div class="txt_box">
				<h3>
					식재료 유통기한<br>간편 등록
				</h3>
				<div class="main_btn">
					<a href="my_fridge.jsp">More &nbsp; &gt;</a>
				</div>
			</div>
		</div>

	</div>
	<!-- Fixed Sections Ends-->


	<!-- Fruits Images Section -->
	<div class="section_container_main">
		<div class="section_container">
			<section class="section" id="section1">
				<div class="fruit_images">
					<div class="image_one fruit_image">
						<img src="./images/main/pearone.png" alt="pear-image">
					</div>
					<div class="image_two fruit_image">
						<img src="./images/main/avocado.png" alt="pear-image">
					</div>
					<div class="image_four fruit_image">
						<img src="./images/main/broccoli.png" alt="pear-image">
					</div>
				</div>
			</section>
			<section class="section" id="section2">
				<div class="fruit_images">
					<div class="image_one fruit_image">
						<img src="./images/main/peach.png" alt="apple-image">
					</div>
					<div class="image_two fruit_image">
						<img src="./images/main/strawberry.png" alt="apple-image">
					</div>
					<div class="image_four fruit_image">
						<img src="./images/main/apple_piece.png" alt="apple-image">
					</div>
				</div>
			</section>
			<section class="section" id="section3">
				<div class="fruit_images">
					<div class="image_one fruit_image">
						<img src="./images/main/cabbage.png" alt="exotic-image">
					</div>
					<div class="image_two fruit_image">
						<img src="./images/main/exotic.png" alt="exotic-image">
					</div>
					<div class="image_four fruit_image">
						<img src="./images/main/blueberry.png" alt="exotic-image">
					</div>
				</div>
			</section>
		</div>
	</div>

	<div id="scroll" class="wave">Scroll Down</div>


</main>
<!-- //container -->


<!-- 참고출처 : https://codepen.io/ELIZABETH-LEDESMA-AGUILAR/pen/mdgmMya -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
<script src="./js/main.js"></script>


<%@ include file="footer.jsp"%>