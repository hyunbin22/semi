<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page
   import="com.semi.report.model.vo.Report, com.semi.mento.model.vo.Mento, java.util.*"%>
   <% List<Report> list = (List)request.getAttribute("list"); 
		int cPage=(int)request.getAttribute("cPage");
		String pageBar=(String)request.getAttribute("pageBar");
   %>

<section>


 <div id="admin-Mento-Search-container">
   <article class="admin-list-container wrap">
      <div class="row">
         <div class="col">
            <h3 class="admintitle">신고처리대기목록</h3>
            <div class="tab-content">
               <div class="tab-pane fade show active" id="lectureAppro">
                  <div class="card appro-frm-wrap">
                     <%
                     for (int i = 0; i < list.size(); i++) {
                     %>
                     <div class="lectureAppro-frm" style="height: 280px">
                        <!-- 강의승인신청목록 -->
                        <div class="card-header mtAppro-name"><%=list.get(i).getReportId()%>
                        </div>
                        <div class="card-body">
                           <table class="tbl-appro">
                              <tr>
                                 <td><h5 class="card-title"><%=list.get(i).getmAttackerNum()%></h5></td>
                              </tr>
                              <tr>
                                 <td rowspan="2">
                                 </td>

                                 <td><p class="approDate"></p></td>
                                 <td>

                                 </td>
                              </tr>
                           </table>
                        </div>
                     </div>
                     <%
                      
                      }         
                     %>
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
   </div>

<%@ include file="/views/common/adminAside.jsp"%>

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