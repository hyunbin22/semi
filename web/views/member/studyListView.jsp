<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.semi.order.model.vo.Order"%>
 <% Order o = (Order)request.getAttribute("order"); %>
<%@ include file="/views/common/header.jsp"%>
	<%@ include file="/views/common/myPageAside.jsp" %>
<section>

	  	<div class="wrap">
	  	<div id="myPageContentWrap">
             <div class="bar">
				<br>
                <h1 class="center1"><strong>신청한 강의 상세</strong></h1>
                <br><br>
                <hr>
                <br>
             </div>
             <div class="center1 myPage-content-wrap">
                 					<table id="class-pay-tbl">
										<tr>
											<th style = "background-color: lightpink; text-align: center;" >수업 제목</th>
											<td><%=o.getLecture().getLecName() %></td>
										</tr>
										<tr>
											<th style = "background-color: lightpink; text-align: center;" >수업 시간</th>
											<td><%=o.getoTot() %> 시간</td>
										</tr>
										<tr>
											<th style = "background-color: lightpink; text-align: center;" >총 결제 금액</th>
											<td><%=o.getoPrice() %> 원</td>
										</tr>
										<tr>
											<th style = "background-color: lightpink; text-align: center;" >하고 싶은 말</th>
											<td>
												<%=o.getoText() %>
											</td>
										</tr>
										<tr>
											<th style = "background-color: lightpink; text-align: center;" >신청 날짜</th>
											<td>
												<%=o.getOrderDate() %>
											</td>
										</tr>

									</table>
									<br><br>
									<div class="center1">
								   		<button onclick="back();" class="next center1" >목록으로</button>
								   		<button class = "next" onclick = "location.href='<%=request.getContextPath()%>/order/orderPaymentView.do?lecNum=<%=o.getLecNum()%>'">결제하기</button>
									</div>
                 					<br>

         
  
  					</div>
                </div>
            </div>
      </section>
	<script>	
		function back()
		{
			var url="<%=request.getContextPath()%>/member/studyList.do?mNum=<%=m.getmNum() %>";
			location.href=url;
		}
	</script>

<%@ include file="/views/common/footer.jsp"%>