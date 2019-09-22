<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page
	import="com.semi.member.model.vo.Member, com.semi.mento.model.vo.Mento, java.util.*"%>
<%@ page import = "com.semi.lecture.model.vo.Lecture, com.semi.lecture.model.vo.LectureUpload" %>
<%
	List<Lecture> list = (List)request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
	int count = 0;
%>
<section>

	<article id="search1">
		<div id="adminSearchContainer">
			<select id="searchType">
				<option value="mId" <%="mId".equals(searchType)?"selected":"" %>>아이디</option>
				<option value="mName" <%="mName".equals(searchType)?"selected":"" %>>강의 제목</option>
			</select> 
			<div id="search-mId">
				<form action="<%=request.getContextPath()%>/admin/lectureNolistIdFinder.do">
					<input type="hidden" name="searchType" value="mId">
					<input type="hidden" name="cPage" value="<%=cPage%>">
					<input type="hidden" name="temp" value=0> 
					<input type="text" name="searchKeyword" placeholder="검색어 입력"
						value='<%="mId".equals(searchType)?searchKey:""%>'>
					<button type="submit" class="next" style="height: 33px;">검색</button>
				</form>
			</div>
	 		<div id="search-mName">
				<form action="<%=request.getContextPath()%>/admin/lectureNolistNameFinder.do">
					<input type="hidden" name="searchType" value="lecName">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="hidden" name="temp" value=0> 
					<input type="text" name="searchKeyword" placeholder="강의 제목 입력"
						value='<%="mName".equals(searchType)?searchKey:""%>'>
					<button type="submit" class="next" style="height: 33px;">검색</button>
				</form>
			</div> 
		</div>
	</article>
	<article class="admin-list-container wrap">
		<div class="row">
			<div class="col">
				<h3 class="admintitle"><strong>비활성화 강의 목록</strong></h3>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="lectureAppro">
						<div class="card appro-frm-wrap">
							<%
							for (int i = 0; i < list.size(); i++) {
								if(list.get(i)!=null&&list.get(i).getLecReason()==null) {
							%>
							<div class="lectureAppro-frm" style="height: 280px">
								<!-- 강의승인신청목록 -->
								<div class="card-header mtAppro-name"><%=list.get(i).getLecMento().getMtNickName()%>
									(<%=list.get(i).getLecMento().getMember().getmId()%>)
								</div>
								<div class="card-body">
									<table class="tbl-appro">
										<tr>
											<td><h5 class="card-title"><%=list.get(i).getLecName() %></h5></td>
										</tr>
										<tr>
											<td rowspan="2">
											<img
												src='<%=request.getContextPath()%>/upload/lecture/<%=list.get(i).getLectureUpList().get(0).getUpLectureReName()%>'
												class="approImg"></td>
											<td style="width:170px"><p class="approDate">신청날짜 : <%=list.get(i).getLecADate()%></p></td>
											<td style="width:130px">
											<button type="submit" class="btn btn-primary btn-appro-view next"
												onclick="location.href='<%=request.getContextPath()%>/admin/AdminLectureNoListDetail.do?lecNum=<%=list.get(i).getLecNum()%>'">
												More</button>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<%
									count++;
									}
								}
							if(count==0) {
							%>
							<div id="EmptyListWrap" style = "border : none;"></div>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="admin-appro-pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
	<br><br>
	</article>

	<%@ include file="/views/common/adminLectureAside.jsp"%>

</section>
<%@ include file="/views/common/adminFooter.jsp"%>
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

$(function(){
	if(<%=count%>==0) {
		alert("조회 결과가 없습니다.");
			
	}
});
</script>