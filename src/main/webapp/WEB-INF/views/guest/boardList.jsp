<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/setting.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<title>승운서점</title>
	<meta name="description" content="승운서점/문제집 판매" />
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
	<div class="contents_box">
			<table width="100%" cellpadding="0" cellspacing="0" class="board_list">
				<colgroup>
					<col width="10%">
					<col width="60%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
										<tr>
						<td>15435</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238297&pg=1&skey=&sval=">예..알겠습니다.</a>
																			</td>
						<td>박진철</td>
						<td>2020-08-12 18:31:14</td>
					</tr>
										<tr>
						<td>15434</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238296&pg=1&skey=&sval=">진행단계 관련 문의드립니다.</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>박진철</td>
						<td>2020-08-12 17:47:00</td>
					</tr>
										<tr>
						<td>15433</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238295&pg=1&skey=&sval=">묵주기도 MP3파일구매</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>홍성하</td>
						<td>2020-08-12 13:56:56</td>
					</tr>
										<tr>
						<td>15432</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238294&pg=1&skey=&sval=">송금</a>
																			</td>
						<td>김정애</td>
						<td>2020-08-12 13:47:40</td>
					</tr>
										<tr>
						<td>15431</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238293&pg=1&skey=&sval=">성무일도4로 변경부탁드려요</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>황경미</td>
						<td>2020-08-12 08:17:36</td>
					</tr>
										<tr>
						<td>15430</td>
						<td class="left">
															주문취소요														<span class="answer">답변완료</span>
													<span class="lock">비밀글</span>						</td>
						<td>정혜임</td>
						<td>2020-08-11 16:54:26</td>
					</tr>
										<tr>
						<td>15429</td>
						<td class="left">
															다시 재주문할려합니다														<span class="answer">답변완료</span>
													<span class="lock">비밀글</span>						</td>
						<td>추미정</td>
						<td>2020-08-10 08:16:16</td>
					</tr>
										<tr>
						<td>15428</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238286&pg=1&skey=&sval=">배송</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>한현희</td>
						<td>2020-08-10 05:10:09</td>
					</tr>
										<tr>
						<td>15427</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238285&pg=1&skey=&sval=">취소 신청</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>한현희</td>
						<td>2020-08-10 05:08:40</td>
					</tr>
										<tr>
						<td>15426</td>
						<td class="left">
															<a href="/customer_qnaview?sno=238284&pg=1&skey=&sval=">함께 보내 주세요</a>
														<span class="answer">답변완료</span>
																			</td>
						<td>김종령</td>
						<td>2020-08-09 21:14:05</td>
					</tr>
					
				</tbody>
			</table>
			</form>
			<!-- pagination -->
			<div class="pagination mt30 fl">
<a href='javascript:void(0);' class='disabled' tabindex='-1'>&laquo;</a>
<a href='javascript:void(0);' class='disabled' tabindex='-1'>&lt;</a>
<a href='/customer_qnalist.php?1=1&pg=1' class='active'>1</a><a href='/customer_qnalist.php?1=1&pg=2'>2</a><a href='/customer_qnalist.php?1=1&pg=3'>3</a><a href='/customer_qnalist.php?1=1&pg=4'>4</a><a href='/customer_qnalist.php?1=1&pg=5'>5</a><a href='/customer_qnalist.php?1=1&pg=6'>6</a><a href='/customer_qnalist.php?1=1&pg=7'>7</a><a href='/customer_qnalist.php?1=1&pg=8'>8</a><a href='/customer_qnalist.php?1=1&pg=9'>9</a><a href='/customer_qnalist.php?1=1&pg=10'>10</a><a href='/customer_qnalist.php?1=1&pg=11'>&gt;</a>
<a href='/customer_qnalist.php?1=1&pg=1544'>&raquo;</a>
			</div>
			
			<div class="btn_defualt mt30"><a href="customer_qnawrite.php" class="btn_Red fr">글쓰기</a></div>
		</div>
		<!-- //리스트 -->


<%@include file="../common/footer.jsp" %><!-- footer -->

</body>
</html>