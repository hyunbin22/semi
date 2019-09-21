<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.moim.model.vo.Moim, java.util.List" %>
<%
	List<Moim> list = (List)request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
%>
<%@ include file="/views/common/header.jsp"%>
 <section class="center1">
	<article>
        <div>
        <br>
        <!-- <div id="search-container"> -->
        <div class="input-group mb-3">
  			<div class="input-group-prepend">
			<select id="searchType" class="btn btn-outline-secondary dropdown-toggle">
				<option value="mId" <%="mId".equals(searchType)?"selected":"" %>>아이디</option>
				<option value="mName" <%="mName".equals(searchType)?"selected":"" %>>이름</option>
				<option value="moim_keyword" <%="keyword".equals(searchType)?"selected":"" %>>키워드</option>
			</select> 
			<div id="search-mId">
				<form action="<%=request.getContextPath()%>/moim/moimListFind.do">
					<input type="hidden" name="searchType" value="mId">
					<input type="hidden" name="cPage" value="<%=cPage%>">
					<input type="text" class="form-control" name="searchKeyword" placeholder="작성자 아이디 입력"
					value='<%="mId".equals(searchType)?searchKey:""%>'>
					<input type="submit" class="form-control" value="검색">
				</form>
			</div>
	 		<div id="search-mName">
				<form action="<%=request.getContextPath()%>/moim/moimListFind.do">
					<input type="hidden" name="searchType" value="mName">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="text" class="form-control" name="searchKeyword" placeholder="작성자 이름 입력"
						value='<%="mName".equals(searchType)?searchKey:""%>'>
					<input type="submit" class="form-control" value="검색">
				</form>
			</div> 
			<div id="search-moim_keyword">
				<form action="<%=request.getContextPath()%>/moim/moimListFind.do">
					<input type="hidden" name="searchType" value="moim_keyword">
					<input type="hidden" name="cPage" value="<%=cPage%>"> 
					<input type="text" class="form-control" name="searchKeyword" placeholder="키워드 입력"
						value='<%="moim_keyword".equals(searchType)?searchKey:""%>'>
					<input type="submit" class="form-control" value="검색">
				</form>
			</div> 
		</div>
		</div></div>
        <%if(memberLogin != null){ %>
            <div><a onclick = "location.href='<%=request.getContextPath()%>/moim/moimEnroll.do?'"><input class="btn btn-outline-danger moimWrite" type="button" value="게시글 작성"></a></div>
            <%} %>
        
        <!-- </div> -->
        <div class="class-pay-container">
            <div class="notice-table" style="width:100%;">
                <table class="table table-hover">
                	<tr>
	                    <th>No</th>
	                    <th>제목</th>
	                    <th>작성자</th>
	                    <th>작성일</th>
	                    <th>조회수</th>
                    </tr>
                    <%for(Moim moim : list){ %>
                    <tr class="click-notice">
		            <%if(list.size()>0 && list!=null) {%>
		            	<td><%=moim.getMoimNum() %></td>
			            <td><a href="<%=request.getContextPath()%>/moim/moimView.do?moimNum=<%=moim.getMoimNum() %>"><%=moim.getMoimTitle() %></a></td>
			            <td><%=moim.getMember().getmId() %></td>
			            <td><%=moim.getMoimDate() %></td>
		         		<td><%=moim.getMoimReadCount() %></td>
			         <%} else { %>
			         <td>
				         <div style="height:90px;">
				         </div>
			         </td>
			         <%} 
		            }%>         
                </table>
            </div>
            <br>
            </div>         <!-- class-pay-container 끝 -->
            <div class="center1"><%=request.getAttribute("pageBar")%></div>
	</article>
   </section>

<script>
	$(function(){
		var sid = $("#search-mId");
		var sname = $("#search-mName");
		var skeyword = $('#search-moim_keyword');
		var searchType=$("#searchType");
		searchType.change(function() {
			sid.hide();
			sname.hide();
			skeyword.hide();
			$("#search-"+this.value).show().css("display","inline-block");
		});
		$("#searchType").trigger('change');
		
	});
	
	$(function(){
		if(<%=list%>==null || <%=list.size()%>==0) {
			alert("조회 결과가 없습니다.");
		}
	})


</script>
<%@ include file="/views/common/footer.jsp" %>