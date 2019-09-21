<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.mento.model.vo.MentoUpload, java.util.*" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	MentoUpload mu = (MentoUpload)request.getAttribute("mentoUpload");
    %>
	<%@ include file="/views/common/myPageAside.jsp" %>
	<div class="wrap">
	<div id="myPageContentWrap">
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
                               <%=mt.getMtBank() %>
                            </td>
    
                            <td>

                            </td>
                        </tr>
                        <tr>
                        </tr>
                            <tr>
                            <td>계좌번호</td>
                            <td>
                               <%=mt.getMtAccountNumber() %>
                            </td>
    
                            <td>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            </div>
            </div>
        </section>

    	<%@ include file = "/views/common/footer.jsp" %>
    	