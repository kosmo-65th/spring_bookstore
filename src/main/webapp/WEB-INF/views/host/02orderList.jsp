<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<html>
<title>주문신청 리스트</title>
<script type="text/javascript">
function deliver(orderNum){
	var deliverNum = prompt("송장번호를 입력하세요","");
	if(deliverNum==null){return false;}
	else if(deliverNum!=""){location.href="${path}/host/02deliverPro?orderNum="+orderNum+'&deliverNum='+deliverNum;}
}
</script>
</head>
<body id="page-top">
	
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path}/host/02orderList"/>
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">주문신청 리스트</h1>

          <!-- DataTales Example -->
         
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">검색주문 ${cnt }건</h6>
              <form action="${path}/host/02orderList" name="orderList" method="get">
              <div style="text-align:right;">serach : 
              	<input type="text" name="search" value="${param.search }">
              	<input type="submit" value="검색">
              </div>
              <div style="text-lagin:left;">Show 
              	<select name="pageSize">
              		<c:forEach var="i" begin="10" end="30" step="10">
              			<option value="${i }" >${i }</option>
              		</c:forEach>
              	</select>
               entries
               <input type="submit" value="출력갯수변경">
               </div>
              </form>
            </div>
            <div class="card-body">
              <div class="table-responsive">
              <form action="${path}/host/02manyOrderCancel" method="get" name="form2">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>체크</th>
                      <th>주문번호</th>
                      <th>아이디</th>
                      <th>책ISBN</th>
                      <th>가격</th>
                      <th>갯수</th>
                      <th>총액</th>
                      <th>배송</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  	<c:forEach var="order" items="${orders }">
	                    <tr>
	                      <td><input type="checkbox" name="select" value="${order.getOrderNum() }"/></td>
	                      <td>${order.getOrderNum() }</td>
	                      <td>${order.getId() }</td>
	                      <td>${order.getISBN() }</td>
	                      <td>${order.getPrice() }</td>
	                      <td>${order.getCount() }</td>
	                      <td>${order.getTotalPrice() }</td>
	                      <td>
	                      <a href="#" class="btn btn-primary btn-icon-split" onclick="deliver(${order.getOrderNum()});">
		                    <span class="icon text-white-50">
		                      <i class="fas fa-flag"></i>
		                    </span>
                   			 <span class="text">배송하기</span>
                 		 </a>
                 		 <a href="#" class="btn btn-danger btn-icon-split" onclick="location='${path}/host/02orderCancel?orderNum=${order.getOrderNum()}'">
		                    <span class="icon text-white-50">
		                      <i class="fas fa-trash"></i>
		                    </span>
		                    <span class="text">취소하기</span>
		                  </a>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                 <a href="javascript:document.form2.submit();" class="btn btn-danger btn-icon-split" onclick="location='${path}/host/02orderCancel?orderNum=${order.getOrderNum()}'">
                   <span class="icon text-white-50">
                     <i class="fas fa-trash"></i>
                   </span>
                   <span class="text">선택주문 취소하기</span>
                 </a>
              </form>
              </div>
            </div>
          </div>
        </div>
        
        
        <table style="width:1500px" align="center">
        <tr>
            <th align="center">
                <!-- 게시글이 있으면  -->
                <c:if test="${cnt>0 }">
                    <!-- 처음[◀◀]/이전블록[◀] 특수문자 : 한글상태 ㅁ+한자키 -->
                     <a href="${path}/host/02orderList?currentPage=${(startPage - pageBlock)>0 ? (startPage - pageBlock) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀◀] </a>
                     <a href="${path}/host/02orderList?currentPage=${(currentPage - 1)>0 ? (currentPage - 1) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀] </a>
                    
                    <!-- 블록내의 페이지 번호 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <c:if test="${i==currentPage }">
                            <span><b>[${i }]</b></span>
                        </c:if>
                        <c:if test="${i!=currentPage }">
                            <a href="${path}/host/02orderList?currentPage=${ i}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }">[${i }]</a>
                        </c:if>
                    </c:forEach>
                    
                    <!-- 다음[▶]/마지막[▶▶] 특수문자 : 한글상태 ㅁ+한자키 -->
                    <a href="${path}/host/02orderList?currentPage=${(pageCount - currentPage-1)>0 ? (currentPage+1) : endPage }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶] </a>
                    <a href="${path}/host/02orderList?currentPage=${(startPage +pageBlock)>pageCount ? pageCount : startPage +pageBlock}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶▶] </a>
                    
                </c:if>
            </th>
        </tr>
    </table>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
     
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
</html>