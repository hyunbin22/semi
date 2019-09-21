<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ include file="/views/common/myPageAside.jsp" %>
        <div class="wrap">
        <div id="myPageContentWrap">
            <div class="bar">
                    <br>
                    <h1 class="center1"><strong>내정보수정</strong></h1>
                    <br><br>
                    <hr>
                </div>
                <div class="regdata center1 myPage-content-wrap">
                <form action="member/memberUpdate.do" method="POST" id = "memberFrm" onsubmit="return checkValue();">
                   <table class="tblreg center1">
					<tr>
						<td colspan="2" class = "lecture">아이디</td>
						<td ><%=m.getmId() %></td>
						<td></td>
						<td></td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan="2" class = "lecture">비밀번호 변경</td>
						<td><input class="textfield title2" type="password" name="mPw"
							id="password" placeholder="변경하실 비밀번호를 입력해주세요" required></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
					<td colspan="2" ></td>
					<td id="pwCheck" class="rg-checkMsg"></td>
					</tr>
					<tr>
						<td colspan="2" class = "lecture">비밀번호 재입력</td>
						<td><input class="textfield title2" type="password" name="userPwd2"
							id="password2" placeholder="" required></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
					<td colspan="2" ></td>
					<td id="pwCheck2" class="rg-checkMsg"></td>
					</tr>
					<tr>
						<td colspan="2" class = "lecture">이메일 변경</td>
						<td><input class="textfield title2" type="email" name="email"
							id="email" placeholder="변경하실 이메일을 입력해주세요" required></td>
							<td></td>
					</tr>
					<tr></tr>
					<tr>
						<td colspan='2' class = "lecture">연락처</td>
						<td><%=m.getmPhone() %></td>
						<td><button class = "next" onclick = "seeChangePhone();">연락처 변경</button></td>
					</tr>
					</table>
					<table id = "changePhone1" style = "visibility: collapse;" class="tblreg center1">
					<tr>
						<td colspan='1' class = "lecture">변경할 연락처</td>
						<td>
							<input type="text" name="tel1" id="tel1" class="phone title2" list="data"> - 
							<datalist id="data">
								<option value="010"></option>
								<option value="011"></option>
								<option value="019"></option>
							</datalist> 
							<input type="text" name="tel2" id="tel2" class="phone title2" maxlength=4 > - 
							<input type="text" name="tel3" id="tel3" class="phone title2" maxlength=4 >
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="button" value="인증번호받기" class="inputbtn" id="sendSms"></td>
					</tr>
					<tr>
						<td colspan='1' class = "lecture">인증번호</td>
						<td><input class="textfield title2" type="text" name="number"
							placeholder="인증번호를 입력해주세요" id="checkNum" required></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td id="keyCheck"></td>
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
        $(function() {
    		var re = /^[a-zA-Z0-9]{6,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식

    		var pattern1 = /[0-9]/;
    		var pattern2 = /[a-zA-Z]/;
    		var pattern3 = /[~!@\#$%<>^&*]/;

    		var pwCheck = $('#pwCheck');
    		$('#password').blur(function() {
    				var pw = $('#password').val();

    				if (pw == "") {
    					$(pwCheck).text('비밀번호를 입력해주세요.');
    					$(pwCheck).css({
    						"color" : "red",
    						"font-size" : "11px"
    					});
    					$(pwCheck).prop("disabled", true);
    				} else if (!pattern1.test(pw) || !pattern2.test(pw)	|| !pattern3.test(pw)) {
    					$(pwCheck).text('비밀번호는 영문자와 숫자, 특수기호를 포함해주세요.');
    					$(pwCheck).css({
    						"color" : "red",
    						"font-size" : "11px"
    					});
    					$(pwCheck).prop("disabled", true);
    				} else if (pw.length < 6) {
    					$(pwCheck).text('비밀번호는 6글자 이상 입력해주세요.');
    					$(pwCheck).css({
    						"color" : "red",
    						"font-size" : "11px"
    					});
    					$(pwCheck).prop("disabled", true);
    				} else {
    					$(pwCheck).text("");
    					$(pwCheck).prop("disabled", false);

    				}
    			});
    	});

    	$(function() {
    		var pwCheck2 = $('#pwCheck2');
    		$('#password2').blur(function() {
    			var pw2 = $('#password2').val();
    			if (pw2 == "") {
    				$(pwCheck).text('비밀번호를 입력해주세요.');
    				$(pwCheck).css({
    					"color" : "red",
    					"font-size" : "11px"
    				});
    				$(pwCheck).prop("disabled", true);
    			} else if (!(pw2 == $('#password').val())) {
    				$(pwCheck2).text("비밀번호확인이 일치하지 않습니다.");
    				$(pwCheck2).css({
    					"color" : "red",
    					"font-size" : "11px"
    				});
    				$(pwCheck2).prop("disabled", true);
    			} else {
    				$(pwCheck2).text("");
    				$(pwCheck2).prop("disabled", false);
    			}

    		});

    	});
        
    	
    	
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
    


>>>>>>> cd775fe7606f768061ec6a245c816946f0c292f7
    <%@ include file = "/views/common/footer.jsp" %>