<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${deleteCnt==1 }">
		<script type="text/javascript">
			alert("성공적으로 삭제되었습니다");
			location.href="${path}/host/";
		</script>
	</c:if>
	<c:if test="${deleteCnt !=1}">
		<script type="text/javascript">
			alert("삭제에 실패하였습니다.");
			location.href="${path}/host/";
		</script>
	</c:if> 
</body>
</html>