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
	<link href="./css/layout.css" rel="stylesheet" />
	<link href="./css/reset.css" rel="stylesheet" />
	<link href="./css/member.css" rel="stylesheet" />
	
	<!-- JS -->
	<script src="./js/jquery-3.5.1.js" type="text/javascript"></script>
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
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .num .date,.sub_news .hit{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
.sub_news tr.reply .title a{padding-left:16px;background:url(./img/board/ic_reply.png) 0 1px no-repeat}
	
	</style>
</head>
<body>

<!-- HEADER -->
<div id="header_member">
	<h1 class="logo"><a href="main.html">승운서점/문제집 판매</a></h1>
</div><!-- //HEADER -->

<!-- CONTENTS -->
<div id="container_member">
	<!-- 타이틀 -->
	<h2>게시판</h2>
	<!-- //타이틀 -->

	<!-- 위치 네비게인션 -->
	<div class="history_menu">
		<ul>
			<li class="home"><div><a href="main.html">HOME</a> <span> &gt; </span></div></li>
			<li><div><strong>BOARD</strong></div></li>
		</ul>
	</div>
	<!-- //위치 네비게인션 -->

	<!-- 본문 -->
	<div id="div_center" class="contants_area">
		<p class="sumbold">승운서점에 오신것을 진심으로 환영합니다.</p>

		<!-- 로그인 -->
		<fieldset>
			<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
<caption>게시판 리스트</caption>
	<colgroup>
	<col width="80">
	<col>
	<col width="110">
	<col width="100">
	<col width="80">
	</colgroup>
	<thead>
		<tr>	
		<th scope="col">글번호</th>
		<th scope="col">제목</th>
		<th scope="col">글쓴이</th>
		<th scope="col">날짜</th>
		<th scope="col">조회수</th>
		</tr>
	</thead>
		<tbody>
		<!-- 손님글 -->
		<tr>
			<td class="num">1</td>
			<td class="title">
				<a href="#">기념적인 첫 글</a>
				<img width="13" height="12" class="pic" alt="첨부이미지" src="./img/board/ic_pic.gif"> <a class="comment" href="#">[5]</a> 
				<img width="10" height="9" class="new" alt="새글" src="./img/board/ic_new.gif">
			</td>
			<td class="name">오픈축하</td>
			<td class="date">2020/06/14</td>
			<td class="hit">1234</td>
		</tr>
		<!-- 답변글 -->
		<tr class="reply">
			<td class="num"></td>
			<td class="title" style="padding-left:30px;">
				<a href="#">저희 홈페이지에 관심가져 주셔서 감사합니다.</a>
			</td>
			<td class="name">HOST</td>
			<td class="date">2020/06/14</td>
			<td class="hit">123</td>
		</tr>
<!-- tr이 제목 1줄입니다 보일 list 갯수만큼 li반복합니다.-->
</tbody>
</table>

<!-- 리스트 게시판 끝-->
			
			
		</fieldset>
	</div><!-- 로그인 -->
</div>
</body>
</html>