<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>
	<meta name="description" content="승운서점/문제집 판매" />

<script type="text/javascript">
	$(function(){
		var id = '${idsave}';
		
		if(id !=null){
			if(id.length !=0){
				$("#idsave").prop("checked", true);
			}
		}
	});
	
	$(document).ready(function(){//관리자 로그인 자동처리
		 var hostId = "${hostLogin}";
		 var hostPassword = "${hostPassword}";
		 if(hostId=="host"){
			 $("input[name=uid]").val(hostId);
			 $("input[name=upwd]").val(hostPassword);
			 $("input[name=hidden]").val("hostLogin");
			 
			 document.loginForm.submit();
		 }
	});
</script>

</head>


<body>
<!-- HEADER -->
<div id="header_member">
	<h1 class="logo"><a href="${path }/">승운서점/문제집 판매</a></h1>
</div><!-- //HEADER -->

<!-- CONTENTS -->
<div id="container_member">
	<!-- 타이틀 -->
	<h2>로그인</h2>
	<!-- //타이틀 -->
	<!-- 위치 네비게인션 -->
	<div class="history_menu">
		<ul>
			<li class="home"><div><a href="${path }/">HOME</a> <span> &gt; </span></div></li>
			<li><div><strong>회원</strong> <span> &gt; </span></div></li>
			<li><div><strong>로그인</strong></div></li>
		</ul>
	</div>
	<!-- //위치 네비게인션 -->

	<!-- 본문 -->
	<div id="div_center" class="contants_area">
		<p class="sumbold">승운서점에 오신것을 진심으로 환영합니다.</p>

		<!-- 로그인 -->
		<fieldset>
			<legend>검색</legend>
			<div id="login_member" class="login_area" style="display:block;">
				<div class="tab_menu">
					<h3>회원 로그인</h3>
				</div>

            <form name="loginForm" method="post" action="${path }/loginPro">
            <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
            <input type="hidden" name="hidden" value="hidden">
				<div class="login_input_area">
					<label class="login_txt"><input type="text" name="uid" value="${idsave}"placeholder="아이디" required></label>
					<label class="login_txt"><input type="password" name="upwd" placeholder="비밀번호" required></label>
					<label class="login_btn"><input type="submit" value="로그인"></label>
					<div class="check_box">
						<label class="login_check"><input type="checkbox" name="idsave" id="idsave" value="Y"> <span>아이디 저장하기</span></label>
						<label class="login_check"><input type="checkbox" name="autoLogin" value="Y"> <span>자동로그인</span></label>
					</div>
				</div>
            </form>
				<div class="space_line"></div>
				<div class="btn_defualt mb30">
					<a href="admit" class="btn_Gray">회원가입</a>
					<a href="#" class="btn_Gray" onclick='javascript:window.open("rememberId.do", "remember",  "menubar=no, width=350, height=300") '>아이디 찾기</a>
					<a href="#" class="btn_Gray" onclick='javascript:window.open("rememberPwd.do", "remember",  "menubar=no, width=350, height=300")'>비밀번호 찾기</a>
				</div>
			</div>

			<!-- 비회원 로그인 -->
		</fieldset>
	</div><!-- 로그인 -->
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>