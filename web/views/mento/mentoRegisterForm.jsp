<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/myPageAside.jsp" %>
<div class="wrap">
	<div id="myPageContentWrap">
                <div class="bar">
                        <br>
                    <h1 class="center1">멘토신청하기</h1>
                    <br><br>
                    <hr>
                </div>
      <form action="<%=request.getContextPath()%>/mentoRegisterEnd" method="post" enctype="multipart/form-data" class = "center1" id = "mentoFrm">
      
         프로필 사진<input type=file name='mtprofileimg' style='display: none;'>
         <img id="camera"
            src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
            onclick='document.all.mtprofileimg.click(); document.all.file2.value=document.all.file1.value'
            width=150px; height=150px;>
         <p id="profile">
            <br> <br> <br> <br>
            프로필 사진을 업로드 해 주세요.<br>
            수강생 분들에게 신뢰감을 높이기 위해 <br>
            얼굴이 나온 사진이 필수 입니다.
         </p>
         <br> <br>
         아이디
         <input id="nick" type="text" name="mtnickname" value = "<%=m.getmId()%>" readonly="readonly" style = "border : none;">
         <br> <br>
         <br> <br>
         별명
         <input id="nick" type="text" name="mtnickname">
         <br> <br> <br> <br>
         신분/학력 인증
         <input id="school1" type="radio" name="mthowconfirm" value="대학교인증" /> 대학인증
         <input id="school2" type="radio" name="mthowconfirm" value="신분증인증" /> 신분증인증 
         <br> <br>
         <input id="school3" type="text"
            name="mtacademic" placeholder="학교" />
         <input id="school4"
            type="text" name="mtacademicdept" placeholder="학과" />
         <br /> <br>
         <input id="school5" type="radio" name="mtgraduation" value="재학" /> 재학
         <input id="school6" type="radio" name="mtgraduation" value="졸업" /> 졸업
         <br> <br>
         신분인증사진
         <input id="photo" type="file"
            name="mtconfirming" id="profile_pt"
            onchange="previewImage(this,'View_area')">
         <div id='View_area'
            style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
         </div>
         <br> <br>
         
         자격증 1 (선택)
         <input id="school7" type="text"
            name="mtlicense" /> <br> <br> 자격증 1 사진 <input id="photo"
            type="file" name="mtlicenseimg" id="profile_pt"
            onchange="previewImage(this,'View_area')">
         
         <div id='View_area'
            style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
         </div>
         
         자격증 2 (선택)
         <input id="school7" type="text" name="mtlicense2" />
         <br><br>
         
         자격증 2 사진 <input id="photo" type="file" name="mtlicenseimg2"
            id="profile_pt" onchange="previewImage(this,'View_area')">
         <div id='View_area'
            style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
         </div>
         <div class = "center1">
                    <input type="button" id = "btnDelete" value="신청하기" class="next center1" onclick="enrollMento();">
            </div>
         
      </form>
   </div>
   </div>
    <script>
     function enrollMento(){
         var frm=$('#mentoFrm');
         var url="<%=request.getContextPath()%>/mento/mentoRegisterEnd.do?mNum=<%=m.getmNum()%>";
         frm.attr("action",url);
         frm.submit();
         }
        </script>
</section>
<%@ include file="/views/common/footer.jsp"%>