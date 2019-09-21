<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import="com.semi.lecture.model.vo.Lecture, com.semi.member.model.vo.Member" %>
<% 
	Lecture lec = (Lecture)request.getAttribute("lecture");
	String cate = (String)request.getAttribute("cate");
	String local = (String)request.getAttribute("local");
	int temp = (int)request.getAttribute("temp");
	Member m = (Member)session.getAttribute("loginMember");
	String toId = lec.getLecMento().getMember().getmId();
	String reason = "";
	if(lec.getLecReason()!=null) {
		reason = lec.getLecReason();
	}
%>

<section>
	<article class="admin-mento-detailwrap">
		<div class="admin-mento-detailwrap">
		<br><br><h1>강의 상세보기</h1>
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
					<%if(temp!=0) {%>
						<p class="refusalinfo">
							<h2>거절사유</h2>
							<div class="center1">
								<textarea id="refusalContent" cols="107" rows="5" style="resize: none;" maxlength="200" placeholder="거절사유를 입력하세요."><%=reason %></textarea>
							</div>
						</p>
					<%} %>
				</div>
			</div>
			<%if(temp!=0) {%>
			<div class="appro-btn-wrap">
				<button type="submit" class="next" id="btnclassAppro" onclick="checkAppro();">승인</button>
				<button class="next" id="btnclassRefusal" onclick="btnRefusal();">거절</button>
			<br><br><br>
			</div>
			<%} %>
			
			<!-- 거절시 보낼 데이터 -->
			<form name="saveRefusalFrm" method="post">
				<input type="hidden" name="lecNum" id="inputlecNum" value=<%=lec.getLecNum() %>>
				<input type="hidden" name="mtLec" value="lec">
			</form>
			
			<button class="mentosubmit" id="sendMessage">문의하기</button>
			
			<form name="openMessageFrm" method="post">
				<input type="hidden" name="toId" value="<%=lec.getLecMento().getMember().getmId()%>">
				<input type="hidden" name="fromId" value="<%=m.getmId()%>">
				<input type="hidden" name="lectureName" value="<%=lec.getLecName() %>">
			</form>
			
			</div>
		</div>
		</article>
		<%if(temp!=0) {%>
	<%@ include file="/views/common/adminAside.jsp" %>
	<%} %>
</section>
	<script>
		
		function btnRefusal() {
			var reason = $('#refusalContent').val();
			if(reason.length > 0) {
				var url = "<%=request.getContextPath()%>/admin/saveRefusal.do?reason="+reason;
				saveRefusalFrm.action=url;
				saveRefusalFrm.submit();
				
			} else {
				alert("거절사유를 입력하세요.");
			}
			
		}
		
		function checkAppro() {
			if(confirm('승인하시겠습니까?')){
				var lecNum = <%=lec.getLecNum()%>;
				var url="<%=request.getContextPath()%>/lecture/updateCheckLecture.do?lecNum="+lecNum;
				location.href=url;
			}
		}

		
		//문의하기
		$(function(){
			$('#sendMessage').click(function(){
				var toId = "<%=toId%>";
				var url = "<%=request.getContextPath()%>/message/openToMessage.do?toId="+toId;
				var status = "width=400, height=600, resizable=no, status=no, toolbars=no, menubar=no";
				var title="ABLINGTALK"
				var popUp = open("", title, status);
				window.name="parentWin"; 
				openMessageFrm.target = title;
				openMessageFrm.action=url;
				openMessageFrm.submit();
			});
		});
	</script>
<%@ include file="/views/common/adminFooter.jsp"%>