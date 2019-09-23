<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.mento.model.vo.Mento"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%
	Mento mt = (Mento)request.getAttribute("mento");
	int temp = (int)request.getAttribute("temp");
	String reason = "";
	if(mt.getMtReason()!=null) {
		reason = mt.getMtReason();
	}
%>
<section>
	<article id="admin-mento-wrap">
		<div class="admin-mento-detailwrap">
			<br><br><h3><strong>멘토 상세보기</strong></h3>
			<div class="admin-detail-frm-wrap">
				<input type="hidden" name="mtNum" value="<%=mt.getMtNum()%>" id="mtNum">
				<div class="mento_info_child">
					<h1 class="mento-info-title"><%=mt.getMember().getmName()%> (<%=mt.getMember().getmId() %>)</h1>
					<h3><strong>프로필사진</strong></h3>
					<div id="picture-cover" class="picture center1">
					<%for(int j = 0; j < mt.getList().size(); j++) {
						if(mt.getList().get(j).getUpMentoCategory().equals("profile")) {%>
						<img src="<%=request.getContextPath()%>/upload/mento/<%=mt.getList().get(j).getUpMentoReName() %>" class="mento-profile-img">
					<%} 
					}%>
					</div>
					<h3><strong>별명</strong></h3>
					<p><%=mt.getMtNickName()%></p>
					<h3><strong>휴대폰 번호</strong></h3>
					<p><%=mt.getMember().getmPhone()%></p>
					<h3><strong>신분/학력</strong></h3>
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
					<h3><strong>자격증</strong></h3>
					<p>[ <%=mt.getList().get(j).getUpMentoNameLicense() %> ]</p>
					<img src="<%=request.getContextPath() %>/upload/mento/<%=mt.getList().get(j).getUpMentoReName()%>">
					<br> <br>
	
					<%}
					 }%>
					<h3><strong>입금받을 은행 / 계좌번호</strong></h3>
					<p><%=mt.getMtBank() %> / <%=mt.getMtAccountNumber() %></p>
 					<%
						if (temp!=0) {
					%> 
					<h3><strong>거절사유</strong></h3>
					<textarea id="refusalContent" cols="107" rows="5" style="resize: none; width:100%;" maxlength="100" placeholder="거절사유를 입력하세요." ><%=reason %></textarea>
	
 					<%
						}
					%> 
					<br><br>
					<hr>
					<br>
					<%if(temp!=0) {%>
					<div class="appro-btn-wrap">
						<input type="button" value="승인" class="next" id="btnclassAppro" onclick="checkAppro();">
						<button class="next" id="btnclassRefusal" onclick="btnRefusal();">거절</button>
						<br><br><br>
					</div>
					<%} %>
				</div>
			
			<!-- 거절시 보낼 데이터 -->
			<form name="saveRefusalFrm" method="post">
				<input type="hidden" name="mtNum" id="inputMtNum" value=<%=mt.getMtNum() %>>
				<input type="hidden" name="mtLec" value="mt">
			</form>

			</div>
		</div>
	</article>
	<%if(temp!=0) {%>
	<%@ include file="/views/common/adminAside.jsp" %>
	<%} %>
</section>
<%@ include file="/views/common/adminFooter.jsp"%>
<script>
	$(function(){
		<%if(temp==0) {%>
			$('#admin-mento-wrap').css('float','none');
			$('#admin-mento-wrap').addClass('center1');
			
		<%} else if(temp!=0) {%>
			$('#btnclassAppro').addClass('mentosubmit');
			$('#btnclassAppro').addClass('mentosubmit');
			
		<%}%>
	});
	//거절버튼 눌렀을때
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
 	function checkAppro(){
		if(confirm('승인하시겠습니까?')) {
			var mtNum = <%=mt.getMtNum()%>;
			var url="<%=request.getContextPath()%>/mento/updateCheckMento.do?mtNum="+mtNum;
			location.href=url;
		}
	}; 
	

	
</script>