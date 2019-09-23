 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.notice.model.vo.Notice, com.semi.notice.model.vo.NoticeUpload, java.util.List" %>    
<%@ include file="/views/common/header.jsp"%>
<%
	List<Notice> list=(List)request.getAttribute("notice");
	int cPage=(int)request.getAttribute("cPage");
	String pageBar=(String)request.getAttribute("pageBar");
%>
    <section class="center1">

        <!-- <span id="notice-nav">
            <table id="notice-menu">
                <tr><td>Notice</td></tr>
                <tr><td>Event</td></tr>
                <tr><td>FAQ</0td></tr>
            </table>
        </span> -->
        <div>
        <br>
        <%if(memberLogin != null){
               if(memberLogin.getmId().equals("kiho") || memberLogin.getmId().equals("admin") || memberLogin.getmId().equals("gusqls897") || memberLogin.getmId().equals("rldh8") || memberLogin.getmId().equals("thd9292")) {%>
            <div><a onclick = "location.href='<%=request.getContextPath()%>/views/notice/notice-form.jsp'"><input class="notice-write next" type="button" value="공지사항작성"></a></a></div><%} }%>
        </div>
            <div class="notice-table">
                <table class="notice-top">
                    <th class="notice-highlight1"></th>
                    <th class="notice-date">작성일</th>
                    <th class="notice-title">제목</th>
                    <th class="notice-id">작성자</th>
                </table>
                <%for(Notice n : list){ %>
                <table>
			<tr class="click-notice">
				<td class="notice-highlight">
					<div class="notice-highlight-div">
						<strong class="notice-highlight-str"> <span
							class="notice-highlight-span">필독</span>
						</strong>
					</div>
				</td>
				<td class="notice-date"><%=n.getnDate() %></td>
				<td class="notice-title"><a href="<%=request.getContextPath()%>/notice/noticeView.do?nNum=<%=n.getnNum() %>"><%=n.getnName() %></a></td>
				<td class="notice-id">관리자</td>
			
			<%-- <tr class="notice-content">
				<td colspan="4">
					<div class="notice-content2">
						<div>첨부파일 : </div>
						<%=n.getNtext() %>


					</div>
				</td>
			
			<tr> --%>
			</tr>




			<tr class="null"><td colspan="4"></td></tr>
                </table>
                <%} %>
            </div>
            <br>
            <div class="center1"><%=request.getAttribute("pageBar")%></div>
            <!-- <aside class="notice-banner">
            <div><h3>banner</h3></div>
        </aside> -->
    </section>
    <%@ include file="/views/common/footer.jsp"%>