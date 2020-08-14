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
    opener.document.admitForm.uid.value = id;
    opener.document.admitForm.hiddenId.value = id;
    self.close();
}
</script>
 
 
</head>
<body>
    <h2>중복 확인 페이지</h2>
    
<%
    int selectCnt = (Integer)request.getAttribute("selectCnt") ;
%>
<form action="confirmId" method="post" name="confirmform" onsubmit="confirmIdCheck();">
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
<%
    //아이디 중복인 경우
    if(selectCnt==1){
%>
    <table>
        <tr>
            <th colspan="2">
                <span>${id }</span>는 사용할 수 없습니다.
            </th>
        </tr>
        <tr>
            <th> 아이디 :     </th>
            <td>
                <input class="input" type="text" name="id" maxlength="20" style="width:150px" autofocus required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="inputButton" type="submit" value="확인">
                <input class="inputButton" type="reset" value="초기화">
            </td>
        </tr>
    </table>    
<%
    }else{//아이디 중복이 아닌 경우
%>
    <table>
        <tr>
            <td align="center">
                <span>${id }</span>는 사용할 수 있습니다
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
            </td>
        </tr>
    </table>
<%
    }
%>
</form>
</body>
</html>
