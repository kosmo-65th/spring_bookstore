<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#holder{width:300px; height:450px; border:1px solid black; margin:0 auto;}
</style>
<script type="text/javascript">
$(document).ready(function(){/* 날짜 설정 */
	$("input:radio[name=solar]:input[value='${guest.getSolar()}']").attr('checked',true);
	$("input:radio[name=gender]:input[value='${guest.getGender()}']").attr('checked',true);
	$("input:radio[name=emailCheck]:input[value='${guest.getEmailCheck()}']").attr('checked',true);
	$("input:radio[name=smsCheck]:input[value='${guest.getSmsCheck()}']").attr('checked',true);
});
</script>
</head>
<body id="page-top">
<c:if test="${updateCnt==1 }">
	<script type="text/javascript">
		alert("회원정보 수정에 성공하셨습니다.");
	</script>
</c:if>
<c:if test="${updateCnt==0 }">
	<script type="text/javascript">
		alert("회원정보 수정에 실패하셨습니다.");
	</script>
</c:if>
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path }/host/03guestEdit"/>
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

	          <!-- Page Heading -->
	          <h1 class="h3 mb-2 text-gray-800">회원정보 열람하기</h1>
	          <c:if test="${id == null}">
		          <script type="text/javascript">
		          	var id ="";	
          			id = prompt("정보를 확인할 회원 ID을 입력하세요","id입력");
		          	location.href="${path }/host/03guestEdit?id="+id;
		          </script>
			  </c:if>
			<c:if test="${id != null}">
			
	          <!-- DataTales Example -->
	          <form action="${path }/host/03guestEditPro" name="guestInfo" method="post">
	         <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
	          <div class="row">
	         
	         <div class="col-xl-6 col-md-6 mb-4">
	          <div class="card shadow mb-4">
	            <div class="card-body">
	                <table class="table table-bordered" width="800px" cellspacing="0">
	                
	                  <tbody>
					<tr>
						<th><label for="id"> 아이디 : </label></th>
						<td colspan="2"><input type="text" size="30" name="id" value="${guest.getId() }" readonly></td>
					</tr>
					<tr>
						<th><label for="password"> 비밀번호 : </label></th>
						<td colspan="2"><input type="text" size="30" name="password" value="${guest.getPassword() }"></td>
					</tr>
					<tr>
						<th><label for="name"> 이름 : </label></th>
						<td colspan="2"><input type="text" size="30" name="name" value="${guest.getName() }"></td>
					</tr>
					<tr>
						<th><label for="jumin1"> 주민번호 </label></th>
						<td colspan="2"><input type="text" size="10" name="jumin1" value="${fn:substring(guest.getJumin(),0,6) }">
						-
						<input type="text" size="10" name="jumin2" value="${fn:substring(guest.getJumin(),6,13) }"></td>
					</tr>
					<tr>
						<th><label for="birth"> 생일 </label></th>
						<td><input type="date" name="birth" value='${guest.getBirthForString() }'/>
						</td>
						<td>
							<input type="radio" name="solar" value="P"/>양력
							<input type="radio" name="solar" value="M"/>음력
						</td>
					</tr>
					<tr>
						<th><label for="gender"> 성별 </label></th>
						<td colspan="2"><input type="radio" name="gender" value="M">남성
							<input type="radio" name="gender" value="F">여성
						</td>
					</tr>
					<tr>
						<th><label for="email1"> 이메일 </label></th>
						<td>
							<input type="text" size="15" name="email1" value="${fn:substring(guest.getEmail(), 0, fn:indexOf(guest.getEmail(),'@')) }">
							@
							<input type="text" size="15" name="email2" value="${fn:substring(guest.getEmail(), fn:indexOf(guest.getEmail(),'@')+1, fn:length(guest.getEmail())) }">
						</td>
						<td>
							<b>이메일 수신</b>
							<input type="radio" name="emailCheck" value="Y">수신
							<input type="radio" name="emailCheck" value="N">거부
						</td>
					</tr>
					<tr>
						<th><label for="phone1"> 핸드폰번호 </label></th>
						<td><input type="text" name="phone1" size="8" value="${fn:substring(guest.getPhone(),0,3)}">
						-<input type="text" name="phone2" size="8" value="${fn:substring(guest.getPhone(),4,8)}">
						-<input type="text" name="phone3" size="8" value="${fn:substring(guest.getPhone(),9,13)}">
						</td>
						<td>
							<b>SMS수신</b>
							<input type="radio" name="smsCheck" value="Y">수신
							<input type="radio" name="smsCheck" value="N">거부
						</td>
					</tr>
					<tr>
						<th><label for="address1"> 주소 </label></th>
						<td colspan="2">
						<input type="text" name="address1" size="30" value="${guest.getAddress1() }" ><br>
						<input type="text" name="address2" size="30" value="${guest.getAddress2() }" ><br>
						<input type="text" name="address3" size="30" value="${guest.getAddress3() }" >
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" value="정보 수정하기">
							<input type="button" value="회원 강제 탈퇴" onclick="window.location='${path }/host/03deleteGuestPro?id=${id}'">
						</td>
					</tr>
	                  </tbody>
	                </table>
	            </div>
	          </div>
	        </div>
	         </div>
	 		</form>
	 	  </c:if>
	        </div>
       
        
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  

</body>
</html>