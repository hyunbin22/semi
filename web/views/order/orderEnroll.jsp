<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.semi.lecture.model.vo.Lecture"%>
<%@ page import="com.semi.lecture.model.vo.LectureReview"%>
<%@ page import="java.util.List"%>
<%

   Lecture lec = (Lecture) request.getAttribute("lecture");
   List<LectureReview> list = (List) request.getAttribute("list");
   String days = (String)request.getParameter("day");
   String lecTot = (String)request.getAttribute("lecTot");
   
   String coverImage = "";
   for(int i=0;i<lec.getLectureUpList().size();i++){
		if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")){
			coverImage = lec.getLectureUpList().get(i).getUpLectureReName();
		}
	}
   
%>



<%@ include file="/views/common/header.jsp"%>
<br><br><br><br>
<div class="center1">
<h5 class="subtext">강의 신청</h5>
</div>
<br><br>
<section>
<form action="<%=request.getContextPath()%>/order/OrderEnrollEnd.do" method="post">
<input type="hidden" value="<%=lec.getLecNum()%>" name="lecNum">
<input type="hidden" name="oTot" value="<%=lecTot %>">
<input type="hidden" name="oPrice" value="<%=lec.getLecPrice() %>">

	<table id="LecMemRegistTable">
		<tr>
			<td rowspan="6"><img class="lecMemRegImage" src="<%=request.getContextPath() %>/upload/lecture/<%=coverImage %>"></td>
			<td colspan="4" class="lecMemRegTitle"><%=lec.getLecName() %></td>
		</tr>
		<tr>
			<td colspan="4"><hr></td>
		</tr>
		<tr>
			<td colspan="4"><%=lec.getLecLectureContent() %></td>
			
		</tr>
		<tr>
			<td colspan="4"><hr></td>
		</tr>
		<tr>
			<td><%=days %></td>
			<td>시간 : <%=lecTot %></td>
			<td>정원 : <%=lec.getLecStudentCount() %>/<%=lec.getLecMaxCount() %></td>
			
		</tr>
		<tr>
			<td colspan="4"><%=lec.getLecPrice() %>원</td>
		</tr>
		<tr>
			<td colspan="10"><hr></td>
		</tr>
		<tr>
			<td colspan="10" id="orderTalk">멘토에게 남기고 싶은 말</td>
		</tr>
		<tr>
			<td colspan="10">
			<textarea id="oText" name="oText" cols="110" rows="5" ></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4"><input class="lecMemRegButton" type="submit" value="신청하기" ></td>
		</tr>
	</table>
	
</form>
</section>



<script src="js/bootstrap.js"></script>


<%@ include file="/views/common/footer.jsp"%>