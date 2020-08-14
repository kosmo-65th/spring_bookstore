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
 section{float:left; width:75%; padding: 0 30px;}
 .table1{width:100%; margin-left:15px; list-style:none;}
 .table1 ul{list-style:none;}
 .table1 ul li{float:left; height:150px;text-align:center; padding-top:10px; }
 .table1 .table_detail_head{font-size:15px; font-weight:bold;}
 .table1 .table_detail_head .bookImg{width:20%; height:50px;  border-bottom:1px solid black; }
 .table1 .table_detail_head .bookInfo{width:35%; height:50px;  border-bottom:1px solid black; }
 .table1 .table_detail_head .bookPrice{width:15%; height:50px;  border-bottom:1px solid black;  }
 .table1 .table_detail_head .bookCount{width:10%;height:50px; border-bottom:1px solid black; }  
 .table1 .table_detail_head .btn{width:20%;height:50px; border-bottom:1px solid black; }  
 
 .table1 .table_detail .bookImg{width:20%;}
 .table1 .table_detail .bookImg img{height:120px;}
 .table1 .table_detail .bookInfo{width:35%; font-size:15px;}
 .table1 .table_detail .bookInfo strong{font-size:25px;}
 .table1 .table_detail .bookInfo span{padding:0 5px; color:#ddd;}
 .table1 .table_detail .bookPrice{width:15%; font-size:15px;}
 .table1 .table_detail .bookPrice .won{}
 .table1 .table_detail .bookPrice .dis{}
 .table1 .table_detail .bookPrice strong{color:red;font-size:10px;}
 .table1 .table_detail .bookCount{width:10%;} 
 .table1 .table_detail .btn{width:20%;} 
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
				<li><a href="./host_add.html" >상품등록</a></li>
				<li class="checked"><a href="">상품목록</a></li>
				<li><a href="./host_order.html">주문목록</a></li>
			</ul>
		</aside>
		
		<section>
			<ul class="table1">
				<li>
					<ul class="table_detail_head">
						<li class="bookImg">사진</li>
						<li class="bookInfo">책 정보</li>
						<li class="bookPrice">가격</li>
						<li class="bookCount">수량</li>
						<li class="btn">수정</li>
					</ul>
				</li>	
				<li>
					<ul class="table_detail">
						<li class="bookImg"><img src="../img/5/5.jpg"></li>
						<li class="bookInfo"><strong>수학의 시대</strong><br>
											이재현<span>|</span>로드북<span>|</span>2020-03-18<br>
											248p<span>|</span>9788997924509
											</li>
						<li class="bookPrice"><span class="won">16,000</span><br>
											→<span class="dis">14,400</span><br><strong>(10%▼)</strong></li>
						<li class="bookCount">75</li>
						<li class="btn"><a href="#" class="btn_Red">수정하기</a></li>
					</ul>
				</li>
				<li>
					<ul class="table_detail">
						<li class="bookImg"><img src="../img/5/5.jpg"></li>
						<li class="bookInfo"><strong>수학의 시대</strong><br>
											이재현<span>|</span>로드북<span>|</span>2020-03-18<br>
											248p<span>|</span>9788997924509
											</li>
						<li class="bookPrice"><span class="won">16,000</span><br>
											→<span class="dis">14,400</span><br><strong>(10%▼)</strong></li>
						<li class="bookCount">75</li>
						<li class="btn"><a href="#" class="btn_Red">수정하기</a></li>
					</ul>
				</li>
				<li>
					<ul class="table_detail">
						<li class="bookImg"><img src="../img/5/5.jpg"></li>
						<li class="bookInfo"><strong>수학의 시대</strong><br>
											이재현<span>|</span>로드북<span>|</span>2020-03-18<br>
											248p<span>|</span>9788997924509
											</li>
						<li class="bookPrice"><span class="won">16,000</span><br>
											→<span class="dis">14,400</span><br><strong>(10%▼)</strong></li>
						<li class="bookCount">75</li>
						<li class="btn"><a href="#" class="btn_Red">수정하기</a></li>
					</ul>
				</li>
				<li>
					<ul class="table_detail">
						<li class="bookImg"><img src="../img/5/5.jpg"></li>
						<li class="bookInfo"><strong>수학의 시대</strong><br>
											이재현<span>|</span>로드북<span>|</span>2020-03-18<br>
											248p<span>|</span>9788997924509
											</li>
						<li class="bookPrice"><span class="won">16,000</span><br>
											→<span class="dis">14,400</span><br><strong>(10%▼)</strong></li>
						<li class="bookCount">75</li>
						<li class="btn"><a href="#" class="btn_Red">수정하기</a></li>
					</ul>
				</li>
			</ul>	
		</section>
		
		</fieldset>
	</div><!-- 로그인 -->
</div>
<%@include file="../common/footer.jsp" %>
</body>
</html>