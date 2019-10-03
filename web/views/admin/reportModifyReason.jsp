<%@page import="com.semi.report.model.vo.ReportUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import = "com.semi.report.model.vo.Report , com.semi.report.model.vo.ReportUpload" %>
<% 
	Report rp = (Report)request.getAttribute("report"); 
	Report rp2 = (Report)request.getAttribute("report2");
 	ReportUpload rpu = (ReportUpload)request.getAttribute("reportUp");
%>

 <section>

        <article class="admin-list-container wrap">
          <div class="row">
         <div class="col">
            <div class="notice-table2">
            <form id = "replyFrm" action = "/admin/adminReportModifyReasonEnd.do" method = "post">
            <input type="hidden" name="reportNo" value=<%=rp.getReportNum() %>>
                <table class="notice-top">
                	<tr>
	                    <th class="notice-highlight1"></th>
	                                        <th></th>
	                    <th class="notice-date">첨부파일</th>
	                                        <th></th>
	                    <th class="notice-title"> 제목</th>
	                    <th class="notice-id">작성자</th>
                    </tr>
                </table>
                <table>
                    <tr class="click-notice">
                        	<td class="notice-highlight">
                        </td>
                        <td class="notice-date"><%if(rpu.getFileReNmae()!=null) {%>
						<a href="javascript:fn_filedown('<%=rpu.getFileOriName()%>','<%=rpu.getFileReNmae()%>')">
							<img src="<%=request.getContextPath() %>/image/첨부파일.png"
							width='40px'/>
							<%=rpu.getFileReNmae() %>
						 </a>
					<%} %>
					<script>
						function fn_filedown(ori,re){
							var file=encodeURIComponent(re);
							location.href="<%=request.getContextPath()%>/admin/reportFileDown?orifileName="+file+"&refileName="+re;
						}
						
					</script>
						</td>
                       	<td class="notice-title"><%=rp.getReportTitle() %></td>
                        <td class="notice-id"><%=rp.getMember().getmId() %></td>
                        <tr><td colspan = "4"><hr></td></tr>
                        <tr><td colspan = "4">신고 당한 ID : <%=rp2.getMember().getmId() %></td></tr>
                        <tr class="notice-content">
                            <td colspan="4">
                                <div class="notice-content2">
                                <div class = "report-content">
                                   <%=rp.getReportContent() %>

								</div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                        <td colspan="4">답변 수정</td>
                        </tr>
                        <tr>
                        <td colspan="4">
                        <textarea rows="10" cols="110" style="resize: none;" name = "rReply" id = "rReply"><%=rp.getReportReason() %></textarea>
                        </td>
                        </tr>
                        <tr class = "notice-top">
                        <td colspan="2">
                        	ID 사용정지 처리 :
                        </td>
                        <td colspan="2">
                        
                        <%if(rp2.getMember().getmUse() != 'Y'){ %>
                        	이용정지 O
                        <%} else {%>
                        	이용정지 X
                        <% } %>	
                 
                        </td>
                        <td colspan="3">
                        </td>
                        </tr>
                </table>
                <table class = "center1">
                    <tr class="null">
                    <td>
                    <input type = "submit" id = "seeMore" value = "답변수정하기"/>
                    </td>
                    </tr>
                </table>
                </form>
                </div>
                </div>
            </div>
        </article>
        <%@ include file="/views/common/adminAside.jsp"%>
    </section>
    
	<script>
	function checkValue(){ 
		var reportReply = $('#rReply');
          if(reportReply.val().length==0){
  			alert('답변을 입력하세요');
  			reportId.focus();
              return false;
  			}
          return true;
          }
	
	</script>



<%@ include file="/views/common/adminFooter.jsp"%>