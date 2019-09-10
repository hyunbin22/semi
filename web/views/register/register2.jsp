<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<section class="center1">
	<article class="wrap">
		<div class="bar">
			<br>
			<br>
			<h1>이용약관</h1>
			<br>
			<hr>
		</div>
		<form action="<%=request.getContextPath() %>/views/register/register3.jsp" method="post" onsubmit="return checkAgree();">
			<table class="tbl-register2 center1">
				<tr>
					<th><h3>개인정보 수집 및 이용에 대한 안내</h3></th>
				</tr>
				<tr>
					<td>
						<p>정보통신망법 규정에 따라 abling에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
					이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보
					이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 abling 서비스를 회원과 동일하게 이용할 수 있습니다.
					이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우,
					abling은 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. 회원가입 시점에 abling이 이용자로부터 수집하는
					개인정보는 아래와 같습니다. - 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대전화번호’를
					필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의
					이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를
					수집합니다. - 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대전화번호를
					필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다. 서비스 이용 과정에서 이용자로부터 수집하는
					개인정보는 아래와 같습니다. abling 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의
					이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서
					이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를
					받습니다. 서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수
					있습니다. 구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여
					이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는
					경우를 의미합니다. abling 위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘abling
					위치정보 이용약관’에서 규정하고 있습니다.</p>
					</td>
				</tr>
				<tr>
					<th><h3>마케팅 활용 동의에 대한 안내</h3></th>
				</tr>
				<tr>
					<td>
						<p>마케팅활용ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
					</td>
				
				</tr>
				<tr>
					<td>
					<label class="center1"><input type="checkbox" name="rg-chbox-agree" class="rg-chbox-agree" value="agree">이용약관에 동의합니다.</label>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="다음" class="btnregister center1">
					</td>
				
				</tr>
			
			</table>
			</form>
		</article>
</section>

<script>
	function checkAgree() {
		
		if(!($('.rg-chbox-agree').prop("checked"))) {
			alert('이용약관에 동의해주세요');
			$('.rg-chbox-agree').focus();
			
			return false;
		}
		return true;	
	}


</script>

<%@ include file="/views/common/footer.jsp"%>