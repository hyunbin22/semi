<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import="com.semi.lecture.model.vo.Lecture, com.semi.member.model.vo.Member" %>
<% 
	Lecture lec = (Lecture)request.getAttribute("lecture");
	String cate = (String)request.getAttribute("cate");
	String local = (String)request.getAttribute("local");
%>

<section>
	<article class="admin-mento-detailwrap">
		<div class="admin-mento-detailwrap">
		<br><br><h3><strong>강의 상세보기</strong></h3>
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
					<p class="proinfo">
						<h3><strong>멘토소개</strong></h3>
						<p>
							<%=lec.getLecMentoContent() %>
						</p>
					</p>
					<p class="classinfo">
						<h3><strong>강의 기본정보</strong></h3>
						<p>
							
							카테고리 : <%=cate %><br><hr>
							<table class="tblLectureInfo">
								<tr>
									<td>수업타입&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecType() %></td>
								</tr>
								<tr>
									<td>1회 수업 정원&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecMaxCount() %> 명 </td>
								</tr>
								<tr>
									<td>1회 수업 시간&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecTime() %> 시간</td>
								</tr>
								<tr>
									<td>1회 시간당 가격&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecPrice() %> 원</td>
								</tr>
								<tr>
									<td>수업 횟수&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecCount() %> 회</td>
								</tr>
								<tr>
									<td>수업 요일&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecWeek() %></td>
								</tr>
								<tr>
									<td>수업 날자&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecMeet() %></td>
								</tr>
								<%if(lec.getLecTot()!=null){%>
								<tr>
									<td>수업 시간&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecTot() %></td>
								</tr>
								<%} if(lec.getLecTot2()!=null) {%>
								<tr>
									<td>수업 시간&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecTot2() %></td>
								</tr>
								<%} %>
								<%if(lec.getLecOpenDate()!=null){%>
								<tr>
									<td>개설 날자&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecOpenDate() %></td>
								</tr>
								<%} if(lec.getLecOpenDate2()!=null) {%>
								<tr>
									<td>개설 날자&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecOpenDate2() %></td>
								</tr>
								<%} %>
								<tr>
									<td>지역&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=local %></td>
								</tr>
								<tr>
									<td>상세지역&nbsp;&nbsp;&nbsp;&nbsp;:</td>
									<td style="width:20px;"></td>
									<td><%=lec.getLecLocalContent()!=null?lec.getLecLocalContent():"협의" %></td>
								</tr>
							
							</table>
						</p>
					</p>
					<p class="classinfo">
					
						<h3><strong>강의사진</strong></h3>
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
						<h3><strong>커리큘럼</strong></h3>
						<p>
							<%=lec.getLecLectureContent() %>
						</p>
					</p>
				</div>
			</div>
			

			</div>
			<br><br>
			<%if(lec.getLecStatus() != 'N') {%>
			<button class="mentosubmit next" id="sendMessage" onclick= "location.href='<%=request.getContextPath()%>/admin/lectureOff.do?lecNum=<%=lec.getLecNum()%>'">비활성화하기</button>
			<%} %>
			<button class="mentosubmit next" id="sendMessage" onclick= "location.href='<%=request.getContextPath()%>/admin/adminLectureList.do'">목록으로</button>
		</div>
		<br><br>
		</article>


	<%@ include file="/views/common/adminLectureAside.jsp" %>

</section>
<%@ include file="/views/common/adminFooter.jsp"%>
	<script>
		
	</script>
