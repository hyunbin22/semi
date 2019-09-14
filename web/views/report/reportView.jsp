<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import = "com.semi.report.model.vo.Report" %>
<% Report rp = (Report)request.getAttribute("report"); %>

 <section class="center1">

        <!-- <span id="notice-nav">
            <table id="notice-menu">
                <tr><td>Notice</td></tr>
                <tr><td>Event</td></tr>
                <tr><td>FAQ</0td></tr>
            </table>
        </span> -->
        <article class="admin-list-container wrap">
          <div class="row">
         <div class="col">
            <div class="notice-table">
                <table class="notice-top">
                    <th class="notice-highlight1"></th>
                    <th class="notice-date">첨부파일</th>
                    <th class="notice-title">제목</th>
                    <th class="notice-id">작성자</th>
                </table>
                <table>
                    <tr class="click-notice">
                        <td class="notice-highlight">
                        </td>
                        <td class="notice-date">첨부파일</td>
                        <td class="notice-title"><%=rp.getReportTitle() %></td>
                        <td class="notice-id"><%=rp.getMember().getmId() %></td>
                        <tr class="notice-content">
                            <td colspan="4">
                                <div class="notice-content2">
                                <div class = "report-content">
                                   <%=rp.getReportContent() %>

</div>
                                </div>
                            </td>
                        </tr>
                    <tr class="null">
                    <td colspan="4">
                    <button id ="seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath() %>/admin/AdminReportApproval.do'">뒤로가기</button>
                    <button id ="seeMore" name = "seeMore"  onclick="location.href=''">처리하기</button>
                    </td>
                    </tr>
                </table>
                </div>
                </div>
            </div>
            <!-- <aside class="notice-banner">
            <div><h3>banner</h3></div>
        </aside> -->
        </article>
    </section>




<%@ include file="/views/common/adminFooter.jsp"%>