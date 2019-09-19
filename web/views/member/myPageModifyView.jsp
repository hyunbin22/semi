<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ include file="/views/common/myPageAside.jsp" %>
        <div class="wrap">
        <div id="myPageContentWrap">
            <div class="bar">
                    <br>
                    <h1 class="center1">내정보수정</h1>
                    <br><br>
                    <hr>
                </div>
                <div class="regdata center1 myPage-content-wrap">
                <form action="member/memberUpdate.do" method="POST" id = "memberFrm" onsubmit="return checkValue();">
                   <table class="tblreg center1">
					<tr>
						<td colspan="1">아이디</td>
						<td><%=m.getmId() %></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1">비밀번호 변경</td>
						<td><input class="textfield" type="password" name="mPw"
							id="newPw" placeholder="변경하실 비밀번호를 입력해주세요" required></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1">비밀번호 재입력</td>
						<td><input class="textfield" type="password" name="userPwd2"
							id="newPw2" placeholder="" required></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="1">이메일 변경</td>
						<td><input class="textfield" type="email" name="email"
							id="email" placeholder="변경하실 이메일을 입력해주세요" required></td>
							<td></td>
					</tr>
					<tr>
						<td colspan='1'>연락처</td>
						<td><%=m.getmPhone() %></td>
						<td><button class = "next" onclick = "seeChangePhone();">연락처 변경</button></td>
					</tr>
					</table>
					<table id = "changePhone1" style = "visibility: collapse;" class="tblreg center1">
					<tr>
						<td colspan='1'>변경할 연락처</td>
						<td>
							<input type="text" name="tel1" id="tel1" class="phone" list="data" required> - 
							<datalist id="data">
								<option value="010"></option>
								<option value="011"></option>
								<option value="019"></option>
							</datalist> 
							<input type="text" name="tel2" id="tel2" class="phone" maxlength=4 required> - 
							<input type="text" name="tel3" id="tel3" class="phone" maxlength=4 required>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" value="인증번호받기" class="inputbtn" id="sendSms"></td>
					</tr>
					<tr>
						<td colspan='1'>인증번호</td>
						<td><input class="textfield" type="text" name="number"
							placeholder="인증번호를 입력해주세요" id="checkNum"></td>
						<td></td>
					</tr>
			        <tr>
						<td></td>
						<td><button class = "next">인증번호 확인</button></td>
						<td></td>
					</tr>
						
				</table>
				
				
				<div class="center1">
                   <input type="submit" id = "btnModify" value="수정하기" class="next" onclick="updateMember();">
                  </div>
                </form>

    
    		</div>
            </div>
    		</div>
            </div>
        </section>
        <script>
        function checkValue(){ 
    		var email = $('#email');
    		var phone1 = $('#phone1');
    		var phone2 = $('#phone2');
    		var phone3 = $('#phone3');
    		
    		var pw = $('#newPw');
    		var pw2 = $('#newPw2');

    		if(phone1.val().length==0 || phone2.val().length==0 || phone3.val().lenght==0){
                alert('전화번호를 입력하세요');
                phone1.focus();
                return false;
            }
    		
    		if(email.val().length==0){
    			alert('이메일을 입력하세요');
                email.focus();
                return false;
    		}
    		
    		
              if(pw.val().length==0){
                  alert('비밀번호를 입력하세요');
                  pw.focus();
                  return false;
              }
              if(pw.val().length<=5){
                  alert('비밀번호를 6글자 이상 입력하세요');
                  pw.focus();
                  return false;
              }
              /* if(pw.val()) */
              if(pw.val()!=pw2.val()) {
            	  alert('비밀번호가 맞지 않습니다.')
            	  pw.focus();
                  return false;
              }
              
              
              return true;
    	}
        
        function updateMember(){
        	
				var frm=$('#memberFrm');
				var url="<%=request.getContextPath()%>/member/memberUpdate.do?mId=<%=m.getmId()%>";
				frm.attr("action",url);
				frm.submit();
		}
        
        function seeChangePhone(){
        	$('#changePhone1').css("visibility","visible");
        	return false;
        }
		

        </script>
    


    <%@ include file = "/views/common/footer.jsp" %>