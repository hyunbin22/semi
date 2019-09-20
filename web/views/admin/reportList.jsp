<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page
   import="com.semi.report.model.vo.Report, com.semi.mento.model.vo.Mento, java.util.*"%>
   <% 	
   		List<Report> list = (List)request.getAttribute("list"); 
		int cPage=(int)request.getAttribute("cPage");
		String pageBar=(String)request.getAttribute("pageBar");
		int count = 0;
   %>
   <%@ include file="/views/common/adminAside.jsp"%>
<section>
<div style = "height: 700px;">
<article id="search1">
		<div id="adminSearchContainer">

			<div id="search-mreporterId">
				<form action="<%=request.getContextPath()%>/admin/reportApproFinder.do">
					<input type="hidden" name="searchType" value="mId">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					신고자 ID : <input type="text" name="searchKeyword" placeholder="검색어 입력">
					<button type="submit">검색</button>
				</form>
			</div>
	 		<%-- <div id="search-reportTitle">
				<form action="<%=request.getContextPath()%>/admin/reportApproFinder.do">
					<input type="hidden" name="searchType" value="mName">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="hidden" name="temp" value=0>
					<input type="text" name="searchKeyword" placeholder="이름 입력"
						value='<%="mName".equals(searchType)?searchKey:""%>'>
					<button type="submit">검색</button>
				</form>
			</div>  --%>
		</div>
	</article>
   <article class="admin-list-container wrap">
    <div class="row">
         <div class="col">
            <h3 class="admintitle">신고처리대기목록</h3>
            <div class="tab-content">
               <div class="tab-pane fade show active" id="lectureAppro">
				    <% 
                     for (int i = 0; i < list.size(); i++) {
                     %>
                  <div class="card appro-frm-wrap" style = "height: 110px;">
                     <div class="lectureAppro-frm">
                        <!-- 강의승인신청목록 -->
                        <div class="card-header mtAppro-name">신고자 ID . [<%=list.get(i).getMember().getmId()%>] &emsp;/&emsp; 신고 날짜 : [<%=list.get(i).getReportDate() %>]
                        </div>

                           <table class="tbl-appro" style = "text-align: center">
                              <tr>
                                 <td style = "margin-top: 13.5px; margin-left: 10px; text-align: left; width: 200px;"><%=list.get(i).getReportTitle() %></td>
                                 <td>
								<button id ="seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath()%>/admin/reportView?reportNo=<%=list.get(i).getReportNum()%>'">자세히보기</button>
                                 </td>
                              </tr>        
                           </table>
						<br>
                     </div>
                     <% count++;}  if(count==0) {
							%>
						<div class="card appro-frm-wrap"></div>
					<%} %>
                    <div id="admin-appro-pageBar" class = "center">
         				<%=request.getAttribute("pageBar")%>
      				</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </article>

</div>
</section>

<script>

$(function(){
	if(<%=count%>==0) {
		alert("조회 결과가 없습니다.");
			
	}
});
</script>

<%@ include file="/views/common/adminFooter.jsp"%>
