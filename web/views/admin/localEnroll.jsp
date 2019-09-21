<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/adminHeader.jsp"%>

	<form name = "form" action="<%=request.getContextPath() %>/admin/localEnroll" method="post">
    <%@ include file="/views/common/adminCateAside.jsp"%>
	<section>
  <br>
  <br>
  <br>
    <div id="search1">지역카테고리(Main)</div>
		<table border="1" width="500"  bgcolor="" align="center" cellspacing="0" cellpadding="3" 
		 bordercolor="" bordercolordark="" bordercolorlight="#fddc78">
		    <tr>
		    <td align="left" width="120" bgcolor="">
			<font color="#0000ff">*</font>카테고리선택</td>
		    <td width="400">
			<select name="selectbank" onchange="bankDisplay(this.form)" >
		    <option selected value=0>-선택하세요-
		    <option value="1">강원</option>
			<option value="2">경기</option>
			<option value="3">경남</option>
			<option value="4">경북</option>
			<option value="5">광주</option>
			<option value="6">대구</option>
			<option value="7">대전</option>
			<option value="8">서울</option>
			<option value="9">울산</option>
			<option value="10">인천</option>
			<option value="11">전남</option>
			<option value="12">전북</option>
			<option value="13">제주</option>
			<option value="14">부산</option>
			<option value="15">충남</option>
			<option value="16">충북</option>
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
             <button type="submit" id="scName" name="localCity">등록</button>
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
    	     frm.bank.value = '카테고리명이 표시됩니다.';
    		 break;
    	   case 1:
    	     frm.bank.value = '강원';
    		 break;
    	   case 2:
    	     frm.bank.value = '경기';
    		 break;
    	   case 3:
    	     frm.bank.value = '경남';
    		 break;
    	   case 4:
    	     frm.bank.value = '경북';
    	     break;
    	   case 5:
      	     frm.bank.value = '광주';
    		 break;
    	   case 6:
      	     frm.bank.value = '대구';
      		 break;
      	   case 7:
      	     frm.bank.value = '대전';
      		 break;
      	   case 8:
      	     frm.bank.value = '서울';
      		 break;
      	   case 9:
      	     frm.bank.value = '울산';
      		 break;
      	   case 10:
      	     frm.bank.value = '인천';
      	     break;
      	   case 11:
        	 frm.bank.value = '전남';
      		 break;
      	   case 12:
      	     frm.bank.value = '전북';
      		 break;
      	   case 13:
      	     frm.bank.value = '제주';
      		 break;
      	   case 14:
      	     frm.bank.value = '부산';
      		 break;
      	   case 15:
      	     frm.bank.value = '충남';
      		 break;
      	   case 16:
      	     frm.bank.value = '충북';
      	     break;
        }
    	
        return true;
    }
        //장르선택 카테고리
        function categoryChange(e) {
		  var good_a = ["메이크업", "네일", "헤어"];
		  var good_b = ["마케팅", "편집", "촬영"];
		  var good_c = ["헬스", "축구", "요가/필라테스"];
		  var good_d = ["기타", "DJ", "보컬"];
		  var good_e = ["영어", "중국어", "스페인어"];
		  var target = document.getElementById("good");
		 
		  if(e.value == "뷰티"){
			  var d = good_a;
		  }else if(e.value == "미디어"){
			  var d = good_b;
		  }else if(e.value == "운동"){
			  var d = good_c;
		  }else if(e.value == "음악"){
			  var d = good_d;
		  }else if(e.value == "외국어"){
			  var d = good_e;
		  }
		  
		  target.options.length = 0;
		 
		  for (x in d) {
		    var opt = document.createElement("option");
		    opt.value = d[x];
		    opt.innerHTML = d[x];
		    target.appendChild(opt);
		  }
        }
		  
        </script>

<%@ include file="/views/common/adminFooter.jsp"%>
