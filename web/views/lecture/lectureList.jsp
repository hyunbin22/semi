<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.semi.lecture.model.vo.Lecture" %>
<%@ page import="java.util.List"%>
<%@ page import="com.semi.category.model.vo.Category" %>
<%@ page import="com.semi.subcategory.model.vo.SubCategory" %>
<%
   int cPage=(int)request.getAttribute("cPage");
   String pageBar=(String)request.getAttribute("pageBar");
   List<Lecture> list = (List)request.getAttribute("list");
   List<Category> category = (List)request.getAttribute("category");
   List<SubCategory> subCategory = (List)request.getAttribute("subcategory");
   
%>

<%@ include file="/views/common/header.jsp"%>

<section>
<aside>
   <form action="<%=request.getContextPath()%>/lecture/lectureListSearch.do">
      <div class="wrap">
         <div class="lectureFloatMenu">
            <div class="lectureFloatTitle">
               검색
               <hr>
            </div>
            <div class="lectureFloatsubtitle">메인 카테고리</div>
            <div id="select_box1">
               <select id="category" class="color" title="select color">
	               <%for (Category c : category){ %>
	                        <option value="<%=c.getScNum()%>"><%=c.getScName() %></option>
	               <%} %>
               </select>
               
            </div>
            <div class="lectureFloatsubtitle">서브 카테고리</div>
            <div id="select_box1">
               <select id="subCategory" class="color" title="select color" name="subName">
	               <div id="subCategoryVal">
	               		서브카테고리
	               </div>
               </select>
            </div>

            <script>
            
            $(window).scroll(function() {
               if ($(window).scrollTop() > 420) {
                  $('.lectureFloatMenu').addClass("lectureFix");
                  $('.lectureFloatMenu').addClass("right");
                  $('.lectureFloatMenu').removeClass("lectureFloatMenu");

               } else {
                  $('.lectureFix').addClass("lectureFloatMenu");
                  $('.lectureFix').removeClass("lectureFix");

               }
            });

            
            $(function(){
            	
            	$("#category").click(function(){
            		
            		$.ajax({
            			url:"<%=request.getContextPath()%>/selectSubCategory?scNum="+$("#category").val(),
            			type:"post",
            			dataType:"html",
            			success:function(data){
            				
            				var datas=data.split(",");
            				$('#subCategory').find("option").remove();
            				for(var i = 0; i < datas.length; i++){    
                                if(data==0){
                                   $("#local").append("<option value='1'></option>");
                                }else{
	                             	 // 이전에 있던 option들 삭제
	                                $('<option value="' + datas[i] +'">' + datas[i] + '</option>').appendTo('#subCategory');
                          		}
                             }

            				
            				/* if($("#category").val()!=$("#subCategory").val()){
            					console.log($("#category").val());
            					console.log($("#subCategory").val());
            					$("#subCategory").find("option").remove();
            				} */
            			}
            		});
            	});
            });
               $(function() {
                  var select = $("select#color");

                  select.change(function() {
                     var select_name = $(this).children(
                           "option:selected").text();
                     $(this).siblings("label").text(select_name);
                  });
               });
            </script>
            <div>
               <input type="submit" value="확인" class="classSubmit">
            </div>
            <section class= "page1">
			    <div class="page" id="pageBar">
			       <%=pageBar %>
			       <br>
			        
			    </div>
			</section>

         </div>
      </div>

   </form>
</aside>

<p id="title" class="lectureListText">강좌리스트</p>


        
    
    <div class="LectureMainFrame">
        <%for(Lecture lec : list){ 
        %>
        
        

                  
        <table class="lectureTable"  style="cursor:pointer;" onclick="location.href='<%=request.getContextPath() %>/lecture/lectureView?lecnum=<%=lec.getLecNum()%>'">
            <tr>
                <td colspan="4">
                	<div class="img300px">
                      <img class="img300px" src="<%=request.getContextPath()%>/upload/lecture/<%=lec.getLectureUpload().getUpLectureReName()%>">
                   </div>
                </td>
            </tr>
            <tr>
                <td colspan="3"class="lectureListName" ><%=lec.getLecName() %></td>
                <td class="classplace">위치 | <%=lec.getLecMeet() %></td>
            </tr>
            <tr>
                <td colspan="4" class="classinfo">

                    <%=lec.getLecMento().getMtNickName() %>

                    <hr>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" class="classScore"><b>Type</b><br><%=lec.getLecType() %></td>
                <td colspan="2" class="classmoneytime"><b>Money</b><br><%=lec.getLecPrice() %></td>
            </tr>
            
        </table>
        
        
        <%} %>
        
		&nbsp;
        
    </div>
</section>
<div id="listbottom">
		
		</div>
<%@ include file="/views/common/footer.jsp"%>