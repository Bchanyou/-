<%@page import="com.smhrd.ingredient.model.IngredientDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<IngredientDTO> ingredientList = (List<IngredientDTO>) request.getAttribute("ingredientList");
%>

<%@include file="header.jsp"%>


<!-- container -->
<main id="sub" class="container">

	<!-- Sub Visual -->
	<section id="sub_vis" class="sv01">
		<div id="sub_tit" class="w1280">
			<h2>
				<strong class="font">my냉장고</strong>
			</h2>
			<p>
				현재 냉장고에 보유중인 품목을 확인하고<br>간편하게 유통기한을 관리해보세요!
			</p>
		</div>
	</section>

	<!-- Sub Content -->
	<section id="content" class="my120">

		<!-- my냉장고품목 -->
		<section class="sub_cont w1280">
			<div class="big_tit">
				<h3>
					<strong>my냉장고</strong>
				</h3>
				<p>이미지를 클릭하여 해당 칸에 보관된 식재료를 확인할 수 있습니다.</p>
			</div>
			<div class="s01_fridge">
				<img src="images/sub/fridge.png" alt="my냉장고" usemap="#image-map">
			</div>


			<!-- 품목리스트 -->
			<form class="tb_wrap" action="" name="">

				<div class="tabs row">
					<map name="image-map" class="tabs_head">
						<area target="" alt="냉장칸" title="냉장칸" href="javascript:void(0)"
							coords="237,90,548,355" shape="rect" class="tab tabs_head_active">
						<area target="" alt="야채칸" title="야채칸" href="javascript:void(0)"
							coords="241,369,545,501" shape="rect" class="tab">
						<area target="" alt="날개칸" title="날개칸" href="javascript:void(0)"
							coords="53,51,223,509" shape="rect" class="tab">
					</map>
					<div class="tabs_cont">
						<div class="tabs_item tabs_cont_active" id="tab1">
							<div class="mid_tit my20 loca">
								<h4>
									<span>01</span><strong>냉장칸</strong>
								</h4>
							</div>

							<div class="bdr_wrap">
								<table class="fridge_list">
									<caption>냉장칸 보유 품목</caption>
									<colgroup>
										<col width="50px">
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>
												<div class="chk_box">
													<input type="checkbox" id="check_all1" class="chk chk_all">
													<label for="check_all1"></label>
												</div>
											</th>
											<th>품목명</th>
											<th>단위</th>
											<th>수량</th>
											<th>구매날짜</th>
											<th>유통기한</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<!-- Java 코드로 ingredientList를 반복하며 데이터를 출력 -->
										<%
										//request 영역에 저장된 게시글 정보 가져오기
										if (ingredientList != null) {
											int num = 0;
											for (IngredientDTO ingredient : ingredientList) {
												if (ingredient.getIngre_loc().equals("냉장칸")) {
										%>
										<tr>
											<td>
												<div class="chk_box">
													<input type="checkbox" id="chk1_<%=num%>" class="chk">
													<label for="chk1_<%=num%>"></label>
												</div>
											</td>
											<td><%=ingredient.getIngre_name()%></td>
											<td><span name="bundle"><%=(ingredient.getIngre_bundle() != null ? ingredient.getIngre_bundle() : "")%></span>
												<span name="unit"><%=ingredient.getIngre_unit()%></span></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
											<td>
												<button type="button" class="btn bdr edit">수정</button>
												<button type="button" class="btn bdr delete"
													data-ingre-idx="<%=ingredient.getIngre_idx()%>">삭제</button>
											</td>
											<td style="display: none;"><%=ingredient.getIngre_idx()%></td>
										</tr>
										<%
										}
										num += 1;
										}
										}
										%>
									</tbody>

								</table>

								<!-- 품목 null인 경우 -->
								<div class="info_box null_box">
									<p class="ico_info">보유중인 품목이 없습니다</p>
								</div>

							</div>

							<div class="btn_wrap my30">
								<div class="lb"></div>
								<div class="rb">
									<button class="btn bg check_del" type="button">선택삭제</button>
									<button class="btn grn btn_modal" type="button">품목추가</button>
								</div>
							</div>
						</div>
						<div class="tabs_item" id="tab2">
							<div class="mid_tit my20 loca">
								<h4>
									<span>02</span><strong>야채칸</strong>
								</h4>
							</div>

							<div class="bdr_wrap">
								<table class="fridge_list">
									<caption>야채칸 보유 품목</caption>
									<colgroup>
										<col width="50px">
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>
												<div class="chk_box">
													<input type="checkbox" id="check_all2" class="chk chk_all">
													<label for="check_all2"></label>
												</div>
											</th>
											<th>품목명</th>
											<th>단위</th>
											<th>수량</th>
											<th>구매날짜</th>
											<th>유통기한</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<!-- Java 코드로 ingredientList를 반복하며 데이터를 출력 -->
										<%
										//request 영역에 저장된 게시글 정보 가져오기
										if (ingredientList != null) {
											int num = 0;
											for (IngredientDTO ingredient : ingredientList) {
												if (ingredient.getIngre_loc().equals("야채칸")) {
										%>
										<tr>
											<td>
												<div class="chk_box">
													<input type="checkbox" id="chk2_<%=num%>" class="chk">
													<label for="chk2_<%=num%>"></label>
												</div>
											</td>
											<td><%=ingredient.getIngre_name()%></td>
											<td><span name="bundle"><%=(ingredient.getIngre_bundle() != null ? ingredient.getIngre_bundle() : "")%></span>
												<span name="unit"><%=ingredient.getIngre_unit()%></span></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
											<td>
												<button type="button" class="btn bdr edit">수정</button>
												<button type="button" class="btn bdr delete"
													data-ingre-idx="<%=ingredient.getIngre_idx()%>">삭제</button>
											</td>
											<td style="display: none;"><%=ingredient.getIngre_idx()%></td>
										</tr>
										<%
										}
										num += 1;
										}
										}
										%>
									</tbody>

								</table>

								<!-- 품목 null인 경우 -->
								<div class="info_box null_box">
									<p class="ico_info">보유중인 품목이 없습니다</p>
								</div>

							</div>

							<div class="btn_wrap my30">
								<div class="lb"></div>
								<div class="rb">
									<button class="btn bg check_del" type="button">선택삭제</button>
									<button class="btn grn btn_modal" type="button">품목추가</button>
								</div>
							</div>
						</div>
						<div class="tabs_item" id="tab3">
							<div class="mid_tit my20 loca">
								<h4>
									<span>03</span><strong>날개칸</strong>
								</h4>
							</div>

							<div class="bdr_wrap">
								<table class="fridge_list">
									<caption>날개칸 보유 품목</caption>
									<colgroup>
										<col width="50px">
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>
												<div class="chk_box">
													<input type="checkbox" id="check_all3" class="chk chk_all">
													<label for="check_all3"></label>
												</div>
											</th>
											<th>품목명</th>
											<th>단위</th>
											<th>수량</th>
											<th>구매날짜</th>
											<th>유통기한</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<!-- Java 코드로 ingredientList를 반복하며 데이터를 출력 -->
										<%
										//request 영역에 저장된 게시글 정보 가져오기
										if (ingredientList != null) {
											int num = 0;
											for (IngredientDTO ingredient : ingredientList) {
												if (ingredient.getIngre_loc().equals("날개칸")) {
										%>
										<tr>
											<td>
												<div class="chk_box">
													<input type="checkbox" id="chk3_<%=num%>" class="chk">
													<label for="chk3_<%=num%>"></label>
												</div>
											</td>
											<td><%=ingredient.getIngre_name()%></td>
											<td><span name="bundle"><%=(ingredient.getIngre_bundle() != null ? ingredient.getIngre_bundle() : "")%></span>
												<span name="unit"><%=ingredient.getIngre_unit()%></span></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
											<td>
												<button type="button" class="btn bdr edit">수정</button>
												<button type="button" class="btn bdr delete"
													data-ingre-idx="<%=ingredient.getIngre_idx()%>">삭제</button>
											</td>
											<td style="display: none;"><%=ingredient.getIngre_idx()%></td>
										</tr>
										<%
										}
										num += 1;
										}
										}
										%>
									</tbody>

								</table>

								<!-- 품목 null인 경우 -->
								<div class="info_box null_box">
									<p class="ico_info">보유중인 품목이 없습니다</p>
								</div>

							</div>

							<div class="btn_wrap my30">
								<div class="lb"></div>
								<div class="rb">
									<button class="btn bg check_del" type="button">선택삭제</button>
									<button class="btn grn btn_modal" type="button">품목추가</button>
								</div>
							</div>
						</div>

					</div>
				</div>

			</form>

			<!-- 품목추가 팝업창 -->
			<div class="modal_box w1280 pa50 add">

				<div class="imgBlock btn_modal_close">
					<a href="javascript:void(0)"><img
						src="./images/sub/modal_close.png" alt="팝업창 닫기"></a>
				</div>

				<div class="mid_tit">
					<h4>
						<strong>품목 추가</strong>
					</h4>
				</div>

				<p class="ico_info">상품의 유통기한이 촬영된 사진을 업로드하시면 유통기한이 자동으로 입력됩니다.</p>

				<form action="IngredientAddCon" method="post">
					<div class="bdr_wrap">
						<table class="add_list">
							<caption>품목 추가</caption>
							<colgroup>
								<col width="60px">
								<col>
								<col width="18%">
								<col width="10%">
								<col>
								<col width="15%">
								<col>
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th>No.</th>
									<th>품목명</th>
									<th>단위</th>
									<th>수량</th>
									<th>구매날짜</th>
									<th>유통기한</th>
									<th>위치</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td><input type="text" name="name" placeholder="품목명 입력"></td>
									<td class="unit">
										<div class="select_wrap">
											<select name="unit" class="select" title="품목 단위">
												<option selected>개</option>
												<option>ml</option>
												<option>g</option>
											</select>
										</div> <input type="number" class="unit_input" name="unit_stock"
										disabled>
									</td>
									<td class="qtt_num"><input type="number" name="stock"
										value="1"></td>
									<td class="date_picker"><input type="date" name="date_buy"
										class="date_format"></td>
									<td class="date_picker exp"><input type="date"
										name="date_exp" class="date_format"> <input
										type="file" id="file1" class="inpFile"> <label
										for="file1" class="file_upload"><i
											class="fa-regular fa-file-image fa-xl"
											style="color: #2ec758;"></i></label></td>
									<td>
										<div class="select_wrap loca">
											<select name="location" class="select" title="보관위치">
												<option selected>냉장칸</option>
												<option>야채칸</option>
												<option>날개칸</option>
											</select>
										</div>
									</td>
									<td>
										<div class="row_del">
											<a href="javascript:void(0)"><img
												src="./images/sub/delete.png" alt="행 삭제 버튼"></a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_wrap my30">

						<div class="lb"></div>
						<div class="rb">
							<button class="btn bg row_add" type="button">행 추가</button>
							<button class="btn grn" type="submit">완료</button>
						</div>
					</div>

				</form>
			</div>
			<!-- // 품목추가 팝업창 -->

			<!-- 품목수정 팝업창 -->
			<div class="modal_box w1280 pa50 edit">

				<div class="imgBlock btn_modal_close">
					<a href="javascript:void(0)"><img
						src="./images/sub/modal_close.png" alt="팝업창 닫기"></a>
				</div>

				<div class="mid_tit">
					<h4>
						<strong>품목 수정</strong>
					</h4>
				</div>

				<p class="ico_info">상품의 유통기한이 촬영된 사진을 업로드하시면 유통기한이 자동으로 입력됩니다.</p>

				<form action="IngredientEditCon">
					<div class="bdr_wrap">
						<table class="add_list">
							<caption>품목 수정</caption>
							<colgroup>
								<col>
								<col width="18%">
								<col width="10%">
								<col>
								<col width="15%">
								<col>
								<col width="50px">
							</colgroup>
							<thead>
								<tr>
									<th>품목명</th>
									<th>단위</th>
									<th>수량</th>
									<th>구매날짜</th>
									<th>유통기한</th>
									<th>위치</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" name="name" placeholder="품목명 입력"></td>
									<td class="unit">
										<div class="select_wrap">
											<select name="unit" class="select" title="품목 단위">
												<option>개</option>
												<option>ml</option>
												<option>g</option>
											</select>
										</div> <input type="number" class="unit_input" name="unit_stock">
									</td>
									<td class="qtt_num"><input type="number" name="stock"
										value="1"></td>
									<td class="date_picker"><input type="date" name="date_buy"
										class="date_format"></td>
									<td class="date_picker exp"><input type="date"
										name="date_exp" class="date_format"> <input
										type="file" id="file1" class="inpFile"> <label
										for="file1" class="file_upload"><i
											class="fa-regular fa-file-image fa-xl"
											style="color: #2ec758;"></i></label></td>
									<td>
										<div class="select_wrap loca">
											<select name="location" class="select" title="보관위치">
												<option>냉장칸</option>
												<option>야채칸</option>
												<option>날개칸</option>
											</select>
										</div>
									</td>
									<td style="display: none;"><input type="text" name="idx"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="btn_wrap my30">
						<div class="lb"></div>
						<div class="rb">
							<button class="btn grn" type="submit">완료</button>
						</div>
					</div>

				</form>
			</div>
			<!-- // 품목수정 팝업창 -->

		</section>

		<!-- 팝업창 백그라운드 -->
		<div class="modal_back"></div>

	</section>

</main>
<!-- //container -->

<script>
    $(document).ready(function() {
        function attachFileChangeListener(selector) {
            $(document).on('change', selector, function() {
                var fileInput = $(this);
                var formData = new FormData();
                var file = fileInput[0].files[0];
                formData.append('file', file);

                $.ajax({
                    url: '<%=request.getContextPath()%>/UploadServlet', // URL이 올바른지 확인
															type : 'POST',
															data : formData,
															processData : false,
															contentType : false,
															success : function(
																	response) {
																try {
																	console
																			.log(
																					"Server response: ",
																					response); // 서버 응답 확인
																	// JSON 파싱 시도
																	if (typeof response === "string") {
																		response = JSON
																				.parse(response);
																	}
																	console
																			.log(
																					"Parsed response: ",
																					response); // 파싱된 응답 확인
																	if (response.status === "success") {
																		// 적절한 유통기한 필드를 찾아 값을 설정
																		fileInput
																				.closest(
																						'tr')
																				.find(
																						'input[name="date_exp"]')
																				.val(
																						response.expiry_date);
																	} else {
																		alert('Error: '
																				+ response.message);
																	}
																} catch (e) {
																	console
																			.error(
																					"Error parsing JSON: ",
																					e);
																	console
																			.log(
																					"Response that caused error: ",
																					response);
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error('Error: '
																				+ error);
																console
																		.log(
																				"XHR: ",
																				xhr);
															}
														});
											});
						}

						// 초기 파일 입력 필드에 대해 이벤트 리스너 설정
						for (var i = 1; i <= 15; i++) {
							attachFileChangeListener('#file' + i);
						}
					});
</script>

<script type="text/javascript" src="js/ingredient.js" charset="utf-8"></script>
<script type="text/javascript" src="js/ingredientAdd.js" charset="utf-8"></script>
<script type="text/javascript" src="js/ingredientEdit.js"
	charset="utf-8"></script>
<script type="text/javascript" src="js/ingredientDelete.js"
	charset="utf-8"></script>


<%@include file="footer.jsp"%>
