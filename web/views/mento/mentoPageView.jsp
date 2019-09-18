<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.mento.model.vo.MentoUpload, java.util.*" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	Mento mt = (Mento)session.getAttribute("loginMento");
    	Member m = (Member)session.getAttribute("loginMember");
    	MentoUpload mu = (MentoUpload)request.getAttribute("mentoUpload");
    %>
<section class = "center1">
            <div class="wrap">
                <div class="bar">
                        <br>
                        <table class = "MYLIST">
                                <tr>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/memberMyPage.do?mId=<%=m.getmId()%>'" id = "listBtn">마이페이지</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/mypageModify.do?mId=<%=m.getmId()%>'" id = "listBtn">내정보수정</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/studyList.do?mNum=<%=m.getmNum()%>'" id = "listBtn">신청한강의</button></td>
                                    <td><button onclick="location.href='LIKELIST.html'" id = "listBtn">즐겨찾기목록</button></td>
                                	 <%if(mt != null && m.getmNum() == mt.getmNum()) { %>
                                    
                                    <%} else { %>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/mento/mentoRegister.do?mId=<%=m.getmId()%>'" id = "listBtn">멘토신청하기</button></td>    
                                	<%} %>
                                </tr>
                        </table>
                        <table class = "MYLIST">
                                <tr>
                                    <%if(mt != null && m.getmNum() == mt.getmNum()) { %>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/mento/mentoMyPage.do?getmNum=<%=mt.getmNum()%>&getMtNum=<%=mt.getMtNum() %>'" id = "listBtn">멘토페이지</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/mento/mypageModify.do?mtnum=<%=mt.getMtNum()%>'" id = "listBtn">멘토정보수정</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/mento/studyList.do?mtnum=<%=mt.getMtNum()%>'" id = "listBtn">멘토강의목록</button></td>                                 
                                    <%} else { %>
                                    
                                    <%} %>
                                    <%if(mt != null && m.getmNum() == mt.getmNum()) { %>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/mento/enrollLecture.do?mtNum=<%=mt.getMtNum()%>'" id = "listBtn">강의만들기</button></td>
                                    <%} else { %>
                                        
                                	<%} %>
                                </tr>
                        </table>
                        <br><br>
                    <h1 class="center1">멘토페이지</h1>
                    <br><br>
                    <hr>
                </div>
                <div class="regdata center1">
                    <table class="tblreg">
                        <tr>
                            <td>닉네임</td>
                            <td>
                     			 <%=mt.getMtNickName()%>
                            </td>
                            <td>
   
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>인증방법</td>
                            <td>
                                <%=mt.getMtHowConfirm()%>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                         <tr>
                            <td>자격증</td>
                            <td>
                   		<%-- 		<%=mu.getUpMentoNameLicense()%>	 --%>			
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>학력</td>
                            <td> 
                            	<%=mt.getMtAcademic() %> 
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>전공학과</td>
                            <td> <%=mt.getMtAcademicDept() %></td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>재학/졸업</td>
                            <td>
                                <span><%=mt.getMtGraduation() %></span> 
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td>은행</td>
                            <td>
                               <%=mt.getBank() %>
                            </td>
    
                            <td>

                            </td>
                        </tr>
                        <tr>
                        </tr>
                            <tr>
                            <td>계좌번호</td>
                            <td>
                               <%=mt.getAccountNumber() %>
                            </td>
    
                            <td>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>

    	<%@ include file = "/views/common/footer.jsp" %>
    	