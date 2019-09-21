<%@page import="com.semi.report.model.vo.ReportUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import = "com.semi.moim.model.vo.Moim , com.semi.moim.model.vo.MoimUpload" %>
<% 
	Moim moim = (Moim)request.getAttribute("moim");
	Member m = (Member) session.getAttribute("loginMember");
	String toId = moim.getMember().getmId();
%>

	<section class = "center1">
		<div class="center1">
			<h2>모임게시판</h2>
		</div>
            <div class="notice-table" style="width:760px;">
                <table style="width:100%;">
                	<tr style="background-color: lightgray;">
	                	<th>No</th>
	                    <th style="width:300px;">제목</th>
	                    <th style="width:80px;">작성자</th>
	                    <th style="width:200px;">작성 날짜</th>
	                    <th style="width:60px;">조회수</th>
                	</tr>
                    <tr>
                    	<td><%=moim.getMoimNum()%></td>
                       	<td><%=moim.getMoimTitle()%></td>
                        <td><%=moim.getMember().getmId()%></td>
                        <td><%=moim.getMoimDate() %></td>
                        <td><%=moim.getMoimReadCount() %></td>
                        <tr>
                        <td colspan = "5"><hr></td>
                        </tr>
                        <tr>
                        <td colspan = "5">내용</td>
                        </tr>
                        <tr class="notice-content">
                            <td colspan="5">
                                <div class="notice-content2">
	                                <div class = "report-content">
	                                   		<%=moim.getMoimText() %>

									</div>
                                </div>
                            </td>
                        </tr>
                        <tr style="float:left;"><td>첨부파일</td><td colspan="4"></td></tr>
                        <tr style="float:left;">
                        	<td style="float:left; text-align:left;">
                        	<%if(moim.getMoimUpload().size()>0 || moim.getMoimUpload()!=null) {
                         			for(int i = 0; i < moim.getMoimUpload().size(); i++) {%>
                         		<%=i+1%>.&nbsp;&nbsp;<a href="javascript:fn_filedown('<%=moim.getMoimUpload().get(i).getUpMoimOrgName()%>','<%=moim.getMoimUpload().get(i).getUpMoimReName()%>')"><%=moim.getMoimUpload().get(i).getUpMoimOrgName() %></a>
                         		<br>
                         		<%} 
                        		}%>
                        	
                        	</td>
                        	<td colspan="4"></td>
                        </tr>
                        
                </table>
                <table class = "center1">
                    <tr class="null">
                    <td>
                    <button id ="seeMore" onclick="back();">목록으로</button>
                    <% if(memberLogin!=null) {%>
	                    <button id ="seeMore" class="btnMessage">메세지보내기</button>
                    	<%if(m.getmId().equals(moim.getMember().getmId()) || memberLogin.getmId().equals("kiho") || memberLogin.getmId().equals("admin") || memberLogin.getmId().equals("gusqls897") || memberLogin.getmId().equals("rldh8") || memberLogin.getmId().equals("thd9292")) {%>
	                    <input type="button" id ="seeMore" name = "seeMore" onclick="fn_update();" value="수정하기">
	                    <input type="button" id ="seeMore" name = "seeMore" onclick="fn_delete();" value="삭제하기">
                    <%} 
                    }%>
                    </td>
                    </tr>
                </table>
                </div>
    </section>
<%--     <form id="moimFrm" method="post" name="moimFrm">			<!-- 수정/삭제시 보낼 데이터 -->
    	<input type="hidden" name="moimNum" value=<%=moim.getMoimNum() %>>
    </form>
     --%>
    <%if(m!=null) { %>
    <form name="moimMessage" method="post" id="openMessageFrm">	<!-- 메세지보내기 -->
		<input type="hidden" name="toId" value="<%=moim.getMember().getmId()%>">
		<input type="hidden" name="fromId" value="<%=m.getmId()%>">
		<input type="hidden" name="moimTitle" value="<%=moim.getMoimTitle() %>">
	</form>
	<%} %>

	
	
	<script>	
		function back()
		{
			var url="<%=request.getContextPath()%>/moim/moimList.do";
			location.href=url;
		}
		
		function fn_update() {
			var url = "<%=request.getContextPath()%>/moim/moimUpdate.do?moimNum=<%=moim.getMoimNum() %>";
			location.href=url;
		}
		
		function fn_delete() {
			if(confirm("삭제하시겠습니까?")) {
				var url = "<%=request.getContextPath()%>/moim/moimDelete.do?moimNum=<%=moim.getMoimNum() %>";
				location.href=url;
				/* moimFrm.action=url;
				moimFrm.submit(); */
			}
		}
		
	    function fn_filedown(ori, re) {
	    	var file = encodeURIComponent(ori);
	    	location.href="<%=request.getContextPath()%>/moim/filedown.do?oriFileName="+file+"&reFileName="+re;
	    }
		
		$(function(){
			$('.btnMessage').click(function(){
				<%-- if('<%=m.getmId()%>'==null || '<%=m.getmId()%>'=="") { --%>
				if('<%=m%>'==null) {
					alert("로그인 후 이용 가능합니다.");
					$('#id').focus();
				} else {
					var toId = "<%=toId%>";
					var url = "<%=request.getContextPath()%>/message/openToMessage.do";
					var status = "width=400, height=600, resizable=no, status=no, toolbars=no, menubar=no";
					var title="ABLINGTALK"
					var popUp = open("", title, status);
					window.name="parentWin"; 
					moimMessage.target = title;
					moimMessage.action=url;
					moimMessage.submit();
				}
			})
		});
		
		
	</script>



<%@ include file="/views/common/footer.jsp"%>