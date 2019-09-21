<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>
	<section>
	<form action="<%=request.getContextPath() %>/admin/sublocalEnroll" method="post">
   <%@ include file="/views/common/adminCateAside.jsp"%>
	<section>
  <br>
  <br>
  <br>
    <div id="search1">지역카테고리(Sub)</div>
		<table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3" 
		 bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
		    <tr>
		    <td align="left" width="120" bgcolor="">
			<font color="#0000ff">*</font>카테고리선택</td>
		    <td width="400">
				<select name="maincategory" id="maincategory" onchange="categoryChange2(this)">
			<option selected value=0>-선택하세요-
			<option value="강원">강원</option>
			<option value="경기">경기</option>
			<option value="경남">경남</option>
			<option value="경북">경북</option>
			<option value="광주">광주</option>
			<option value="대구">대구</option>
			<option value="대전">대전</option>
			<option value="서울">서울</option>
			<option value="울산">울산</option>
			<option value="인천">인천</option>
			<option value="전남">전남</option>
			<option value="전북">전북</option>
			<option value="제주">제주</option>
			<option value="부산">부산</option>
			<option value="충남">충남</option>
			<option value="충북">충북</option>
		</select> <select id="local" name="selectbank" onchange="bankDisplay(this.form)" >
			<option>과목선택</option>
		</select> 
		    </td>
		    </tr>
		    <tr>
		    <td align="left" width="120" bgcolor="">
			<font color="#0000ff">*</font>카테고리입력</td>
		    <td width="400">
			<input name="bank" type="text" size="50" maxlength="50"></td>
		    </tr>
		</table>

           <br>
             <button type="submit" id="scName" name="localCountry">등록</button>
           <button type="submit" id="submit2">수정</button>
           <button type="submit" id="submit3">삭제</button>
           
        </section>
        <br>
        <br>
        <br>
	</form>
	
	<script>
    function bankDisplay(frm) {

        var bank = frm.selectbank.selectedIndex;

        switch( bank ){
    	   case 0:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 1:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 2:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 3:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 4:
    	     frm.bank.value = $("#local option:selected").val();
    	     break;
    	   case 5:
      	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 6:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 7:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 8:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 9:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 10:
      	     frm.bank.value = $("#local option:selected").val();
      	     break;
      	   case 11:
        	 frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 12:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 13:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 14:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 15:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 16:
      	     frm.bank.value = $("#local option:selected").val();
      	     break;
      	   case 17:
        	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 18:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 19:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 20:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 21:
    	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 22:
    	     frm.bank.value = $("#local option:selected").val();
    	     break;
    	   case 23:
      	     frm.bank.value = $("#local option:selected").val();
    		 break;
    	   case 24:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 25:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 26:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 27:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 28:
      	     frm.bank.value = $("#local option:selected").val();
      	     break;
      	   case 29:
        	 frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 30:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
      	   case 31:
      	     frm.bank.value = $("#local option:selected").val();
      		 break;
        }
    	
        return true;
    }
        //장르선택 카테고리
       function categoryChange2(ee) {
						var local_a = [ "춘천시", "원주시", "강릉시", "동해시", "태백시",
								"속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군",
								"정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군" ];
						var local_b = [ "수원시","성남시","의정부시", "안양시",
								"부천시", "광명시", "평택시", "동두천시", "안산시","고양시","과천시", "구리시", "남양주시", "오산시", "시흥시",
								"군포시", "의왕시", "하남시", "용인시", "파주시", "이천시", "안성시",
								"김포시", "화성시", "광주시", "양주시", "포천시", "여주시",
								"연천군", "가평군", "양평군" ];
						var local_c = [ "창원시",  "진주시",
								"통영시", "사천시", "김해시", "밀양시", "거제시", "양산시",
								"의령군", "함안군", "창녕군", "고성군", "남해군", "하동군",
								"산청군", "함양군", "거창군", "합천군" ];
						var local_d = [ "포항시", "경주시",
								"김천시", "안동시", "구미시", "영주시", "영천시", "상주시",
								"문경시", "경산시", "군위군", "의성군", "청송군", "영양군",
								"영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군",
								"봉화군", "울진군", "울릉군" ];
						var local_e = [ "동구", "서구", "남구", "북구", "광산구" ];
						var local_f = [ "중구", "동구", "서구", "남구", "북구", "수성구",
								"달서구", "달성군" ];
						var local_g = [ "동구", "중구", "서구", "유성구", "대덕구" ];
						var local_h = [ "종로구", "중구", "용산구", "성동구", "광진구",
								"동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구",
								"은평구", "서대문구", "마포구", "양천구", "강서구", "구로구",
								"금천구", "영등포구", "동작구", "관악구", "서초구", "강남구",
								"송파구", "강동구" ];		
						var local_j = [ "중구", "남구", "동구", "북구", "울주군" ];
						var local_k = [ "중구", "동구", "미추홀구", "연수구", "남동구",
								"부평구", "계양구", "서구", "강화군", "옹진군" ];
						var local_l = [ "목포시", "여수시", "순천시", "나주시", "광양시",
								"담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군",
								"장흥군", "강진군", "해남군", "영암군", "무안군", "함평군",
								"영광군", "장성군", "완도군", "진도군", "신안군" ];
						var local_m = [ "전주시", "군산시",
								"익산시", "정읍시", "남원시", "김제시", "완주군", "진안군",
								"무주군", "장수군", "임실군", "순창군", "고창군", "부안군" ];
						var local_n = [ "제주시", "서귀포시" ];
						var local_o = [ "중구", "서구", "동구", "영도구", "부산진구", "동래구",
								"남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구",
								"수영구", "사상구", "기장군" ];
						var local_p = [ "천안시", "공주시",
								"보령시", "아산시", "서산시", "논산시", "계룡시", "당진시",
								"금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군" ];
						var local_q = [ "청주시", "충주시", "제천시", "보은군", "옥천군", "영동군",
								"증평군", "진천군", "괴산군", "음성군", "단양군" ];

						var target = document.getElementById("local");

						if (ee.value == "강원") {
							var dd = local_a;
						} else if (ee.value == "경기") {
							var dd = local_b;
						} else if (ee.value == "경남") {
							var dd = local_c;
						} else if (ee.value == "경북") {
							var dd = local_d;
						} else if (ee.value == "광주") {
							var dd = local_e;
						} else if (ee.value == "대구") {
							var dd = local_f;
						} else if (ee.value == "대전") {
							var dd = local_g;
						} else if (ee.value == "서울") {
							var dd = local_h;
						} else if (ee.value == "울산") {
							var dd = local_j;
						} else if (ee.value == "인천") {
							var dd = local_k;
						} else if (ee.value == "전남") {
							var dd = local_l;
						} else if (ee.value == "전북") {
							var dd = local_m;
						} else if (ee.value == "제주") {
							var dd = local_n;
						} else if (ee.value == "부산") {
							var dd = local_o;
						} else if (ee.value == "충남") {
							var dd = local_p;
						} else if (ee.value == "충북") {
							var dd = local_q;
						}

						target.options.length = 0;

						for (x in dd) {
							var opt = document.createElement("option");
							opt.value = dd[x];
							opt.innerHTML = dd[x];
							target.appendChild(opt);
						}
					}
		  
        </script>

<%@ include file="/views/common/adminFooter.jsp"%>
