<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./setting/hostSetting.jsp" %>
<html>
<script type="text/javascript">
$(document).ready(function(){
	if('${param.pageSize}'){
		$('select[name="pageSize"]').val('${param.pageSize}');
	}
});
$(document).ready(function(){
	$(".count").each(function(){
		if($(this).text()==0){
			$(this).css("color","#e74a3b");//빨간색
			$(this).siblings().css("color","#e74a3b");
		}else if($(this).text()<10){
			$(this).css("color","#f6c23e");//노란색
			$(this).siblings().css("color","#f6c23e");
		}else if($(this).text()<30){
			$(this).css("color","#36b9cc");//하늘색
			$(this).siblings().css("color","#36b9cc");
		}else{
			$(this).css("color","#1cc88a");//초록색
			$(this).siblings().css("color","#1cc88a");
		}
	})
	
});


</script>
<title>host - main</title>
</head>
<body id="page-top">
	
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path }/host/01stockList"/>
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">재고도서조회</h1>

          <!-- DataTales Example -->
          <form action="${path }/host/01stockList" name="stockList" method="get">
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">검색도서 ${cnt }건</h6>
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
              
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>ISBN</th>
                      <th>책이름</th>
                      <th>글쓴이</th>
                      <th>출판사</th>
                      <th>분류</th>
                      <th>책가격</th>
                      <th>판매가격</th>
                      <th>쪽수</th>
                      <th>재고량</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  	<c:forEach var="book" items="${books }">
	                    <tr>
	                      <td><a href="${path }/host/01editStock?ISBN=${book.getISBN() }">${book.getISBN() }</a></td>
	                      <td>${book.getBookName() }</td>
	                      <td>${book.getBookWriter() }</td>
	                      <td>${book.getBookPublisher() }</td>
	                      <td>${book.getBookClass() }</td>
	                      <td>${book.getBookPrice() }</td>
	                      <td>${book.getSale() }</td>
	                      <td>${book.getPage() }</td>
	                      <td class="count">${book.getBookCount() }</td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
 		</form>
        </div>
        
        
        <table style="width:1500px" align="center">
        <tr>
            <th align="center">
                <!-- 게시글이 있으면  -->
                <c:if test="${cnt>0 }">
                    <!-- 처음[◀◀]/이전블록[◀] 특수문자 : 한글상태 ㅁ+한자키 -->
                     <a href="${path }/host/01stockList?currentPage=${(startPage - pageBlock)>0 ? (startPage - pageBlock) : 1 }&search=${param.search }&pageSize=${(pageSize!=10) ? pageSize : 10 }"> [◀◀] </a>
                     <a href="${path }/host/01stockList?currentPage=${(currentPage - 1)>0 ? (currentPage - 1) : 1 }&search=${param.search }&pageSize=${(pageSize!=10) ? pageSize : 10 }"> [◀] </a>
                    
                    <!-- 블록내의 페이지 번호 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <c:if test="${i==currentPage }">
                            <span><b>[${i }]</b></span>
                        </c:if>
                        <c:if test="${i!=currentPage }">
                            <a href="${path }/host/01stockList?currentPage=${ i}&search=${param.search }&pageSize=${(pageSize!=10) ? pageSize : 10 }">[${i }]</a>
                        </c:if>
                    </c:forEach>
                    
                    <!-- 다음[▶]/마지막[▶▶] 특수문자 : 한글상태 ㅁ+한자키 -->
                    <a href="${path }/host/01stockList?currentPage=${(pageCount - currentPage-1)>0 ? (currentPage+1) : endPage }&search=${param.search }&pageSize=${(pageSize!=10) ? pageSize : 10 }"> [▶] </a>
                    <a href="${path }/host/01stockList?currentPage=${(startPage +pageBlock)>pageCount ? pageCount : startPage +pageBlock}&search=${param.search }&pageSize=${(pageSize!=10) ? pageSize : 10 }"> [▶▶] </a>
                    
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