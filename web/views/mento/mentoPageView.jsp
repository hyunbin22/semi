<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.mento.model.vo.MentoUpload, java.util.*" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	List<MentoUpload> muList = (List)request.getAttribute("mentoUpload");
    	Mento mt2 = (Mento)request.getAttribute("mento");
    %>
	<%@ include file="/views/common/myPageAside.jsp" %>
                    <section>
	<div class="wrap">
	<div id="myPageContentWrap">
                 <div class="bar">
					<br>
					<br>
                    <h1 class="center1">멘토페이지</h1>
                    <br><br>
                    <hr>
                    <br>
                </div>
                <div class="regdata center1">
                    <table class="tblreg center1">
                        <tr>
                        <div class="box">
                            <td class="lecture">닉네임</td>
                            <td class="title2">
                     			 <%=mt2.getMtNickName()%>
                            </td>
                            <td>
   
                            </td>
                            </div>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        <div class="box">
                            <td class="lecture">인증방법</td>
                            <td class="title2">
                                <%=mt2.getMtHowConfirm()%>
                            </td>
                            </div>
                        </tr>
                        <tr>
                        </tr>
                         <tr>
                         <div class="box">
                            <td class="lecture">자격증명</td>
                           <td class="title2">
                            <%for(int i=0; i<muList.size(); i++) {
                            	if(muList.get(i).getUpMentoNameLicense()!=null){
                            		%>
                           <%=muList.get(i).getUpMentoNameLicense()+"." %>
                            <%
                            }
                            }%>
                            </td>
                            </div>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        <div class="box">
                            <td class="lecture">학력</td>
                            <td class="title2"> 
                <%       	if(mt2.getMtAcademic()!=null){
                            		%>
                           <%=mt2.getMtAcademic() %> 
                            <%
                                  }%>
     
                            </td>
                            </div>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        <div class="box">
                            <td class="lecture">전공학과</td>
                          <td class="title2"> 
                             <%
                            	if(mt2.getMtAcademicDept() !=null){
                            		%>
                            		 <%=mt2.getMtAcademicDept() %>
                            <%
                            }
                            %>
   							  </td>
                            
                            </div>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        <div class="box">
                            <td class="lecture">재학/졸업</td>
                            <td class="title2">
                                <span><%=mt2.getMtGraduation() %></span> 
                            </td>
                        </div>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                        <div class="box">
                            <td class="lecture">은행</td>
                            <td class="title2">
           							<%=mt2.getMtBank() %>
                            </td>
    
                            <td>

                            </td>
                            </div>
                        </tr>
                        <tr>
                        </tr>
                            <tr>
                            <div class="box">
                            <td class="lecture">계좌번호</td>
                            <td class="title2">
                               <%=mt2.getMtAccountNumber() %>
                            </td>
    
                            <td>

                            </td>
							</div>
                        </tr>
                    </table>
                </div>
            </div>
            </div>
            </div>
        </section>

    	<%@ include file = "/views/common/footer.jsp" %>
    	