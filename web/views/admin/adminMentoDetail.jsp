<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.mento.model.vo.Mento"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%
	Mento mt = (Mento)request.getAttribute("mento");
	int temp = (int)request.getAttribute("temp");
%>
<section>
	<article id="admin-mento-wrap">
		<div class="admin-mento-detailwrap">
			<br><br><h1><strong>멘토 상세보기</strong></h1>
			<div class="admin-detail-frm-wrap">
			<form id="admin-mento-detail-frm" method="post" >
				<input type="hidden" name="mtNum" value="<%=mt.getMtNum()%>" id="mtNum">
				<div class="mento_info_child">
					<h1 class="mento-info-title"><%=mt.getMember().getmName()%> (<%=mt.getMember().getmId() %>)</h1>
					<h2><strong>프로필사진</strong></h2>
					<div id="picture-cover" class="picture center1">
					<%for(int j = 0; j < mt.getList().size(); j++) {
						if(mt.getList().get(j).getUpMentoCategory().equals("profile")) {%>
						<img src="<%=request.getContextPath()%>/upload/mento/<%=mt.getList().get(j).getUpMentoReName() %>" class="mento-profile-img">
					<%} 
					}%>
					</div>
					<h2><strong>별명</strong></h2>
					<p><%=mt.getMtNickName()%></p>
					<h2><strong>휴대폰 번호</strong></h2>
					<p><%=mt.getMember().getmPhone()%></p>
					<h2><strong>신분/학력</strong></h2>
					<p>
						<strong>인증방법</strong> :
						<%=mt.getMtHowConfirm()%></p>
					<%
						if (!mt.getMtHowConfirm().equals("신분증인증")) {
					%>
					<p>
						<strong>소속대학</strong> :
						<%=mt.getMtAcademic()%>
						<%=mt.getMtAcademicDept()%>
					</p>
					<p>
						<strong>상태여부</strong> :
						<%=mt.getMtGraduation()%></p>
					<%
						}
					for(int j = 0; j < mt.getList().size(); j++) {
						if(mt.getList().get(j).getUpMentoCategory().equals("confirm")) {
					%>
					
					<img alt="" src="<%=request.getContextPath() %>/upload/mento/<%=mt.getList().get(j).getUpMentoReName()%>">
					<%} 
					}%>
					<br /> <br />
					<%for(int j = 0; j < mt.getList().size(); j++) {
					 	if(mt.getList().get(j).getUpMentoCategory().equals("license")) {%>
					<h2><strong>자격증</strong></h2>
					<p><%=mt.getList().get(j).getUpMentoNameLicense() %></p>
					<img src="<%=request.getContextPath() %>/upload/mento/<%=mt.getList().get(j).getUpMentoReName()%>">
					<br> <br>
	
					<%}
					 }%>
					
					<%
						if (mt.getMtReason() != null) {
					%>
					<h2><strong>거절사유</strong></h2>
					<p><%=mt.getMtReason() %></p>
	
					<%
						}
					%>
					<br><br>
					<hr>
					<br>
					<%if(temp==1) {%>
					<div class="appro-btn-wrap">
						<input type="button" value="승인" class="next" id="btnclassAppro" onclick="checkAppro();">
						<input type="button" value="거절" class="next" id="btnclassRefusal" onclick="openRefusal();">
						<br><br><br>
					</div>
					<%} %>
				</div>
			</form>
	
			<form name="saveRefusalFrm" method="post">
				<input type="hidden" name="mtNum" id="inputMtNum">
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
			
		<%} else if(temp==1) {%>
			$('#btnclassAppro').addClass('mentosubmit');
			$('#btnclassAppro').addClass('mentosubmit');
			
		<%}%>
	});
	//거절버튼 눌렀을때
	function openRefusal(){
		var mtNum = $("#mtNum").val().trim();
		var url = "<%=request.getContextPath()%>/mento/mentoRefusalView.do?mtNum="+mtNum;
		var status = "width=500, height=500, resizable=no, scrollbars=no, status=no;";
		var title="거절상세"
		var popUp = open("", title, status);
		window.name="parentWin";
		saveRefusalFrm.mtNum.value = mtNum;
		saveRefusalFrm.target = title;
		saveRefusalFrm.action=url;
		saveRefusalFrm.submit();

	};

 	function checkAppro(){
		if(confirm('승인하시겠습니까?')) {
			var mtNum = <%=mt.getMtNum()%>;
			var url="<%=request.getContextPath()%>/mento/updateCheckMento.do?mtNum="+mtNum;
			location.href=url;
		}
	}; 

	
</script>
<%@ include file="/views/common/adminFooter.jsp"%>