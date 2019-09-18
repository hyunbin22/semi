<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.lecture.model.vo.Lecture, com.semi.order.model.vo.Order, com.semi.member.model.vo.Member" %>
<%
	Order order = (Order)request.getAttribute("order");
	Lecture lec = order.getLecture();
	Member m = order.getMember();
	
	String lecProImg = "";
	for(int i = 0; i < lec.getLecMento().getList().size(); i++) {	//멘토 프로필사진 받아오기
		if(lec.getLecMento().getList().get(i).getUpMentoCategory().equals("profile")) {
			lecProImg = lec.getLecMento().getList().get(i).getUpMentoReName();
		}
	}
	String lecCoverImg = "";
	for(int i = 0; i < lec.getLectureUpList().size(); i++) {
		if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")) {
			lecCoverImg = lec.getLectureUpList().get(i).getUpLectureReName();
		}
	}
%>

<section class="center1">
	<article>
		<div id="class-pay-container">
			<div class="card mb-3 center1" style="max-width: 800px;">
				<div class="row no-gutters">
					<div class="col-md-4 center1">
						<img src="<%=request.getContextPath()%>/upload/lecture/<%=lecCoverImg%>" class="card-img orderImg" alt="...">
						<h1 class="center1"><%=lec.getLecMento().getMtNickName() %></h1>
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h2 class="card-title"><%=lec.getLecName() %></h2>
							<div class="class-pay-table-wrap">
								
									<table id="class-pay-tbl">
										<tr>
											<th>수업횟수</th>
											<td><%=lec.getLecCount() %> 회</td>
										</tr>
										<tr>
											<th>수업시간</th>
											<td><%=lec.getLecTime() %> 시간</td>
										</tr>
										<tr>
											<th>가격(1회 수업 금액)</th>
											<td><%=lec.getLecPrice() %> 원</td>
										</tr>
										<tr>
											<th>총결제금액</th>
											<td><%=order.getoPrice() %> 원</td>
										</tr>
										<tr>
											<th>결제수단</th>
											<td><label><input type="radio" name="kakaopay">카카오페이</label></td>
										</tr>
									</table>
									<div class="center1 btn-pay-wrap">
								   		<button onclick="fn_iampay();" class="next">결제하기</button>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>
</section>
<script>

</script>

<%@ include file="/views/common/footer.jsp"%>