<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,
				 com.semi.qna.model.vo.Qna,
				 com.semi.qna.model.vo.QnaComment, 
				 com.semi.qna.model.vo.QnaUpload,
				 com.semi.member.model.vo.Member" %>
<%
	List<Qna> list=(List)request.getAttribute("qna");
	/* Qna q=(Qna)request.getAttribute("qna"); */
	int cPage=(int)request.getAttribute("cPage");
	String pageBar=(String)request.getAttribute("pageBar");
	Member m=(Member)request.getAttribute("member");
%>
    <section class="qna center1">
    
        <br>
        <p class="qna-title">1:1문의</p>
        <div class="">
        <%if(memberLogin != null){ %>
            <a onclick = "location.href='<%=request.getContextPath()%>/views/notice/qna_form.jsp'"><input class="notice-write next" type="button" value="문의하기"></a>
            <%} %>
        </div>  <br>
		<%for(int i = 0; i < list.size(); i++){ %>
		<form>
    		<input type="hidden" name="qNum" value="<%=list.get(i).getqNum()%>">
    	</form>
		<br>
        <div class="qna-table1">
            <div class="qna-inbox">              
                <div class="qna-boxTilte">
                    <div class="qna-boxTitle-Left">
                        <table>
                            <tr>
                                 <td class="qna-subTitle"><%=list.get(i).getqNum() %>.</td>
                                <td class="qna-titleNull"></td>
                                 
                                <td class="qna-titleName"><a href="<%=request.getContextPath()%>/qna/qnaView.do?qNum=<%=list.get(i).getqNum()%>"><%=list.get(i).getqTitle()%></a></td>
                                
                            </tr>
                        </table>
                    </div>
                    <div class="qna-boxTitle-Right">
                        <table>
                            <tr>
                                <td><%=list.get(i).getqDate() %></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="board-boxpline-dashed"></div>
                <div class="qna-box-nameline">
                    <table class="Nlinesize">
                        <tr>
                            <td class="noticewriterP">작성자 : <%=list.get(i).getMember().getmId() %></td>
                        </tr>
                        <tr>

                            <td>	<%=list.get(i).getqContent() %> </td>

                        </tr>
                    </table>
                </div>
<%--                 <div class="qna-box-content">
                    <p>
<%=list.get(i).getqContent() %>
                    </p>
                </div> --%>
           
 
            	</div>

            <!-- <div class="qna-answer-box">
                <br>
                <ul class="comment-content">
                    <li class="comment-content-time">
                        <table>
                            <tr>
                                <td class="comment-content-1" name="">달린댓글</td>
                                <td class="comment-content-2">|</td>
                                <td class="comment-content-3">2019.09.03 16:32</td>
                            </tr>
                        </table>
                    </li>
                    <li class="li-linestyle"> </li>
                </ul>
                <table class="comment-inputLine">
                    <tr>
                        <td>
                            <div class="commentText-outLine">
                                <textarea name="qcContent" id="commentText" cols="50" rows="2" class="textareaComment"></textarea>
                            </div>
                        </td>
                        <td>
                            <div>
                                <input type="button" value="등록" class="answerButton">
                            </div>
                        </td>
                    </tr>
                </table>
            </div> -->
        </div>
        <%} %>
        <br>
        <div class="center1">
        	<%=request.getAttribute("pageBar")%>
        </div>
        <br><!--------------------------------------------------->
    </section>
    <%@ include file="/views/common/footer.jsp"%>