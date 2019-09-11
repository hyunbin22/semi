<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="center1">
		<div class="wrap">
			<div class="bar">
				<br> <br>
				<h1 class = "center1">회원가입</h1>
				<br>
				<hr>
			</div>
			<div class="selectregister center1">
				<div class="rgemail">
					<p>
						<a
							href="<%=request.getContextPath()%>/views/member/register_text.jsp">이메일로<br>가입하기
						</a>
					</p>
				</div>
				<div class="rgkakao">
					<p>
						<a href="#">카카오로<br>가입하기
						</a>
					</p>
				</div>
				<div class="rgnaver">
					<p>
						<a href="#">네이버로<br>가입하기
						</a>
					</p>
				</div>

			</div>
		</div>
</section>
<%@ include file="/views/common/footer.jsp"%>