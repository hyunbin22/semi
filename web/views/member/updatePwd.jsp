<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<% Member m = (Member)request.getAttribute("member"); %>

<section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br>
                    <h1 style="font-size: 40px; text-align: center;"><strong>비밀번호 변경</strong></h1>
                    <h5 class = "center1">변경할 비밀번호를 입력해주세요.</h5>
                    <hr>
                    <br><br>
                </div>
                <div class="regdata center1">
                 <form action = "<%=request.getContextPath()%>/member/updatePwd?mId=<%=m.getmId() %>" method="POST">
                <table class="tblreg">
                <tr>
                <td colspan="2" class = "lecture">아이디</td>
                <td><%=m.getmId() %></td>
                </tr>
                <tr></tr>
                        <tr>
						<td colspan="2" class = "lecture">변경할 비밀번호</td>
						<td><input class="textfield title2" type="password" name="mPw"
							id="password" placeholder="비밀번호를 입력해주세요" required></td>
						</tr>
						<tr><td></td><td colspan = "3" id="pwCheck" class="rg-checkMsg"></td></tr>

                        <tr>
						<td colspan="2" class = "lecture">비밀번호 재입력</td>
						<td><input class="textfield title2" type="password" name="pw2"
							id="password2" placeholder="비밀번호를 입력해주세요" required></td>
					</tr>
					<tr><td></td><td colspan = "3" id="pwCheck2" class="rg-checkMsg"></td></tr>
                    </table>
                    <br><br>
  					<div class = "center1">
                            <a href=""><input type="submit" value="비밀번호 변경" class="next center1"></a>
                    </div>
                    </form>
                </div>
            </div>
        </section>
        <script>
      //비밀번호 입력체크
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

		</script>
        
<%@ include file="/views/common/footer.jsp"%>