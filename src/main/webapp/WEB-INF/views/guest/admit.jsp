<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function cancel(){
		alert("회원가입 취소되었습니다.")
	}
	function view_click() {
	  	var i,p,v,obj;
	  	var args=view_click.arguments;
	  	for (i=0; i<(args.length-2); i+=3) with (document) 
	  	if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
			if (obj.style) { 
				obj=obj.style; 
				v=(v=='show')?'block':(v=='hide')?'none':v; 
			}
			obj.display=v; 
		}
	}
	function confirmId(){
	    //아이디 값 미 입력시 아이디 입력창 포커스
	    if($("input[name=uid]").val()==""){
	        alert("아이디를 입력하지 않으셨습니다");
	        $("input[name=uid]").focus();
	        return false;
	    }
	    //var id = new String($("input[name=id]").val());
	    var id = document.admitForm.uid.value;
	    //아이디 중복확인 창을 띄움
	    var url =("confirmId?id="+ id); 
	    window.open(url, "confirm",  "menubar=no, width=350, height=300");
	}
	$(document).ready(function(){
		$("input[name=uid]").keyup(function(){
			$("input[name=hiddenId]").val("0");
		})
	});
	
	</script>
	<script type="text/javascript">
	function mainCheck(){
		var pwdCheck = /^[A-Za-z0-9]{8,20}$/;
		if($("input[name=hiddenId]").val() != $("input[name=uid]").val()){
			alert("아이디 중복확인 다시하세요");
			return false;
		}else if($("input[name=hiddenId]").val().length <6){
			alert("아이디 길이가 6자 미만입니다");
			return false;
		}else if($("input[name=pwd1]").val()!=$("input[name=pwd2]").val()){
			alert("비밀번호 확인과 비밀번호가 일치하지 않습니다");
			return false;
		}else if(!pwdCheck.test($("input[name=pwd1]").val())){
			alert("비밀번호 형식이 맞지 않습니다");
			return false;
		}
		document.admitForm.submit();
	}
	</script>
</head>
<body>
<div id="header_member">
	<h1 class="logo"><a href="${path }/">승운서점/문제집 판매</a></h1>
</div><!-- //HEADER -->
<!-- HEADER -->
<div id="container_member">
	<!-- 타이틀 -->
	<h2>회원가입</h2>
	<!-- //타이틀 -->

	<!-- 위치 네비게인션 -->
	<div class="history_menu">
		<ul>
			<li class="home"><div><a href="main">HOME</a> <span> &gt; </span></div></li>
			<li><div><strong>회원</strong> <span> &gt; </span></div></li>
			<li><div><strong>회원가입</strong></div></li>
		</ul>
	</div>
	<!-- //위치 네비게인션 -->

	<!-- 본문 -->
	<div id="div_center" class="contants_area">
        <!-- 회원가입 -->
        <form class="admit" name="admitForm" action="admitPro" method="post" onsubmit="return ;">
        <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
		<fieldset>
			<legend>회원가입</legend>
			<div class="join_area">
				<!-- 기본정보 -->
				<div class="over">
					<h4 class="fl">회원 기본 정보 입력</h4>
					<p class="info_cap fr mt30"><em>*</em> 표시는 필수 항목입니다.</p>
				</div>

				<div class="member_wrap top">
					<ul class="input_box">
						<li><strong class="tit">아이디 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input">
								<input type="text" name="uid" id="uid" class="w314p" maxlength="20" required> <!-- 아이디 입력칸 -->
								<input type="hidden" name="hiddenId" id="hiddenId" value="0"> 
								<a href="javascript:confirmId();" class="btn">중복확인</a><!-- 중복확인 버튼 -->
								</label>
								<p class="cap left">* 아이디는 최소 6자 이상으로 해주세요.</p>
							</div>
						</li>
						
						<li><strong class="tit">비밀번호 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="password" name="pwd1" value="" class="w400p" maxlength="20" required></label>
								<p class="cap left">* 비밀번호는 최소 8자 이상으로 영문, 숫자 포함 해주세요.</p>
							</div>
						</li>
						<li><strong class="tit">비밀번호 확인 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="password" name="pwd2" value="" class="w400p" maxlength="20" required></label>
							</div>
						</li>
						<li><strong class="tit">이름 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="text" name="uname" id="uname" class="w400p" maxlength="20" required></label>
							</div>
						</li>
						<li><strong class="tit">주민등록번호 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="jumin1" class="w124p" maxlength="6" required></label>
								-
								<label class="i_input"><input type="password" name="jumin2"  class="w124p" maxlength="7" required></label>
							</div>
						</li>

						
						<li><strong class="tit">생년월일 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_radio"><input name="birthType" type="radio" value="P" checked="checked"> <span>양력</span></label>
								<label class="i_radio ml10"><input name="birthType" type="radio" value="M" > <span>음력</span></label>
								<label class="i_select ml10">
									<select id="select02" name="birthYear">
<% Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
for(int i = year; i>=1900; i--){
%>
	<option value="<%=i %>"><%=i %></option>
<%	
}
%>
                                        									</select>
								</label>
								<span>년</span>
								<label class="i_select">
									<select id="select03" name="birthMonth" class="w60p">
									<c:forEach var="i" begin="1" end="12">
										<c:if test="${i<10}">
											<option value="0${i }">0${i }</option>
										</c:if>
										<c:if test="${i>=10 }">
											<option value="${i }">${i }</option>
										</c:if>
									</c:forEach>
                                        									</select>
								</label>
								<span>월</span>
								<label class="i_select">
									<select id="select04" name="birthDate" class="w60p">
									<c:forEach var="i" begin="1" end="31">
										<c:if test="${i<10}">
											<option value="0${i }">0${i }</option>
										</c:if>
										<c:if test="${i>=10 }">
											<option value="${i }">${i }</option>
										</c:if>
									</c:forEach>
									</select>
								</label>
								<span>일</span>
							</div>
						</li>
						<li><strong class="tit">성별 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_radio"><input name="sex" id="M" type="radio" value="M" required> <span>남</span></label>
								<label class="i_radio"><input name="sex" id="F" type="radio" value="F"> <span>여</span></label>
							</div>
						</li>
						<li><strong class="tit">이메일<em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="email1" id="email1" class="w124p" maxlength="20" required></label>
								<span>@</span>
								<label class="i_input"><input type="text" name="email2" id="email2" class="w124p" maxlength="20"></label>
								<label class="i_select">
									<select id="select05" name="email3" class="w128p">
										<option value="" selected="selected"> 직접입력 </option>
										<option value="naver.com"> 네이버 </option>
										<option value="nate.com"> 네이트 </option>
										<option value="hanmail.net"> 다음(한)메일 </option>
										<option value="yahoo.co.kr"> 야후 </option>
										<option value="gmail.com"> Gmail </option>
									</select>
								</label>
								<br>
								<p class="cap left block">* ‘비밀번호’를 찾을 경우 이메일로 임시 비밀번호가 발송되므로 정확히 입력해 주십시오.</p>
							</div>
						</li>
						<li><strong class="tit">휴대전화 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="handphone1" maxlength="3" class="w96p" required></label>
								<span>-</span>
								<label class="i_input"><input type="text" name="handphone2" maxlength="4" class="w96p"></label>
								<span>-</span>
								<label class="i_input"><input type="text" name="handphone3" maxlength="4" class="w96p"></label>
							</div>
						</li>
						<li><strong class="tit">메일 수신 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_radio"><input name="mailAgree" type="radio" value="Y" checked="checked" required> <span>예</span></label>
								<label class="i_radio ml10"><input name="mailAgree" type="radio" value="N"> <span>아니오</span></label>
							</div>
						</li>
						<li><strong class="tit">SMS 문자 수신 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_radio"><input name="smsAgree" type="radio" value="Y" checked="checked" required> <span>예</span></label>
								<label class="i_radio ml10"><input name="smsAgree" type="radio" value="N"> <span>아니오</span></label>
							</div>
						</li>
						
											<li><strong class="tit">주소(도로명주소) <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="text" name="homezip1" id="homezip1" class="w124p" readonly required> <a href="javascript:;" onclick="daumAddress();" class="btn">우편번호 찾기</a></label>
								<label class="i_input"><input type="text" name="homeAddr1" id="homeAddr1" readonly required></label>
								<label class="i_input"><input type="text" name="homeAddr2" id="homeAddr2" required></label>
							</div>

						</li>
					</ul>
				</div>
				<!-- //기본정보 -->
			</div>

			<div class="btn_defualt">
				<a href="main.do" class="btn_Gray" onclick = "cancel();">취소</a>
				<a href="#" class="btn_Red" onclick="return mainCheck();">회원가입</a>
			</div>

	</fieldset>
		</form>
		<!-- //회원가입 -->
	</div>
	<!-- //본문 -->
</div>
<!-- //CONTENTS -->
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
$("#select05").change(function(){//이메일 선택지 골랐으면 내용 못바꾸게
	$("#email2").val($("#select05").val()); 
	if($("#select05").val()){
		$("#email2").attr("readonly","true");
	}else{
		$("#email2").removeAttr("readonly");
	}
});

$("input[name=jumin1]").keyup(function(){//주번 앞번호 치면 자동으로 생년월일 들어감
	if($(this).val().length==6){
		var jumin = $(this).val();
		var year = jumin.substring(0,2);
		var month = jumin.substring(2,4);
		var day = jumin.substring(4,6);
		
		if(year<40){
			year = "20"+year;
		}else{
			year = "19"+year;
		}
		
		if(month<10){
			month="0"+month.substring(1);
		}
		
		$("#select02").val(year);
		$("#select03").val(month);
		$("#select04").val(day);
	}
});
$("input[name=jumin2]").keyup(function(){//주번 앞번호 치면 자동으로 성별 들어감
	if($(this).val().length>=7){
		var gender=$(this).val().substring(0,1);
		if(gender==1||gender==3){
			$("#M").attr("checked","true");
		}else{
			$("#F").attr("checked","true");
		}
	}
});


function daumAddress(){//우편번호 찾기
	 new daum.Postcode({
		oncomplete: function(data) {
	        var roadAddr = data.roadAddress; // 도로명 주소 변수
	        // 우편번호와 주소 정보를 해당 필드에 넣는다.
	        document.getElementById('homezip1').value = data.zonecode;
	        document.getElementById("homeAddr1").value = roadAddr;
	        document.getElementById("homeAddr2").focus();
	    }
	}).open();
}
</script>	
	
</body>
</html>