<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="page-top">
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path }/host/03guestList" />
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원목록 조회</h1>

          <!-- DataTales Example -->
          <form action="${path }/host/03guestList" name="guestList" method="get">
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
                      <th>ID</th>
                      <th>NAME</th>
                      <th>BIRTH</th>
                      <th>GENDER</th>
                      <th>EMAIL</th>
                      <th>PHONE</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  	<c:forEach var="guest" items="${guests }">
	                    <tr>
	                      <td><a href="${path }/host/03guestEdit?id=${guest.getId() }">${guest.getId() }</a></td>
	                      <td>${guest.getName() }</td>
	                      <td>${guest.getBirthForString() }</td>
	                      <td>${guest.getGender() }</td>
	                      <td>${guest.getEmail() }</td>
	                      <td>${guest.getPhone() }</td>
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
                     <a href="${path }/host/03guestList?currentPage=${(startPage - pageBlock)>0 ? (startPage - pageBlock) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀◀] </a>
                     <a href="${path }/host/03guestList?currentPage=${(currentPage - 1)>0 ? (currentPage - 1) : 1 }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [◀] </a>
                    
                    <!-- 블록내의 페이지 번호 -->
                    <c:forEach var="i" begin="${startPage }" end="${endPage }">
                        <c:if test="${i==currentPage }">
                            <span><b>[${i }]</b></span>
                        </c:if>
                        <c:if test="${i!=currentPage }">
                            <a href="${path }/host/03guestList?currentPage=${ i}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }">[${i }]</a>
                        </c:if>
                    </c:forEach>
                    
                    <!-- 다음[▶]/마지막[▶▶] 특수문자 : 한글상태 ㅁ+한자키 -->
                    <a href="${path }/host/03guestList?currentPage=${(pageCount - currentPage-1)>0 ? (currentPage+1) : endPage }&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶] </a>
                    <a href="${path }/host/03guestList?currentPage=${(startPage +pageBlock)>pageCount ? pageCount : startPage +pageBlock}&search=${param.search }&pageSize=${(pageSize) ? pageSize : 10 }"> [▶▶] </a>
                    
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