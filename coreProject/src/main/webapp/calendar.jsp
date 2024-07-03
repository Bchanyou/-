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

<%
List<IngredientDTO> ingredientList = (List<IngredientDTO>) request.getAttribute("ingredientList");
%>

<!-- container -->
<main id="sub" class="container">

    <!-- Sub Visual -->
    <section id="sub_vis" class="sv02">
        <div id="sub_tit" class="w1280">
            <h2>
                <strong class="font">캘린더</strong>
            </h2>
            <p>유통기한이 5일 이내로 임박한 품목들을 캘린더에 일정으로 보여드립니다.</p>
        </div>
    </section>

    <!-- Sub Content -->
    <section id="content" class="my120">
        <section class="w1280">
            <section class="sub_cont">
            	<p class="ico_info">색상 범위를 클릭하시면 해당 일정에 속한 품목의 리스트를 확인하실 수 있습니다.</p>
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
if (ingredientList != null && !ingredientList.isEmpty()) {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Calendar cal = Calendar.getInstance();
    String[] colors = {"#bfd1e5", "#ffb9ae", "#f6de88", "#dec1f1", "#a6f6aa", "#abc7fd"};
    int colorIndex = 0;
    Map<String, String> colorMapJava = new HashMap<>(); // Java에서 사용할 색상 맵

    // 유통기한별로 정렬하여 색상이 순서대로 적용되도록 보장
    ingredientList.sort((a, b) -> a.getExpired_at().compareTo(b.getExpired_at()));

    for (IngredientDTO ingredient : ingredientList) {
        // 유통기한 5일 전 날짜 계산
        Date expiredAt = sdf.parse(ingredient.getExpired_at());
        cal.setTime(expiredAt);
        cal.add(Calendar.DATE, -5);
        String startDate = sdf.format(cal.getTime());
        String expiredAtStr = ingredient.getExpired_at();

        // 색상 할당을 위한 날짜 기준으로 색상 설정
        if (!colorMapJava.containsKey(expiredAtStr)) {
            colorMapJava.put(expiredAtStr, colors[colorIndex % colors.length]);
            colorIndex++;
        }

        String color = colorMapJava.get(expiredAtStr);
%>
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
                expiredAt: "<%=expiredAtStr%>",
            }
        });
<%
    }
} else {
    System.out.println("ingredientList is empty or null");
}
%>
    var calendar = new FullCalendar.Calendar(calendarEl, {
        timeZone: 'UTC',
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'today',
            center: 'title',
            right: 'prev,next',
        },
        events: events,
        eventDidMount: function (info) {
            // 마우스를 올렸을 때만 제목을 보여줌
            var tooltipContent = '<ul class="cal_ingre_list"><li>' + info.event.extendedProps.ingreName + '</li></ul>';
            $(info.el).tooltipster({
                content: $(tooltipContent),
                theme: 'tooltipster-light',
                delay: 100,
                appendTo: 'fc-daygrid-bg-harness'
            });

            // 배경 색상에 따라 클래스를 추가하여 위치 조정.
            var color = info.event.backgroundColor;
            info.el.classList.add('fc-bg-event', color.replace('#', 'bg')); // 클래스 추가
        }
    });

    calendar.render();
});
</script>

<%@include file="footer.jsp"%>
