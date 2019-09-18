<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.* , com.semi.order.model.vo.Order"%>
    <%@ include file = "/views/common/header.jsp" %>
    <% List<Order> list = (List)request.getAttribute("list"); %>
    <section>
	<%@ include file="/views/common/myPageAside.jsp" %>
	  	<div class="wrap">
	  		<div id="myPageContentWrap">
             <div class="bar">
				<br>
                <h1 class="center1">신청한 강의</h1>
                <br><br>
                <hr>
                <br>
             </div>
             <div class="center1 myPage-content-wrap">
                  <table id = "list" border="1">
                            <tr class = "listName">
                                    <td class = "listNumber">No</td>
                                    <td class = "listContent">강의 이름</td>
                                    <td class = "listCheck">상세보기</td>
                                    <td class = "listCheck">승인</td>
                                    <td class = "listCheck">결제</td>
                                </tr>
					<%for(int i = 0; i <list.size(); i ++) {%>
                        <tr class = "list">
                            <td class = "listNumber"><%=(i+1) %></td>
                            <td class = "listContent"><span><%=list.get(i).getLecture().getLecName() %></span></td>
                            <td class = "listContent"><span><button class = "next" onclick = "location.href='<%=request.getContextPath()%>/member/seeMoreStudy.do?lecNum=<%=list.get(i).getLecNum()%>'">상세보기</button></span></td>
                            <td class = "listCheck"><%=list.get(i).getoCheck() %></td>
                            <td class = "listCheck"><%if(list.get(i).getoCheck() == 'Y' && list.get(i).getoPayment() == 'N'){ %>
                            							<span><button class = "next" onclick = "location.href='<%=request.getContextPath()%>/order/orderPaymentView.do?oNum=<%=list.get(i).getoNum()%>'">결제하기</button></span>
                            							<%} else if(list.get(i).getoCheck() == 'Y' && list.get(i).getoPayment() == 'Y') {%>
                            							<span>결제완료</span>
                            							<%} else { %>
                            							<span>승인대기중</span>
                            							<%} %>
                            </td>
                        </tr>
                    <%} %>

                    </table>
                 <br>

         
  
  					</div>
                </div>
            </div>
      </section>
      
      <script>

      	
      	
      
      
      </script>
    <%@ include file = "/views/common/footer.jsp" %>