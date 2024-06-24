<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smhrd.ingredient.model.IngredientDTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>

<%@include file="header.jsp"%>




<!-- container -->
<main id="sub" class="container">


	<!-- Sub Visual -->
	<section id="sub_vis" class="sv02">
		<div id="sub_tit" class="w1280">
			<h2><strong class="font">캘린더</strong></h2>
			<p>유통기한이 5일 이내로 임박한 품목들을 캘린더에 일정으로 보여드립니다.</p>
		</div>
	</section>

	<!-- Sub Content -->
	<section id="content" class="my120">

		<section class="w1280">
			<div class="big_tit">
				<h3><strong>캘린더</strong></h3>
				<p>색상 범위를 클릭하시면 해당 일정에 속한 품목의 리스트를 확인하실 수 있습니다.</p>
			</div>
			<section class="sub_cont">
				<div id="calendar"></div>
			</section>
		</section>

	</section>

</main>
<!-- //container -->


<script>
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var events = [];
    var colorMap = new Map(); // JavaScript에서 사용할 색상 맵

<%
List<IngredientDTO> ingredientList = (List<IngredientDTO>) request.getAttribute("IngredientList");
if (ingredientList != null && !ingredientList.isEmpty()) {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String[] colors = {"rgba(0, 123, 255, 0.5)", "rgba(40, 167, 69, 0.5)", "rgba(255, 193, 7, 0.5)",
			"rgba(220, 53, 69, 0.5)"};
	int colorIndex = 0;
	Map<String, String> colorMapJava = new HashMap<>(); // Java에서 사용할 색상 맵

	for (IngredientDTO ingredient : ingredientList) {
		// 유통기한 5일 전 날짜 계산
		Date expiredAt = sdf.parse(ingredient.getExpired_at());
		cal.setTime(expiredAt);
		cal.add(Calendar.DATE, -5);
		String startDate = sdf.format(cal.getTime());
		String expiredAtStr = ingredient.getExpired_at();

		if (!colorMapJava.containsKey(expiredAtStr)) {
			colorMapJava.put(expiredAtStr, colors[colorIndex % colors.length]);
			colorIndex++;
		}

		String color = colorMapJava.get(expiredAtStr);%>
	                        events.push({
	                            title: "", // 기본적으로 제목을 숨김
	                            start: "<%=startDate%>",
	                            end: "<%=expiredAtStr%>",
	                            display: 'background',
	                            backgroundColor: "<%=color%>",
	                            borderColor: "<%=color%>",
	                            classNames: ['fc-daygrid-event-dot'],
	                            extendedProps: {
	                                ingreName: "<%=ingredient.getIngre_name()%>",
	                                expiredAt: "<%=expiredAtStr%>
		"
										}
									});
	<%}
}%>
	var calendar = new FullCalendar.Calendar(calendarEl, {
							timeZone : 'UTC',
							//locale : 'kor',
							initialView : 'dayGridMonth',
							headerToolbar : {
								left : 'today',
								center :'title',
								right : 'prev,next',
								
							},
							events : events,
							eventDidMount : function(info) {
								// 마우스를 올렸을 때만 제목을 보여줌
								var tooltipContent = '<ul><li>'
										+ info.event.extendedProps.ingreName
										+ '</li></ul>';
								$(info.el).tooltipster({
									content : $(tooltipContent),
									theme : 'tooltipster-light',
									delay : 100
								});
							}
						});

						calendar.render();
					});
</script>

<%@include file="footer.jsp"%>
