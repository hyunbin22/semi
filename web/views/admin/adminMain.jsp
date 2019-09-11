<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page
   import="com.semi.member.model.vo.Member, com.semi.mento.model.vo.Mento, java.util.*"%>
<%@ page import = "com.semi.lecture.model.vo.Lecture, com.semi.lecture.model.vo.LectureUpload" %>
<section>

<div>관리자메인</div>



</section>

<script>
$(function(){
   var sid = $("#search-mId");
   var sname = $("#search-mName");
   var searchType=$("#searchType");
   searchType.change(function() {
      sid.hide();
      sname.hide();
      $("#search-"+this.value).show().css("display","inline-block");
   });
   $("#searchType").trigger('change');
   
});
</script>
<%@ include file="/views/common/adminFooter.jsp"%>