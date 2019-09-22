<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.lecture.model.vo.Lecture" %>
    <%@ page import="java.util.*, com.semi.category.model.vo.Category, com.semi.subcategory.model.vo.SubCategory, com.semi.local.model.vo.Local, com.semi.sublocal.model.vo.SubLocal"%>
    
    <% 
    	String mtNum = (String) request.getAttribute("mtNum");
    	List<Category> cList=(List)request.getAttribute("category");
    	List<SubCategory> scList=(List)request.getAttribute("scList");
    	List<Local> lList=(List)request.getAttribute("local");
    %>
<%@ include file="/views/common/myPageAside.jsp" %>
	  	<div class="wrap">
	  	<div id="myPageContentWrap">
             <div class="bar">
			<br>
			<h1 class="center1">강의 만들기</h1>
			<br>
			<hr>
		</div>
		
		<div class=" center1 myPage-content-wrap">
			<form action="<%=request.getContextPath()%>/lectureEnrollEnd?mtNum=<%=mt.getMtNum()%>" method="POST" enctype="multipart/form-data">
			<div class="box">
				<div class="lecture" >수업제목</div>
				<div>
				<input type="text" id="title" class="title2" name="className" >
				<br> <br>
				<div style='background: #edf0f4; border-radius: 4px; padding: 12px 24px; width: 630px;'>
				<b style='color:#ff005a;'>TIP</b>
				<ul>
					<li>누구를 대상으로 어떤 취미를 공유하나요?</li>
					<li>수업을 통해 어떤것을 얻어갈 수 있나요?</li>
					<li>예시:내 일상을 영상속으로/단 몇번의 수업으로
					 유튜브 영상을 내가직접 업로드♥</li>
				</ul>
				</div>
				</div>
				</div>
				<br><br><br>
				<hr>
				<div class="box">
				<div class="lecture" >수업카테고리</div>
				<select name="maincategory" id="maincategory" class="title2">
					<option value="0">카테고리선택</option>
					<%
						for (Category c : cList) { 
					%>
					<option value="<%=c.getScNum()%>"><%=c.getScName()%></option>
					<%
						}
					%>
				</select>
			    <select id="good" name="subcategory" class="title2">
					<option>과목선택</option>
				</select> 
				</div>
				<br><br>
				<hr>
				<div class="box">
				<div class="lecture">수업형태</div>
				 <input type="text" name="studentCount"	placeholder="수업정원을 입력하세요." class="title2">
				<input type="radio" name="classType" id="r2" value="그룹" checked style='margin-top:19px;'><label	for="r2" style='margin-top:17px; margin:10px;'>그룹수업</label>
				<input type="radio" name="classType" id="r1" value="1대1" style='margin-top:19px;'><label for="r1" style='margin-top:17px; margin:10px;'>1대1수업</label>
				<br> <br>
				</div>
				<br><br>
				<hr>
				<div class="box">
				<div class="lecture">커버사진등록</div>
				 <br>
				  <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;'>
				 <input type='file' id="file1" name="file1" />	<br><br>				
				 <img id="image_section1" src="#" alt="미리보기" style='position: relative; width: 250px; height: 200px; color: black; border: 0px solid black; dispaly: inline;' />
			     </div>
				</div>
				<br><br><br><br><br><br><br>
				<hr>
				<div class="box">
				<div class="lecture">수업사진등록</div>
				<table width="400" border="0" cellspacing="0" cellpadding="0" style= 'margin:0;'>
					<tr>
						<td colspan="2" align="left" bgcolor="#FFFFFF">
							<table width="100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
										<input name="addButton" type="button" style="cursor: hand"
										onClick="insRow()" value="추가"> <font color="#FF0000">*</font>추가버튼을
										클릭해 보세요.
									</td>
								</tr>
								<br>
								<tr>
									<td height="25">
										<table id="addTable" width="400" cellspacing="0"
											cellpadding="0" bgcolor="#FFFFFF" border="0">
											<tr>
												<br>
												<td>
												  <input type='file' id="addImg" name="addImg"/></td>
																						  
												<td align="left"></td>
											</tr>
										</table>
										<br>
										<div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;'>
						        <img id="image_section2" src="#" alt="미리보기" style='position: relative; width: 250px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'/>
			         </div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</div>
				  <br><br><br>		
				<input type="hidden" value=<%=mt.getMtNum() %> name="mtNum">

				<br> <br>
				<hr>
				<div class="box">
				<div class="lecture">멘토소개</div>
				<textarea id="" cols="30" rows="10" name="mentoIntroduce"
					placeholder="내용을 입력해주세요." class="title2"></textarea>
					</div>
				
				<br> 
				<hr>
				<div class="box">
				<div class="lecture">강의소개</div>
				<textarea id="" cols="30" rows="10" name="classIntroduce"
					placeholder="내용을 입력해주세요." class="title2"></textarea>
				</div>
				<br> 
				<hr>
				<div class="box">
				<div class="lecture">시간당가격</div>
				<input type="text" name="price" id="hourPrice" class="title2"> 원 <br>
				</div>
				<br> <br>
				<div class="box">
				<div class="lecture">기본수업시간</div>
				<select name="time" id="time" class="title2">
					<option value="0">선택하세요</option>
					<option value="1">1시간</option>
					<option value="2">2시간</option>
					<option value="3">3시간</option>
					<option value="4">4시간</option>
					<option value="5">5시간</option>
					<option value="6">6시간</option>
				</select> /회 
				</div>
				<br> <br> 
				<div class="box">
				<div class="lecture">총수업(한달기준)</div>
				<input type="text" name="totaltime" id="totalTime"
					placeholder="예) 20회" onkeyup="total()" class="title2">회 
				</div>
				<br> <br> 
				<hr>
				<div class="lecture">총가격</div>

				<div class="calc-total" style=' border-radius: 4px;  padding: 12px 24px; width: 100%; text-align: right; float: right; color: #555; font-size: 15px; background: #edf0f4;'>

					<dl>
						<dt style='text-align:left;'>
							<font id="calc-price"><span id="price2">0</span>
							</font>원 X
							<font id="calc-time"><span id="time2">0</span>
							</font>시간 X
						    <font id="calc-totaltime"><span id="totalTime2">0</span>
						    </font>회
						</dt>
						<dd style='color: #ff005a; font-size:20px'>
							총 <font id="calc-result" ><span id="totalPrice2">0</span></font>원
						</dd>
						<dd>
							연결수수료 <font id="calc-fee"><span id="fee2">0</font>원
						</dd>
					</dl>
				</div>
				<br>				
				<br><br><br><br><br><br>
				<hr>
				<div class="box">
				<div class="lecture">장소</div>
				<select name="local1" id="local1" class="title2">
					<option value="0">지역선택</option>
					<% 
						for (Local l : lList) {
					%>
					<option value="<%=l.getLocalNum()%>"><%=l.getLocalCity()%></option>
					<%
						}
					%>
				</select>
				<select id="local" name="local" class="title2">
					<option id="si">시/구/군 선택</option>
				</select>
				<input type="text" name="local2" id="local2"
					placeholder="세부장소를 입력하세요.">
				</div>
				<br><br>
				<hr>
				<div class="box">
				<div class="lecture">가능 요일별 시간대(복수선택)</div>
				</div>
				<input type="checkbox" name="yo" value="월요일">월요일
				</option>
				<input type="checkbox" name="yo" value="화요일">화요일
				</option>
				<input type="checkbox" name="yo" value="수요일">수요일
				</option>
				<input type="checkbox" name="yo" value="목요일">목요일
				</option>
				<input type="checkbox" name="yo" value="금요일">금요일
				</option>
				<input type="checkbox" name="yo" value="토요일">토요일
				</option>
				<input type="checkbox" name="yo" value="일요일">일요일
				</option>
				<br><br>
				<hr>
				<div class="box">
				<br> <br> <input type="text" name="day1" placeholder="ex>오후7시~오후9시" class="title2"> 
				<input type="radio"	name="week1" id="f1" value="선택" style='margin-top:17px; ' checked><label for="f1" style='margin:10px;'></label>
				<input type="date" name="month1" min='2019-09-23' max='2019-12-31' class="title2"/>
				<input type="radio" name="week1" id="f2" value="협의" style='margin-top:17px; '><label for="f2" style='margin:10px;'>협의</label>
				</div>
				<br>
				<div class="box">
				<input type="text" name="day2" placeholder="ex>오후7시~오후9시" class="title2">
				<input type="radio" name="week2" id="f3" value="선택" style='margin-top:17px; ' checked ><label for="f3" style='margin:10px; '></label>
				<input type="date" name="month2" min='2019-09-23' max='2019-12-31' class="title2"/>
				<input type="radio" name="week2" id="f4" value="협의" style='margin-top:17px; '><label for="f4" style='margin:10px;'>협의</label>
				</div>
				<br>
				<div class="center1">
				<button type="submit" id="insert1" name="submit1" style='color: #fff; border:none; padding: 6px 10px; width: 130px; margin: 20px auto; font-size: 16px; border-radius: 6px; text-align: center; background: #eb9f9f;'>승인요청</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>
<script>

			//확장자, 정규식 검사
			$(document).on("change","input[name='file1']",function(event) {
			   var ext = $(this).val().split('.').pop().toLowerCase();
			   var fileSize = (this).files[0].size;
			   var maxSize = 1024*1024*1024;
			   
			   if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			      alert("등록할 수 없는 확장자입니다.");
			      $(this).val("");
			      return;
			   } 
			   
			   if(fileSize > maxSize) {
			      alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
			      $(this).val("");
			      return;
			   }
			});
			


		//커버사진 미리보기
		function readURL(input) {
			  if (input.files && input.files[0]) {
			   var reader = new FileReader();
			   
			   reader.onload = function (e) {
			    $('#image_section1').attr('src', e.target.result);  
			   }
			   
			   reader.readAsDataURL(input.files[0]);
			   }
			 }   
			 
			 $("#file1").change(function(){
			    readURL(this);
			 });
			 
		  //수업사진 미리보기
		  function readURL2(input) {
			  if (input.files && input.files[0]) {
			   var reader = new FileReader();
			   
			   reader.onload = function (ee) {
			    $('#image_section2').attr('src', ee.target.result);  
			   }
			   
			   reader.readAsDataURL(input.files[0]);
			   }
			 }   
			 
			 $("#addImg").change(function(){
			    readURL2(this);
			 });
		
		
		       //장르선택 카테고리
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
		                          $('<option value="' + datas[i] +'">' + datas[i] + '</option>').appendTo('#good');
		                    }
		                       }
		               }
		            });
		         });
		      });
		             
		       //기본수업시간선택
		      $("#time").on("propertychange change keyup paste input",
		            function() {
		               var currentVal = $(this).val();
		               var opt = document.getElementById("time2");
		               opt.innerHTML=currentVal;
		                        
		      })
		      
		      //시간당가격입력
		      $("#hourPrice").on("propertychange change keyup paste input",
		            function() {
		               var currentVal = $(this).val();
		               var opt = document.getElementById("price2");
		               opt.innerHTML=currentVal;
		                        
		      })
		      
		      //한달 기준 총수업
		      $("#totalTime").on("propertychange change keyup paste input",
		            function() {
		               var currentVal = $(this).val();
		               var opt = document.getElementById("totalTime2");
		               opt.innerHTML=currentVal;
		                        
		      })
		      
		      //연결수수료
		      $("#hourPrice").on("propertychange change keyup paste input",
		            function() {
		               var currentVal = $(this).val();
		               var opt = document.getElementById("fee2");
		               opt.innerHTML=currentVal;
		                        
		      })
		      
		      //총액계산
		      function total() //total()함수 부분
		
		      {
		      
		        var hourPrice1=document.getElementById("hourPrice"); //<body>부분에서 num1변수를 getElementById를 이용하여 값을 가져온다.
		      
		        var hourPrice1s=hourPrice1.value; // num1에서 가져온 값을 num1s에 저장해주고,
		      
		        var hourPrice1b=parseInt(hourPrice1s); // 계산을 하기위해 그 값을 int형으로 바꿔준다.
		      
		        var totalTime2=document.getElementById("totalTime"); //위 방법과 같음..
		      
		        var totalTime2s=totalTime2.value;
		      
		        var totalTime2b=parseInt(totalTime2s);   
		      
		        var time1=document.getElementById("time"); //역시 op값을 가져오고
		      
		        var times=time1.value;
		        
		        var time2b=parseInt(times);
		        
		        var totalPrice = hourPrice1b * time2b * totalTime2b;
		        document.getElementById("totalPrice2").innerHTML=totalPrice;
		      
		   
		      }
		       
       //수업타입 라디오버튼
       $(document).ready(function(){
 
       // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=classType]").click(function(){
    
           if($("input[name=classType]:checked").val() == "그룹"){
               $("input:text[name=studentCount]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=classType]:checked").val() == "1대1"){
                 $("input:text[name=studentCount]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
       
       //날짜선택 라디오 버튼11
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week1]").click(function(){
    
           if($("input[name=week1]:checked").val() == "선택"){
               $("input:text[name=day1]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week1]:checked").val() == "협의"){
                 $("input:text[name=day1]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
      //날짜선택 라디오 버튼11
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week1]").click(function(){
    
           if($("input[name=week1]:checked").val() == "선택"){
               $("input:date[name=month1]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week1]:checked").val() == "협의"){
                 $("input:date[name=month1]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
        //날짜선택 라디오 버튼22
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week2]").click(function(){
    
           if($("input[name=week2]:checked").val() == "선택"){
               $("input:text[name=day2]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week2]:checked").val() == "협의"){
                 $("input:text[name=day2]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
        
      //지역선택 카테고리
	      $(function(){
	         $("#local1").click(function(){
	            $.ajax({
	               url : "<%=request.getContextPath()%>/selectSubLocal?localNum=" + $('#local1').val(),
	               type : "post",
	               dataType : "html",
	               success:function(data){
	                  $("#local").find("option").remove();
	
	                  var datas = data.split(",");
	            
	                       for(var i = 0; i < datas.length; i++){    
	                          if(data==0){
	                             $("#local").append("<option value='1'>지역선택</option>");
	                          }else{
	                       console.log(datas[i]);                        
	                          $('<option value="' + datas[i] +'">' + datas[i] + '</option>').appendTo('#local');
	                    }
	                       }
	               }
	            });
	         });
	      });
      
               
               var oTbl;
               //Row 추가
               function insRow() {
                 oTbl = document.getElementById("addTable");
                 var oRow = oTbl.insertRow();
                 oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
                 var oCell = oRow.insertCell();

                 //삽입될 Form Tag
                 var frmTag = "<input type=file name=addImg style=width:350px; height:20px;> ";
                 frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
                 oCell.innerHTML = frmTag;
               }
               //Row 삭제
               function removeRow() {
                 oTbl.deleteRow(oTbl.clickedRowIndex);
               }

               function frmCheck()
               {
                 var frm = document.form;
                 
                 for( var i = 0; i <= frm.elements.length - 1; i++ ){
                    if( frm.elements[i].name == "addImg" )
                    {
                        if( !frm.elements[i].value ){
                                frm.elements[i].focus();
                   return;
                         }
                     }
                  }
                }
            </script>

<%@ include file = "/views/common/footer.jsp" %>
