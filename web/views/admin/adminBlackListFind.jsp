<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import="java.util.List, com.semi.member.model.vo.Member"%>
<%
   List<Member> members=(List)request.getAttribute("memberList");
   int cPage=(int)request.getAttribute("cPage");
   String pageBar=(String)request.getAttribute("pageBar");
   int count = 0;
%>
<%@ include file="/views/common/adminMemberAside.jsp"%>
<section>
<div style = "height: 700px;">
<article id="search1">
		<div id="adminSearchContainer">

			<div id="search-mreporterId">
				<form action="<%=request.getContextPath()%>/admin/memberBlackApproFinder.do">
					<input type="hidden" name="searchType" value="mId">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					ID 검색 : <input type="text" name="searchKeyword" placeholder="검색어 입력">
					<button type="submit" class = "next">검색</button>
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
            <h3 class="admintitle"><strong>계정 이용 정지 회원</strong></h3>
            <div class="tab-content">
               <div class="tab-pane fade show active" id="lectureAppro">
				    <% 
                     for (int i = 0; i < members.size(); i++) {
                     %>
                  <div class="card appro-frm-wrap" style = "height: 110px;">
                     <div class="lectureAppro-frm">
                        <!-- 강의승인신청목록 -->
                        <div class="card-header mtAppro-name">회원 ID . [<%=members.get(i).getmId()%>] &emsp;/&emsp; 가입 날짜 : [<%=members.get(i).getmHireDate() %>]
                        </div>

                           <table class="tbl-appro" style = "text-align: center">
                              <tr>
                              	 <td style = "margin-top: 13.5px; margin-left: 10px; text-align: left; width: 100px;"><%=members.get(i).getmName() %></td>
                                 <td style = "margin-top: 13.5px; margin-left: 10px; text-align: left; width: 200px;"><%=members.get(i).getmEmail() %></td>
                                 <td style = "margin-top: 13.5px; margin-left: 10px; text-align: left; width: 100px;"><%=members.get(i).getmPhone() %></td>
                                 <td>
								<button id ="seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath()%>/admin/memberRebirth.do?mId=<%=members.get(i).getmId()%>'">계정 활성화</button>
                                 </td>
                              </tr>        
                           </table>
						<br>
                     </div>
                     <% count++;}  if(count==0) {
							%>
						<div class="card appro-frm-wrap"></div>
					<%} %>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </article>

</div>
</section>
<%@ include file="/views/common/adminFooter.jsp"%>
<script>
$(function(){
	if(<%=count%>==0) {
		alert("조회 결과가 없습니다.");
			
	}
});
</script>
