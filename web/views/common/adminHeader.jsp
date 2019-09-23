<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>관리자</title>

<link
	href="https://fonts.googleapis.com/css?family=Stylish&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin.css">
<style>
p {
	margin: 20px 0px;
}
</style>
</head>
<body class="center1">
	<header class="admin-header">

			<a href="<%=request.getContextPath()%>/views/admin/adminMain.jsp"><img src = "<%=request.getContextPath()%>/image/adminHeaderLogo.png"></a>

		<ul id="header-line">
			<li><a href="<%=request.getContextPath() %>/admin/memberList.do">회원관리</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/AdminMentoList.do">멘토관리</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/adminLectureList.do">강의관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/categoryEnroll">카테고리관리</a></li>
			<li><a href="<%=request.getContextPath() %>/admin/AdminMentoApproval.do">승인관리</a></li>
			<button id="exit" onclick="location.href='<%=request.getContextPath()%>/'">메인</button>
		</ul>
	</header>
