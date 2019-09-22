<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	Member m = (Member) session.getAttribute("loginMember");
%>
	<section class="qna-view center1">
	    <br>
	    <p class="qna-title">공지사항 작성</p>
	    <form action = "<%=request.getContextPath()%>/notice/noticeFormEnd.do" method="POST" enctype="multipart/form-data">
	    <div class="qna-view-box center1" >
	        <table>
	            <tr>
	                <td class="qna-box-1">제목</td>
	                <td>
	                    <input type="text" class="qna-box-2" name="qna-title">
	                </td>
	                <td name="qna-writer">관리자 </td>
	            </tr>
	        </table>
	        <br>
	        <div class="qna-inputbox0 center1">
	            <textarea name="qna-content" id="qna-inputbox" cols="50" rows="2" class="qna-inputbox"></textarea>
	            <br>
	            <div>
	                <h4>첨부파일</h4><input id="reportPhoto1" type="file" name="noticefile" onchange="previewImage(this,'View_area')">
	            </div>
	            <br>
	            <div>
	            	 <input type="submit" value="등록" class="qna-input next">
	            </div>
	        </div>
	        <br>
	    </div>
	    <input type = "hidden" name = "aIdNum" value = "<%=m.getmNum()%>">
	    </form>
	    
	    
	</section>

    <%@ include file="/views/common/footer.jsp"%>