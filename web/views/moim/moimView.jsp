<%@page import="com.semi.report.model.vo.ReportUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import = "com.semi.moim.model.vo.Moim , com.semi.moim.model.vo.MoimUpload" %>
<% 
	Moim moim = (Moim)request.getAttribute("moim");
	Member m = (Member) session.getAttribute("loginMember");
%>

	<section class = "center1">
            <div class="notice-table">
                <table class="notice-top2">
                    <th class="notice-title"> 제목</th>
                    <th class="notice-id">작성자</th>
                    <th class="notice-date">작성 날짜</th>
                    <th class="notice-id">조회수</th>
                </table>
                <table>
                    <tr class="click-notice">
                       	<td class="notice-title"><%=moim.getMoimTitle()%></td>
                        <td class="notice-id"><%=moim.getMember().getmId()%></td>
                        <td class="notice-date"><%=moim.getMoimDate() %></td>
                        <td class="notice-date"><%=moim.getMoimReadCount() %></td>
                        <tr>
                        <td colspan = "4"><hr></td>
                        </tr>
                        <tr>
                        <td colspan = "4">내용</td>
                        </tr>
                        <tr class="notice-content">
                            <td colspan="4">
                                <div class="notice-content2">
	                                <div class = "report-content">
	                                   		<%=moim.getMoimText() %>
	                                   		<br><br>
	                                   		<%if(moim.getMoimUpload().getUpMoimReName()!=null) {%>
	                                   		<div class="center1">
	                                   			<img src="<%=request.getContextPath() %>/upload/moim/<%=moim.getMoimUpload().getUpMoimReName() %>" style="width:300px">
	                                   		</div>
	                                   		<%} %>
									</div>
                                </div>
                            </td>
                        </tr>
                        
                </table>
                <table class = "center1">
                    <tr class="null">
                    <td>
                    <button id ="seeMore" name = "seeMore" onclick="back();">목록으로</button>
                    <%
                    if(memberLogin!=null) {
                    	if(m.getmId().equals(moim.getMember().getmId()) || memberLogin.getmId().equals("kiho") || memberLogin.getmId().equals("admin") || memberLogin.getmId().equals("gusqls897") || memberLogin.getmId().equals("rldh8") || memberLogin.getmId().equals("thd9292")) {%>
	                    <button id ="seeMore" name = "seeMore" onclick="fn_update();">수정하기</button>
	                    <button id ="seeMore" name = "seeMore" onclick="fn_delete();">삭제하기</button>
                    <%} 
                    }%>
                    </td>
                    </tr>
                </table>
                </div>
                <form id="moimFrm" method="post">			<!-- 수정/삭제시 보낼 데이터 -->
                	<input type="hidden" name="moimNum" value=<%=moim.getMoimNum() %>>
                </form>
    </section>
	
	
	<script>	
		function back()
		{
			var url="<%=request.getContextPath()%>/moim/moimList.do";
			location.href=url;
		}
		
		function fn_update() {
			var url = "<%=request.getContextPath()%>/moim/moimUpdate.do";
			$('#moimFrm').action=url;
			$('#moimFrm').submit;
		}
		
		function fn_delete() {
			var url = "<%=request.getContextPath()%>/moim/moimDelete.do";
			$('#moimFrm').action=url;
			$('#moimFrm').submit;
		}
		
		
	</script>



<%@ include file="/views/common/footer.jsp"%>