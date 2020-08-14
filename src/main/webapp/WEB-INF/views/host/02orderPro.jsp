<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${deleteCnt != null }">
	<c:if test="${deleteCnt ==1 }">
		<script type="text/javascript">
			alert("성공적으로 삭제되었습니다");
			window.location = document.referrer;
		</script>
	</c:if>
	
	<c:if test="${deleteCnt !=1 }">
		<script type="text/javascript">
			alert("성공적으로 삭제되었습니다");
			window.location = document.referrer;
		</script>
	</c:if>
</c:if>

<c:if test="${updateCnt != null }">
	<c:if test="${updateCnt ==1 }">
		<script type="text/javascript">
			alert("성공적으로 송장번호가 입력되었습니다");
			location.href="${path}/host/02orderList";
		</script>
	</c:if>
	<c:if test="${updateCnt !=1 }">
		<script type="text/javascript">
			alert("성공적으로 송장번호가 입력에 실패하였습니다");
			location.href="${path}/host/02orderList";
		</script>
	</c:if>
</c:if>

<c:if test="${orderedCnt != null }">
	<c:if test="${orderedCnt ==1 }">
		<script type="text/javascript">
			alert("성공적으로 주문완료로 변경되었습니다");
			location.href="${path}/host/02deliverList";
		</script>
	</c:if>
	<c:if test="${orderedCnt !=1 }">
		<script type="text/javascript">
			alert("성공적으로 주문완료로 변경실패하였습니다.");
			location.href="${path}/host/2deliverList";
		</script>
	</c:if>
</c:if>
</body>
</html>