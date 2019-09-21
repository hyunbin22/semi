<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
	
<section class="center1">
	<div class="images">
		<div class="banner">
			<ul>
				<li><img
					src="<%=request.getContextPath() %>/image/mainBanner01.jpg"
					width="1024" height="500px"></li>
				<li><img
					src="<%=request.getContextPath() %>/image/mainBanner02.jpg"
					width="1024" height="500px"></li>
				<li><img
					src="<%=request.getContextPath() %>/image/mainBanner03.jpg"
					width="1024" height="500px"></li>
				<li><img
					src="<%=request.getContextPath() %>/image/mainBanner04.jpg"
					width="1024" height="500px"></li>
				<li><img
					src="<%=request.getContextPath() %>/image/mainBanner05.jpg"
					width="1024" height="500px"></li>
			</ul>
		</div>
	</div>
	<br>
	<div class = "center">
	<div id=most1_1 style="float: left;">인기강좌 1</div>
	<div id=most1_1 style="float: left;">인기강좌 2</div>
	<div id=most1_1 style="float: left;">인기강좌 3</div>
	</div>
<!-- 	<article>
		<div style="float: left">
			<div class=con1>
				<div id=con1_1>
					<img class=img1 src="인기기타.jpg">
				</div>
				<table class="classtable">
					<tr>
						<td colspan="4"></td>
					</tr>
					<tr>
						<td colspan="3" class="className">강좌 제목 1</td>
						<td class="classplace">위치 | 경기수원</td>
					</tr>
					<tr>
						<td colspan="4" class="classinfo">소개설명<br>제매력에 빠져보실래요?<br>개피곤하다우
							<hr>

						</td>
					</tr>
					<tr>
						<td colspan="2" class="classScore"><b>평점</b><br>4.4/5.0</td>
						<td colspan="2" class="classmoneytime"><b>돈/시간</b><br>20000원/1시간</td>
					</tr>
				</table>
			</div>
		</div>
	</article> -->
	<br><br><br><br><br><br>
	<div>
	<img src = "<%=request.getContextPath()%>/image/MainContent1.jpg">
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>
