<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>
	<meta name="description" content="승운서점/문제집 판매" />
	
	<!-- META -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- CSS -->
	<link href="../css/layout.css" rel="stylesheet" />
	<link href="../css/reset.css" rel="stylesheet" />
	<link href="../css/member.css" rel="stylesheet" />
	
	<!-- JS -->
	<script src="../js/jquery-3.5.1.js" type="text/javascript"></script>
	<script type="text/javascript">
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
	</script>
	
	<style>
	/* 메뉴 */
 aside { float:left; width:25%; }
 aside {text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;color:black;}
 aside ul li a:hover { background:#eee; }
 aside ul .checked{background-color:#ddd;}
 	/* //메뉴 */
 section{  float:left; width:75%; padding: 0 30px;}
	</style>
</head>
<body>

<!-- HEADER -->
<div id="header_member">
	<h1 class="logo"><a href="../main.html">승운서점/문제집 판매</a></h1>
</div><!-- //HEADER -->

<!-- CONTENTS -->
<div id="container_member">
	<!-- 타이틀 -->
	<h2>관리자</h2>
	<!-- //타이틀 -->

	<!-- 위치 네비게인션 -->
	<div class="history_menu">
		<ul>
			<li class="home"><div><a href="../main.html">HOME</a> <span> &gt; </span></div></li>
			<li><div><strong>HOST</strong><span> &gt; </span></div></li>
			<li><div><strong>ITEM_ADD</strong></div></li>
		</ul>
	</div>
	<!-- //위치 네비게인션 -->

	<!-- 본문 -->
	<div id="div_center" class="contants_area">
		
		<fieldset>
		<aside>
			<ul>
				<li class="checked"><a href="" >상품등록</a></li>
				<li><a href="">상품목록</a></li>
				<li><a href="">유저목록</a></li>
				<li><a href="">주문목록</a></li>
			</ul>
		</aside>
		
		<section>
			<div id="bookHead">
			<h1 id="bookName">프로그래머, 수학의 시대</h1>
			<span>이재현</span>
			<span>로드북</span>
			<span>2020-03-18</span>
			<hr>
		</div>
		<div id="bookBody">
			<div class="thumb"><span><a href="javascript:"><img src="./img/5/5.jpg" alt="" /></a></span></div>
			<table>
				<tr>
					<th>정가</th>
					<td>16,000원 </td>
				</tr>
				<tr>
					<th>판매가</th>
					<td>14,400원 <strong>(10%, 1600원 할인)</strong></td>
				</tr>
				<tr>
					<th>배송료</th>
					<td>신간도서 단 1권도 무료</td>
				</tr>
				<tr>
					<th>수령 예정일</th>
					<td>지금 택배로 주문하면 내일 수령</td>
				</tr>
				<tr>
					<th>쪽수</th>
					<td>248</td>
				</tr>
				<tr>
					<th>ISBN</th>
					<td>9788997924509</td>
				</tr>
				<tr>
					<th><label for="bookNum">수량</label></th>
					<td><input type="number" id="bookNum" value="1" min="0" max="10" step="1"></td>
				</tr>
				<tr>
					<td colspan="2" id="bookButton">
						<div class="btn_defualt mb30">
							<a href="intro.html" class="btn_Red">등록하기</a>
						</div>
					</td>
				</tr>
			</table>	
		</div>	
		</section>
		</fieldset>
	</div><!-- 로그인 -->
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>