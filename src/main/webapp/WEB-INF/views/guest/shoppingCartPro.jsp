<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 넣기
</title>
</head>
<body>
	
	<c:if  test= "${existCheck==0 }">
		<c:if test="${updateCnt ==0 }">
			<script type="text/javascript">
				alert("장바구니 추가에 실패하였습니다.");
				history.back(); 
			</script>
		</c:if>
		<c:if test="${updateCnt !=0 }">
			<script type="text/javascript">
				alert("ISBN이 ${ISBNs}의 책이 장바구니에 추가되었습니다.");
				history.back();
			</script>
		</c:if>
	</c:if>
	<c:if test="${existCheck ==1}">
		<script type="text/javascript">
			alert("장바구니에 이미 있는 책입니다");
			history.back();
		</script>
	</c:if>
</body>
</html>