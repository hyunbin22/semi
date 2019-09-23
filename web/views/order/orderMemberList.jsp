<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.lecture.model.vo.Lecture" %>
<%@ page import="com.semi.order.model.vo.Order" %>
<%@ page import="com.semi.member.model.vo.Member" %>
<%@ page import="java.util.*" %>

<%
	String pageBar=(String)request.getAttribute("pageBar");
	int cPage=(int)request.getAttribute("cPage");
	int mtnum = (int)request.getAttribute("mtnum");
	String lecnum = (String)request.getAttribute("lecNum");
	List<Lecture> lec = (List)request.getAttribute("lecture");
	List<Order> o = (List)request.getAttribute("order");
	
%>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/myPageAside.jsp" %>




<section>
<div class="wrap">
      	  		<div id="myPageContentWrap">
             <div class="bar">
				<br>
                <h1 class="center1">신청자 목록</h1>
                <br><br>
                <hr>
                <br>
             </div>
             <div class="center1 myPage-content-wrap">
                  <table id = "list" border="1">
                            <tr class = "listName">
                                    <td class = "listContent">이름</td>
                                    <td class = "listContent">시간</td>
                                    <td class = "listContent">하고싶은 말</td>
                                    <td class = "listContent">가격</td>
                                    <td class = "listContent">신청 날짜</td>
                                    <td class = "listContent">승인 여부</td>
                                    <td class = "listContent">결제 여부</td>
                                    
                                    
                                </tr>
					<%for (Order order : o){%>
                        <tr class = "list">
                            <td class = "listContent"><%=order.getMember().getmName() %></td>
                            <td class = "listContent"><%=order.getoTot() %></td>
                            <td class = "listContent"><%=order.getoText()%></td>
                            <td class = "listContent"><%=order.getoPrice()%></td>
                            <td class = "listContent"><%=order.getOrderDate()%></td>
                            <%if(order.getoCheck()=='Y'&&order.getoPayment()=='Y'){ %>
                            <td class = "listContent">승인완료</td>
                            <%}else if(order.getoCheck()=='Y'&&order.getoPayment()=='N'){ %>
                            <td class = "listContent"><button class = "next" onclick="oCheckN();">승인취소</button></td>
                            <%}else{ %>
                            <td class = "listContent"><button class = "next" onclick="oCheckY();">승인하기</button></td>
                            <%} %>
                            
                            <%if(order.getoCheck()=='Y'&&order.getoPayment()=='Y'){ %>
                            <td class = "listContent">결제완료</td>
                            <%}else if(order.getoCheck()=='Y'&&order.getoPayment()=='N'){ %>
                            <td class = "listContent">결제대기</td>
                            <%} else{%>
                            <td class = "listContent">승인대기</td>
                            <%} %>
                        </tr>
                        <script>
							function oCheckY(){
								if(confirm("승인하시겠습니까?")){
									var url="<%=request.getContextPath()%>/order/orderCheckY.do?oNum=<%=order.getoNum()%>&lecNum=<%=order.getLecNum()%>&mtNum=<%=mtnum%>";
									location.href=url;
								}
							}
							
							function oCheckN(){
								if(confirm("승인 취소하시겠습니까?")){
									var url="<%=request.getContextPath()%>/order/orderCheckN.do?oNum=<%=order.getoNum()%>&lecNum=<%=order.getLecNum()%>&mtNum=<%=mtnum%>";
									location.href=url;
								}
							}
						</script>
                    <%} %>

                    </table>
                 <br>

  				<div class="center1"><%=pageBar %></div>
  				</div>
                </div>
            </div>
      </section>



<%@ include file = "/views/common/footer.jsp" %>