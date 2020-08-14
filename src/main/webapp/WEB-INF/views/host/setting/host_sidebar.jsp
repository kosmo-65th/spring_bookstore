<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>side-bar</title>
<style>
	#sidebar{postion:fixed; float:hidden; width:280px; height:100%; background-color:#afafaf;z-index:999;}
	ul, li{list-style:none;}
</style>
<script type="text/javascript">
$(document).ready(function(){
	if($("a[href='${where}']").parents("div").parents("div").attr("class")=="collapse"){
		$("a[href='${where}']").attr("class","collapse-item active");
		$("a[href='${where}']").parents("div").parents("div").attr("class","collapse show");
		$("a[href='${where}']").parents("div").parents("div").parents("li").attr("class","nav-item active");
	}else if($("a[href='${where}']").parents("li")!=null){
		$("a[href='${where}']").parents("li").attr("class","nav-item active");
	}
});
</script>
</head>
<body>
	<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${path }/host">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">ㅅㅇ 서점</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>재고관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">재고관리:</h6>
            <a class="collapse-item" href="${path }/host/01stockList">재고도서조회</a>
            <a class="collapse-item" href="${path }/host/01addStock">도서추가</a>
            <a class="collapse-item" href="${path }/host/01editStock">도서수정</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>거래관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">거래관리:</h6>
            <a class="collapse-item" href="${path }/host/02orderList">구매 요청 목록보기</a>
            <a class="collapse-item" href="${path }/host/02deliverList">배송중 목록보기</a>
            <a class="collapse-item" href="${path }/host/02orderedList">구매완료 목록보기</a>
            <a class="collapse-item" href="${path }/host/02refundList">환불 요청 목록보기</a>
          </div>
        </div>
      </li>
      
       <!-- Nav Item - Charts -->
        <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>회원관리</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">회원관리:</h6>
            <a class="collapse-item" href="${path }/host/03guestList">회원 목록보기</a>
            <a class="collapse-item" href="${path }/host/03guestEdit">회원 상세보기</a>
          </div>
        </div>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
   		     기타
      </div>

	<!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="${path }/host/04result">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>결산</span></a>
      </li>
      
       <li class="nav-item">
        <a class="nav-link" href="${path }/host/05boardList">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>게시판</span></a>
      </li>
      
    </ul>
    <!-- End of Sidebar -->
</body>
</html>