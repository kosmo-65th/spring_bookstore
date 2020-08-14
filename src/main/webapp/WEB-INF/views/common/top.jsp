<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top</title>
<!-- META -->
	 <script type="text/javascript">
	 	function hostLogin(){
	 		var password = prompt("System Access Approach","*********");
	 		if(password !=null){
	 			location.replace("${path }/admin?password="+password);
	 			return false;}
	 		return false;
	 	}
	 	function quickSearch() {
	 		var f = document.quickForm;
	 		if( !f.search.value ) {
	 			alert("검색어를 입력하지 않았습니다");
	 			f.search.focus();
	 			return false;
	 		}
	 		f.submit();
	 		f=null;
	 	}
	 	function onChangeQuickSearchCategory(v, txt) {
	 		var f = document.quickForm;
	 		f.category.value = v;
	 		f=null;
	 		$("#quickFormCategory").parent().children("span").text(txt);
	 	}
	 	function quickSearchKeyword(keyword){
	 		document.getElementById("mainKeyword").value = keyword;
	 		quickSearch();
	 	}
	 </script>
</head>
<body>
<!-- TOP 메뉴 -->
	<div class="top_menu_area">
		<ul class="top_menu_left">
			<li><a href = "javascript:void(0)" target="_blank" onclick="return hostLogin();">관리자페이지</a></li>
		</ul>
		<ul class="top_menu">		
			<c:if test="${sessionScope.id ==null }">
				<li><a href="${path }/login" class="top_login">로그인</a></li>
				<li><a href="${path }/admit">회원가입</a></li>
			</c:if>
			<c:if test="${sessionScope.id !=null }">
				<li><a href="${path }/user/logout" class="top_login">로그아웃</a></li>
				<li><a href="${path }/guest/myPage">마이페이지</a></li>
			</c:if>
			<li><a href="${path }/guest/boardList">고객센터</a></li>
			
		</ul>
	</div>
	<!-- //TOP 메뉴 -->
	<!-- 로고 -->
	<h1 class="logo" style="z-index:999;"><a href="${path }/">로고</a></h1>
	<!-- //로고 -->

	<!-- 검색 -->
	<div class="top_search_area" style="z-index:999;">
		<!-- 일반검색 -->
		<form action ="searchList" method="get" name="quickForm">
		<input type="hidden" name="category" value=""/>
		<fieldset>
			<legend>검색</legend>
			<div class="top_search">
				<div class="curr"><span>모든매체</span>
					<ul id="quickFormCategory">
						<li><a href="javascript:void(0);" onclick="onChangeQuickSearchCategory('', '모든매체');">모든매체</a></li>
						<li><a href="javascript:void(0);" onclick="onChangeQuickSearchCategory('01', '산업공단');">산업공단</a></li>
						<li><a href="javascript:void(0);" onclick="onChangeQuickSearchCategory('02', '자격증');">자격증</a></li>
						<li><a href="javascript:void(0);" onclick="onChangeQuickSearchCategory('03', '어학');">어학</a></li>
						<li><a href="javascript:void(0);" onclick="onChangeQuickSearchCategory('04', '컴퓨터/IT');">컴퓨터/IT</a></li>
					</ul>
				</div>
				<label><input type="text" id="mainKeyword" name="search" value="" placeholder="검색어를 입력하세요"></label>
			</div>
			<div class="btn"><a href="#" onclick="quickSearch();" title="검색">검색</a></div>

			<!-- 추천키워드 -->
			<div class="top_search_word">
				<a href="javascript:void(0);" class="arrow-left">이전</a>
                <div class="search_word_box"><span>
<a href="javascript:void(0);" style="padding-left: 0;" onclick="quickSearchKeyword(this.text);">자바</a> 
<a href="javascript:void(0);" style="" onclick="quickSearchKeyword(this.text);">TOEIC</a> 
<a href="javascript:void(0);" style="" onclick="quickSearchKeyword(this.text);">한식조리기능사</a> 
<a href="javascript:void(0);" style="" onclick="quickSearchKeyword(this.text);">한국어능력시험</a> 
<a href="javascript:void(0);" style="" onclick="quickSearchKeyword(this.text);">운전면허</a> 
<a href="javascript:void(0);" style="" onclick="quickSearchKeyword(this.text);">JLPT</a> 
                </span></div>
				<a href="javascript:void(0);" class="arrow-right">다음</a>
			</div>
		</fieldset>
        </form>
        <script>
            $(document).ready(function(){/* 추천키워드 <> 이동  */
                $(".arrow-left").click(function(){
                    moveSearchWordBox('+');
                });
                $(".top_search_word>a.arrow-right").click(function(){
                    moveSearchWordBox('-');
                });
            });
            function moveSearchWordBox(signed)
            {
                var box_width = $(".search_word_box").width();
                var box_span_width = $(".search_word_box>span").width();
                if (box_span_width > box_width)
                {
                    var sleft = parseInt($(".search_word_box>span").css("left"), 10);

                    var tmp_width = sleft + box_span_width;

                    var mv = 0;
                    if (signed == '-')
                    {
                        mv = tmp_width > box_width ? (tmp_width - box_width < box_width  ? tmp_width - box_width : box_width) : 0;
                    }
                    else
                    {
                        mv = sleft < 0 ? (Math.abs(sleft) > box_span_width  ? sleft + box_span_width : Math.abs(sleft)) : 0;
                    }

                    $(".search_word_box>span").stop().animate({left: signed+"="+mv}, 500, function(){});
                }
            }
        </script>

	</div>
	<!-- //검색 -->
<!-- 오른쪽 배너 -->
<div class="top_banner_area">
 <div class="top_banner">
<div><a href="javascript:void(0)" target="_self"><img src="#" alt=""></a></div>
 </div>
</div>
<script type="text/javascript">
</script>
<!-- //오른쪽 배너 -->
</body>
</html>