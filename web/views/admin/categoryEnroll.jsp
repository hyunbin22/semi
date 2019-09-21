<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
<%@ page import = "com.semi.category.model.vo.Category , java.util.*"%>
<% 
	List<Category> list = (List)request.getAttribute("category");
%>
   
	
    <%@ include file="/views/common/adminCateAside.jsp"%>
	<section>
  <br>
  <br>
  <br>
  <div style = "margin-left: 200px">
    <div id="search1"><strong>수업카테고리(Main)</strong></div>
    <br>
    <form name = "form" id="categoryFrm"method="post" style = "font-family: 'Noto Sans KR', sans-serif;">
		<table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3"
		 bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
		    <tr>
		    <td align="left" width="120" style = "background-color: lavender">
			<font color="#0000ff">*</font>카테고리선택</td>
		    <td width="400">
		    
			<select name="selectbank" id="selectbank">
             <option selected value=0>-선택하세요-
				<%
						for (Category c : list) {
					%>
					<option value="<%=c.getScNum()%>"><%=c.getScName()%></option>
					<%
						}
					%>

		    </select>
		    </td>
		    </tr>
		    <tr>
		    <td align="left" width="120" style = "background-color: lavender">
			<font color="#0000ff">*</font>카테고리입력</td>
		    <td width="400">
			<input name="inputcategory" type="text" size="50" maxlength="50"></td>
		    </tr>
		</table>

	</form>
	</div>
           <br>
           <div style = "margin-left: -20px;">
           <button type="submit" id="scName" name="scName" onclick="enrollCategory();" class = "next">등록</button>
           <input type="submit" value="수정" id="submit2" onclick="updateCategory();" class = "next">
           <input type="submit" value="삭제" id="submit2" onclick="deleteCategory();" class = "next">
           </div>
        </section>
        <br>
        <br>
        <br>
	
	<script>
	function updateCategory(){
	       
	      var frm=$('#categoryFrm');
	      var url="<%=request.getContextPath()%>/admin/categoryUpdate";
	      frm.attr("action",url);
	      frm.submit();
	   }
	   
	   
	   function enrollCategory(){
	       
	      var frm=$('#categoryFrm');
	      var url="<%=request.getContextPath() %>/admin/categoryEnrollEnd";
	      frm.attr("action",url);
	      frm.submit();
	   }
	   
	   function deleteCategory(){
	       
	      var frm=$('#categoryFrm');
	      var url="<%=request.getContextPath()%>/admin/categoryDelete";
	      frm.attr("action",url);
	      frm.submit();
	   }
		  
        </script>

<%@ include file="/views/common/adminFooter.jsp"%>