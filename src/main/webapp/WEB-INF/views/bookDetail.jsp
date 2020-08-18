<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<title>승운서점</title>
	<meta name="description" content="승운서점/문제집 판매" />
	<link href="${path}/include/css/bookDetail.css" rel="stylesheet" />
	
<script type="text/javascript">
function loginCheck(){
	if(${sessionScope.id == null}){
		alert("로그인하세요");
		return false;
	}
}
function buyFunction(){
	if(sumitCheck()==false)return false;
	document.detailForm.action = "${path}/guest/buyBook";
	document.detailForm.submit();
}
function countCheck(){
	if($("#bookNum").val()>${book.getBookCount() }){
		alert("재고량보다 갯수가 많습니다");
		return false;
	}
}
function sumitCheck(){
	if(loginCheck()==false)return false;
	if(countCheck()==false)return false;
}

</script>
</head>

<body>
<div id="wrap_main">

<!-- HEADER -->
<section id="head">
<div id="header">
	<%@include file="./common/top.jsp" %>
	<%@include file="./common/GNB_menu.jsp" %>
</div>
</section><!-- 머리(head) 종료 -->

<div id="headSpace">
</div>



<div id="main_new_area" style="background:#f8f8f8">
	<div id="container_member">
		<div class="history_menu">
			<ul>
				<li class="home"><div><a href="${path }/">HOME</a> <span> &gt; </span></div></li>
				<li><div><strong>${book.getBookClassSet() }</strong> <span> &gt; </span></div></li>
				<li><div><strong>${book.getBookClassKor() }</strong></div></li>
			</ul>
		</div>
	</div>
	<div class="main_new_area">
		<div id="bookHead">
			<h1 id="bookName">${book.getBookName() }</h1>
			<span>${book.getBookWriter() }</span>
			<span>${book.getBookPublisher() }</span>
			<span>${book.getPublishDate() }</span>
			<hr>
		</div>
		<div id="bookBody">
			<form action="${path }/guest/shoppingCartPro" method="get" name="detailForm"> 
			<div class="thumb"><span><a href="#"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
			<table>
				<tr>
					<th>정가</th>
					<td>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getBookPrice()}" />
					원 
					</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" />
					원 <strong>(
					<fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" pattern=".0" />
					%, 
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getBookPrice()-book.getSale()}" />
					원 할인)</strong></td>
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
					<td>${book.getPage() }</td>
				</tr>
				<tr>
					<th>ISBN</th>
					<td>${book.getISBN() }
						<input type="hidden" name="ISBN" value="${book.getISBN() }">
					</td>
					
				</tr>
				<tr>
					<th><label for="bookNum">수량</label></th>
					<td><input type="number" id="bookNum" name="count" value="1" min="0" max="${book.getBookCount() }" step="1">
					(재고 수량 : ${book.getBookCount() })
					</td>
				</tr>
				<tr>
					<td colspan="2" id="bookButton">
						<div class="btn_defualt mb30">
							<a href="javascript:document.detailForm.submit();"class="btn_Orange" onclick="return sumitCheck();">장바구니</a>
							<a href="#" class="btn_Red" onclick="return buyFunction();">구매하기</a>
						</div>
					</td>
				</tr>
			</table>
			</form>
			
		</div>
		
	</div>
</div>






	<script type="text/javascript">
	// 새로나온 제품 탭메뉴
	function mainNewList(target_con, target_btn) {
		$(".main_new_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultnew").click();

	// 새로나온 책 탭메뉴
	function mainBookNewList(target_con, target_btn) {
		$(".new_book_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultnew_book").click();

	// 새로나온 성물 탭메뉴
	function mainScredNewList(target_con, target_btn) {
		$(".new_scred_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultnew_scred").click();
	</script>
</div><!-- container 종료 -->

<%@include file="./common/footer.jsp" %>
</body>


</html>