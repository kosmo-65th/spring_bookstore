<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gnb 메뉴</title>
<script type="text/javascript">
	function gnbFunction(category){
		document.gnbForm.category.value = category;
		document.gnbForm.submit();
	}
</script>
</head>
<body>
<!-- GNB 메뉴 -->
<form action="${path }/searchList" method="post" name="gnbForm">
	<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
	<input type="hidden" name="category" value="">
	<input type="hidden" name="search" value="">
</form>
	<nav class="gnb_area" id="navigation" tabindex="0">
		<div class="gnb">
			<ul class="depth1">
				<li><a href="javascript:void(0);" class="" onclick="gnbFunction('01')">산업입력관리공단</a>
<ul class="depth2">
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01')">토목</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01001')">건설</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01002')">환경</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01003')">에너지</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01004')">전기</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01005')">기계</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01006')">산업응용</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01007')">위생</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('01008')">기타</a></li>
</ul>
				</li>
				<li><a href="javascript:void(0);" class="" onclick="gnbFunction('02')">자격증</a>
<ul class="depth2">
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02001')">조리/미용/패션</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02002')">한국어능력시험</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02003')">한자능력검정시험</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02004')">공인중개사/주택관리사</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02005')">경제/금융/회계</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('02006')">운전/교통</a></li>
</ul>
				</li>
				<li><a href="javascript:void(0);" class="" onclick="gnbFunction('03')">어학</a>
<ul class="depth2">
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03001')">TOEIC</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03002')">TOFEL</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03003')">TEPS</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03004')">OPIC</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03005')">중국어</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03006')">일본어</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('03007')">기타</a></li>
</ul>
				</li>
				<li><a href="javascript:void(0);" class="" onclick="gnbFunction('04')">컴퓨터/IT</a>
<ul class="depth2">
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04001')">프로그래밍언어</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04002')">오피스(액셀/파워포인트)</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04003')">웹디자인/홈페이지</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04004')">그래픽/멀티그래픽</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04005')">컴퓨터공학</a></li>
<li><a href="javascript:void(0);" target="_self" onclick="gnbFunction('04006')">게임</a></li>
</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- //GNB 메뉴 -->
	
</body>
</html>