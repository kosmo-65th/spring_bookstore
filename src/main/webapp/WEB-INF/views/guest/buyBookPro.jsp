<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${insertCnt >=1}">
		<script type="text/javascript">
			alert("${insertCnt}개의 주문이 구매신청되었습니다.");
			window.location.href="${path}/";
		</script>
	</c:if>
	<c:if test="${insertCnt ==0}">
		<script type="text/javascript">
			alert("책 구매 신청이 실패하였습니다.");
			history.back();
		</script>
	</c:if>
</body>
</html>