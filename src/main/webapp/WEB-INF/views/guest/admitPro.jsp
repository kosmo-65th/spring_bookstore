<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>

<c:if test="${admitCnt == 1 }">
	<script type="text/javascript">
		alert("회원가입에 성공하였습니다.");
		window.location.href="${path }/main";
	</script>
</c:if>
<c:if test="${admitCnt != 1 }">
	<script type="text/javascript">
		alert("회원가입에 실패하였습니다.");
		history.back(); 
	</script>
</c:if>
