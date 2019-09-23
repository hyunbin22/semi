<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.notice.model.vo.Notice, com.semi.notice.model.vo.NoticeUpload" %>

<%
	Notice n=(Notice)request.getAttribute("notice");
	NoticeUpload nu=(NoticeUpload)request.getAttribute("noticeUpload");
%>
    <section class="qna center1">
    <form>
		<input type="hidden" name="nNum" value="<%=n.getnNum() %>">
    </form>
        <p class="noticeView-title">공지사항</p>
        <div class="qna-table1">
            <div class="qna-inbox">              
                <div class="qna-boxTilte">
                    <div class="qna-boxTitle-Left">
                        <table>
                            <tr>
                                 <td class="qna-subTitle"><%=n.getnNum() %></td>
                                <td class="qna-titleNull"></td>
                                <td class="qna-titleName"><%=n.getnName() %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="qna-boxTitle-Right">
                        <table>
                            <tr>
                                <td><%=n.getnDate() %></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="board-boxpline-dashed"></div>
                <div class="qna-box-nameline">
                    <table class="Nlinesize">
                        <tr>
                         <td class="noticewriterP">관리자</td>
                        </tr>
                    </table>

                </div>
                 <div class="qna-box-content">
                    <pre>
<%=n.getnText() %>
                    </pre>
                </div> 
                <br><br><br>
            <div class="NoticeFileDownload">첨부파일
   					<%if(nu.getFileReNmae()!=null) {%>
						<a href="javascript:fn_filedown('<%=nu.getFileOriName()%>','<%=nu.getFileReNmae()%>')">
							<!-- <img src=""> -->
							<%=nu.getFileReNmae() %></a>
					<%} %>
					</div>
					<script>
						function fn_filedown(ori,re){
							var file=encodeURIComponent(ori);
							location.href="<%=request.getContextPath()%>/notice/noticeDownload?orifileName="+file+"&refileName="+re;
						}
						
					</script>
		</div>
<br>
	</div>
        

        <br><!--------------------------------------------------->
    </section>
    <%@ include file="/views/common/footer.jsp"%>