<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/host/setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#top_navi{position:absolute; width:100%; height:50px; top:0; right:0;padding-right:50px;background-color:#656565;text-align:right;z-index:1;}
</style>
<script type="text/javascript">
	function deleteMessage(idx){
		$.ajax({
            url:'${path}/host/deleteMessage?num='+idx,
            success:function(data){
                if(data == '1'){
                	var num = $('#messageCnt').text();
                	num = parseInt(num)-1;
                	$('#'+idx).html('');
                	$('#messageCnt').html(num+'+');
                }
                
            }
        })
	}
	
	function deleteAll(){
		var nums='';
		
		$('input[name="num"]').each(function(){
			nums += $(this).val()+'-';
		});
		
		$.ajax({
			url:'${path}/host/deleteMessages?nums='+nums,
            success:function(data){
                if(data != '0'){
                	$('#messageBox').html('');
                	$('#messageCnt').html('0+');
                }
            }
          
        })
	}
	
</script>
</head>
<body>
	 <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter" id="messageCnt">${messageCnt }+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  	알림창
                </h6>
                <div id="messageBox">
                <c:forEach var = "message" items="${messageList }">
                	<c:choose>
                		
                		<c:when test='${fn:contains("${message.message}", "회원가입") }'>
                <div id='${message.num }'>
                	<a class="dropdown-item d-flex align-items-center"  href="javascript:void(0)" onClick="deleteMessage(${message.num });">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-primary">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">${message.time }</div>
	                    <span class="font-weight-bold">${message.message }</span>
	                    
	                  </div>
	                  <input type="hidden" name='num' value="${message.num }">
	                </a>
	              </div>
	              		</c:when>
	              		<c:when test="${fn:contains('${message.message}', '구매') }">
	              		<div id='${message.num }'>
                	<a class="dropdown-item d-flex align-items-center"  href="javascript:void(0)" onClick="deleteMessage(${message.num });">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">${message.time }</div>
	                    <span class="font-weight-bold">${message.message }</span>
	                  </div>
	                  <input type="hidden" name='num' value="${message.num }">
	                </a>
	              </div>
	              		
	              		</c:when>
	              		<c:otherwise>
	              		<span>${fn:contains('${message.message}', "회원가입") } 회원가입</span>
	              		<span>${fn:indexOf("${message.message}", "구매") } 구매</span>
	              		<div id='${message.num }'>
                	<a class="dropdown-item d-flex align-items-center"  href="javascript:void(0)" onClick="deleteMessage(${message.num });">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">${message.time }</div>
	                    <span class="font-weight-bold">${message.message }</span>
	                  </div>
	                  <input type="hidden" name='num' value="${message.num }">
	                </a>
	              </div>
	              		</c:otherwise>
	              		
               		</c:choose>
                </c:forEach>
                </div>
                <a class="dropdown-item d-flex align-items-center" href="javascript:void(0)">
                
                
                <a class="dropdown-item text-center small text-gray-500" href="javascript:void(0)" onClick="deleteAll()">전부 삭제</a> 
              </div>
            </li>



            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">HOST</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
</body>
</html>