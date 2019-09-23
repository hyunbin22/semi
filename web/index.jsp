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
		<img src="<%=request.getContextPath() %>/image/인기강좌.png">
	</div>

	<br><br><br><br><br><br>
	<div>
	<img src = "<%=request.getContextPath()%>/image/MainContent1.jpg">
	</div>
</section>
<%@ include file="/views/common/footer.jsp" %>
