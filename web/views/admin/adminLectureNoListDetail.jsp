<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import="com.semi.lecture.model.vo.Lecture, com.semi.member.model.vo.Member" %>
<% 
	Lecture lec = (Lecture)request.getAttribute("lecture");
	String cate = (String)request.getAttribute("cate");
	String local = (String)request.getAttribute("local");
	String toId = lec.getLecMento().getMember().getmId();
	String reason = "";
	if(lec.getLecReason()!=null) {
		reason = lec.getLecReason();
	}
%>

<section>
	<article class="admin-mento-detailwrap">
		<div class="admin-mento-detailwrap">
		<br><br><h1><strong>강의 상세보기</strong></h1>
		<div class="admin-detail-frm-wrap">
			<input type="hidden" name="lecNum" id="lecNum" value="<%=lec.getLecNum()%>">
			<br>
			<%for(int i = 0; i < lec.getLectureUpList().size(); i++) {
				if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")) {%>
			<div class="center1">
				<img src="<%=request.getContextPath()%>/upload/lecture/<%=lec.getLectureUpList().get(i).getUpLectureReName() %>" class="lecture-cover-img" alt="...">
			</div>
			<%}
			}%>
			<div class="detailbody">
				<div class="class_info">
					<h5 class="title"><%=lec.getLecName() %></h5>
					<table class="detailbar">
						<tr>
							<td>프로필</td>
							<td>수업</td>
						</tr>
					</table>
					<p class="proinfo">
						<h2>멘토소개</h2>
						<p>
							<%=lec.getLecMentoContent() %>
						</p>
					</p>
					<p class="classinfo">
						<h2>강의 기본정보</h2>
						<p>
							카테고리 : <%=cate %><br>
							수업타입 : <%=lec.getLecLectureContent() %><br>
							1회 수업 정원 : <%=lec.getLecMaxCount() %> 명 <br>
							1회 수업 시간 : <%=lec.getLecTime() %> 시간<br>
							1회 시간당 가격 : <%=lec.getLecPrice() %> 원<br>
							수업 횟수 : <%=lec.getLecCount() %> 회<br>
							수업 요일 : <%=lec.getLecWeek() %> <br>
							수업 날자 : <%=lec.getLecMeet() %><br>
							<%if(lec.getLecTot()!=null){%>
							수업 시간 : <%=lec.getLecTot() %><br>
							<%} if(lec.getLecTot2()!=null) {%>
							수업 시간 : <%=lec.getLecTot2() %><br>
							<%} %>
							<%if(lec.getLecOpenDate()!=null){%>
							개설 날자 : <%=lec.getLecOpenDate() %><br>
							<%} if(lec.getLecOpenDate2()!=null) {%>
							개설 날자 : <%=lec.getLecOpenDate2() %><br>
							<%} %>
							지역 : <%=local %><br>
							상세지역 : <%=lec.getLecLocalContent()!=null?lec.getLecLocalContent():"협의" %>
						</p>
					</p>
					<p class="classinfo">
					
						<h2>강의사진</h2>
						<p>
							<%for(int i = 0; i < lec.getLectureUpList().size(); i++) {
								if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("lecimage")) {%>
							<div class="center1">
								<img src='<%=request.getContextPath() %>/upload/lecture/<%=lec.getLectureUpList().get(i).getUpLectureReName() %>'>
							</div>
							<%}
							}%>
						</p>
					</p>
					
					
					<p class="classinfo">
						<h2>커리큘럼</h2>
						<p>
							<%=lec.getLecLectureContent() %>
						</p>
					</p>
				</div>
			</div>

			</div>
			<br><br>
			<button class="mentosubmit next" id="sendMessage" onclick= "location.href='<%=request.getContextPath()%>/admin/lectureOn.do?lecNum=<%=lec.getLecNum()%>'">활성화하기</button>
			<button class="mentosubmit next" id="sendMessage" onclick = "location.href='<%=request.getContextPath()%>/admin/adminLectrueNoList.do'">목록으로</button>
			<br><br>
		</div>
		</article>

	<%@ include file="/views/common/adminLectureAside.jsp" %>

</section>
<%@ include file="/views/common/adminFooter.jsp"%>
	<script>
		
		
	</script>
