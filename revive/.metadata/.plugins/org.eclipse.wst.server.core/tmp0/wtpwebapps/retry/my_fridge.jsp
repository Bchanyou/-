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
						<area target="" alt="냉장칸" title="냉장칸" href="#;"
							coords="237,90,548,355" shape="rect" class="tab tabs_head_active">
						<area target="" alt="야채칸" title="야채칸" href="#;"
							coords="241,369,545,501" shape="rect" class="tab">
						<area target="" alt="날개칸" title="날개칸" href="#;"
							coords="53,51,223,509" shape="rect" class="tab">
						<area target="" alt="날개칸" title="날개칸" href="#;"
							coords="565,62,752,498" shape="rect" class="tab">
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
										<col>
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
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
											for (IngredientDTO ingredient : ingredientList) {
										%>
										<tr>
											<td><%=ingredient.getIngre_name()%></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="7">
												<div class="info_box null_box">
													<p class="ico_info">보유중인 품목이 없습니다</p>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

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
										<col>
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
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
											for (IngredientDTO ingredient : ingredientList) {
										%>
										<tr>
											<td>
												<div class="chk_box">
													<input type="checkbox" id="check1" class="chk"> <label
														for="check1"></label>
												</div>
											</td>
											<td><%=ingredient.getIngre_name()%></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="7">
												<div class="info_box null_box">
													<p class="ico_info">보유중인 품목이 없습니다</p>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

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
										<col>
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
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
											for (IngredientDTO ingredient : ingredientList) {
										%>
										<tr>
											<td><%=ingredient.getIngre_name()%></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="7">
												<div class="info_box null_box">
													<p class="ico_info">보유중인 품목이 없습니다</p>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

							</div>

							<div class="btn_wrap my30">
								<div class="lb"></div>
								<div class="rb">
									<button class="btn bg check_del" type="button">선택삭제</button>
									<button class="btn grn btn_modal" type="button">품목추가</button>
								</div>
							</div>
						</div>
						<div class="tabs_item" id="tab4">
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
										<col>
										<col>
										<col width="15%">
										<col width="15%">
										<col width="15%">
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
											for (IngredientDTO ingredient : ingredientList) {
										%>
										<tr>
											<td><%=ingredient.getIngre_name()%></td>
											<td><%=ingredient.getIngre_stock()%></td>
											<td><%=ingredient.getPurchased_at()%></td>
											<td><%=ingredient.getExpired_at()%></td>
										</tr>
										<%
										}
										} else {
										%>
										<tr>
											<td colspan="7">
												<div class="info_box null_box">
													<p class="ico_info">보유중인 품목이 없습니다</p>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>

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

				<p class="ico_info">상품의 유통기한이 촬영된 사진을 업로드하시면 유통기한이 자동으로 입력됩니다.</p>

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
											</select>
										</div> <input type="text" class="unit_input" name="unit_stock"
										disabled>
									</td>
									<td class="qtt_num"><input type="number" name="stock"
										value="1"></td>
									<td class="date_picker"><input type="date" id="date_buy"
										name="date_buy" class="date_format"></td>
									<td class="date_picker exp"><input type="date"
										id="date_exp" name="date_exp" class="date_format"> <input
										type="file" id="file1" class="inpFile"> <label
										for="file1" class="file_upload"><i
											class="fa-regular fa-file-image fa-xl"
											style="color: #2ec758;"></i></label></td>
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

		</section>

		<!-- 팝업창 백그라운드 -->
		<div class="modal_back"></div>

	</section>

</main>
<!-- //container -->

<%@include file="footer.jsp"%>
