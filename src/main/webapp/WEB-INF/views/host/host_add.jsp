<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting/hostSetting.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>
	
	<style>
	/* 메뉴 */
 aside { float:left; width:25%; }
 aside {text-align:center; margin-bottom:10px; }
 aside ul li a { display:block; width:100%; padding:10px 0;color:black;}
 aside ul li a:hover { background:#eee; }
 aside ul .checked{background-color:#ddd;}
 	/* //메뉴 */
 section{float:left; width:75%; padding: 0 30px;}
 .photo{float:left; width:300px; height:480px; align:center;}
 #holder{width:300px; height:450px; border:1px solid black; margin:0 auto;}
 
 #bookBody table tr td{padding:5px 0 5px 15px;}
	</style>
</head>
<body>
<%@ include file="setting/hostHead.jsp" %>


<!-- CONTENTS -->
<div id="host_container">
	<div class="head">
		<!-- 타이틀 -->
		<h2>관리자</h2>
		<!-- //타이틀 -->
	
		<!-- 위치 네비게인션 -->
		<div class="history_menu">
			<ul>
				<li class="home"><div><a href="../main.html">HOME</a> <span> &gt; </span></div></li>
				<li><div><strong>HOST</strong><span> &gt; </span></div></li>
				<li><div><strong>ITEM_ADD</strong></div></li>
			</ul>
		</div>
		<!-- //위치 네비게인션 -->
	</div>
	<!-- 본문 -->
	<div id="div_center" class="contants_area">
		
		<fieldset>
		<aside>
			<ul>
				<li class="checked"><a href="" >상품등록</a></li>
				<li><a href="./host_list.html">상품목록</a></li>
				<li><a href="./host_order.html">주문목록</a></li>
			</ul>
		</aside>
		
		<section>
			<div class="photo">
				<div id="holder">사진을 등록하세요</div>
				<p><input type=file id="fileUpload"></p>
			</div>
<script>/* 이미지 넣으면 뜨게하기 */
	var upload = document.getElementById('fileUpload'),
	    holder = document.getElementById('holder'),
	    state = document.getElementById('status');

	upload.onchange = function () {
	  var file = upload.files[0],
	      reader = new FileReader();
	  reader.onload = function (event) {
	    var img = new Image();
	    img.src = event.target.result;
	    // note: no onload required since we've got the dataurl...I think! :)
	    img.width = 300;/* 그림크기 조정 */
	    holder.innerHTML = '';
	    holder.appendChild(img);
	  };
	  reader.readAsDataURL(file);
		alert( reader.readAsDataURL(file));
	  return false;
	};
</script>
		<div id="bookBody">
			<table>
				<tr>
					<th><label for="title"> 책 제목 : </label></th>
					<td><input type="text" size="30" id="title"></td>
				</tr>
				<tr>
					<th><label for="writer"> 작가 : </label></th>
					<td><input type="text" size="30" id="writer"></td>
				</tr>
				<tr>
					<th><label for="publiser"> 출판사 : </label></th>
					<td><input type="text" size="30" id="publiser"></td>
				</tr>
				<tr>
					<th><label for="date"> 출판일 </label></th>
					<td><input type="date" size="30" id="date"></td>
				</tr>
				<tr>
					<th><label for="price"> 정가 </label></th>
					<td><input type="text" size="30" id="price"></td>
				</tr>
				<tr>
					<th><label for="discount"> 할인율 </label></th>
					<td><input type="number" id="discount" size="30" min="0" max="30" value="0"></td>
				</tr>
				<tr>
					<th><label for="sort"> 분류 </label></th>
					<td>
						<select name="sort">
							<optgroup label="산업인력관리공단">
								<option value="01001">토목</option>
								<option value="01002">건설</option>
								<option value="01003">환경</option>
								<option value="01004">에너지</option>
								<option value="">전기</option>
								<option value="mech">기계</option>
								<option value="san">산업응용</option>
								<option value="wee">위생</option>
								<option value="git">기타</option>
							</optgroup>
							<optgroup label="자격증">
								<option value="jori">조리/미용/패션</option>
								<option value="kor">한국어능력시험</option>
								<option value="hanja">한자능력검정시험</option>
								<option value="gongin">공인중계사/주택관리사</option>
								<option value="finance">경제/금융/회계</option>
								<option value="drive">운전/교통</option>
							</optgroup>
							<optgroup label="어학">
								<option value="TOEIC">TOEIC</option>
								<option value="TOFEL">TOFEL</option>
								<option value="TEPS">TEPS</option>
								<option value="OPIC">OPIC</option>
								<option value="chinese">중국어</option>
								<option value="jap">일본어</option>
								<option value="git_lang">기타</option>
							</optgroup>
							<optgroup label="컴퓨터/IT">
								<option value="programming">프로그래밍언어</option>
								<option value="excel">오픽스(액셀/파워포인트)</option>
								<option value="web">웹디자인/홈페이지</option>
								<option value="graphic">그래픽/멀티그래픽</option>
								<option value="computer">컴퓨터공학</option>
								<option value="game">게임</option>
							</optgroup>
						</select>
					
					</td>
				</tr>
				<tr>
					<th><label for="page"> 쪽수 </label></th>
					<td><input type="text" id="page"size="30"></td>
				</tr>
				<tr>
					<th><label for="ISBN"> ISBN </label></th>
					<td><input type="text" id="ISBN"size="30"></td>
				</tr>
				<tr>
					<th><label for="bookNum">수량</label></th>
					<td><input type="number" id="bookNum" value="1" min="0" max="100" step="1"></td>
				</tr>
				<tr>
					<td colspan="2" id="bookButton">
						<div class="btn_defualt mb30">
							<a href="#" class="btn_Red" onclick="submit_item();">등록하기</a>
						</div>
					</td>
				</tr>
			</table>	
		</div>	
		</section>
		</fieldset><!-- 본문 -->
	</div>
</div>


<%@include file="../common/footer.jsp" %>
</body>
</html>