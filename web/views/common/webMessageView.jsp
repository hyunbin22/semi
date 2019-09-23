<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import= "com.semi.member.model.vo.Member, java.util.*"%>
<%@ page import= "com.semi.message.model.vo.Message"%>
<%
	Member m = null;
	String userId = null;
	String toId = (String)request.getAttribute("toId");
	
	if(session.getAttribute("loginMember")!=null) {
		m = (Member)session.getAttribute("loginMember");
		userId=m.getmId();
	}
	String str = "";
	if(request.getAttribute("lecName")!=null && !request.getAttribute("lecName").equals("")) {
		str = (String)request.getAttribute("lecName");
	}
	if(request.getAttribute("moimTitle")!=null && !request.getAttribute("moimTitle").equals("")) {
		str = (String)request.getAttribute("moimTitle");
	}
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>ABLINGTALK</title>
<style>
@charset "UTF-8";


</style>

</head>
<body onresize="parent.resizeTo(450,600)" onload="parent.resizeTo(450,600)">
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/message/openMessage.do">ABLINGTALK<span id = "unread" class="label label-info"></span></a>
			<a class="navbar-brand" href="<%=request.getContextPath() %>/message/memberFind.do">친구찾기</a>
		</div>
	</nav>	
	<div class="container bootstrap snippet">
		<div class="row"> 
			<div class="col-xs-12">
				<div class="portlet portlet-default chatWrap">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i><%=toId %></h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id= "chat" class="panel-collapse collapse in">
						<div id="chatList" class="porlet-body chat-widget" style="overflow-y:auto; width: auto; height: 300px;">
						</div>
						<div class="portlet-footer">
							
							<div class="row" style="height:90px;">
								<div class="form-group col-xs-10">
								<%if(!toId.equals("msgAdmin")) {%>
									<%if(str!=null && !str.equals("")) {%> 
										<textarea style="height: 70px;resize: none;" id="chatContent" class="form-control" maxlength="100"><%=str %>문의합니다</textarea>
									<%} else { %>
										<textarea style="height: 70px;resize: none;" id="chatContent" class="form-control" maxlength="100" placeholder="메세지를 입력하세요."></textarea>
									<%} %>
									</div> 
										<div class="form-group col-xs-2">
											<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
											<div class="clearfix"></div>
										</div>
								<%} else {%>	<!-- 관리자로부터 받은경우 -->
										<textarea style="height: 70px;resize: none;" id="chatContent" class="form-control" readonly>이 발신자는 읽기만 가능합니다.</textarea>
									</div> 
								<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메세지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display:none;">
		<strong>내용을 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display:none;">
		<strong>오류가 발생했습니다.</strong>
	</div>
<script>
	function autoClosingAlert(selector, delay) {
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {alert.hide()}, delay);
	}
	function submitFunction() {
		var fromId = '<%=userId%>';
		var toId = '<%=toId%>';
		var chatContent = $('#chatContent').val();
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/message/messageSubmit.do",
			data:{
				fromId: encodeURIComponent(fromId),
				toId: encodeURIComponent(toId),
				chatContent: encodeURIComponent(chatContent),
			},
			success: function(result){
				if(result == 1) {
					autoClosingAlert("#successMessage",2000);
				} else if(result==0) {
					autoClosingAlert("#dangerMessage",2000);
				} else {
					autoClosingAlert("#warningMessage",2000);
				}
			}
		});
		$('#chatContent').val("");
	}
	
	var lastId=0;
	
	function chatListFunction(type){
		var fromId = '<%=userId%>';
		var toId = '<%=toId%>';
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/message/messageListEnd.do",
			data:{
				fromId: encodeURIComponent(fromId),
				toId: encodeURIComponent(toId),
				listType: type,
			},
			success: function(data){
				if(data=="") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0; i < result.length; i++) {
					if(result[i][0].value== fromId) {
						result[i][0].value = '나';
					}
					addChat(result[i][0].value, result[i][2].value, result[i][3].value);
				}
				lastId = Number(parsed.last);
			}
		})
	}
	

	function addChat(chatName, chatContent, chatTime) {
		$('#chatList').append('<div class="row">' +
			'<div class="col-lg-12">' +
			'<div class="media">' +
			'<div class="media-body">' +
			'<h4 class="media-heading">' +
			(chatName=='msgAdmin'?"관리자":chatName) +
			'<span class="small pull-right">' +
			chatTime +
			'</span></h4>'+
			'<p>' + chatContent + '</p>' +
			'</div></div></div></div>' +
			'<hr>');
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	function getInfiniteChat() {
		setInterval(function() {
			chatListFunction(lastId);
		}, 1000);
	}
	
	//안읽은메세지수 출력
	$(function(){
		timer = setInterval(function(){
			$.ajax({
				type:"post",
				url: "<%=request.getContextPath()%>/message/readCount.do",
				data: {
					userId: encodeURIComponent('<%=userId%>'),
				},
				success: function(result) {
					if(result>=1) {
						showUnread(result);
					} else {
						showUnread('0');
					}
				}
			});
		},2000);
		
	});
	function showUnread(result){
		$('#unread').html(result);
	}
	
	
	
</script>
<script>
	$(document).ready(function(){
		chatListFunction('0');
		getInfiniteChat();
	});
</script>

</body>
 
</html>