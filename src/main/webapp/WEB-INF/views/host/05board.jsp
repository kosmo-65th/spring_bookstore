<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<html>
<title>게시판관리</title>
<script src="${path }/include/js/request.js"></script>
<script type="text/javascript">
	var check= true;

	function re(){
		if(check){
			$("#re_content").html("<textarea name='re_content' id='re_edit' cols='30' rows='5'>${board.getRe_content()}</textarea>");
			check=false;
		}else{
			var re = $("#re_edit").val();
			$.ajax({
	            url : '${path }/host/05boardUpdate?${_csrf.parameterName}=${_csrf.token}',
	            type : 'POST',
	            data : 'boardNum=${board.getBoardNum()}&re_content='+re,
	            success : function(data){//콜백함수
	                $("#re_content").html(data);
	                check=true;
	            },
	            error :  function(){
	                alert("에러발생");                
	    		}
			});
		}
	}
	function re_del(){
		$.ajax({
            url : '${path }/host/05boardReDel?${_csrf.parameterName}=${_csrf.token}',
            type : 'POST',
            data : 'boardNum=${board.getBoardNum()}',
            success : function(data){//콜백함수
            	if(data.trim()=='1'){
            		alert("답변이 삭제되었습니다.");
            		location.reload(true);
            	}else{
            		alert("답변 삭제에 실패하였습니다.");
            	}
            },
            error :  function(){
                alert("에러발생");                
    		}
		});
	}
	
	function del(){
		$.ajax({
            url : '${path }/host/05boardDel?${_csrf.parameterName}=${_csrf.token}',
            type : 'POST',
            data : 'boardNum=${board.getBoardNum()}' ,
            success : function(data){//콜백함수
            	if(data.trim()=='1'){
            		alert("답변이 삭제되었습니다.");
            		location.href='05boardList';
            	}else{
            		alert("답변 삭제에 실패하였습니다.");
            	}
            },
            error :  function(){
                alert("에러발생");                
    		}
		});
	}
	
	function re(){
		$("#makeRe").css("display","block");
	}
	
	function re_cancel(){
		$("#makeRe").css("display","none");
	}
	function re_make(){
		var re = $("#makeRe_content").val();
		
		$.ajax({
            url : '${path }/host/05boardRe?${_csrf.parameterName}=${_csrf.token}',
            type : 'POST',
            data : 'boardNum=${board.getBoardNum()}&re_content='+re,
            success : function(data){//콜백함수
            	if(data.trim()=='1'){
            		alert("답변이 등록되었습니다.");
            		location.href="05board.ho?boardNum=${board.getBoardNum()}"
            	}else{
            		alert("답변 등록에 실패하였습니다.");
            	}
            },
            error :  function(){
                alert("에러발생");                
    		}
		});
	}
</script>
</head>
<body id="page-top">
	
  <!-- Page Wrapper -->
 	<div id="wrapper">
 		<c:set var="where" value="${path }/host/05boardList"/>
		<%@include file="./setting/host_sidebar.jsp" %>
		<%@include file="./setting/hostHead.jsp" %>
		<!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">게시판 관리</h1>

          <!-- DataTales Example -->
         
        <div class="card shadow mb-4">
      		<div class="card-header py-3">
      		<h3 class="m-0 font-weight-bold text-primary">${board.getTitle() }</h3>
      		<p class="date">${board.getWriter() }<span> l </span>${board.getWriteDate() } <i class="view"> ${board.getViewCount() }</i></p>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt">
								<p> ${board.getContent() }</p>
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
	            <a href="#" class="btn btn-danger btn-icon-split" onclick="del();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">삭제하기</span>
	           </a>
	          <c:if test ="${board.getRe() =='F' }">
	          	
	          	 <a href="#" class="btn btn-primary btn-icon-split" onclick="re(); ">
	               <span class="icon text-white-50">
	                 <i class="fas fa-check"></i>
	               </span>
	               <span class="text">답변달기</span>
	             </a>
	          </c:if>
          </div>
        </div>
       
       
       <div id="makeRe" style="display:none">
   		<div class="card shadow mb-4">
      		<div class="card-header py-3">
      		<h3 class="m-0 font-weight-bold text-primary"><span>RE: </span>${board.getTitle() }</h3>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt" id="MakeRe_content">
								<textarea name='re_content' id='makeRe_content' cols='30' rows='5'></textarea>
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
            <a href="#" class="btn btn-danger btn-icon-split" onclick="re_cancel();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">답변취소</span>
	        </a>
            <a href="#" class="btn btn-primary btn-icon-split" onclick="re_make();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-flag"></i>
	               </span>
	               <span class="text">답변등록</span>
	        </a>
          </div>
        </div>
   </div>
        
       
        	
      <c:if test ="${board.getRe() =='T' }">
   		  <div class="card shadow mb-4">
      		<div class="card-header py-3">
      		<h3 class="m-0 font-weight-bold text-primary"><span>RE: </span>${board.getTitle() }</h3>
      		<p class="date">HOST<span> l </span>${board.getRe_writeDate() } <i class="view"> </i></p>
               </div>
   		  <div class="card-body">
           <div class="table-responsive">
            <!-- 리스트 -->
			<!-- 내용 -->
			
					<div class="contents_box con_board_view">
						<!-- 질문 -->
						<div class="qna_q">
							<div class="board_view_txt" id="re_content">
								${board.getRe_content() }
							</div>
						</div>
						<!-- //질문 -->
		<!-- //리스트 -->
              </div>
            </div>
            <a href="#" class="btn btn-danger btn-icon-split" onclick="re_del();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-trash"></i>
	               </span>
	               <span class="text">삭제하기</span>
	        </a>
            <a href="#" class="btn btn-primary btn-icon-split" onclick="re();">
	               <span class="icon text-white-50">
	                 <i class="fas fa-flag"></i>
	               </span>
	               <span class="text">수정하기</span>
	        </a>
          </div>
        </div>
       </c:if>
      <!-- End of Main Content -->
    </div>
   </div>
   
   
   
   
<!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

</body>
</html>