<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#holder{width:300px; height:450px; border:1px solid black; margin:0 auto;}
</style>
<script type="text/javascript">
$(document).ready(function(){/* 사진 미리보기 */
	function readURL(input) {
	    if (input.files && input.files[0]) {
	    	if(!input.files[0].type.match("image.*")) {
                alert($("input[name='publishDate']").val());
	    		alert("확장자는 이미지 확장자만 가능합니다.");
                $("#fileUpload").val("");
            }else{
            	var reader = new FileReader();
     	        reader.onload = function(e) {
     	            $('#previewImg').attr('src', e.target.result);
     	        }
     	        reader.readAsDataURL(input.files[0]);
            }
	    }
	}
	$("#fileUpload").change(function() {
	    readURL(this);
	});
});
</script>
</head>
<body id="page-top">
<c:if test="${updateCnt==1 }">
	<script type="text/javascript">
		alert("새 책 등록에 성공하셨습니다.");
	</script>
</c:if>
<c:if test="${updateCnt==0 }">
	<script type="text/javascript">
		alert("새 책 등록에 실패하셨습니다.");
	</script>
</c:if>
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path }/host/addStock"/>
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">신규 재고 추가</h1>


          <!-- DataTales Example -->
          <form action="${path }/host/01addStockPro?${_csrf.parameterName}=${_csrf.token}" name="stockList" method="post" enctype="multipart/form-data">
       	 <input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
          <div class="row">
          
          <div class="col-xl-4 col-md-6 mb-4"><!-- 크기조절  -->
          	<div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">사진을 등록하세요</h6>
                </div>
                <div class="card-body">
                	<div id="holder"><img id="previewImg" width="300" height="450px"></div>
                 	<input type=file id="fileUpload" name="fileUpload">
                </div>
          	 </div>
          </div>
        
         
         <div class="col-xl-6 col-md-6 mb-4">
          <div class="card shadow mb-4">
            <div class="card-body">
                <table class="table table-bordered" width="800px" cellspacing="0">
                
                  <tbody>
				<tr>
					<th><label for="bookName"> 책 제목 : </label></th>
					<td><input type="text" size="30" name="bookName"></td>
				</tr>
				<tr>
					<th><label for="bookWriter"> 작가 : </label></th>
					<td><input type="text" size="30" name="bookWriter"></td>
				</tr>
				<tr>
					<th><label for="bookPublisher"> 출판사 : </label></th>
					<td><input type="text" size="30" name="bookPublisher"></td>
				</tr>
				<tr>
					<th><label for="publishDate"> 출판일 </label></th>
					<td><input type="date" size="30" name="publishDate"></td>
				</tr>
				<tr>
					<th><label for="bookPrice"> 정가 </label></th>
					<td><input type="number" size="30" name="bookPrice" size="30"></td>
				</tr>
				<tr>
					<th><label for="sale"> 판매가 </label></th>
					<td><input type="number" size="30" name="sale" size="30"></td>
				</tr>
				<tr>
					<th><label for="bookClass"> 분류 </label></th>
					<td>
						<select name="bookClass">
							<optgroup label="산업인력관리공단">
								<option value="01001">토목</option>
								<option value="01002">건설</option>
								<option value="01003">환경</option>
								<option value="01004">에너지</option>
								<option value="01005">전기</option>
								<option value="01006">기계</option>
								<option value="01007">산업응용</option>
								<option value="01008">위생</option>
								<option value="01009">기타</option>
							</optgroup>
							<optgroup label="자격증">
								<option value="02001">조리/미용/패션</option>
								<option value="02002">한국어능력시험</option>
								<option value="02003">한자능력검정시험</option>
								<option value="02004">공인중계사/주택관리사</option>
								<option value="02005">경제/금융/회계</option>
								<option value="02006">운전/교통</option>
							</optgroup>
							<optgroup label="어학">
								<option value="03001">TOEIC</option>
								<option value="03002">TOFEL</option>
								<option value="03003">TEPS</option>
								<option value="03004">OPIC</option>
								<option value="03005">중국어</option>
								<option value="03006">일본어</option>
								<option value="03007">기타</option>
							</optgroup>
							<optgroup label="컴퓨터/IT">
								<option value="04001">프로그래밍언어</option>
								<option value="04002">오픽스(액셀/파워포인트)</option>
								<option value="04003">웹디자인/홈페이지</option>
								<option value="04004">그래픽/멀티그래픽</option>
								<option value="04005">컴퓨터공학</option>
								<option value="04006">게임</option>
							</optgroup>
						</select>
					</td>
				</tr>
				<tr>
					<th><label for="page"> 쪽수 </label></th>
					<td><input type="text" name="page"size="30"></td>
				</tr>
				<tr>
					<th><label for="ISBN"> ISBN </label></th>
					<td><input type="text" name="ISBN"size="30"></td>
				</tr>
				<tr>
					<th><label for="bookCount">수량</label></th>
					<td><input type="number" name="bookCount" value="1" min="0" max="1000" step="1" size="20"></td>
				</tr>
				<tr>
					<td colspan="2" id="bookButton">
						<input type="submit" value="등록하기">
					</td>
				</tr>
                  </tbody>
                </table>
            </div>
          </div>
        </div>
         </div>
 		</form>
        </div>
        
        
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  

</body>
</html>