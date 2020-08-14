<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>   
<!doctype html>
<html lang="ko">
<head>
	<title>승운서점</title>
	<meta name="description" content="승운서점/문제집 판매" />
	
	<!-- META -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${path}/include/css/bookDetail.css" rel="stylesheet" />
	<link href="${path}/include/css/myPage.css" rel="stylesheet" />
	
	<script type="text/javascript">
	function allCheck(){
		$("input[name=select]").each(function(){
			$(this).attr("checked","true");
		})
	}
	function countCheck(){
		var check = true;
		$("input[name=select]:checked").each(function(){
			var idx = $(this).val();
			
			var max = $("input[name=max_cnt]").eq(idx).val();
			var count = $("input[name=count]").eq(idx).val();
			var bookName = $("input[name=bookName]").eq(idx).val();
			
			if(isNaN(count)==true){
				alert("갯수에는 문자를 입력하실 수 없습니다");
				check=false;
				return false;
			}
			if(max-count<0){
				alert(bookName+"의 주문량이 재고량보다 많습니다"+"\n재고량 :"+max);
				check=false;
				return false;
			}
		});
		
		if(check==false)return false;
	}
	</script>
	
	<script type="text/javascript">//cnk_cnt > count로 변경
	 function gcnt_up(idx) {
		    if( typeof idx == 'undefined' ) {
		        $("input[name=count]").val( $("input[name=count]").val()*1 + 1 );
		    } else {
		        if (idx == '') { idx = 0; }

		        $("input[name=count]").eq(idx).val( $("input[name=count]").eq(idx).val()*1 + 1 );
		    }
		}
	function gcnt_up_check(idx) {
	    cnt = $("input[name=count]").val();

	    if(idx >= cnt+1){
	    	$("input[name=count]").val( $("input[name=count]").val()*1 + 1 );
	    }else{
	    	alert('재고량을 초과할 수 없습니다.');
	    }
	}
	 /* 숫자 갯수 변경 */
	 function gcnt_down(idx) {
		    if( typeof idx == 'undefined' ) {
		        if( $("input[name=count]").val()*1 > 1 ) {
		            $("input[name=count]").val( $("input[name=count]").val()*1 - 1 );
		        }
		    } else {
		        if (idx == '') { idx = 0; }

		        if( $("input[name=count]").eq(idx).val()*1 > 1 ) {
		            $("input[name=count]").eq(idx).val( $("input[name=count]").eq(idx).val()*1 - 1 );
		        }
		    }
		}
	 </script>
	<style>
	.cnt{width:50px; height:30px; margin:0 23px 0 0; border:1px solid #d0d0d0; text-align:center; font-size:14px; font-weight:600;}
	.list_amount a { text-decoration:none;}
	.list_amount {position:relative; width:100%; height:30px; margin:0; text-align:right;}
	.list_amount span {position:absolute; top:3px; left:2px; color:#555;}
	.list_amount input {width:30px; height:30px; margin:0 23px 0 0; border:1px solid #d0d0d0; text-align:center; font-size:14px; font-weight:600;}
	.list_area.vlist .media .list_btn_area .list_amount span {top:1px;}
	.list_amount .l {position:absolute; top:0; right:52px; width:24px; height:30px; margin:0; padding:0; border:1px solid #d0d0d0; -moz-border-radius:3px 0 0 3px; -khtml-border-radius:3px 0 0 3px; -webkit-border-radius:3px 0 0 3px; border-radius:3px 0 0 3px; font-size:18px; font-weight:900; line-height:160%; color:#a7a7a7;}
	.list_amount .r {position:absolute; top:0; right:0; width:24px; height:30px; margin:0; padding:0; border:1px solid #d0d0d0; -moz-border-radius:0 3px 3px 0; -khtml-border-radius:0 3px 3px 0; -webkit-border-radius:0 3px 3px 0; border-radius:0 3px 3px 0; font-size:18px; font-weight:900; line-height:160%; color:#a7a7a7;}
	.list_amount a:hover {background:#f9f9f9; border:1px solid #aaa; color:#000;}
	.list_area.vlist .media .list_btn_area .list_amount {height:26px; margin:3px 0 0;}
	.list_area.vlist .media .list_btn_area .list_amount input {height:26px;}
	.list_area.vlist .media .list_btn_area .list_amount .l {height:26px; line-height:150%;}
	.list_area.vlist .media .list_btn_area .list_amount .r {height:26px; line-height:130%;}
	</style>
	
</head>

<body>
<div id="wrap_main">

<!-- HEADER -->
<section id="head">
<div id="header">
<%@include file="../common/top.jsp" %>
<%@include file="../common/GNB_menu.jsp" %>

</div>
</section><!-- 머리(head) 종료 -->

<div id="headSpace">
</div>



<div id="main_new_area" style="background:#f8f8f8">
	
<!-- CONTENTS -->
<div id="container" class="ssize">
	<!-- LNB -->
	<div id="lnb_area">
		<h2><a href="javascript::">마이페이지</a></h2>
		<span><strong id="userID">${id }</strong> 님의 마이페이지 화면입니다.</span>
	</div>
	<!-- LNB -->
	
	<!-- 본문 -->
	<div id="div_center" class="contants_area mypage">
		<!-- 기본정보 -->
		<div class="member_info_box" >
			<p class="profile"><i class="bronze"></i><p>
		</div>
		<!-- //기본정보 -->

		<!-- 최근주문내역 -->
		<h3>최근 주문내역 &nbsp;&nbsp;<small>${orderListCnt }건</small></h3>
		<div class="contents_box">
			<table width="100%" cellpadding="0" cellspacing="0" class="cart_list">
				<colgroup>
					<col width="13%">
					<col width="">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>날짜</th>
						<th>상품정보</th>
						<th>주문금액</th>
						<th>주문상태</th>
					</tr>
					
				</thead>
				<tbody>
					<c:forEach var="order" items="${orderList }">
					<tr>
						<td>${order.orderDate }</td>
						<td class="bookInfo">
							<img src="${image }${order.bookImage }">
							<span class="bookTitle">${order.bookName }</span><br>
							<span class="bookex">${order.bookWriter } | ${order.bookPublisher }   </span>
						</td>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.price * order.count}" /></td>
						<td>${order.status_kor }</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<p class="more"><a href="./intro.html">더보기</a> <span>&gt;</span></p>
		</div>
		<!-- //최근주문내역 -->

		

		<!-- 장바구니 및 보관함 -->
		<h3>장바구니 내역&nbsp;&nbsp;<small>${shoppingCartCnt }건</small></h3>

		<div class="contents_box no_bd">
			<div id="my_submain_cart" class="submain_tab_list submain">
			<form action="${path }/guest/buyBookForCart" method="post" name="shoppingCartForm">
			<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
				<table width="100%" cellpadding="0" cellspacing="0" class="cart_list">
					<colgroup>
						<col width="10%">
						<col width="60%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>체크</th>
							<th>상품명</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
					
						<c:if test="${shoppingCartCnt != 0 }">					
							<c:forEach var="order" items="${shoppingCart }" varStatus="st">
								<tr>	
									<td>
										<input type="checkbox" name="select" value="${st.index }"/>
										<input type="hidden" name="ISBN" value="${order.ISBN }">
									</td>
									<td class="bookInfo">
										<img src="${image }${order.getBookImage() }">
										<span class="bookTitle">${order.getBookName() }</span><br>
										<input type="hidden" name="bookName" value="${order.getBookName() }">
										<span class="bookex">${order.getBookWriter() } | ${order.getBookPublisher() }   </span>
									</td>
									<td>
										<div class="list_amount">
											<a href="javascript:gcnt_down(${st.index})" class="l">&minus;</a>
												<input type="text" name="count" value="${order.getCount() }" onkeyup="checkOnlyNumber(this, false);" onclick="checkOnlyNumber(this, false);" onblur="checkOnlyNumber(this, false);">
												<input type="hidden" name="max_cnt" value="${order.getMaxCount() }">
											<a href="javascript:gcnt_up(${st.index})" class="r">&plus;</a>
										</div>
									</td>
									<td>${order.price }</td>
								</tr>
							</c:forEach>
							<td colspan="2" >
								<div class="btn_defualt mb30" style="text-align:left">
									<a href="javascript:void(0)"class="btn_White" onclick="allCheck();">전체선택</a>
								</div>
							</td>
							<td></td>
							<td>
								<div class="btn_defualt mb30">
									<a href="javascript:document.shoppingCartForm.submit();" class="btn_Red" onClick="return countCheck();"> 선택 구매하기</a>
								</div>
							</td>
						</c:if>
						<c:if test="${shoppingCartCnt ==0 }">
							<tr>
								<td class="no_data" colspan="4">장바구니에 담긴 상품이 없습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form>
			</div>

			
		</div>


		<!-- 나의 문의 내역 -->
		<h3>나의 문의 내역</h3>
		<div class="contents_box">
			<table width="100%" cellpadding="0" cellspacing="0" class="cart_list">
				<colgroup>
					<col width="10%">
					<col width="60%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="no_data" colspan="4">문의내역이 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<p class="more"><a href="./intro.html">더보기</a> <span>&gt;</span></p>
		</div>

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


<%@include file="../common/footer.jsp" %>
</body>


</html>