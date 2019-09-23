<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.qna.model.vo.Qna, 
				 com.semi.qna.model.vo.QnaUpload, 
				 com.semi.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp"%>
<% 
	Member m = (Member) session.getAttribute("loginMember");
	Qna q=(Qna)request.getAttribute("qna");
%>
	<section class="qna-view center1">
	    <br>
	    <p class="qna-redit-title">문의 수정</p>
	    <form action = "<%=request.getContextPath()%>/qna/updateDB.do" method="POST"  enctype="multipart/form-data">
	    <input type="hidden" name="qNum" value="<%=q.getqNum()%>">
	    <div class="qna-view-box center1" >
	        <table>
	            <tr>
	                <td class="qna-box-1">제목</td>
	                <td>
	                    <input type="text" value="<%=q.getqTitle() %>" class="qna-box-2" name="qna-title">
	                </td>
	                <td name="qna-writer">　 <%=m.getmId() %>  </td>
	            </tr>
	        </table>
	        <br>
	        <div class="qna-inputbox0 center1">
	            <textarea name="qna-content" value="" id="qna-inputbox" cols="50" rows="2" class="qna-inputbox"><%=q.getqContent() %></textarea>
	            <br>
	            <div>
	                <h4>첨부파일 </h4><input type="file" name="qnafile" onchange="previewImage(this,'View_area')"/>
	            </div>
	            <br>
	            	<input type="submit" value="수정" class="qna-input next">
	        </div>
	        <br>
	    </div>
	    <input type = "hidden" name = "aIdNum" value = "<%=m.getmId() %>">
	    </form>
	</section>

    <%@ include file="/views/common/footer.jsp"%>