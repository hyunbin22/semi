<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="java.util.* , com.semi.report.model.vo.Report" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	Member m = (Member) session.getAttribute("loginMember");
    	List<Report> rp = (List)request.getAttribute("reportHistory");
		int cPage=(int)request.getAttribute("cPage");
		String pageBar=(String)request.getAttribute("pageBar");
		int count = 0;
    %>
	<section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br><table class = "MYLIST">
                                <tr>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/views/report/reportForm.jsp'" id = "listBtn">신고하기</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/reportHistroy?mNum=<%=memberLogin.getmNum() %>'" id = "listBtn">신고내역</button></td>
                                </tr>
                        </table><br><br>
                    <h1 class="center1">신고내역</h1><br>
                    <h5 class = "center1">자세히 버튼 클릭시 상세페이지로 이동합니다.</h5>
                    <br>
                    <hr>
    		</div>
    		<div class="center1">
                    <table id = "list" border="1">
                            <tr class = "listName">
                                    <td class = "listNumber">No</td>
                                    <td class = "listContent">제목</td>
                                    <td class = "listCheck">날짜</td>
                                    <td class = "listCheck">결과</td>
                                    <td class = "listCheck">보기</td>
                                </tr>
				    <% 
                     for (int i = 0; i < rp.size(); i++) {
                     %>
                        <tr class = "list">
                            <td class = "listNumber"><%= i+1%></td>
                            <td class = "listContent"><span><%= rp.get(i).getReportTitle() %></span></td>
                            <td class = "listContent"><span><%= rp.get(i).getReportDate() %></span></td>
                            <td class = "listCheck"><%=rp.get(i).getReportCheck() %></td>
                            <td class = "listCheck"><button id ="seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath()%>/member/seeReport?reportTitle=<%=rp.get(i).getReportTitle()%>'">자세히</button></td>
                        </tr>
                    <% count++;} %>
                    <%if(count == 0){ %>
					<tr class = "list">
					<td colspan="5">신고 목록이 없습니다.</td>
					</tr>
					<%} %>
                    </table>
                    <br><br>
			 	<%if(count > 0){ %>
					<div id="admin-appro-pageBar" class = "center1">
         				<%=request.getAttribute("pageBar")%>
      				</div>
      			<%} %>
                </div>
                </div>
    </section>
>>>>>>> cd775fe7606f768061ec6a245c816946f0c292f7
    <%@ include file = "/views/common/footer.jsp" %>