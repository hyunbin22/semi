<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento, java.util.*, com.semi.lecture.model.vo.Lecture, com.semi.mento.model.vo.MentoUpload" %>
    <% 
    	List<MentoUpload> mu = (List)request.getAttribute("mu");
    
		String profileName=null;
		String licenseName=null;
		String confirmName=null;
		for(MentoUpload mn : mu){
			if(mn.getUpMentoCategory().equals("profile")){
				profileName=mn.getUpMentoReName();
			}if(mn.getUpMentoCategory().equals("license")){
				licenseName=mn.getUpMentoReName();
			}if(mn.getUpMentoCategory().equals("confirm")){
				confirmName=mn.getUpMentoReName();
		} 
		}
    %>
    <%@ include file="/views/common/myPageAside.jsp" %>
    <div class="wrap">
    		<div id="myPageContentWrap">
                        <br><br>
                    <h1 class="center1">멘토정보수정</h1>
                    
                    <br><br>
                    <hr>
                </div>
                <div class="regdata center1">
                <form action="<%=request.getContextPath()%>/mento/mentoUpdateEnd.do?mtNum=<%=mt.getMtNum()%>" method="POST" id = "mentoFrm" enctype="multipart/form-data">
                   <table class="tblreg center1">
					<tr>
					<td>
			<div class="box">
         <div class="lecture" style='margin-top:50px;'>프로필 사진</div>
         <div style='margin:0;'>
		         <p id="profile">
		            <br> <br> <br> <br>
		            프로필 사진을 업로드 해 주세요.<br>
		            수강생 분들에게 신뢰감을 높이기 위해 <br>
		            얼굴이 나온 사진이 필수 입니다.
		         </p>
	         	 <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;'>
         <input type=file name='mtprofileimg' id='mtprofileimg' style='display: none;' class="title2">
         <img id="camera"
            src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
            onclick='document.all.mtprofileimg.click(); document.all.file2.value=document.all.file1.value'
            width=150px; height=150px; style='margin-left:130px;'>
			  	<img id="image_section1" alt="미리보기" src="<%=request.getContextPath() %>/upload/mento/<%=profileName%>" style='width:250px; height: 200px;'>

		         </div>
						        <br><br><br><br><br><br><br><br><br>
            	</div>
         </div>
			         </td>
			         </tr>
					<tr>
					<td>
		         <br><br><br><br>
		         </td>
			         </tr>
			         <tr>
			         <div class="box">
						<td colspan="3" class="lecture">닉네임</td>
						<td>
						<br><input class="textfield title2" type="text" name="mtnickname"
							id="nickName" value="<%=mt.getMtNickName() %>" required><br><br></td>
							
						<td id="nicknameCheck" class="rg-checkMsg"></td>
				</div>
				</tr>
					
					<tr>
					<div class="box">
				
						<td colspan="3" class="lecture">신분/학력 인증</td>
						<%if(mt.getMtHowConfirm().equals("대학교인증")) { %>
							<td><input type="radio" name="mthowconfirm" value="대학교인증" checked/>대학인증
					        <input type="radio" name="mthowconfirm" value="신분증인증" />신분증인증</td>                               
                            <%} else { %>
	                        <td><input type="radio" name="mthowconfirm" value="대학교인증" /> 대학인증
					        <input type="radio" name="mthowconfirm" value="신분증인증" checked/>신분증인증</td>             
                        <%} %>
                        
				    </tr>
				    <tr>    
				    	<td colspan="3"></td>
					         <td>
					         <br>
					         <input class="textfield title2" type="text" name="mtacademic" value="<%=mt.getMtAcademic() %>" />
					         <input class="textfield title2" type="text" name="mtacademicdept" value="<%=mt.getMtAcademicDept() %>" />
					         <br>
					         <%if(mt.getMtGraduation().equals("재학")) { %>
								<input type="radio" name="mtgraduation" value="재학" checked/> 재학
						        <input type="radio" name="mtgraduation" value="졸업" /> 졸업                           
						         	 
                            <%} else { %>
		                        <input type="radio" name="mtgraduation" value="재학" /> 재학
						        <input type="radio" name="mtgraduation" value="졸업" checked/> 졸업           
						         
                        <%} %>
						</td>
						<td></td>
					 	<br><br>
					 	
					</tr>
					<tr>			
					<div class="box">		
						<td colspan="3" class="lecture">신분인증사진</td>
						<div style='margin:0;'>
			      <td > <br><br><br> <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;' >
						<input type="file" name="mtconfirming" id="mtconfirmimg" onchange="previewImage(this,'View_area')">
	       				<img  src="<%=request.getContextPath() %>/upload/mento/<%=confirmName%>" id="image_section2" alt="미리보기" style='width:250px; height: 200px;'>				
					   <br><br>
	       			 </div>
		       					
						</td>    
			      
			         </div>
			         <tr>
			      
			         <div class="box">		
			         
					<br><br>
			       	<td colspan="3" class="lecture"><br><br>자격증  1 (선택)</td>
					<td>
					<br><br><br><br><br><br><br>
					 <input class="textfield title2" type="text" name="mtlicense" value=""/>
					
					 <br><br><br><br><br><br>
					 </td>
					</tr>
					
					</div>
					<tr>
				   <div class="box">
				    <td colspan="3" class="lecture"> 자격증 1 사진</td>
				 
				   <td>
				   <div style='margin:0;'>
				   <br><br> <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;' >
				    <input type="file" name="mtlicenseimg" id="mtlicenseimg" onchange="previewImage(this,'View_area')">
							<img  id="image_section3" style='width:250px; height: 200px;' alt="미리보기" src="<%=request.getContextPath() %>/upload/mento/<%=licenseName%>">
	   				  </div>
	   				  
	   				 <td>  </td>

					  </td>

					 </div>
					 </div>
				    </tr>

					<tr>    
					<div class="box">
				    	<td colspan="3" class="lecture"><br><br><br><br><br><br>은행</td>
				        <td><br><br><br><br><br><br><select id="bank" name="mtbank" class="title2">
							<option><%=mt.getMtBank() %></option>
							<option value = "농협">농협</option>
							<option value = "국민은행">국민은행</option>
							</select>
						</td>
						</div>
					</tr>
					<tr>
					<div class="box">
							<td colspan="3" class="lecture">계좌번호 </td>
							<td><input class="textfield title2" type = "text" name = "mtAccountNumber" id = "accountNumber" value="<%=mt.getMtAccountNumber()%>">
			         	</td>
					
							</div>
					</tr>
					<tr>
						<td colspan='3'>
						<br>
						</td>
					</tr>
				</table>
                   <div class="center1"><input type="submit" id = "btnModify" value="수정하기" class="next" onclick="updateMento();"></div>
                </form>

    
   					 </div>
                	</div>
  
        <script>
        
        function readURL(input) {
      	  if (input.files && input.files[0]) {
      	   var reader = new FileReader();
      	   
      	   reader.onload = function (e) {
      	    $('#image_section1').attr('src', e.target.result);  
      	   }
      	   
      	   reader.readAsDataURL(input.files[0]);
      	   }
      	 }   
      	 
      	 $("#mtprofileimg").change(function(){
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
      	 
      	 $("#mtconfirmimg").change(function(){
      	    readURL2(this);
      	 });
      	 
      	 //수업사진 미리보기
         function readURL3(input) {
       	  if (input.files && input.files[0]) {
       	   var reader = new FileReader();
       	   
       	   reader.onload = function (eee) {
       	    $('#image_section3').attr('src', eee.target.result);  
       	   }
       	   
       	   reader.readAsDataURL(input.files[0]);
       	   }
       	 }   
       	 
       	 $("#mtlicenseimg").change(function(){
       	    readURL3(this);
       	 });

        
        function updateMento(){
        	
				var frm=$('#mentoFrm');
				var url="<%=request.getContextPath()%>/mento/mentoUpdateEnd.do?mtNum=<%=mt.getMtNum()%>";
				frm.attr("action",url);
				frm.submit();
		}
        
        $(function(){
    	 	var nicknameCheck = $('#nicknameCheck');
    		$('#nickName').blur(function(){
    			var rgNickname = $('#nickName').val();
    			$.ajax({
    				url:"<%=request.getContextPath()%>/mento/MentoNickNameDupliCheckServlet.do?nickname="+rgNickname,
    				type:"get",
    				dataType:"html",
    				success:function(result) {
    					if(result == 0 ) {	//닉네임이 중복될경우
    						$(nicknameCheck).text("사용중인 닉네임입니다.");
    						$(nicknameCheck).css({"color":"red","font-size":"11px"});
    						$(nicknameCheck).prop("disabled", true);
    					} else {
    						$(nicknameCheck).text("사용가능한 닉네임입니다.");
    						$(nicknameCheck).css({"color":"blue","font-size":"11px"});
    						$(nicknameCheck).prop("disabled", true);
    					}
    					
    				}
    				});
    		});
        });		
        

        </script>
 
    <%@ include file = "/views/common/footer.jsp" %>