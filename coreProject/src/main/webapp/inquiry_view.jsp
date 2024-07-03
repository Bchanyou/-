<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.board.model.questionsDTO"%>
<%@ include file="header.jsp"%>

<%
questionsDTO question = (questionsDTO) request.getAttribute("question");
%>

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
						<strong>1:1문의</strong>
					</h3>
				</div>

				<!-- 문의 내용 작성 -->
				<section class="sub_cont">
					<div class="bdr_wrap" id="inquiry_view">
						<%
						if (question != null) {
						%>
						<div class="view_title pa40">
							<h4><%=question.getQue_title()%></h4>
							<span><%=question.getCreated_at()%></span>
						</div>
						<div class="inq_cont_wrap pa40">
							<div class="view_cont my20">
								<p><%=question.getQue_content()%></p>
							</div>

							<!-- 이미지 업로드 시 보이게 -->
							<ul class="view_imgs my20">
								<%
								if (question.getQue_img() != null && !question.getQue_img().isEmpty()) {
								%>
								<li><img
									src="<%=request.getContextPath() + "/" + question.getQue_img()%>"
									alt="문의 이미지"></li>
								<%
								}
								%>
							</ul>
						</div>
						<%
						}
						%>

						<div class="view_answer pa40">
							<div class="top">
								<i class="fa-regular fa-comment-dots fa-flip-horizontal fa-2xl"
									style="color: #2ec758;"></i> <strong>답변내용</strong>
							</div>
							<div class="bott">
								<p class="unanswered">
									접수된 내용은 빠른시간내에 순차적으로 답변을 드리도록하겠습니다.<br>고객센터 답변가능 시간 : 평일
									09:00 ~ 18:00
								</p>
								<div class="answer">
									<!--답변내용들어갈곳-->
								</div>
							</div>
						</div>
					</div>
					<div class="btn_wrap my30">
						<div class="lb"></div>
						<div class="rb">
							<a href="InquirySearchCon" class="btn grn">목록으로</a>
						</div>
					</div>
				</section>

			</section>

		</section>
		<!-- //Sub Content -->

	</section>

</main>
<!-- //container -->

<%@include file="footer.jsp"%>