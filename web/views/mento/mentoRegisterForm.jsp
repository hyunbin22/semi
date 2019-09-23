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
      <form action="<%=request.getContextPath()%>/mento/mentoRegisterEnd.do" method="post" enctype="multipart/form-data" class="center1" id="mentoFrm" onsubmit="return checkNull();">
        <div class="box">
         <div class="lecture" style='margin-top:50px;'>프로필 사진</div>
         <div style='margin:0;'><input type=file name='mtprofileimg' class="title2" id="profileImg"><br><br>
         <img id="camera"
            src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
            
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
         <div class = "lecture"><input type="text" name="mtnickname" value = "<%=m.getmId()%>" readonly="readonly" style = "border : none;"></div>
         </div>
         <br> <br>
         <br> <br>
        <div class = "box">
           <div class = "lecture">별명</div>
            <input id="nick" type="text" name="mtnickname" class = "title2">
         </div>
         <br> <br> <br> <br>
         <span class = "lecture">신분/학력 인증</span>
         <input id="school1" type="radio" name="mthowconfirm" value="대학교인증" /> 대학교인증
         <input id="school12" type="radio" name="mthowconfirm" value="대학원인증"/> 대학원인증
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
            <input class = "title2" id="confirmPhoto" type="file" name="mtconfirming"><br><br>
            <img id="confirming" src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
 width=150px; height=150px;/>
         
         <br> <br>
         
         <span class = "lecture">자격증 1 (선택)</span>
         <input id="school7" type="text"
            name="mtlicense" class = "title2"/> <br> <br> <span class = "lecture">자격증 1 사진</span> <input id="licensePhoto" class="title2"
            type="file" name="mtlicenseimg" id="profile_pt" ><br><br>
            <img id="licenseImg"
	src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
 	width=150px; height=150px;/><br><br>
         
         
         <span class = "lecture">자격증 2 (선택)</span>
         <input id="school8" type="text" name="mtlicense2" class = "title2"/>
         <br><br>
         
         <span class = "lecture">자격증 2 사진</span> <input class="title2" id="licensePhoto2" type="file" name="mtImgLicense"
            id="profile_pt2"><br><br>
         <img id="licenseImg2"
	src='https://dumielauxepices.net/sites/default/files/digital-camera-clipart-basic-camera-502592-7419029.jpg'
 	width=150px; height=150px;/><br><br>
            <span class = "lecture">은행</span> <select name="mtbank" id="bank" style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'>
               <option value="농협은행">농협은행</option>
               <option value="카카오뱅크">카카오뱅크</option>
               <option value="국민은행">국민은행</option>
               <option value="신한은행">신한은행</option>
               <option value="기업은행">기업은행</option>
               <option value="우리은행">우리은행</option>
            </select>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class = "lecture">계좌번호</span>
            <input id="accountNumber" type="text" name="mtAccountNumber" style='display:inline;'>
            <br>
            <br>
         
         <div class = "center1">
                    <input type="submit" id = "btnDelete" value="신청하기" class="next center1" onclick="enrollMento();">
            </div>
         
      </form>
   </div>
   </div>
    <script>
    
    $(document).on("change","input[name='mtprofileimg']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
    
    $(document).on("change","input[name='mtconfirming']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
    
    $(document).on("change","input[name='mtconfirming']",function(event) {
        var ext = $(this).val().split('.').pop().toLowerCase();
        var fileSize = (this).files[0].size;
        var maxSize = 1024*1024*1024;
        
        if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
           alert("등록할 수 없는 확장자입니다.");
           $(this).val("");
           return;
        } 
        
        if(fileSize > maxSize) {
           alert("첨부파일 크기는 1GB 이내로 등록 가능합니다.");
           $(this).val("");
           return;
        }
     });
     

     function enrollMento(){
         var frm=$('#mentoFrm');
         var url="<%=request.getContextPath()%>/mento/mentoRegisterEnd.do?mNum=<%=m.getmNum()%>";
         frm.attr("action",url);
         frm.submit();
         }
        
     // 빈칸 체크
     function checkNull(){
        
        var profile =$('#profileImg');
        var nick=$('#nick');
        
        // 대학인증, 신분증인증
        var school1=$('#school1');
        var school2=$('#school2');
        var school12=$('#school12');
        
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
        
        if(profile.val()==""){
           alert('프로필 사진을 등록하세요.');
           profile.focus();
           return false;
        }
        if(nick.val().length<2){
           alert('닉네임은 2글자 이상 가능합니다.');
           
           nick.focus();
           return false;
        }
        if(school1.is(':checked')==false&&school12.is(':checked')==false&&school2.is(':checked')==false){
            alert('신분/학력 인증을 선택하세요.');
            return false;
         }
         if(schoo1.is(':checked')==true || school12.is(':checked')==true) {
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
          }
        if(photo.val()==""){
           alert('신분인증사진을 등록하세요.')
           return false;
        }
        if(bank.val()==null){
           alert('은행을 선택하세요.');
           return false;
        }
        if(accountNumber.val()==null){
           alert('계좌번호를 입력하세요.');
           return false;
        }
        return true;
     }
     
      //프로필사진 미리보기
     function readURL(input) {
          if (input.files && input.files[0]) {
           var reader = new FileReader();
           
           reader.onload = function (e) {
            $('#camera').attr('src', e.target.result);  
           }
           
           reader.readAsDataURL(input.files[0]);
           }
         }   
         
         $("#profileImg").change(function(){
            readURL(this);
         });
         
         
         
       //신분증사진 미리보기
       function confirmReadURL(input) {
          if (input.files && input.files[0]) {
           var reader = new FileReader();
           
           reader.onload = function (ee) {
            $('#confirming').attr('src', ee.target.result);  
           }
           
           reader.readAsDataURL(input.files[0]);
           }
         }   
         
         $("#confirmPhoto").change(function(){
        	 confirmReadURL(this);
         });
         
         //자격증사진 미리보기
         function licenseImageURL(input) {
          if (input.files && input.files[0]) {
           var reader = new FileReader();
           
           reader.onload = function (ee) {
            $('#licenseImg').attr('src', ee.target.result);  
           }
           
           reader.readAsDataURL(input.files[0]);
           }
         }   
         
         $("#licensePhoto").change(function(){
        	 licenseImageURL(this);
         });
         
         function licenseImageURL2(input) {
             if (input.files && input.files[0]) {
              var reader = new FileReader();
              
              reader.onload = function (ee) {
               $('#licenseImg2').attr('src', ee.target.result);  
              }
              
              reader.readAsDataURL(input.files[0]);
              }
            }   
            
            $("#licensePhoto2").change(function(){
            	licenseImageURL2(this);
            });
       </script>
</section>
<%@ include file="/views/common/footer.jsp"%>