<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%-- 3초가 지나면 해당 url(home)으로 이동 --%>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1, ${path}">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert("${errMsg}");
	</script>
</body>
</html>