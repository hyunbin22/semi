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
  <div style = "margin-left: 200px; font-family: 'Noto Sans KR', sans-serif;">
    <div id="search1"><strong>수업카테고리(Sub)</strong></div>
    <br>
	<form id="subcategoryFrm" action="<%=request.getContextPath() %>/admin/subcategoryEnrollEnd" method="post">
		<table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3" 
		 bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
		    <tr>
		    <td align="left" width="120" style = "background-color: lavender">
			<font color="#0000ff">*</font>카테고리선택</td>
		    <td width="400">
				<select name="maincategory" id="maincategory">
					<option value="0">카테고리선택</option>
					<%
						for (Category c : cList) {
					%>
					<option value="<%=c.getScNum()%>"><%=c.getScName()%></option>
					<%
						}
					%>
				</select>
			    <select id="good" name="subcategory">
					<option>과목선택</option>
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
	</form>
</div>
           <br>
           <div style = "margin-left: -20px">
           <button type="submit" id="subName" name="subName" onclick="enrollSubCategory();" class = "next">등록</button>
           <button type="submit" id="submit2" class = "next">수정</button>
           <button type="submit" id="submit3" class = "next">삭제</button>
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
	 $(function(){
         $("#maincategory").click(function(){
            $.ajax({
               url : "<%=request.getContextPath()%>/selectSubCategory?scNum=" + $('#maincategory').val(),
               type : "post",
               dataType : "html",
               success:function(data){
                  $("#good").find("option").remove();
                  var datas = data.split(",");
            
                       for(var i = 0; i < datas.length; i++){    
                          if(data==0){
                             $("#good").append("<option value='1'>과목선택</option>");
                          }else{
                       console.log(datas[i]);                        
                          $('<option value="' + (i+1) +'">' + datas[i] + '</option>').appendTo('#good');
                    }
                       }
               }
            });
         });
      });
    
        </script>

<%@ include file="/views/common/adminFooter.jsp"%>