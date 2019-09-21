<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento, java.util.*, com.semi.lecture.model.vo.Lecture, com.semi.mento.model.vo.MentoUpload" %>
    <% 
    	MentoUpload mu = (MentoUpload)request.getAttribute("mu");
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
					프로필 사진<input type=file name='mtprofileimg' style='display: none;'>
			         <img id="camera"
			            src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
			            onclick='document.all.mtprofileimg.click(); document.all.file2.value=document.all.file1.value'
			            width=150px; height=150px; style='display : inline-block;'>
			         <p id="profile">
			            <br> <br> <br> <br>
				            프로필 사진을 업로드 해 주세요.<br>
				            수강생 분들에게 신뢰감을 높이기 위해 <br>
				            얼굴이 나온 사진이 필수 입니다.
			         </p>
			         </td>
			         </tr>
					<tr>
						<td colspan="3">닉네임</td>
						<td>
						<br><input class="textfield" type="text" name="mtnickname"
							id="nickName" value="<%=mt.getMtNickName() %>" required><br><br></td>
							
						<td id="nicknameCheck" class="rg-checkMsg"></td>
					</tr>
					
					<tr>
						<td colspan="3">신분/학력 인증</td>
						<%if(mt.getMtHowConfirm().equals("대학교인증")) { %>
							<td><input type="radio" name="mthowconfirm" value="대학교인증" checked/>대학인증
					        <input type="radio" name="mthowconfirm" value="신분증인증" />신분증인증</td>                               
                            <%} else { %>
	                        <td><input type="radio" name="mthowconfirm" value="대학교인증" /> 대학인증
					        <input type="radio" name="mthowconfirm" value="신분증인증" checked/>신분증인증</td>             
                        <%} %>
                        <td></td>
				    </tr>
				    <tr>    
				    	<td colspan="3"></td>
					         <td>
					         <br>
					         <input class="textfield" type="text" name="mtacademic" value="<%=mt.getMtAcademic() %>" />
					         <input class="textfield" type="text" name="mtacademicdept" value="<%=mt.getMtAcademicDept() %>" />
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
					</tr>
					<tr>					
						<td colspan="3">신분인증사진</td>
						<td><input type="file" name="mtconfirming" id="profile_pt" onchange="previewImage(this,'View_area')"></td>
			         </tr>
			         <td><div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
			         </div></td>			         

			         <tr>
					<td colspan="3">자격증  1 (선택)</td>
					<td> <input class="textfield" type="text" name="mtlicense" value=""/></td>
					</tr>
					<tr>
				    <td colspan="3"> 자격증 1 사진</td>
				    <td><input type="file" name="mtlicenseimg" id="profile_pt" onchange="previewImage(this,'View_area')"></td>
				    </tr>
				    <td><div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
				        </div></td>
					<tr>    
				    	<td colspan="3"><br><br>은행</td>
				        <td><br><br><select id="bank" name="mtbank">
							<option><%=mt.getMtBank() %></option>
							<option value = "농협">농협</option>
							<option value = "국민은행">국민은행</option>
							</select>
						</td>
					</tr>
					<tr>
							<td colspan="3">계좌번호 </td>
							<td><input class="textfield" type = "text" name = "mtAccountNumber" id = "accountNumber" value="<%=mt.getMtAccountNumber()%>">
			         	</td>
							<td></td>
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
    			</div>
            </div>
        </section>
        <script>

        
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
    					if(result == 0 ) {	//아이디가 중복될경우
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