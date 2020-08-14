<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>

<c:if test="${loginCnt == 1 }">
	<script type="text/javascript">
		alert("로그인 되었습니다.");
		window.location.href="main";
	</script>
</c:if>
<c:if test="${loginCnt == 0 }">
	<script type="text/javascript">
		alert("로그인에 실패하였습니다.");
		history.back(); 
	</script>
</c:if>
<c:if test="${logout == 1 }">
	<script type="text/javascript">
		alert("로그아웃 되었습니다.");
		window.location.href="main";
	</script>
</c:if>