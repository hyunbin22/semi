<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.* , com.semi.bookmark.model.vo.Bookmark"%>
    <%@ include file = "/views/common/header.jsp" %>
    <% List<Bookmark> list = (List)request.getAttribute("list"); %>
    <section>
	<%@ include file="/views/common/myPageAside.jsp" %>
	  	<div class="wrap">
	  	<div id="myPageContentWrap">
             <div class="bar">
				<br>
                <h1 class="center1">즐겨찾기</h1>
                <br><br>
                <hr>
                <br>
             </div>
             <div class="center1 myPage-content-wrap">
                  <table id = "list" border="1">
                            <tr class = "listName">
                                    <td class = "listNumber">No</td>
                                    <td class = "listContent">강의 이름</td>
                                    <td class = "listCheck">상세</td>
                                    <td class = "listCheck">삭제</td>
                                </tr>
					<%for(int i = 0; i <list.size(); i ++) {%>
                        <tr class = "list">
                            <td class = "listNumber"><%=(i+1) %></td>
                            <td class = "listContent"><span><%=list.get(i).getLecture().getLecName() %></span></td>
                            <td class = "listContent"><span><button class = "next" onclick = "location.href='<%=request.getContextPath()%>/member/seeMoreStudy.do?lecNum=<%=list.get(i).getLecNum()%>'">상세보기</button></span></td>
                            <td class = "listCheck"><span><button class = "next" onclick = "location.href=''">삭제</button></span></td>
                        </tr>
                    <%} %>

                    </table>
                 <br>

         
  
  					</div>
                </div>
            </div>
      </section>


      	
      	
  
    <%@ include file = "/views/common/footer.jsp" %>