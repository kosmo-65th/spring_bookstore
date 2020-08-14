<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<title>승운서점</title>
	<meta name="description" content="승운서점/문제집 판매" />
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
<!-- 프로모션 리스트 -->
<div id="container" class="main_promotion_wrap" style="background: #f0f4d9;">
	<div class="main_promotion">
		<c:forEach var="book" items="${goodPriceList }">
			<div class="mp_list">
	            <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><i class="i_book"></i><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	            <div class="txt">
	                <p><a style="color:#111;" href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }
						</strong></a></p>
	                <p><strong style="color:#11;">
	                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" />
	                <span> 원</span></strong> <span style="color:#99072b;">
	                (
	                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true"  />
	                % ▼)
	                </span></p>
	            </div>
        	</div>
		</c:forEach>
        	</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('.main_promotion').slick({
		nextArrow: '<a href="javascript:;" class="btn_promotion_next"><span></span></a>',
		prevArrow: '<a href="javascript:;" class="btn_promotion_prev"><span></span></a>',
		slidesToShow: 5,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2000,
	});
});
</script>
<!-- //프로모션 -->

<!-- 상품진열  -->
<div class="main_new_area">
	<!-- 탭메뉴 -->
	<div class="main_new_tab">
		<a href="javascript:;" onclick="mainNewList('main_new_book', $(this))" id="defaultnew">인기있는 책</a>
		<a href="javascript:;" onclick="mainNewList('main_popular_book', $(this))">새로나온 책</a>
	</div>
	<!-- 탭메뉴 -->

	<!-- 인기있는책  -->
	<div id="main_new_book" class="main_new_list new_book">
		<div class="main_new_tabs">
			<a href="javascript:;" onclick="mainBookNewList('new_book_gongdan', $(this))" id="defaultnew_book">산업공단</a>
			<a href="javascript:;" onclick="mainBookNewList('new_book_license', $(this))">자격증</a>
			<a href="javascript:;" onclick="mainBookNewList('new_book_language', $(this))">어학</a>
			<a href="javascript:;" onclick="mainBookNewList('new_book_IT', $(this))">컴퓨터/IT</a>
		</div>

		<!-- 산업인력 공단 -->
		<div id="new_book_gongdan" class="new_book_list">
			<ul>
				<c:forEach var="book" items="${bestBookList01 }">
					<li>
	                    <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	                    <div class="txt">
	                        <p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }</strong></a></p>
	                        <p><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span>원</span></strong>
	                        <span style="color:#99072b;">
				                (
				                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true"/>
				                % ▼)
			                </span>
	                        </p>
	                    </div>
	                </li>
				</c:forEach>
   			</ul>
		</div>
		<!-- //인기있는 책 - 산업입인력공단 -->

		<!-- 인기있는 책 - 자격증 -->
		<div id="new_book_license" class="new_book_list">
			<ul>
                <c:forEach var="book" items="${bestBookList02 }">
					<li>
	                    <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	                    <div class="txt">
	                        <p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }</strong></a></p>
	                        <p><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span>원</span></strong>
	                        <span style="color:#99072b;">
				                (
				                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true" />
				                % ▼)
			                </span>
	                        </p>
	                    </div>
	                </li>
				</c:forEach>
   			</ul>
		</div>
		<!-- //인기있는 책 - 자격증 -->

		<!-- 인기있는 책 - 어학 -->
		<div id="new_book_language" class="new_book_list">
			<ul>
				<c:forEach var="book" items="${bestBookList03 }">
					<li>
	                    <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	                    <div class="txt">
	                        <p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }</strong></a></p>
	                        <p><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span>원</span></strong>
	                        <span style="color:#99072b;">
				                (
				                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true" />
				                % ▼)
			                </span>
	                        </p>
	                    </div>
	                </li>
				</c:forEach>
    			</ul>
		</div>
		
		<!-- 인기있는 책 - IT -->
		<div id="new_book_IT" class="new_book_list">
			<ul>
				<c:forEach var="book" items="${bestBookList04 }">
					<li>
	                    <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	                    <div class="txt">
	                        <p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }</strong></a></p>
	                        <p><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span>원</span></strong>
	                        <span style="color:#99072b;">
				                (
				                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true"/>
				                % ▼)
			                </span>
	                        </p>
	                    </div>
	                </li>
				</c:forEach>
   			</ul>
		</div>
		<!-- //인기있는책  - 더보기 -->
	</div>
	<!-- //인기있는책 -->

	<!-- 새로나온 책 -->
	<!-- <div id="main_popular_book" class="main_new_list popular_book">
		<div id="popular_book_pauline" class="popular_book_list"> -->
	<div id="main_popular_book" class="main_new_list popular_book">
	
		<div id="popular_book_pauline" class="popular_book_list">
			<ul>
               <c:forEach var="book" items="${newBookList }">
					<li>
	                    <div class="thumb"><span><a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image }${book.getBookImage() }" alt="" /></a></span></div>
	                    <div class="txt">
	                        <p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() }</strong></a></p>
	                        <p><strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span>원</span></strong>
	                        <span style="color:#99072b;">
				                (
				                <fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true" />
				                % ▼)
			                </span>
	                        </p>
	                    </div>
	                </li>
				</c:forEach>
    			</ul>
		</div>
	</div>
	<!-- //새로나온 책 -->

	<script type="text/javascript">
	// 인기있는 책목록 메뉴 4개
	function mainNewList(target_con, target_btn) {
		$(".main_new_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultnew").click();

	// 인기있는 책목록
	function mainBookNewList(target_con, target_btn) {
		$(".new_book_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultnew_book").click();

	// 새로운 책 목록
	function mainScredNewList(target_con, target_btn) {
		$(".popular_book_list").css("display","none");
		$("#"+target_con).css("display","block");

		target_btn.parent().children().removeClass("active");
		target_btn.addClass("active");
	}
	$("#defaultPopular_book").click();
	</script>
</div><!-- container 종료 -->

<%@include file="./common/footer.jsp" %><!-- footer -->

</body>


</html>