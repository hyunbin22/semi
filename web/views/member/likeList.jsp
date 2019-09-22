<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.* , com.semi.bookmark.model.vo.Bookmark"%>
    <%@ include file = "/views/common/header.jsp" %>
    <% List<Bookmark> list = (List)request.getAttribute("list"); 
    	int cPage=(int)request.getAttribute("cPage");
		String pageBar=(String)request.getAttribute("pageBar");
		int count = 0;%>
    <section>
	<%@ include file="/views/common/myPageAside.jsp" %>
	  	<div class="wrap">
	  	<div id="myPageContentWrap">
             <div class="bar">
				<br>
                <h1 class="center1"><strong>즐겨찾기</strong></h1>
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
                    <% count ++;} %>
					<%if(count == 0){ %>
					<tr class = "list">
					<td colspan="4">즐겨찾기 등록된 강의가 없습니다.</td>
					</tr>
					<%} %>
                    </table>
                 <br><br>
			 	<%if(count > 0){ %>
					<div id="admin-appro-pageBar">
         				<%=request.getAttribute("pageBar")%>
      				</div>
      			<%} %>
         
  
  					</div>
                </div>
            </div>
      </section>

    <%@ include file = "/views/common/footer.jsp" %>