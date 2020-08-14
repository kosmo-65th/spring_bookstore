<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<CTYPE html>
<html lang="ko">
<head>
<title>주문/결제</title>
<link href="${path}/include/css/shopping.css" rel="stylesheet" />
</head>

<body>
<div id="wrap_main">

<!-- HEADER -->
<section id="head">
<div id="header">
	
<%@include file="../common/top.jsp" %>
<%@include file="../common/GNB_menu.jsp" %>
</div>
</section><!-- 머리(head) 종료 -->
</div>

<div id="wrap">
<!-- CONTENTS -->
<div id="container">
	<form action="buyBookPro" method="post" name="buyBookPro">
	<input type = "hidden" name="${_csrf.parameterName}" value = "${_csrf.token}">
	<!-- 본문 -->
	<div id="div_center" class="contants_area cart">
		<!-- 상품 리스트 -->
		<h4 class="top">주문 내역 </h4>
		<div class="contents_box border">
			<div class="left_box">

				<h5>상품</h5>
				<table width="100%" cellpadding="0" cellspacing="0" class="cart_list bg_w">
					<colgroup>
						<col width="50%">
						<col width="25%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>품목</th>
							<th>판매가</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<!-- 물품 넣는곳 -->
						<c:set var="totalPrice" value="0"/>
						<c:set var="sale" value="0"/>
						<c:forEach var="book" items="${books }">
							 <input type="hidden" value="${book.ISBN }" name="ISBNs[]">
	                         <input type="hidden" value="${book.bookCount }" name="counts[]">
	                         <input type="hidden" value="${book.bookPrice }" name="price[]">
							<tr>
								<td class="thumb book">
									<span class="thumb_img"><img src="${image }${book.getBookImage()}" alt="${book.getBookName() }"></span>
									<span class="thumb_txt">${book.getBookName() }<br>${book.getBookWriter() }</span>
								</td>
								<td class="price"><span><del><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getBookPrice()}" />
									</del> →</span> 
									<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()}" /><span> 원</span>
									</strong> <span>(
										<fmt:parseNumber value= "${100-book.getSale()/book.getBookPrice()*100 }" integerOnly="true" />
									% ▼)</span>
								</td>
								<td class="cart_input">${book.bookCount }</td>
								<td class="txt"><strong>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.getSale()*book.bookCount}" />
									원</strong>
	                            </td>
	                            <c:set var="sale" value="${sale+(book.bookPrice-book.sale)*book.bookCount}"/>
	                            <c:set var="totalPrice" value="${totalPrice+book.getSale()*book.bookCount}"/>
							</tr>
						</c:forEach>
                	</tbody>
				</table>
			</div>

			<!-- 합계 -->

			<div class="cart02_total_box">
				<span>상품 합계 : <strong class="black">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />
				 원</strong></span>
				<i class="icon">+</i>
				<span>배송료 : <strong class="black" id="delivery_price_text">2,000 원</strong></span>
				<i class="icon">=</i>
				<span>주문 합계 : <strong class="red" id="real_payment">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice+2000}" /> 
				원</strong> </span>
			</div>
			<!-- //합계 -->
		</div>
		<!-- //상품 리스트 -->

		<!-- 배송지 정보 -->
		<fieldset id="deliverydata">
			<legend>배송지 입력</legend>
			<h4 class="mt30">배송지 정보</h4>
			<div class="contents_box border">
				<!-- 기본정보 -->
				<div class="cart_input_wrap">
					<ul class="input_box" style="border-bottom: 0;">
						<li><strong class="tit">주문자 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="text" name="order_name" id="order_name" value="${guest.getName() }" class="w400p" renly></label>
							</div>
						</li>
						<li><strong class="tit">주문자 휴대전화 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="order_phone" id="order_phone" value="${guest.getPhone() }" class="w400p" renly></label>
								<p class="cap">* 이 번호로 주문진행 과정이 SMS로 안내됩니다.</p>
							</div>
						</li>
						<li><strong class="tit">주문자 이메일 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="text"  name="order_email1" id="order_email1" value="${guest.getEmail() }" class="w400p" renly></label>
							</div>
						</li>
					</ul>

					<ul class="input_box" style="border: 0; border-top:1px solid #f1f1f1;">
						<li class="fromSelect"><strong class="tit">배송지 <em>*</em></strong>
							<div class="i_inputs">
   								<label class="i_radio ml10"><input type="radio" name="area" value="1" checked> <span>회원정보 동일</span></label>
							</div>
						</li>
					</ul>

						<!-- 일반택배일 경우 노출 -->
					<ul class="input_box localForm" style="border-top:1px solid #f1f1f1; border-bottom: 1px solid #aaa;">
						<li><strong class="tit">수령인 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input"><input type="text" name="delivery_name" id="delivery_name" value="${guest.getName() }" maxlength="30" class="w400p"></label>
							</div>
						</li>
						<li class="local_delivery_adddr_li"><strong class="tit">배송 주소 <em>*</em></strong>
							<div class="i_inputs">
								<label class="i_input w240p" ><input type="text" name="zip1" id="zip1" value="${guest.getAddress1() }" maxlength="5" class="w240p" renly> </label>
								<label class="i_input"><input type="text" name="addr1" id="addr1" value="${guest.getAddress2() }" renly maxlength="100"></label>
								<label class="i_input"><input type="text" name="addr2" id="addr2" value="${guest.getAddress3() }" maxlength="150"></label>
								<p class="cap left">* 정확한 주소를 적어주셔야 우편물이 분실되지 않습니다.</p></br>
								<p class="cap left">* 군부대 사서함 주소 사용시 택배가 제한 될 수 있습니다.</p>
							</div>
						</li>
						<li class="local_delivery_tel_li"><strong class="tit">배송지 전화번호 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="delivery_tel" id="delivery_tel" value="${guest.getPhone() }"  maxlength="20" class="w400p"></label>
							</div>
						</li>
						<li class="local_delivery_phone_li"><strong class="tit">수령인 휴대전화 <em>*</em></strong>
							<div class="i_inputs inline">
								<label class="i_input"><input type="text" name="delivery_phone" id="delivery_phone" value="${guest.getPhone() }" maxlength="20" class="w400p"></label>
								<p class="cap">* 비상연락 번호입니다.</p>
							</div>
						</li>
						<!-- ADD : 2020-02-27 : OCS : 배송메시지 추가 -->
						<li><strong class="tit">배송 요청사항</strong>
							<div class="i_inputs">
								<div class="box">
									<select id="delivery_msg_num" name="delivery_msg_num" class="">
										<option value="0" selected>배송메시지를 선택해주세요</option>
										<option value="1" >배송 전에 문자 부탁드립니다.</option>
										<option value="2" >문 앞에 두시고 문자주세요.</option>
										<option value="3" >경비실에 맡겨 주세요.</option>
										<option value="4" >택배함에 넣어 주세요.</option>
										<option value="5" ><직접입력></option>
									</select>
								</div>
							</div>
							<div class="i_inputs delivery_msg_box" id="delivery_msg_box">
								<label class="i_input"><input type="text" name="delivery_msg" id="delivery_msg" maxlength="100" value="" class="w790p"></label>
								<p class="txt">* 50자 이내로 적어주세요.</p>
							</div>
							<p class="txt">&nbsp;</p>
						</li>
					<!-- 배송메시지 끝-->
					</ul>
						<!-- //일반택배일 경우 노출 -->
				</div>
			</div>
		</fieldset>
		<!-- //배송지 정보 -->


		<!-- //결제 정보 -->
		<fieldset>
			<legend>결제 정보 입력</legend>
			<h4 class="mt30">결제 정보 <span class="bubble">도서소득공제 적용</span></label></h4>
			<div class="contents_box cart no_bg">
				<div class="cart02_info">
					<ul class="input_box">
						<li id="pay_type_creditcard_display"><strong class="tit">신용카드</strong>
							<div class="i_inputs">
								<label class="i_radio"><input type="radio" name="pay_option" id="pay_option1" value="SC0010" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">신용카드(일반)</span></label>
								<!--도서소득공제시 해외카드 노출 -->
																<label class="i_radio ml10"><input type="radio" name="pay_option" id="pay_option8" value="SC0010" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">해외발급신용카드</span></label>
															</div>
						</li>
						<li id="pay_type_simple_display"><strong class="tit">간편결제</strong>
							<div class="i_inputs">
								<label class="i_radio"><input type="radio" name="pay_option" id="pay_option7" value="SC0010" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">카카오페이</span></label>
								<!-- ADD : OCS : 2020-01-07 : 삼성페이 간편결제 추가 -->
								<label class="i_radio ml10"><input type="radio" name="pay_option" id="pay_option11" value="SC0010-SC0040" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">삼성페이</span></label>
								<label class="i_radio ml10"><input type="radio" name="pay_option" id="pay_option10" value="SC0010-SC0030" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">페이나우</span></label>
							</div>
						</li>
						<li id="pay_type_cash_display"><strong class="tit">현금결제</strong>
							<div class="i_inputs">
								<label class="i_radio"><input type="radio" name="pay_option" id="pay_option2" value="SC0030" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">실시간 계좌이체</span></label>
								<label class="i_radio ml10"><input type="radio" name="pay_option" id="pay_option3" value="SC0000" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">온라인(무통장)입금</span></label>
								<label class="i_radio ml10" style="display:none"><input type="radio" name="pay_option" id="pay_option6" value="SC0040" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">가상계좌(에스크로)</span></label>
							</div>
						</li>
						<li id="pay_type_etc_display"><strong class="tit">기타결제</strong>
							<div class="i_inputs">
								<label class="i_radio"><input type="radio" name="pay_option" id="pay_option4" value="SC0060" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">휴대폰 결제</span></label>
							</div>
						</li>
						<li id="pay_type_emoney_display" style="display: none;"><strong class="tit">기타결제</strong>
							<div class="i_inputs">
								<label class="i_radio"><input type="radio" name="pay_option" id="pay_option5" value="5" onclick="onClickPayType();"> <span style="display:inline-block; width:120px;">마일리지/예치금/상품권</span></label>
							</div>
						</li>
						
					</ul>
					<!-- 도서소득공제안내-->
						
				</div>

				<!-- 합계 -->
				<div class="cart02_total_final">
					<p><span>상품수</span><span class="no_view"> : </span><strong>${book.bookCount }개</strong></p>
					<p><span>상품금액</span><span class="no_view"> : </span><strong>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice+sale}" /> 
					원</strong></p>
					<p><span>배송비</span><span class="no_view"> : </span><strong id="delivery_price_text2">2,000 원</strong></p>
					<p><span>할인금액</span><span class="no_view"> : </span><strong id="discount_price_text2">
					 	<fmt:formatNumber type="number" maxFractionDigits="3" value="${sale}" /> 
					 원</strong></p>

					<div class="total_box">
						<span>최종 결제금액</span><span class="no_view"> : </span><strong id="real_payment2">
							<c:set var="totalPrice" value="${totalPrice+2000}"/>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" /> 
						원</strong>
					</div>
					<p class="txt2" id="ck_agreement_text">주문할 상품의 상품명, 가격, 배송정보에 동의하십니까?</p>
					<p class="txt" id="ck_agreement_text2"><label class="i_checkbox"><input type="checkbox" name="ck_agreement" id="ck_agreement" value="Y"> <span class="txt"><strong>동의합니다</strong>. (전자상거래 제 8조 2항)</span></label></p>

					<div class="btn_cart_final">
						<a class="btn_red" href="javascript:void(0);" onclick="javascript:document.buyBookPro.submit();"><i class="i_btn_list_cart"></i> 결제하기</a>
					</div>
				</div>
				<!-- //합계 -->
			</div>

		</fieldset>
		<!-- //결제 정보 -->
	</form>
</body>
</html>