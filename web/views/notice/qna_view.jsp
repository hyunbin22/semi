<%@page import="oracle.net.aso.q"%>
<%@page import="sun.invoke.empty.Empty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.qna.model.vo.Qna, 
				 com.semi.qna.model.vo.QnaComment, 
				 com.semi.qna.model.vo.QnaUpload, 
				 com.semi.member.model.vo.Member" %>
<%
	Qna q=(Qna)request.getAttribute("qna");
	QnaUpload qu=(QnaUpload)request.getAttribute("qnaUpload");
	QnaComment qc=(QnaComment)request.getAttribute("qComment");
	Member m = (Member) session.getAttribute("loginMember");

	/* QnaComment qc=(QnaComment)request.getAttribute("qnaComment"); */
%>
    <section class="qna center1">
    <form>
    	<input type="hidden" name="qNum" value="<%=q.getqNum() %>">
    	<input type="hidden" name="qtitle" value="<%=q.getqTitle() %>">
    	<input type="hidden" name="qcontent" value="<%=q.getqContent() %>">
    	<input type="hidden" name="qdate" value="<%=q.getqDate() %>">
      	
    	<input type = "hidden" name = "mNum" value = "<%=m.getmNum() %>">
    	
    	<input type="hidden" name="qRef" value="<%=q.getqNum()%>">
    	
    	
    	
    </form>
        <p class="qna-title">1:1문의</p>
        <div class="qna-table1">
            <div class="qna-inbox">              
                <div class="qna-boxTilte">
                    <div class="qna-boxTitle-Left">
                        <table>
                            <tr>
                                 <td class="qna-subTitle"><%=q.getqNum() %>. </td>
                                <td class="qna-titleNull"></td>
                                <td class="qna-titleName"><%=q.getqTitle() %></td>
                            </tr>
                        </table>
                    </div>
                    <div class="qna-boxTitle-Right">
                        <table>
                            <tr>
                                <td><%=q.getqDate() %></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="board-boxpline-dashed"></div>
                <div class="qna-box-nameline">
                    <table class="Nlinesize">
                        <tr>
                         <td class="noticewriterP"><%=q.getMember().getmId() %></td>
                        </tr>
                    </table>

                </div>
                 <div class="qna-box-content">
                    <pre>
<%=q.getqContent() %>
                    </pre>
                </div> 
                <br><br><br>
  					<%if(qu.getUpQnaReName()!=null) {%>
            <div class="NoticeFileDownload">첨부파일
						<a href="javascript:fn_filedown('<%=qu.getUpQnaOrgName()%>','<%=qu.getUpQnaReName()%>')">
							<!-- <img src=""> -->
							<%=qu.getUpQnaReName() %></a>
					</div>
					<%} %>
					<script>
						function fn_filedown(ori,re){
							var file=encodeURIComponent(ori);
							location.href="<%=request.getContextPath()%>/qna/qnaFileDown?orifileName="+file+"&refileName="+re;
						}
						
					</script>
            	</div>
	
			
             <div class="qna-answer-box">
                <%if(qc!=null && !qc.getQcContent().isEmpty()){ %>
                <br>
                <ul class="comment-content">
                    <li class="comment-content-time">
                        <table>
                            <tr>
                                <td class="comment-content-1">관리자</td>
                                <td class="comment-content-2">|</td>
                                <td class="comment-content-3">작성일 : <%=qc.getQcDate() %></td>
                            </tr>                            
                        </table>
                    </li>

                    <li class="li-linestyle"> </li>
                    <table>
                             <tr>
                            	<td class="qna_commentB_width">
                            		<%=qc.getQcContent()%>
                            	</td>
                            </tr>
                            
                            <script>
							$(function(){
								$('.btn-delete').click(function(){
									if(confirm("정말로 삭제하시겠습니까?")){
										location.href="<%=request.getContextPath()%>/qna/qnaCommentDelete.do?qnaNo=<%=q.getqNum()%>&commentNo="+$(this).val();
									}
								});
							});
							</script>
                    </table>
                    <%if(memberLogin.getmId().equals("kiho") || memberLogin.getmId().equals("admin") || memberLogin.getmId().equals("gusqls897") || memberLogin.getmId().equals("rldh8") || memberLogin.getmId().equals("thd9292")) {%>
                    <br><br><br>
                    <div class="center1">
                    	<button class="btn-delete next" value="<%=qc.getqRef() %>">댓글 삭제</button>
					</div>
                    <%} %>
                </ul>
               <%} %>
                <%if(memberLogin != null && qc==null){
               if(memberLogin.getmId().equals("kiho") || memberLogin.getmId().equals("admin") || memberLogin.getmId().equals("gusqls897") || memberLogin.getmId().equals("rldh8") || memberLogin.getmId().equals("thd9292")) {%>
	                <form action = "<%=request.getContextPath()%>/qna/qnaComment.do" method="POST"  >
		                <table class="comment-inputLine">
		                    <tr>
		                        <td>
		                            <div class="commentText-outLine">
		                                <textarea name="qcContentIn" id="commentText" cols="50" rows="2" class="textareaComment"></textarea>
		                            </div>
		                        </td>
		                        <td>
		                            <div>
		                                <input type="submit" value="등록" class="answerButton">
		                            </div>
		                        </td>
		                    </tr>
		                </table>
	                <input type="hidden" name="qcNum" value="<%=q.getqNum() %>">
	                <input type = "hidden" name = "qcmNum" value = "<%=m.getmNum() %>">
	                </form>
            </div>
        </div>
				<%}
				}%>
				<%if(memberLogin!=null){
					if(memberLogin.getmId().equals(q.getMember().getmId()) && qc==null){%>
				<div class="center1">
				<br>
					<button class="updateButton next" value="">수정</button>
				</div>
				<%}
				}%>
		        <script>
					$(function(){
						$('.updateButton').click(function(){
							if(confirm("내용을 수정하시겠습니까?")){
								location.href="<%=request.getContextPath()%>/qna/qnaUpdate.do?qNum=<%=q.getqNum()%>";
							}
						});
					});
				</script>
        <!--------------------------------------------------->
    </section>
    <%@ include file="/views/common/footer.jsp"%>