<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="resources/styles.css">
    <link href='https://unpkg.com/@fullcalendar/core@5.10.1/main.min.css' rel='stylesheet' />
    <link href='https://unpkg.com/@fullcalendar/daygrid@5.10.1/main.min.css' rel='stylesheet' />
    <script src='https://unpkg.com/@fullcalendar/core@5.10.1/main.min.js'></script>
    <script src='https://unpkg.com/@fullcalendar/daygrid@5.10.1/main.min.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tooltipster/4.2.8/css/tooltipster.bundle.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tooltipster/4.2.8/js/tooltipster.bundle.min.js"></script>
</head>
<body>
    <h1>Dashboard</h1>
    <form action="CalendarServlet" method="get">
        <input type="hidden" name="mem_id" value="<%= request.getSession().getAttribute("mem_id") %>">
        <button type="submit">Show Calendar</button>
    </form>
</body>
</html>
