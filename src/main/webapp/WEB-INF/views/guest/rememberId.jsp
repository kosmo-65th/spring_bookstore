<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript">
function confirmIdFocus() {
    document.confirmform.id.focus();
}
function confirmIdCheck() {
	 if(!document.confirmform.id.value) {
	    alert(msg_id);
	    document.confirmform.id.focus();
	    return false;
	 }
}
function setId(id) {
    opener.document.loginForm.uid.value = id;
    self.close();
}
</script>
</head>
<body>
 <h2>아이디 찾기</h2>
    
<form action="rememberId" method="post" name="rememberform" onsubmit="confirmIdCheck();">
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
    <table>
        <c:if test="${selectCnt != 1 }">
        	<c:if test="${selectCnt == 0 }">
        		<tr>
        			<td colspan="2"> 입력하신 정보에 해당하는 id가 존재하지 않습니다.</td>
        		</tr>
        	</c:if>
	        <tr>
	            <th> 이름 :     </th>
	            <td>
	                <input class="input" type="text" name="name" maxlength="20" style="width:150px" autofocus required>
	            </td>
	        </tr>
	        <tr>
	            <th> 이메일 :     </th>
	            <td>
	                <input class="input" type="text" name="email" maxlength="60" style="width:150px" required>
	            </td>
	        </tr>
	        
	        <tr>
	            <td colspan="2">
	                <input class="inputButton" type="submit" value="확인">
	                <input class="inputButton" type="reset" value="초기화">
	            </td>
	        </tr>
        </c:if>
        <c:if test="${selectCnt==1 }">
	        <tr>
	            <td align="center">
	               	 찾으시는 id는 <span>${id }</span>입니다.
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2">
	                <input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
	            </td>
	        </tr>
        </c:if>
        
    </table>    
</form>
</body>
</html>