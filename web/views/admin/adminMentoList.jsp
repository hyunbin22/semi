<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page
	import="com.semi.member.model.vo.Member, com.semi.mento.model.vo.Mento, java.util.*"%>
<%
	List<Mento> list = (List)request.getAttribute("mentoList");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
%>
<section>
<div style = "height: 1000px;">
	<article id="search1">
		<div id="adminSearchContainer">
			<select id="searchType">
				<option value="mId" <%="mId".equals(searchType)?"selected":"" %>>아이디</option>
				<option value="mName" <%="mName".equals(searchType)?"selected":"" %>>이름</option>
			</select> 
			<div id="search-mId">
				<form action="<%=request.getContextPath()%>/admin/mentoApproFinder.do">
					<input type="hidden" name="searchType" value="mId">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="hidden" name="temp" value=0>
					<input type="text" name="searchKeyword" placeholder="검색어 입력">
					<button type="submit" class="next" style="height: 33px;">검색</button>
				</form>
			</div>
	 		<div id="search-mName">
				<form action="<%=request.getContextPath()%>/admin/mentoApproFinder.do">
					<input type="hidden" name="searchType" value="mName">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="hidden" name="temp" value=0>
					<input type="text" name="searchKeyword" placeholder="이름 입력"
						value='<%="mName".equals(searchType)?searchKey:""%>'>
					<button type="submit" class="next" style="height: 33px;">검색</button>
				</form>
			</div> 
		</div>
	</article>
	<article class="center1 admin-list">
		<div class="row mentoListRow" style="width:100%;">
			<div class="col">
				<h3 class="admintitle"><strong>멘토목록</strong></h3>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="mentoAppro">
						<div class="card appro-frm-wrap">
							<%
							for (int i = 0; i < list.size(); i++) {
							%>
							<div class="card appro-frm-wrap" style = "height: 110px;">
			                     <div class="lectureAppro-frm">
			                        <!-- 멘토(승인완료)목록 -->
			                        <div class="card-header mtAppro-name">멘토 ID . [<%=list.get(i).getMember().getmId()%>] &emsp;/&emsp; 멘토승인 날짜 : [<%=list.get(i).getMtHireDate() %>]
			                        </div>
			
			                           <table class="tbl-appro" style = "text-align: center">
			                              <tr>
			                                 <td style = "margin-top: 13.5px; margin-left: 10px; text-align: center; width: 150px;"><%=list.get(i).getMtNickName() %></td>
			                                 <td>
												<button id ="seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath()%>/admin/AdminMentoDetailServlet.do?mtNum=<%=list.get(i).getMtNum()%>'">자세히보기</button>
			                                 </td>
			                              </tr>        
			                           </table>
									<br>
			                     </div>
			                     <%} %>
			                     <% if(list.size()==0) {%>
									<div class="card appro-frm-wrap"></div>
								<%} 
			                     %>
		                    <div id="admin-appro-pageBar">
		         				<%=request.getAttribute("pageBar")%>
		      				</div>
		                  </div>
						</div>
					</div>
				</div>
			</div>
	<br><br>
	</article>
<div style = "height: 1000px;">
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

$(function(){
	if(<%=list.size()%>==0) {
		alert("조회 결과가 없습니다.");
	} 		
});

</script>
<%@ include file="/views/common/adminFooter.jsp"%>