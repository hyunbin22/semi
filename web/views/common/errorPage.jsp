<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/error.css">
</head>
<body class="center1 errorPborder">
   <div class="">
      <div class="errorlinetop"></div>
      <div class="center1 ">
         <img class="errorPIMGsize"    src="<%=request.getContextPath()%>/image/logo.png" alt="">
      </div>
      <div>
         <table class="center1">
            <tr>
               <td><h2>Sorry.</h2><span class="errorPT2">Page not found.</span></td>
            </tr>
            <tr>
               <td colspan="2">The page you requested is missing or you have taken the wrong path.</td>
            </tr>
            <tr><td class="null35px"></td></tr>
            <tr>
               <td colspan="2" class="buttoncenter"><a href="<%=request.getContextPath()%>"> Home </a></td>
            </tr>
         </table>
         <br><br><br>
      </div>
      <div class="errorlinebottom"></div>
   </div>
</body>
</html>