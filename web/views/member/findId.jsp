<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br>
                    <h1 style="font-size: 40px; text-align: center;"><strong>아이디 찾기</strong></h1>
                    <h5 class = "center1">찾으시려는 아이디의 정보를 입력해주세요</h5>
                    <hr>
                    <br><br>
                </div>
                <div class="regdata center1">
                 <form action = "<%=request.getContextPath()%>/member/findId" method="POST">
                <table class="tblreg">
                        <tr>
                            <td colspan="3" class = "lecture">이름</td>
                            <td>
                                <input class="textfield title2" type="text" name="name" placeholder="이름을 입력해주세요" required>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr>
						<td colspan="3" class = "lecture">생년월일</td>
						<td><input class="textfield title2" type="date" name="birth"
							id="birth" required></td>
                        </tr>
                        <tr>
                        <td>
                    	</td>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td colspan="3" class = "lecture">핸드폰 번호</td>
                            <td>
							<input class="textfield title2" type="text" name="phone" placeholder="휴대폰번호를 입력해주세요. (-없이)" required>
							</td>
                        </tr>
                    
                    </table>
                    <br><br>
  					<div class = "center1">
                            <a href=""><input type="submit" value="확인" class="next center1"></a>
                    </div>
                    </form>
                
                </div>
            </div>
        </section>
        
>>>>>>> cd775fe7606f768061ec6a245c816946f0c292f7
<%@ include file="/views/common/footer.jsp"%>