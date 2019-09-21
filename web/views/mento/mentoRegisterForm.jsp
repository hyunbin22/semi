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
        <div class="box">
         <div class="lecture" style='margin-top:50px;'>프로필 사진</div>
         <div style='margin:0;'><input type=file name='mtprofileimg' style='display: none;' class="title2">
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
            </div>
         </div>
         <br> <br>
         <div class = "box"><div class = "lecture">아이디</div>
         <div class = "lecture"><input id="nick" type="text" name="mtnickname" value = "<%=m.getmId()%>" readonly="readonly" style = "border : none;"></div>
         </div>
         <br> <br>
         <br> <br>
        <div class = "box"><div class = "lecture">별명</div>
         <input id="nick" type="text" name="mtnickname" class = "title2">
         </div>
         <br> <br> <br> <br>
         <span class = "lecture">신분/학력 인증</span>
         <input id="school1" type="radio" name="mthowconfirm" value="대학교인증" /> 대학인증
         <input id="school2" type="radio" name="mthowconfirm" value="신분증인증" /> 신분증인증 
         <br> <br>
         <input id="school3" type="text"
            name="mtacademic" placeholder="학교" class = "title2"/>
         <input id="school4"
            type="text" name="mtacademicdept" placeholder="학과" class = "title2"/>
         <br /> <br>
         <input id="school5" type="radio" name="mtgraduation" value="재학" /> 재학
         <input id="school6" type="radio" name="mtgraduation" value="졸업" /> 졸업
         <br> <br>
         	<span class = "lecture">신분인증사진</span>
         	<input class = "title2" id="photo" type="file"
            name="mtconfirming" id="profile_pt"
            onchange="previewImage(this,'View_area')">
         <div id='View_area'
            style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
         </div>
         <br> <br>
         
         <span class = "lecture">자격증 1 (선택)</span>
         <input id="school7" type="text"
            name="mtlicense" class = "title2"/> <br> <br> <span class = "lecture">자격증 1 사진</span> <input id="photo"
            type="file" name="mtlicenseimg" id="profile_pt"
            onchange="previewImage(this,'View_area')">
         
         <div id='View_area'
            style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
         </div>
         
         <span class = "lecture">자격증 2 (선택)</span>
         <input id="school7" type="text" name="mtlicense2" class = "title2"/>
         <br><br>
         
         <span class = "lecture">자격증 2 사진</span> <input id="photo" type="file" name="mtlicenseimg2"
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
     

     function enrollMento(){
         var frm=$('#mentoFrm');
         var url="<%=request.getContextPath()%>/mento/mentoRegisterEnd.do?mNum=<%=m.getmNum()%>";
         frm.attr("action",url);
         frm.submit();
         }
        
     // 빈칸 체크
     function checkNull(){
        
        var profile =$('#profile');
        var nick=$('#nick');
        
        // 대학인증, 신분증인증
        var school1=$('#school1');
        var school2=$('#school2');
        
        // 학교, 학과
        var school3=$('#school3');
        var school4=$('#school4');
        
        // 재학, 졸업
        var school5=$('#school5');
        var school6=$('#school6');
        
        // 신분인증사진
        var photo=$('#photo');
        
        // 은행, 계좌번호
        var bank=$('#bank');
        var accountNumber=$('#accountNumber');
        
        if(profile.val()==null){
           alert('프로필 사진을 등록하세요.');
           profile.focus();
           return false;
        }
        if(nick.val().length()<2){
           alert('닉네임은 2글자 이상 가능합니다.');
           nick.focus();
           return false;
        }
        if(school1.val()==null&&school2.val()==null){
           alert('인증방법을 선택하세요.');
           return false;
        }
        if(school3.val()==null){
           alert('학교를 입력하세요.');
           school3.focus();
           return false;
        }
        if(school4.val()==null){
           alert('학과를 입력하세요.');
           scholl4.focus();
           return false;
        }
        if(school5.val()==null&&school6.val()==null){
           alert('재학 혹은 졸업을 선택하세요.');
           return false;
        }
        if(photo.val()=null){
           alert('신분인증사진을 등록하세요.')
           return false;
        }
        if(bank.val()=null){
           alert('은행을 선택하세요.');
           return false;
        }
        if(accountNumber()==null){
           alert('계좌번호를 선택하세요.');
           return false;
        }
        
        return true;
     }
       </script>
</section>
<%@ include file="/views/common/footer.jsp"%>