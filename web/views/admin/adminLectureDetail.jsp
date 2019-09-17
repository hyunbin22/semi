<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import="com.semi.lecture.model.vo.Lecture, com.semi.member.model.vo.Member" %>
<% 
	Lecture lec = (Lecture)request.getAttribute("lecture");
	int temp = (int)request.getAttribute("temp");
	Member m = (Member)session.getAttribute("loginMember");
	String toId = lec.getLecMento().getMember().getmId();
%>

<section>
	<article class="admin-mento-detailwrap">
		<div class="admin-mento-detailwrap">
		<br><br><h1>강의 상세보기</h1>
		<div class="admin-detail-frm-wrap">
			<form id="admin-mento-detail-frm" method="post">
			<input type="hidden" name="lecNum" id="lecNum" value="<%=lec.getLecNum()%>">
			<br>
			<%for(int i = 0; i < lec.getLectureUpList().size(); i++) {
				if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")) {%>
			<img src="<%=request.getContextPath()%>/upload/lecture/<%=lec.getLectureUpList().get(i).getUpLectureReName() %>" class="lecture-cover-img" alt="...">
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
					<hr>
					<p class="classinfo">
						<h2>강의사진</h2>
						<p>
							<%for(int i = 0; i < lec.getLectureUpList().size(); i++) {
								if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("lecimage")) {%>
							<img src='<%=request.getContextPath() %>/upload/lecture/<%=lec.getLectureUpList().get(i) %>'>
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
					<hr>
					<%if(temp==2) {%>
						<p class="refusalinfo">
							<h2>거절사유</h2>
							<p>
								<%=lec.getLecReason() %>
							</p>
						</p>
					<%} %>
				</div>
			</div>
			<%if(temp!=0) {%>
			<div class="appro-btn-wrap">
				<button type="submit" class="next" id="btnclassAppro" onclick="checkAppro();">승인</button>
				<button class="next" id="btnclassRefusal" onclick="popOpen();">거절</button>
			<br><br><br>
			</div>
			<%} %>
			</form>
			
			<form name="saveRefusalFrm" method="post">
				<input type="hidden" name="lecNum" id="inputlecNum">
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
		$(function(){
			<%if(temp==0) {%>
				$('#admin-mento-wrap').css('float','none');
				$('#admin-mento-wrap').addClass('center1');
				
			<%} else {%>
				$('#btnclassAppro').addClass('mentosubmit');
				$('#btnclassAppro').addClass('mentosubmit');
				
			<%}%>
		});
        function popOpen(){
    		var lecNum = $("#lecNum").val().trim();
    		var url = "<%=request.getContextPath()%>/lecture/lectureRefusalView.do?lecNum="+lecNum;
    		var status = "width=500, height=500, resizable=no, scrollbars=no, status=no;";
    		var title="거절상세"
    		var popUp = open("", title, status);
    		window.name="parentWin";
    		saveRefusalFrm.lecNum.value = lecNum;
    		saveRefusalFrm.target = title;
    		saveRefusalFrm.action=url;
    		saveRefusalFrm.submit();
		};
		
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
				var fromId = "<%=m.getmId()%>"
				var url = "<%=request.getContextPath()%>/message/openLecMessage.do?toId="+toId;
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