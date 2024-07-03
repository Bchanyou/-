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
						<strong>1:1문의</strong>
					</h3>
				</div>

				<!-- 문의 내용 작성 -->
				<section class="sub_cont">
					<form action="InquiryWriteCon" method="post"
						enctype="multipart/form-data">
						<div class="bdr_wrap">
							<table class="tb_write" id="inquiry_write">
								<caption>1:1문의 작성</caption>
								<colgroup>
									<col width="15%">
								</colgroup>
								<tbody>
									<tr>
										<th><span>제목</span></th>
										<td><input type="text" name="title"
											placeholder="제목을 입력해주세요" autofocus></td>
									</tr>
									<tr>
										<th><span>내용</span> <span class="cha_limit">(0/3,000자)</span>
										</th>
										<td><textarea name="content" id="inquriy_text"
												maxlength="3000" placeholder="내용을 입력해주세요 (3,000자 미만)"></textarea>
											<div class="inquiry_imgs my20">
												<ul class="imgBlock">

												</ul>
												<div class="file_btn">
													<input type="file" id="file_btn" name="photo" hidden>
													<label for="file_btn"><img
														src="./images/sub/camera.png" alt="문의 이미지 업로드"></label>
												</div>
											</div>
											<p class="ico_info">5MB 이하의 이미지만 업로드 가능합니다.</p>
											<p class="ico_info">상품과 무관한 내용이거나 음란 및 불법적인 내용은 삭제될 수
												있습니다.</p>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btn_wrap my30">
							<div class="lb"></div>
							<div class="rb">
								<a href="InquirySearchCon" class="btn bg">취소 </a>
								<button class="btn grn" type="submit">등록</button>
							</div>
						</div>
					</form>
				</section>

			</section>

		</section>
		<!-- //Sub Content -->

	</section>

</main>
<!-- //container -->

<script>
	document.addEventListener('DOMContentLoaded', function() {
		//문의 작성 글자 수 표시
		const textarea = document.getElementById('inquriy_text');
		const charLimit = 3000; // 최대 글자 수

		textarea.addEventListener('input', function() {
			const textLength = textarea.value.length;
			const remainingChars = charLimit - textLength;
			const charInfo = document.querySelector('.cha_limit');

			charInfo.textContent = `(${textLength}/${charLimit}자)`;

			// 남은 글자 수가 0 이하일 때 글자 수 제한 색 변경
			if (remainingChars <= 0) {
				charInfo.style.color = 'red';
			} else {
				charInfo.style.color = ''; // 기본 스타일로 복원
			}
		});

		// 문의 이미지 업로드
		const fileInput = document.getElementById('file_btn');

		fileInput.addEventListener('change', function(event) {

			const fileList = event.target.files; // 선택된 파일 목록
			const imgBlock = document.querySelector('ul.imgBlock');
			const file = fileList[0];
			const imageURL = URL.createObjectURL(file); // 파일 URL 생성
			const li = document.createElement('li');
			const img = document.createElement('img');

			img.src = imageURL; // 이미지 URL 설정
			img.alt = '업로드된 이미지'; // 대체 텍스트 설정

			li.appendChild(img);
			imgBlock.appendChild(li);
			document.querySelector('.file_btn').style.display= 'none';
		});
	});
</script>


<%@include file="footer.jsp"%>