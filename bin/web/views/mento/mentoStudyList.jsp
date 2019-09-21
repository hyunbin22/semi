<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.lecture.model.vo.Lecture, java.util.*, com.semi.lecture.model.vo.LectureUpload" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	List<Lecture> list = (List)request.getAttribute("list");
    %>
      <%@ include file="/views/common/myPageAside.jsp" %>
      	  	<div class="wrap">
      	  		<div id="myPageContentWrap">
             <div class="bar">
					<br>
					<br>
                    <h1 class="center1">멘토강의목록</h1>
                    <br><br>
                    <hr>
                    <br>
                </div>
                <div class="center1">
                    <table id = "list" border="1">
                    
                            <tr class = "listName">
                                    <td class = "listNumber">No</td>
                                    <td class = "listContent">강의 이름</td>
                                    <td class = "listContent">상세보기</td>
                                    <!-- <td class = "listCheck">선택</td> -->
                                </tr>
                                
                        <%
						for (int i = 0; i < list.size(); i++) {
						%>
						<tr class = "list">
                            <td class = "listNumber"><%= i+1 %></td>
                            <td class = "listContent"><span><%=list.get(i).getLecName() %></span></td>
                            <td class = "listCheck">
                            	<button id = "seeMore" name = "seeMore"  onclick="location.href='<%=request.getContextPath()%>/mento/updateStudy.do?lecNum=<%=list.get(i).getLecNum() %>&mtNum=<%=mt.getMtNum()%>'">자세히</button>
                            </td>
                        </tr>
						<%
							}
						%>                
              
                    </table>
                    <br>
                </div>
            </div>
            </div>
            </div>
            </div>
      </section>
    <%@ include file = "/views/common/footer.jsp" %>
    