<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type ="text/javascript">
function set() {
    alert("임시 비밀번호가 이메일로 발급되었습니다.");
    self.close();
}
</script>
</head>
<body>
 <h2>비밀번호 찾기</h2>
    
<form action="rememberPwd" method="post" name="rememberform">
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
    <table>
        <c:if test="${selectCnt != 1 }">
        	<c:if test="${selectCnt == 0 }">
        		<tr>
        			<td colspan="2"> 입력하신 정보에 해당하는 id가 존재하지 않습니다.</td>
        		</tr>
        	</c:if>
        	<tr>
	            <th> 아이디 :     </th>
	            <td>
	                <input class="input" type="text" name="id" maxlength="20" style="width:150px" autofocus required>
	            </td>
	        </tr>
	        <tr>
	            <th> 이름 :     </th>
	            <td>
	                <input class="input" type="text" name="name" maxlength="20" style="width:150px" required>
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
        	<c:if test="${success ==1 }">
		        <tr>
		            <td align="center">
		               	 이메일로 임시비밀번호가 발급되었습니다.
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2">
		                <input class="inputButton" type="button" value="확인" onclick="set();">
		            </td>
		        </tr>
	        </c:if>
	        <c:if test="${success ==0 }">
	         	<tr>
		            <td align="center">
		               	 이메일로 임시비밀번호가 발급되는데 실패하였습니다. 다시 시도해주세요.
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2">
		                <input class="inputButton" type="button" value="확인" onclick="set();">
		            </td>
		        </tr>
	        </c:if>
        </c:if>
        
    </table>    
</form>
</body>
</html>