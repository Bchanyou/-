<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>

<!-- container -->
<main id="sub">
	<section id="container">

		<!-- Sub Visual -->
		<section id="sub_vis" class="sv04">
			<div id="sub_tit" class="w1280">
				<h2>
					<strong class="font">고객센터</strong>
				</h2>
				<p>
					자주 묻는 질문 이외의 문의사항은<br> 1:1문의로 작성해주시면 언제든 친절하게 답변해드리겠습니다.
				</p>
			</div>
		</section>

		<!-- Sub Content -->
		<section id="content" class="my120">

			<section class="w1280">
				<div class="big_tit">
					<h3>
						<strong>고객센터</strong>
					</h3>
				</div>

				<!-- FAQ -->
				<section class="sub_cont">
					<div class="mid_tit my20 loca">
						<h4>
							<strong>FAQ</strong>
						</h4>
					</div>
					<div class="drop_down_wrap bdr_wrap">
						<div class="drop_down">
							<div class="drop_title">
								<a href="#;" class="pa30"> <span class="title_before"><span>Q</span></span>
									<h4>카메라로 인식이 안 될 경우는 어떻게 해야하나요?</h4>
								</a>
							</div>
							<div class="drop_sub pa50">
								<p>카메라로 인식이 안 될 경우는 어떻게 해야하나요? 질문에 대한 답변 내용</p>
								<p>카메라로 인식이 안 될 경우는 어떻게 해야하나요? 질문에 대한 답변 내용</p>
							</div>
						</div>
						<div class="drop_down">
							<div class="drop_title">
								<a href="#;" class="pa30"> <span class="title_before"><span>Q</span></span>
									<h4>카메라로 인식이 안 될 경우는 어떻게 해야하나요?</h4>
								</a>
							</div>
							<div class="drop_sub pa50">
								<p>카메라로 인식이 안 될 경우는 어떻게 해야하나요? 질문에 대한 답변 내용</p>
								<p>카메라로 인식이 안 될 경우는 어떻게 해야하나요? 질문에 대한 답변 내용</p>
							</div>
						</div>
					</div>
				</section>

				<!-- 문의내역 -->
				<section class="sub_cont" id="cs_inquiry">
					<div class="mid_tit my20">
						<h4>
							<strong>문의내역</strong>
						</h4>
						<a href="inquiry_write.jsp" class="btn bdr">1:1문의 작성하기</a>
					</div>
					<div class="bdr_wrap">
						<table class="">
							<caption>문의내역</caption>
							<thead>
								<tr>
									<th>제목</th>
									<th>등록일</th>
									<th>답변상태</th>
								</tr>
							</thead>
							<tbody>
								<!-- // 1:1문의 내용 작성 시 아래 태그들이 만들어져야함.
                                        <tr>
                                            <td>제목</td>
                                            <td>등록일</td>
                                            <td>답변대기</td>
                                        </tr>
                                        -->
							</tbody>
						</table>
					</div>
					<div class="info_box null_box">
						<p class="ico_info">1:1 문의 내역이 없습니다.</p>
					</div>
				</section>

			</section>

		</section>
		<!-- //Sub Content -->

	</section>

</main>
<!-- //container -->


<%@include file="footer.jsp"%>