<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<title>승운서점</title>
	<meta name="description" content="승운서점/문제집 판매" />
	<link href="${path}/include/css/searchList.css" rel="stylesheet" />
	<link href="${path}/include/css/bookDetail.css" rel="stylesheet" />
	
	<script type="text/javascript">
	function array(type){
		if(type=='recent'){
			document.searchForm.array.value = 'recent';
		}else if(type=='low'){
			document.searchForm.array.value = 'low';
		}else if(type=="high"){
			document.searchForm.array.value = 'high';
		}else{
			document.searchForm.array.value= 'basic';
		}
		document.searchForm.submit();
	}	
	function pageSize(idx){
		document.searchForm.pageSize.value=idx;
		document.searchForm.submit();
	}
	function pageMove(point){
		document.searchForm.currentPage.value = $(point).text();
		document.searchForm.submit();
	}
	function goFirst(){
		document.searchForm.currentPage.value = '1';
		document.searchForm.submit();
	}
	function goBackBlock(){
		if(${currentPage} - ${pageBlock} <=0){ document.searchForm.currentPage.value = '1';}
		else{document.searchForm.currentPage.value= ${currentPage} - ${pageBlock};}
		document.searchForm.submit();
	}
	function goNextBlock(){
		if(${currentPage} + ${pageBlock} >${pageCount}){ document.searchForm.currentPage.value = ${pageCount};}
		else{document.searchForm.currentPage.value= ${currentPage} + ${pageBlock};}
		document.searchForm.submit();
	}
	function goEnd(){
		document.searchForm.currentPage.value = ${pageCount};
		document.searchForm.submit();
	}
	$(document).ready(function(){
		if('${pageSize}'){
			$('select[name="pageSize"]').val('${pageSize}');
		}
	});
	//개별 장바구니
	function selectCart(idx){
		if(loginCheck()==false)return false;
		if(checkCount(idx)==false)return false;
		
		var count =$("input[name=chk_cnt]").eq(idx).val();
		var ISBN =$("input[name=ISBN]").eq(idx).val();
		
		location.href = "guest/shoppingCartPro?ISBN="+ISBN+"&count="+count;
	}
	//선택 장바구니
	function cart_multi_insert(){
		if(loginCheck()==false)return false;
		var check = true;
		
		$("input[name=check]:checked").each(function(){
			if(checkCount(this.value)==false)check= false;
		});
		if(check==false)return false;
		
		document.listBookForm.action = "guest/shoppingCartListPro";
		document.listBookForm.submit();
	}
	
	function loginCheck(){
		if(${sessionScope.id == null}){
			alert("로그인하세요");
			return false;
		}
	}
	///////////구매하기-하나
	function selectBuyOne(idx){
		if(loginCheck()==false)return false;
		if(checkCount(idx)==false)return false;
		var count =$("input[name=chk_cnt]").eq(idx).val();
		var ISBN =$("input[name=ISBN]").eq(idx).val();
		
		location.href = "guest/buyBook?ISBN="+ISBN+"&count="+count;
	};
	//선택된애 구매
	function selectBuy(){
		if(loginCheck()==false)return false;
		var check = true;
		
		$("input[name=check]:checked").each(function(){
			if(checkCount(this.value)==false)check= false;
		});
		if(check==false)return false;
		
		document.listBookForm.submit();
	}
	
	//재고량 체크 후 구매승인
	function checkCount(idx){
		var maxCount = $("input[name=max_cnt]").eq(idx).val();
		var count = $("input[name=chk_cnt]").eq(idx).val();
		var bookName = $("input[name=bookName]").eq(idx).val();
		
		if(isNaN(count)==true){//혹시 문자가 들어왔는지 체크
			alert("갯수에는 문자를 입력하실 수 없습니다");
			return false
		}
		
		if(count - maxCount>0){
			alert(bookName +"의 책의 재고량이 구매량보다 적습니다. 재고량 : "+maxCount);
			return false;
		}
	}
	
	//전체 선택
	function allCheck(){
		if($("input[name=check]").eq(0).is(":checked")){
			$("input[name=check]").each(function(){
				$(this).prop("checked",false);
			})
		}else{
			$("input[name=check]").each(function(){
				$(this).prop("checked",true);
			})
		}
	}
	</script>
	 <script type="text/javascript">
	 function gcnt_up(idx) {
		    if( typeof idx == 'undefined' ) {
		        $("input[name=chk_cnt]").val( $("input[name=chk_cnt]").val()*1 + 1 );
		    } else {
		        if (idx == '') { idx = 0; }

		        $("input[name=chk_cnt]").eq(idx).val( $("input[name=chk_cnt]").eq(idx).val()*1 + 1 );
		    }
		}
	function gcnt_up_check(idx) {
	    cnt = $("input[name=chk_cnt]").val();

	    if(idx >= cnt+1){
	    	$("input[name=chk_cnt]").val( $("input[name=chk_cnt]").val()*1 + 1 );
	    }else{
	    	alert('재고량을 초과할 수 없습니다.');
	    }
	}
	 /* 숫자 갯수 변경 */
	 function gcnt_down(idx) {
		    if( typeof idx == 'undefined' ) {
		        if( $("input[name=chk_cnt]").val()*1 > 1 ) {
		            $("input[name=chk_cnt]").val( $("input[name=chk_cnt]").val()*1 - 1 );
		        }
		    } else {
		        if (idx == '') { idx = 0; }

		        if( $("input[name=chk_cnt]").eq(idx).val()*1 > 1 ) {
		            $("input[name=chk_cnt]").eq(idx).val( $("input[name=chk_cnt]").eq(idx).val()*1 - 1 );
		        }
		    }
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

<div id="bgcolor" style="background-color:#f8f8f8">
<form action="searchList" method="get" name="searchForm">
	<input type="hidden" name="category" value="${category }">
	<input type="hidden" name="search" value="${search }">
	<input type="hidden" name="array" value="${array }">
	<input type="hidden" name="pageSize" value="${pageSize }">
	<input type="hidden" name="currentPage" value="${currentPage }">
</form>
<div id="container">
<div id="div_center" class="contants_area2" style="background-color:#fff">
		<!-- 타이틀 -->
		<div class="title_box">
			<h2><i></i>
			<c:choose>
				<c:when test="${category =='01'}"><strong>산업인력공단</strong><span> l </span></c:when>
				<c:when test="${category =='02'}"><strong>자격증</strong><span> l </span></c:when>
				<c:when test="${category =='03'}"><strong>어학</strong><span> l </span></c:when>
				<c:when test="${category =='04'}"><strong>컴퓨터/IT</strong><span> l </span></c:when>
			</c:choose>
			전체보기<em></em></h2>
			<p class="search_txt">
<span><strong>'${search }'</strong></span> 검색 결과			<strong>총 
<fmt:formatNumber type="number" maxFractionDigits="3" value="${cnt}" />
개의 상품</strong>을 찾았습니다.
		</p>
		</div>

		<!-- 텝메뉴 -->
		<!-- 정렬 메뉴 -->
		<div class="tab_menu_list ">
			<ul>
				<li><a href="#" class="" onclick="array('basic');">기본</a><span></span></li>
				<li><a href="#" class="" onclick="array('recent');">최근 등록순</a><span></span></li>
				<li><a href="#" class="" onclick="array('low');">낮은 가격순</a><span></span></li>
				<li><a href="#" class="" onclick="array('high');">높은 가격순</a><span></span></li>
			</ul>
			<label>
				<select name="pageSize" onchange="javascript:pageSize(this.value);">
					<option value="20" >20개씩 보기</option>
					<option value="40" >40개씩 보기</option>
					<option value="60" >60개씩 보기</option>
				</select>
			</label>
		</div>
 
 <form action="guest/buybookList" method="post" name="listBookForm">  
<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
		<!-- 리스트 - 리스트형 -->
		<div class="contents_box">
            <!-- pagination -->
			<div class="pagination fl">
                <a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goFirst()">&laquo;</a>
					<a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goBackBlock()">&lt;</a>
					<c:forEach var ="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i == currentPage }">
							<a href='#' class='active' onclick="pageMove(this);">${i }</a>
						</c:if>
						<c:if test="${i != currentPage }">
							<a href='#' onclick="pageMove(this);">${i }</a>
						</c:if>
					
					</c:forEach>
				<a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goNextBlock()">&gt;</a>
				<a href='javascript:void(0);' onclick="goEnd()">&raquo;</a>

			</div>
            <!-- //pagination -->
 
    <div class="clear_space"></div>

			<!-- 목록 -->
			<div class="list_area vlist ">
				<c:forEach var= "book" items="${books }" varStatus="st">
    			<!-- 물건 하나 -->
				<div class="list_box media">
					<div class="fl">
            
						<input type="checkbox" class="list_select" name="check" value="${st.index }" >
                		<input type="hidden" name="ISBN" value="${book.getISBN() }" >
                		<input type="hidden" name="bookName" value="${book.getBookName() }">
						<div class="thumb">
                            
							<a href="bookDetail?ISBN=${book.getISBN() }"><img src="${image}${book.getBookImage() }" alt=""></a>
            
						</div>
						<div class="txt">
							<p><a href="bookDetail?ISBN=${book.getISBN() }"><strong>${book.getBookName() } </strong></a></p>
							<p class="author">${book.getBookWriter() }<span> | </span>${book.getBookPublisher() }</p>	
							<p class="price"><span><del>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getBookPrice()}" />
							원</del> →</span> <strong>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" />
							<span>원</span></strong> <span>(
							<fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true" />
							% ▼)</span></p>
						</div>
					</div>
            
					<div class="list_btn_area">
                
						<div class="list_amount">
							<span>수량 : </span>
							<a href="javascript:gcnt_down(${st.index})" class="l">&minus;</a>
								<input type="text" name="chk_cnt" value="1" onkeyup="checkOnlyNumber(this, false);" onclick="checkOnlyNumber(this, false);" onblur="checkOnlyNumber(this, false);">
								<input type="hidden" name="max_cnt" value="${book.getBookCount() }">
							<a href="javascript:gcnt_up(${st.index})" class="r">&plus;</a>
						</div>
						<a href="javascript:void(0);" onclick="selectBuyOne(${st.index});" class="btn_r"><span>바로 구매하기</span></a>
						<a href="javascript:void(0);" class="btn_r2" onclick="selectCart(${st.index});"><span>장바구니 담기</span></a>
					</div>
                            
				</div>
			</c:forEach>
            <!-- //물건 하나 -->
				</div>
			</div>
			<!-- //목록 -->
    
           <!-- pagination -->
           <div class="btn_defualt mb30" style="text-align:left">
				<a href="javascript:void(0)"class="btn_White" onclick="allCheck();">전체선택</a>
			</div>
			<div id="music_hidden01" class="pagination fl">
                <a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goFirst();">&laquo;</a>
<a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goBackBlock();">&lt;</a>
<c:forEach var ="i" begin="${startPage }" end="${endPage }">
<c:if test="${i == currentPage }">
		<a href='#' class='active' onclick="pageMove(this);">${i }</a>
	</c:if>
	<c:if test="${i != currentPage }">
		<a href='#' onclick="pageMove(this);">${i }</a>
	</c:if>
</c:forEach>
<a href='javascript:void(0);' class='disabled' tabindex='-1' onclick="goNextBlock();">&gt;</a>
<a href='javascript:void(0);' onclick="goEnd();">&raquo;</a>

			</div>
            <!-- //pagination -->
    
			<!-- 상품 선택버튼 -->
			<div id="music_hidden03" class="btn_area  fr">
				<a href="javascript:void(0);" class="btn_g" onclick="cart_multi_insert('');"><i class="i_btn_list_cart"></i> 장바구니 담기</a>
				<a href="javascript:void(0);" class="btn_g" onclick="selectBuy();"><i class="i_btn_list_wish"></i> 구매하기</a>
			</div>
 </form>   
			<div class="clear_space"></div>
		</div>
	</div>
	<!-- //본문 -->
</div>
<!-- //CONTENTS -->


</div><!-- container 종료 -->

<%@include file="./common/footer.jsp" %>

</body>


</html>