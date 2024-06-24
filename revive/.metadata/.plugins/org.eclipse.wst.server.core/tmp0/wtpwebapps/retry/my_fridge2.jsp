<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.smhrd.ingredient.model.IngredientDTO"%>
<%@ page import="com.smhrd.ingredient.controller.IngredientSearchCon"%>
<%@ page import="java.util.List"%>

<%
List<IngredientDTO> ingredientList = (List<IngredientDTO>) request.getAttribute("ingredientList");
%>

<%@include file="header.jsp"%>

<!-- container -->
<main id="sub">
	<section id="container">

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
					<img src="images/sub/fridge.png" alt="my냉장고">
				</div>

				<!-- 품목리스트 -->
				<form class="tb_wrap" action="" name="">


					<!-- 냉장칸 -->
					<div class="mid_tit my20 loca">
						<h4>
							<span>01</span><strong>냉장칸</strong>
						</h4>
					</div>
					<div class="bdr_wrap">
						<table class="fridge_list" id="ingredientTable1">
							<caption>냉장칸 보유 품목</caption>
							<colgroup>
								<col width="50px">
								<col>
								<col>
								<col width="15%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>
										<div class="chk_box">
											<input type="checkbox" id="check_all" class="chk"> <label
												for="check_all"></label>
										</div>
									</th>
									<th>품목명</th>
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
									for (IngredientDTO ingredient : ingredientList) {
										String location = ingredient.getIngre_loc();
										if (location != null && location.equals("냉장칸")) {
								%>
								<tr>
									<td></td>
									<td><%=ingredient.getIngre_name()%></td>
									<td><%=ingredient.getIngre_stock()%></td>
									<td><%=ingredient.getPurchased_at()%></td>
									<td><%=ingredient.getExpired_at()%></td>
								</tr>
								<%
								}
								}
								} else {
								%>
								<tr>
									<td colspan="4">보유중인 품목이 없습니다.</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>

						<!-- 야채칸 -->
						<div class="mid_tit my20 loca">
							<h4>
								<span>01</span><strong>야채칸</strong>
							</h4>
						</div>
						<div class="bdr_wrap">
							<table class="fridge_list" id="ingredientTable2">
								<caption>야채칸 보유 품목</caption>
								<colgroup>
									<col width="50px">
									<col>
									<col>
									<col width="15%">
									<col width="15%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>
											<div class="chk_box">
												<input type="checkbox" id="check_all" class="chk"> <label
													for="check_all"></label>
											</div>
										</th>
										<th>품목명</th>
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
										for (IngredientDTO ingredient : ingredientList) {
											String location = ingredient.getIngre_loc();
											if (location != null && location.equals("야채칸")) {
									%>
									<tr>
										<td></td>
										<td><%=ingredient.getIngre_name()%></td>
										<td><%=ingredient.getIngre_stock()%></td>
										<td><%=ingredient.getPurchased_at()%></td>
										<td><%=ingredient.getExpired_at()%></td>
									</tr>
									<%
									}
									}
									} else {
									%>
									<tr>
										<td colspan="4">보유중인 품목이 없습니다.</td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>


							<!-- 날개칸 -->
							<div class="mid_tit my20 loca">
								<h4>
									<span>01</span><strong>날개칸</strong>
								</h4>
							</div>
							<div class="bdr_wrap">
								<table class="fridge_list" id="ingredientTable3">
									<caption>날개칸 보유 품목</caption>
									<colgroup>
										<col width="50px">
										<col>
										<col>
										<col width="15%">
										<col width="15%">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th>
												<div class="chk_box">
													<input type="checkbox" id="check_all" class="chk">
													<label for="check_all"></label>
												</div>
											</th>
											<th>품목명</th>
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
											for (IngredientDTO ingredient : ingredientList) {
												String location = ingredient.getIngre_loc();
												if (location != null && location.equals("날개칸")) {
										%>
										<tr>
											<td></td>
											<td><%=ingredient.getIngre_name()%></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
										</tr>
										<%
										}
										}
										} else {
										%>
										<tr>
											<td colspan="4">보유중인 품목이 없습니다.</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

								<!-- 보관중인 품목이 없을 경우 보여지는 박스/ 
                                        아래 전체,선택삭제 버튼도 마찬가지 -->
								<div class="info_box null_box">
									<p class="ico_info">보유중인 품목이 없습니다</p>
								</div>

							</div>

							<div class="btn_wrap my30">
								<div class="lb"></div>
								<div class="rb">
									<button class="btn_bg check_del" type="button">선택삭제</button>
									<button class="btn_grn btn_modal" type="button">품목추가</button>
								</div>
							</div>
				</form>

				<!-- 품목추가 팝업창 -->
				<div class="modal_box w1280 pa50">

					<div class="imgBlock btn_modal_close">
						<a href="#;"><img src="./images/sub/modal_close.png"
							alt="팝업창 닫기"></a>
					</div>

					<div class="mid_tit">
						<h4>
							<strong>품목 추가</strong>
						</h4>
					</div>

					<form action="IngredientAddCon">
						<div class="bdr_wrap">
							<table class="add_list">
								<caption>품목 추가</caption>
								<colgroup>
									<col width="60px">
									<col>
									<col width="18%">
									<col width="10%">
									<col>
									<col>
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
												</select>
											</div> <input type="text" class="unit_input" name="unit_stock"
											disabled>
										</td>
										<td class="qtt_num"><input type="number" name="stock"
											value="1"></td>
										<td class="date_picker"><input type="date" id="date_buy"
											name="date_buy" class="date_format" onchange="formatDate()"></td>
										<td class="date_picker"><input type="date" id="date_exp"
											name="date_exp" class="date_format" onchange="formatDate()"></td>
										<td>
											<div class="select_wrap loca">
												<select name="location" name="location" class="select"
													title="보관위치">
													<option selected>냉장칸</option>
													<option>야채칸</option>
													<option>날개칸</option>
												</select>
											</div>
										</td>
										<td>
											<div class="row_del">
												<a href="#;"><img src="./images/sub/delete.png"
													alt="행 삭제 버튼"></a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<p class="ico_info">상품의 유통기한이 촬영된 사진을 업로드하시면 유통기한이 자동으로 입력됩니다.</p>
						<div class="btn_wrap my30">

							<div class="lb">
								<label for="file1" class="btn_grn file_upload">사진 업로드</label> <input
									type="file" id="file1" class="inpFile" style="display: none;">

							</div>
							<div class="rb">
								<button class="btn_bg row_add" type="button">행 추가</button>
								<button class="btn_grn" type="submit">완료</button>
							</div>
						</div>

					</form>
				</div>
				<!-- // 품목추가 팝업창 -->

			</section>

			<!-- 팝업창 백그라운드 -->
			<div class="modal_back"></div>

		</section>

	</section>
</main>
<!-- //container -->


<%@include file="footer.jsp"%>
