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
					<tr>
						<td colspan="2"></td>
						<td id="emailCheck" class="rg-checkMsg"></td>
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
						<td><input type="button" value="인증번호받기" class="inputbtn btnPhone"
							id="sendSms"></td>
					</tr>
					<tr>
						<td colspan='1' class = "lecture">인증번호</td>
						<td><input class="textfield title2" type="text" name="number"
							placeholder="인증번호를 입력해주세요" id="checkNum"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td id="keyCheck"></td>
					</tr>
			        <tr>
						<td></td>
						<td><input type="button" value="인증번호확인" class="inputbtn btnPhone"
							id="checkKey"></td>
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
        var count = 0;	//핸드폰인증이 됐는지 확인
    	var key = "";
    	  //핸드폰번호 인증
    	$(function(){
    		$('#sendSms').click(function(){
    			var tel1 = $('#tel1').val();
    			var tel2 = $('#tel2').val();
    			var tel3 = $('#tel3').val();
    			var phone = tel1 + tel2 + tel3;
    			if(phone.length!=11) {
    				alert("유효한 휴대폰번호를 입력해주세요.");
    				return;
    			}
    			$.ajax({
    				url:"<%=request.getContextPath()%>/sendSms.do?phone="+phone,
    				type:"get",
    				dataType:"text",
    				success:function(data) {
    					alert("인증번호가 전송되었습니다.");
    					key = data;
    					$('#tel1').prop("readonly", true);
    					$('#tel2').prop("readonly", true);
    					$('#tel3').prop("readonly", true);
    										
    					setTimeout(function() {
    						if($('#keyCheck')) {
    							setTime();	//3분
    						}
    					}, 180000);
    				},
    				error:function(request,status,error){
    			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
    			    }
    			});
    		});
    		
    		//인증번호 3분안에 입력 안하면 재발송 하게 처리
    		function setTime(){
    			if(count==0 || $('#keyCheck').prop('disabled')) {
    				$('#sendSms').value("인증번호 재발송");
    				alert("인증번호가 만료되었습니다. 재발송 해주세요.");
    				$('#keyCheck').text("핸드폰인증을 다시 진행해주세요");
    				$('#keyCheck').css({"color":"red","font-size":"11px"});
    				$('#keyCheck').prop("disabled", true);
    				$('#tel1').prop("readonly", false);
    				$('#tel2').prop("readonly", false);
    				$('#tel3').prop("readonly", false);
    				key="";
    			};
    		};
    		
    		//인증번호 확인
    		$('#checkKey').click(function(){
    			var userKey = $('#checkNum').val();
    			if(userKey.length == 0){
    				$('#keyCheck').text("인증번호를 입력해주세요.");
    				$('#keyCheck').css({"color":"red","font-size":"11px"});
    				$('#keyCheck').prop("disabled", true);
    				
    			} else if(key!=userKey){
    				$('#keyCheck').text("인증번호가 일치하지 않습니다.");
    				$('#keyCheck').css({"color":"red","font-size":"11px"});
    				$('#keyCheck').prop("disabled", true);

    			} else if(key==userKey) {
    				var sendSms = $('#sendSms');
    				var checkKey = $('#checkKey');
    				alert("핸드폰 인증이 완료되었습니다.");
    				sendSms.disabled = 'disabled';
    				checkKey.disabled = 'disabled';
    				$('#tel1').prop("readonly", true);
    				$('#tel2').prop("readonly", true);
    				$('#tel3').prop("readonly", true);

    				$('#checkNum').prop("readonly",true);
    				$('#keyCheck').prop("disabled",false);
    	
    				count=1;
    			} 
    			
    		});
    	});	//핸드폰번호 인증 끝 
    	
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
    	
      //이메일 중복검사
    	$(function(){
    	 	var emailCheck = $('#emailCheck');
    		$('#email').blur(function(){
    			var email = $('#email').val();
    			$.ajax({
    				url:"<%=request.getContextPath()%>/member/MemberEmailDupliCheckServlet.do?email="+ email,
    				type : "get",
    				dataType : "html",
    				success : function(result) {
    					if (result == 0) { //이메일이 중복될경우
    						$(emailCheck).text("사용중인 이메일입니다.");
    						$(emailCheck).css({
    							"color" : "red",
    							"font-size" : "11px"
    						});
    						$(emailCheck).prop("disabled",true);
    					} else {
    						$(emailCheck).text("");
    						$(emailCheck).prop("disabled",false);
    						} 
    					
    					},
    					error : function(request, status, error) {
    						alert("code = " + request.status
    								+ " message = "
    								+ request.responseText
    								+ " error = " + error); // 실패 시 처리
    					}
    				});
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
    	
    	//전화번호 체크
    	//전화번호 입력시 숫자가 아니면 지움
    	$(tel2).on("keyup", function() {
    		$(this).val($(this).val().replace(/[^0-9]/g, ""));
    	});

    	$(tel3).on("keyup", function() {
    		$(this).val($(this).val().replace(/[^0-9]/g, ""));
    	});
    	//전화번호 4글자 입력시 다음 input태그로 이동
    	$(function() {
    		$(tel2).keyup(function() {
    			var limit = $(this).attr("maxlength");
    			if (this.value.length >= limit) {
    				$(this).next(tel3).focus();
    				return false;
    			}
    		});
    	});
        
    	//회원가입 정규식
    	function checkValue() {

    		var rgUserName = $('#userName');
    		var email = $('#email');
    		var tel2 = $('#tel2');
    		var tel3 = $('#tel3');
    		var birth = $('#birth');

    		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식

    		//비밀번호 체크 글자가 보일때
    		if ($('#pwCheck').prop('disabled') || $('#pwCheck2').prop('disabled')) {
    			alert("비밀번호를 확인하세요.");
    			return false;
    		}

    		//인증번호 체크글자가 보일때
    		if ($('#keyCheck').prop('disabled') && $('#keyCheck').attr("color")=="red") {
    			alert("인증번호를 확인하세요.");
    			return false;
    		} 
    		
    		//이메일 체크 글자가 보일때
    		if ($('#emailCheck').prop('disabled')) {
    			alert("이메일을 확인하세요.");
    			return false;
    		}

    		return true;
    		
    		

    	};
    	
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