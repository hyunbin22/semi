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
	<div class="container-fluid class-pay-container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-4" id="payMentoInfo">
						<div id="center1">
							<img alt="." src='<%=request.getContextPath()%>/upload/lecture/<%=lecCoverImg%>' id="lecCoverImg" />
						</div>
						<h3>
							<%=lec.getLecName() %>
						</h3>
							<h5><%=lec.getLecMento().getMtNickName() %></h5> <br><br>
						<p>
							신청해주셔서 감사합니다.
						</p>
					</div>
					<div class="col-md-8">
						<table class="table" id="payOrderInfo">
							<thead>
								<tr>
									<th>
										신청번호 : <%=order.getoNum() %>
									</th>
									<th>
										신청일자 : <%=order.getOrderDate() %>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>
										첫 수업 날짜
									</th>
									<td>
										<%if(lec.getLecOpenDate()==null) {%>
											협의
										<%} else {%>
											<%=lec.getLecOpenDate() %>
										<%} %>
									</td>
								</tr>
								<tr>
									<th>
										신청한 수업 시간
									</th>
									<td>
										<%if(lec.getLecType().equals("협의")) {%>
											협의
										<%} else {%>
											<%=order.getoTot()%>
										<%} %>
									</td>
								</tr>
								<tr>
									<th>
										1회 수업시간
									</th>
									<td>
										<%=lec.getLecTime() %> 시간
									</td>
								</tr>
								<tr>
									<th>
										1회 수업 금액
									</th>
									<td>
										<%=lec.getLecPrice() %> 원
									</td>
								</tr>
								<tr>
									<th>
										총 수업횟수
									</th>
									<td>
										<%=lec.getLecCount() %> 회
									</td>
								</tr>

								<tr>
									<th>
										총 결제금액
									</th>
									<td>
										<%=order.getoPrice() %> 원
									</td>
								</tr>
								<tr>
									<th>
										결제수단
									</th>
									<td>
										<label><input type="radio" name="kakaopay">카카오페이</label>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<div class="center1">
	   		<button onclick="fn_iampay();" class="next">결제하기</button>
		</div>
	</div>
	</article>
</section>
<script>
    function fn_iampay(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp65013128'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'ABLING 수업 결제',
            amount : <%=order.getoPrice() %>,	//결제금액
            buyer_email : '<%=m.getmEmail()%>',	
            buyer_name : '<%=m.getmName()%>',
            buyer_tel : '<%=m.getmPhone()%>',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
            	var check = 0;
            	$.ajax({
            		url:"<%=request.getContextPath()%>/order/orderUpdatePayment.do?oNum="+<%=order.getoNum()%>,
            		type : "get",
   					dataType : "html", 
            		success:function(result) {
            			console.log(result);
            			if(result>0) {
            				check=1;
            				console.log(check);
            				msg = '결제가 완료되었습니다.';
        	                msg += '\결제 금액 : ' + rsp.paid_amount;
        	                //성공시 이동할 페이지
        	                location.href='<%=request.getContextPath()%>/order/orderPaySuccess.do?msg='+msg+'&oNum=<%=order.getoNum()%>';
            			}
            		},
            		error : function(request, status, error) {
						alert("code = " + request.status
								+ " message = "
								+ request.responseText
								+ " error = " + error); 
					}
            	});
            	
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/orderPayFail.do?msg="+encodeURI(msg);
            }
        });
    };
    </script>

<%@ include file="/views/common/footer.jsp"%>