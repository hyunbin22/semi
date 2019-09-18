<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.lecture.model.vo.Lecture, java.util.*, com.semi.lecture.model.vo.LectureUpload" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	Mento mt = (Mento)session.getAttribute("loginMento");
    	Member m = (Member) session.getAttribute("loginMember");
    	List<Lecture> list = (List)request.getAttribute("list");
     	//LectureUpload lu = (LectureUpload)request.getAttribute("lu");
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
					<br>
					<br>
                    <h1 class="center1">멘토강의목록</h1>
                    <br><br>
                    <hr>
                    <br>
                </div>
                <div class="center1">
                  <!--   <form action = "" method="POST"> -->
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
                 <!--    </form> -->
                    <br>
                </div>
            </div>
      </section>
    <%@ include file = "/views/common/footer.jsp" %>
    