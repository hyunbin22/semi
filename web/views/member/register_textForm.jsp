<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="center1">
	<div class="wrap">
		<div class="bar">
			<br>
			<br>
			<h1 class = "center1">회원가입</h1>
			<br>
			<hr>
		</div>
		
			<form action="<%=request.getContextPath() %>/member/MemberRegisterServlet.do" method="POST" id="registerFrm" onsubmit="return checkValue();">
				<table class="tblreg center1">
					<tr>
						<td colspan="3">아이디</td>
						<td><input class="textfield" type="text" name="id"
							id="userId" placeholder="아이디를 입력해주세요" required></td>
						<td id="idCheck" class="rg-checkMsg"></td>
					</tr>
					<tr>
						<td colspan="3">비밀번호</td>
						<td><input class="textfield" type="password" name="mPw"
							id="password" placeholder="비밀번호를 입력해주세요" required></td>
						<td id="pwCheck" class="rg-checkMsg"></td>
					</tr>
					<tr>
						<td colspan="3">비밀번호확인</td>
						<td><input class="textfield" type="password" name="pw2"
							id="password2" placeholder="비밀번호를 입력해주세요" required></td>
						<td id="pwCheck2" class="rg-checkMsg"></td>
					</tr>
					<tr>
						<td colspan="3">이름</td>
						<td><input class="textfield" type="text" name="name"
							id="userName" placeholder="이름을 입력해주세요" required></td>
					</tr>
					<tr>
						<td colspan="3">성별</td>
						<td><label class="rdGender"><input type="radio"
								name="gender" id="mgender" value="M">남자</label> <label
							class="rdGender"><input type="radio" name="gender"
								id="fgender" value="F">여자</label></td>
					</tr>
					<tr>
						<td colspan="3">생년월일</td>
						<td><input class="textfield" type="date" name="birth"
							id="birth" required></td>
					</tr>
					<tr>
						<td colspan="3">이메일</td>
						<td><input class="textfield" type="email" name="email"
							id="email" placeholder="이메일을 입력해주세요" required></td>
					</tr>
					<tr>
						<td colspan="3">휴대폰번호</td>
						<td>
							<!-- <input class="textfield" type="text" name="phone" placeholder="휴대폰번호를 입력해주세요"> -->

							<input type="text" name="tel1" id="tel1" class="phone"
							list="data" required> - <datalist id="data">
								<option value="010"></option>
								<option value="011"></option>
								<option value="019"></option>
							</datalist> <input type="text" name="tel2" id="tel2" class="phone"
							maxlength=4 required> - <input type="text" name="tel3"
							id="tel3" class="phone" maxlength=4 required>
						</td>

						<td><input type="button" value="인증번호받기" class="inputbtn">
						</td>
					</tr>
					<tr>
						<td colspan="3">인증번호</td>
						<td><input class="textfield" type="text" name="number"
							placeholder="인증번호를 입력해주세요"></td>
						<td><input type="button" value="인증번호확인" class="inputbtn"
							onclick=""></td>
					</tr>
					<tr>
						<td colspan='3'>
						<div><input type="submit" value="회원가입" class="btnregister center1"></div></td>
					</tr>
				</table>
			</form>
		</div>
</section>
<script>
	//아이디 중복검사 
	$(function(){
	 	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	 	var idCheck = $('#idCheck');
		$('#userId').blur(function(){
			var rgUserId = $('#userId').val();
			$.ajax({
				url:"<%=request.getContextPath()%>/member/MemberIdDupliCheckServlet.do?userId="+rgUserId,
				type:"get",
				dataType:"html",
				success:function(result) {
					if(result == 0 ) {	//아이디가 중복될경우
						$(idCheck).text("사용중인 아이디입니다.");
						$(idCheck).css({"color":"red","font-size":"11px"});
						$(idCheck).prop("disabled", true);
					} else if(result == 1){
						if(re.test(rgUserId)) {
							$(idCheck).text("");
							$(idCheck).prop("disabled",false);
						} else if(rgUserId== "") {
							$(idCheck).text('아이디를 입력해주세요.');
							$(idCheck).css({"color":"red","font-size":"11px"});
							$(idCheck).prop("disabled", true);
						} else {
							$(idCheck).text('4~12자의 영문자와 숫자로만 입력하세요.');
							$(idCheck).css({"color":"red","font-size":"11px"});
							$(idCheck).prop("disabled", true);
						}
					} 
				}
			});
		});
	});
	
	//비밀번호 입력체크
	$(function(){
		var re = /^[a-zA-Z0-9]{6,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	 	var pwCheck = $('#pwCheck');
		$('#password').blur(function(){
			var pw = $('#password').val();

			if(re.test(pw)) {
				$(pwCheck).text("");
				$(pwCheck).prop("disabled",false);
			} else if(pw== "") {
				$(pwCheck).text('비밀번호를 입력해주세요.');
				$(pwCheck).css({"color":"red","font-size":"11px"});
				$(pwCheck).prop("disabled", true);
			} else {
				$(pwCheck).text('6~12자의 영문자와 숫자로만 입력하세요.');
				$(pwCheck).css({"color":"red","font-size":"11px"});
				$(pwCheck).prop("disabled", true);
			}
		}); 
	});
		
	$(function(){
		var pwCheck2 = $('#pwCheck2');
		$('#password2').blur(function(){
			var pw2 = $('#password2').val();
			if(pw2 == "") {
				$(pwCheck).text('비밀번호를 입력해주세요.');
				$(pwCheck).css({"color":"red","font-size":"11px"});
				$(pwCheck).prop("disabled", true);
			} else if(!(pw2==$('#password').val())) {
				$(pwCheck2).text("비밀번호확인이 일치하지 않습니다.");
				$(pwCheck2).css({"color":"red","font-size":"11px"});
				$(pwCheck2).prop("disabled", true);
			} else {
				$(pwCheck2).text("");
				$(pwCheck2).prop("disabled",false);
			}
			
		});
		
	});
		
		
	
	//회원가입 정규식
	function checkValue(){ 

		var rgUserName = $('#userName');
		var email = $('#email');
		var tel2 = $('#tel2');
		var tel3 = $('#tel3');
		
	    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;// 이메일이 적합한지 검사할 정규식
	    
	    //아이디 체크글자가 보일때
	    if($('#idCheck').prop('disabled')) {
	    	alert("아이디를 확인하세요.");
	    	return false;
	    }
	    
	    if($('#pwCheck').prop('disabled') || $('#pwCheck2').prop('disabled')) {
	    	alert("비밀번호를 확인하세요.");
	    	return false;
	    }

         
         //이메일 입력체크
         if(email.val().length==0) {
        	 alert("이메일을 입력하세요");
        	 email.focus();
        	 return false;
         }
         
         if(!check(re2, email,"적합하지 않은 이메일 형식입니다.")) return false;
         
         //이름 체크
         if(rgUserName.val().length==0) {
        	 alert("이름을 입력하세요");
        	 rgUserName.focus();
        	 return false;
         }
	 }
	//전화번호 체크
	//전화번호 입력시 숫자가 아니면 지움
	$(tel2).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	$(tel3).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	//전화번호 4글자 입력시 다음 input태그로 이동
	$(function(){
		$(tel2).keyup(function(){
			var limit = $(this).attr("maxlength");
			if(this.value.length >= limit) {
				$(this).next(tel3).focus();
				return false;
			}
		});
	});

</script>
<%@ include file="/views/common/footer.jsp"%>
