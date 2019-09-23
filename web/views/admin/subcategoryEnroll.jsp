<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
   <section>
   <%@ include file="/views/common/adminCateAside.jsp"%>
<%@ page import = "com.semi.category.model.vo.Category , com.semi.subcategory.model.vo.SubCategory, java.util.*"%>   
<% 
   List<SubCategory> scList = (List)request.getAttribute("subcategory");
   List<Category> cList = (List)request.getAttribute("category");
%>   
   <section>
  <br>
  <br>
  <br>
    <div id="search1"><strong>수업카테고리(Sub)등록</strong></div>
   <form id="subcategoryFrm" action="<%=request.getContextPath() %>/admin/subcategoryEnrollEnd" method="post">
   <table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3" 
       bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
          <tr>
          <td align="left" width="120" style = "background-color: lavender">
         <font color="#0000ff">*</font>카테고리선택</td>
          <td width="400">
            <select name="maincategory" id="maincategory">
               <option value="0">메인카테고리선택</option>
               <%
                  for (Category c : cList) {
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
         <input name="inputsubcategory" type="text" size="50" maxlength="50">
         </td>
          </tr>
      </table>
      <br>
      <button type="submit" id="subName" name="subName" onclick="enrollSubCategory();" class = "next">등록</button>
      <br><br><br><br>
      <div id="search1">수업카테고리(Sub)수정삭제</div>
      <table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3" 
       bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
          <tr>
          <td align="left" width="120" style = "background-color: lavender">
         <font color="#0000ff">*</font>카테고리선택</td>
          <td width="400">
            <select name="subcategory" id="subcategory">
               <option value="0">서브카테고리선택</option>
               <%
                  for (SubCategory sc : scList) {
               %>
               <option value="<%=sc.getSubNum()%>"><%=sc.getSubName()%></option>
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
         <input name="inputsubcategory2" type="text" size="50" maxlength="50">
         </td>
          </tr>
      </table>
   </form>

           <br>
         <div style = "margin-left: -60px;" class="center1">
           <input type="submit" value="수정" id="subName" name="subName" onclick="updateSubCategory();" class = "next">
           
           <input type="submit" style="margin:0;" value="삭제" id="subName" name="subName" onclick="deleteSubCategory();" class = "next">
           </div>  
        </section>
        <br>
        <br>
        <br>
   
   <script>
   
    function enrollSubCategory(){
          
         var frm=$('#subcategoryFrm');
         var url="<%=request.getContextPath() %>/admin/subcategoryEnrollEnd";
         frm.attr("action",url);
         frm.submit();
      }
    
      function updateSubCategory(){
          
            var frm=$('#subcategoryFrm');
            var url="<%=request.getContextPath() %>/admin/subcategoryUpdate";
            frm.attr("action",url);
            frm.submit();
         }
         
      function deleteSubCategory(){
          
         var frm=$('#subcategoryFrm');
         var url="<%=request.getContextPath()%>/admin/subcategoryDelete";
         frm.attr("action",url);
         frm.submit();
      }


    
        </script>

<%@ include file="/views/common/adminFooter.jsp"%>