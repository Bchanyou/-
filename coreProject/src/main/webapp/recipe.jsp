<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.smhrd.recipe.model.recipeDTO"%>
<%@page import="java.util.List"%>
<%
List<recipeDTO> recipeList = (List<recipeDTO>) request.getAttribute("recipeList");
%>


<%@include file="header.jsp"%>


<!-- container -->
<main id="sub">
	<section id="container">

		<!-- Sub Visual -->
		<section id="sub_vis" class="sv03">
			<div id="sub_tit" class="w1280">
				<h2>
					<strong class="font">추천 레시피</strong>
				</h2>
				<p>유통기한이 임박한 식재료를 활용한 레시피를 추천해드립니다.</p>
			</div>
		</section>

		<!-- Sub Content -->
		<section id="content" class="my120">

			<section class="w1280">

				<section class="sub_cont" id="recipe">

					<div style="padding-left:30px">
						<p class="ico_info">유통기한이 5일 이내인 식재료를 활용한 레시피 목록입니다.</p>
					</div>

					<%
					if (recipeList == null || recipeList.isEmpty()) {
					%>
					<!-- 추천 레시피 없는 경우 -->
					<div class="bdr_wrap recipe_null">
						<div class="info_box null_box">
							<p class="ico_info">유통기한이 임박한 재료가 없습니다.</p>
						</div>
						<p>아직 등록하지 않은 재료가 있다면 추가해보세요!</p>
						<div class="btn_wrap my30 center">
							<button class="btn grn btn_modal" type="button">추가하기</button>
						</div>
					</div>
					<%
					} else {
					%>
					<div class="swp_wrap">
						<div class="swiper-button-prev swp_btn">
							<i class="fa-solid fa-chevron-left fa-2xl" style="color: #666;"></i>
						</div>
						<div class="swiper-button-next swp_btn">
							<i class="fa-solid fa-chevron-right fa-2xl" style="color: #666;"></i>
						</div>
						<div class="swiper-container swp_basic">
							<div class="swiper-wrapper">

								<%
								int count = 0;
								for (recipeDTO recipe : recipeList) {
									if (count >= 5)
										break; // 각 레시피의 상세 정보를 출력합니다.
								%>
								<div class="swiper-slide">
									<div class="img">
										<img src="<%=recipe.getRec_img_url()%>" alt="">
									</div>
									<a href="<%=recipe.getRec_url()%>" class="btn_view pa30"><span><%=recipe.getRec_name()%></span></a>
								</div>

								<%
								count++;
								}
								%>

							</div>
						</div>
					</div>
					<%
					}
					%>
				</section>

			</section>

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
											<select name="location" class="select"
												title="보관위치">
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

			<!-- 팝업창 백그라운드 -->
			<div class="modal_back"></div>

		</section>
		<!-- //Sub Content -->

	</section>

</main>
<!-- //container -->

<script type="text/javascript" src="js/ingredientAdd.js" charset="utf-8"></script>

<%@include file="footer.jsp"%>