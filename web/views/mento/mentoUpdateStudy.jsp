<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ page import="com.semi.mento.model.vo.Mento" %>
    <%@ page import="com.semi.lecture.model.vo.Lecture" %>
    <%@ page import="java.util.*, com.semi.category.model.vo.Category, com.semi.subcategory.model.vo.SubCategory, com.semi.local.model.vo.Local, com.semi.sublocal.model.vo.SubLocal"%>
    <%@ page import="com.semi.lecture.model.vo.LectureUpload" %>
    <% 
       String mtNum = (String) request.getAttribute("mtNum");
       Lecture lt = (Lecture)request.getAttribute("lecture");
       List<Category> cList=(List)request.getAttribute("category");
       List<SubCategory> scList=(List)request.getAttribute("scList");
       List<Local> lList=(List)request.getAttribute("local");
       List<Lecture> leclist=(List)request.getAttribute("lList");
       String coverName=null;
       String classImgName=null;
    for(LectureUpload cn : lt.getLectureUpList()){
          if(cn.getUpLectureCategory().equals("cover")){
             coverName=cn.getUpLectureReName();
          }if(cn.getUpLectureCategory().equals("lecimage")){
             classImgName=cn.getUpLectureReName();
          }
       }
    %>
<%@ include file="/views/common/myPageAside.jsp" %>
<div class="wrap">
     <div id="myPageContentWrap">
         <br>
         <br>
         <h1 class="center1">멘토 강의수정</h1>
         <br>
         <br>
         <hr>
      </div>
      <div class="regdata center1">
         <div class="lecture">필수입력<b style='color:#ff005a;'> *</b>표시</div>
         <form action="<%=request.getContextPath()%>/mento/updateLecture.do?lecNum=<%=lt.getLecNum()%>" method="POST" enctype="multipart/form-data"onsubmit="return checkValue();">
            <div class="box">
            <div class="lecture" >수업제목</div>
         
            <input type="text" id="title" name="className" value="<%=lt.getLecName()%>" class="title2" style='width:440px;'>
            <span id="titleCheck" class="rg-checkMsg"></span>
            </div>
            <br> <br> <br>
            <hr>
            <div class="box">
            <div class="lecture" >수업카테고리<b style='color:#ff005a;'>*</b></div>
            <select name="maincategory" id="maincategory" class="title2" >
               <option value="0">카테고리선택</option>
               <%
                  for (Category c : cList) {
               %>
               <option value="<%=c.getScNum()%>"><%=c.getScName()%></option>
               <%
                  }
               %>
            </select>
            
             <select id="good" name="subcategory" class="title2" >
               <option value="0">과목선택</option>
            </select>
            <span id="mCategory" class="rg-checkMsg"></span>
            </div>
             <br> <br>
             <hr>
            <div class="box">
            <div class="lecture">수업형태</div>
            <%if(lt.getLecType().equals("그룹")) { %>
                     <input type="text" name="studentCount"   value="<%=lt.getLecMaxCount()%>" class="title2" >
                     <input type="radio" name="classType" id="r2" value="그룹" style='margin-top:19px;' checked><label   for="r2" style='margin-top:17px; margin:10px;'>그룹수업</label>
                     <input type="radio" name="classType" id="r1" value="1대1" style='margin-top:19px;'><label for="r1" style='margin-top:17px; margin:10px;'>1대1수 업</label>                             
                            <%} else { %>
                     <input type="text" name="studentCount"   value="<%=lt.getLecMaxCount()%>" class="title2" >
                           <input type="radio" name="classType" id="r2" value="그룹" style='margin-top:19px;' ><label   for="r2" style='margin-top:17px; margin:10px;'>그룹수업</label>
                     <input type="radio" name="classType" id="r1" value="1대1" style='margin-top:19px;' checked><label for="r1" style='margin-top:17px; margin:10px;'>1대1수업</label>            
                        <%} %>
            <br> <br>
            </div>
            <br><br>
            <hr>
            <div class="box">
            <div class="lecture">커버사진등록<b style='color:#ff005a;'>*</b></div>
            <br>
             <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;'>
             <input type='file' id="file1" name="file1" /> <br> <br>
         
              <img id="image_section1" alt="미리보기" src="<%=request.getContextPath() %>/upload/lecture/<%=coverName%>" style='position: relative; width: 250px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'>
                          
               </div>
               </div>
               <span id="coverImg" class="rg-checkMsg"></span>
               <br><br><br><br><br><br><br>
               <hr>
            <div class="box">
            <div class="lecture">수업사진등록<b style='color:#ff005a;'>*</b></div>
            <table width="400" border="0" cellspacing="0" cellpadding="0" style= 'margin:0;'>
               <tr>
                  <td colspan="2" align="left" bgcolor="#FFFFFF">
                     <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                           <td colspan="5" bgcolor="#FFFFFF" height="25" align="left">
                              <input name="addButton" type="button" style="cursor: hand" onClick="insRow()" value="추가">
                               <font color="#FF0000">*</font>추가버튼을
                              클릭해 보세요.
                           </td>
                        </tr>
                        <br>
                        <tr>
                           <td height="25">
                              <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
                                 <tr>
                                    <br>
                                    <td>
                                     <input type='file' id="addImg" name="addImg"/></td>
                                    <td align="left"></td>
                                 </tr>
                              </table>
                              <br>
                        <div id='View_area' style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; margin:0;' >
                                  <img src="<%=request.getContextPath() %>/upload/lecture/<%=classImgName%>" id="image_section2" alt="미리보기" style='position: relative; width: 250px; height: 200px; color: black; border: 0px solid black; dispaly: inline;'>            
                          
                                    </div>
                                    </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
            </div>
            <span id="lectureImg" class="rg-checkMsg"></span>
            <br><br><br>
            
            <input type="hidden" value=<%=mt.getMtNum() %> name="mtNum">
            <br> <br>
            <hr>
            <div class="box">
            <div class="lecture">멘토소개</div>
            <textarea id="mento" cols="30" rows="10" name="mentoIntroduce" class="title2"><%=lt.getLecMentoContent().replaceAll("<br>", " ").replaceAll("&nbsp;"," ")%></textarea>
            <span id="mentoIntroduce" class="rg-checkMsg"></span>
            </div>
            <br> <br>
            <hr>
            <div class="box">
            <div class="lecture">강의소개</div>
            <textarea id="lecture" cols="30" rows="10" name="classIntroduce" class="title2"><%=lt.getLecLectureContent().replaceAll("<br>", " ").replaceAll("&nbsp;"," ")%></textarea>
            <span id="lectureIntroduce" class="rg-checkMsg"></span>
            </div>
            <br> <br>
            <hr>
            <div class="box">
            <div class="lecture">시간당가격</div>
            <input type="text" name="price" id="hourPrice" value="<%=lt.getLecPrice()%>" class="title2"> 원 <br>
            <span id="lecPrice" class="rg-checkMsg"></span>
            </div>
            <br> <br>
            <div class="box">
            <div class="lecture">기본수업시간<b style='color:#ff005a;'>*</b></div>
            <select name="time" id="time" class="title2">
               <option value="0"><%=lt.getLecTime() %>시간(현재)</option>
               <option value="1">1시간</option>
               <option value="2">2시간</option>
               <option value="3">3시간</option>
               <option value="4">4시간</option>
               <option value="5">5시간</option>
               <option value="6">6시간</option>
            </select> /회
            <span id="lecTime" class="rg-checkMsg"></span>
            </div>
            <br> <br>
            <div class="box">
            <div class="lecture">총수업(한달기준)</div>
            <input type="text" name="totaltime" id="totalTime"
               value="<%=lt.getLecCount()%>" onkeyup="total()" class="title2">회 
            <span id="lecTotalTime" class="rg-checkMsg"></span>
            </div>
            <br><br><br>
            <hr>
            <div class="lecture">총가격</div>
               <div class="calc-total" style=' border-radius: 4px;  padding: 12px 24px; width: 100%; text-align: right; float: right; color: #555; font-size: 15px; background: #edf0f4;'>
               <dl>
                  <dt style='text-align:left;'>
                     <font id="calc-price"><span id="price2"><%=lt.getLecPrice() %></span></font>원 X <font
                        id="calc-time"><span id="time2"><%=lt.getLecTime() %></span></font>시간 X <font
                        id="calc-totaltime"><span id="totalTime2"><%=lt.getLecCount() %></span></font>회
                  </dt>
                  <dd style='color: #ff005a; font-size:20px'>
                     총 <font id="calc-result"><span id="totalPrice2"><%=lt.getLecPrice()*lt.getLecTime()*lt.getLecCount() %></span></font>원
                  </dd>
                  <dd>
                     연결수수료 <font id="calc-fee"><span id="fee2"><%=lt.getLecPrice() %></font>원
                  </dd>
               </dl>
            </div>
            <br>            
            <br><br><br><br><br><br>
            <hr>
            <div class="box">
            <div class="lecture">장소<b style='color:#ff005a;'>*</b></div>
            <select name="local1" id="local1" class="title2">
               <option value="0">지역선택</option>
               <%
                  for (Local l : lList) {
               %>
               <option value="<%=l.getLocalNum()%>"><%=l.getLocalCity()%></option>
               <%
                  }
               %>
            </select>
            <select id="local" name="local"  class="title2">
               <option id="si">시/구/군 선택</option>
            </select> <br> <br>
            <input type="text" name="local2" id="local2"
               value="<%=lt.getLecLocalContent()%>" class="title2"> <br> <br> <br>
            <span id="localCt" class="rg-checkMsg"></span>
               <span id="localDetail" class="rg-checkMsg"></span>
            </div>      
            <br><br>
            <hr>
            <div class="box">
            <div class="lecture">가능 요일별 시간대(복수선택)<b style='color:#ff005a;'>*</b></div>
            </div>
            <input type="checkbox" name="yo" value="월요일">월요일
            
            <input type="checkbox" name="yo" value="화요일">화요일
            
            <input type="checkbox" name="yo" value="수요일">수요일
            
            <input type="checkbox" name="yo" value="목요일">목요일
            
            <input type="checkbox" name="yo" value="금요일">금요일
            
            <input type="checkbox" name="yo" value="토요일">토요일
            
            <input type="checkbox" name="yo" value="일요일">일요일
            <small><div>*변경전 선택한 요일 (<%for (Lecture list : leclist){ %>
                  <%=list.getLecWeek() %>
                     <%} %>)
            </div></small>
            
            <br> <br>
            <hr>
            <div class="box">
            <%
                  if(lt.getLecTot()==null) {
               %>
             <input type="text" name="day1"   placeholder="ex>오후7시~오후9시" class="title2">
               <%}else{%>
                      <input type="text" name="day1"   value="<%=lt.getLecTot()%>" class="title2">
                     
               <%} %>
               
               <%
                  if(lt.getLecMeet().equals("선택")) {
               %>
                    <input type="radio" name="week1" id="f1" value="선택" style='margin-top:17px; ' checked><label for="f1" style='margin:10px;'></label>
                      <input type="date" name="month1" min='2019-01-01' max='2019-12-31' value="<%=lt.getLecOpenDate()%>" class="title2"/>
                      <input type="radio" name="week1" id="f2" value="협의" style='margin-top:17px; '><label for="f2" style='margin:10px;'>협의</label> <br> <br> <br>  
                     <span id="day2" class="rg-checkMsg"></span>
               <%}else{%>
                             <input type="radio" name="week1" id="f1" value="선택" style='margin-top:17px; '><label for="f1" style='margin:10px;'></label>
                      <input type="date" name="month1" min='2019-01-01' max='2019-12-31' value="<%=lt.getLecOpenDate()%>" class="title2"/>
                      <input type="radio" name="week1" id="f2" value="협의"  style='margin-top:17px; ' checked><label for="f2" style='margin:10px;'>협의</label> <br> <br> <br>  
                     <span id="day2" class="rg-checkMsg"></span>
               <%} %> 
               </div>
            <br>
            <div class="box">                        
   
             <%
                  if(lt.getLecTot2()==null) {
               %>
             <input type="text" name="day2" placeholder="ex>오후7시~오후9시" class="title2">
               <%}else{%>
                      <input type="text" name="day2"   value="<%=lt.getLecTot2()%>" class="title2">
                     
               <%} %>
               
                     <%
                  if(lt.getLecMeet().equals("선택")) {
               %>
                       <input type="radio" name="week2" id="f3" value="선택" style='margin-top:17px; ' checked><label for="f3" style='margin:10px;'></label>
                      <input type="date" name="month2" min='2019-09-23' max='2019-12-31' class="title2" value="<%=lt.getLecOpenDate2()%>"/>
                      <input type="radio" name="week2" id="f4" value="협의" style='margin-top:17px; '><label for="f4" style='margin:10px;'>협의</label> <br> <br> <br>   
                     <span id="day3" class="rg-checkMsg"></span>
               <%}else{%>
                      <input type="radio" name="week2" id="f3" value="선택" style='margin-top:17px; '><label for="f3" style='margin:10px;'></label>
                      <input type="date" name="month2" min='2019-09-23' max='2019-12-31' class="title2" value="<%=lt.getLecOpenDate2()%>"/>
                      <input type="radio" name="week2" id="f4" value="협의" style='margin-top:17px; ' checked><label for="f4" style='margin:10px;'>협의</label> <br> <br> <br>   
                     <span id="day3" class="rg-checkMsg"></span>
               <%} %>                             
            </div>
            <br>
            <div class="center1">
                        <button type="submit" id="insert1" name="submit1" style='color: #fff; border:none; padding: 6px 10px; width: 130px; margin: 20px auto; font-size: 16px; border-radius: 6px; text-align: center; background: #eb9f9f;'>승인요청</button>
            </div>
         
         </form>
      </div>
   </div>
</div>
</section>
<script>

$(function(){
    var titleCheck = $('#titleCheck');
   $('#title').blur(function(){
      var rgTitle = $('#title').val();
               if (rgTitle == "") {
                  $(titleCheck).text('제목을 입력해주세요.');
                  $(titleCheck).css({"color" : "red","font-size" : "11px"});
                  $(titleCheck).prop("disabled",true);
               } else {
                  $(titleCheck).text("");
                  $(titleCheck).prop("disabled",false);
                  }       
      });
   });
   
$(function(){
    var lectureIntroduce = $('#lectureIntroduce');
   $('#lecture').blur(function(){
      var rgLectureIntroduce = $('#lecture').val();
               if (rgLectureIntroduce == "") {
                  $(lectureIntroduce).text('강의소개를 입력해주세요.');
                  $(lectureIntroduce).css({"color" : "red","font-size" : "11px"});
                  $(lectureIntroduce).prop("disabled",true);
               }  else {
                  $(lectureIntroduce).text("");
                  $(lectureIntroduce).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var mentoIntroduce = $('#mentoIntroduce');
   $('#mento').blur(function(){
      var rgMentoIntroduce = $('#mento').val();
               if (rgMentoIntroduce == "") {
                  $(mentoIntroduce).text('멘토소개를 입력해주세요.');
                  $(mentoIntroduce).css({"color" : "red","font-size" : "11px"});
                  $(mentoIntroduce).prop("disabled",true);
               }  else {
                  $(mentoIntroduce).text("");
                  $(mentoIntroduce).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var mCategory = $('#mCategory');
   $('#maincategory').blur(function(){
      var rgMainCategory = $('#maincategory').val();
               if (rgMainCategory==0) {
                  $(mCategory).text('카테고리를 선택해주세요.');
                  $(mCategory).css({"color" : "red","font-size" : "11px"});
                  $(mCategory).prop("disabled",true);
               }  else {
                  $(mCategory).text("");
                  $(mCategory).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var sCategory = $('#sCategory');
   $('#good').blur(function(){
      var rgSubCategory = $('#good').val();
               if (rgSubCategory==0) {
                  $(sCategory).text('하위카테고리를 선택해주세요.');
                  $(sCategory).css({"color" : "red","font-size" : "11px"});
                  $(sCategory).prop("disabled",true);
               }  else {
                  $(sCategory).text("");
                  $(sCategory).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var lecPrice = $('#lecPrice');
   $('#hourPrice').blur(function(){
      var rgHourPrice = $('#hourPrice').val();
               if (rgHourPrice==0) {
                  $(lecPrice).text('가격을 입력해주세요.');
                  $(lecPrice).css({"color" : "red","font-size" : "11px"});
                  $(lecPrice).prop("disabled",true);
               }  else {
                  $(lecPrice).text("");
                  $(lecPrice).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var lecTime = $('#lecTime');
   $('#time').blur(function(){
      var rgTime = $('#time').val();
               if (rgTime==0) {
                  $(lecTime).text('시간을 선택해주세요.');
                  $(lecTime).css({"color" : "red","font-size" : "11px"});
                  $(lecTime).prop("disabled",true);
               }  else {
                  $(lecTime).text("");
                  $(lecTime).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var lecTotalTime = $('#lecTotalTime');
   $('#totalTime').blur(function(){
      var rgTotalTime = $('#totalTime').val();
               if (rgTotalTime==0) {
                  $(lecTotalTime).text('총수업 횟수를 선택해주세요.');
                  $(lecTotalTime).css({"color" : "red","font-size" : "11px"});
                  $(lecTotalTime).prop("disabled",true);
               }  else {
                  $(lecTotalTime).text("");
                  $(lecTotalTime).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var localCt = $('#localCt');
   $('#local1').blur(function(){
      var rgLocal1 = $('#local1').val();
               if (rgLocal1==0) {
                  $(localCt).text('지역을 선택해주세요.');
                  $(localCt).css({"color" : "red","font-size" : "11px"});
                  $(localCt).prop("disabled",true);
               }  else {
                  $(localCt).text("");
                  $(localCt).prop("disabled",false);
                  }    
      });
   });
   
$(function(){
    var localDetail = $('#localDetail');
   $('#local2').blur(function(){
      var rgLocal2 = $('#local2').val();
               if (rgLocal2==0) {
                  $(localDetail).text('세부장소를 입력해주세요.');
                  $(localDetail).css({"color" : "red","font-size" : "11px"});
                  $(localDetail).prop("disabled",true);
               }  else {
                  $(localDetail).text("");
                  $(localDetail).prop("disabled",false);
                  }    
      });
   });

      $(function(){
          var day2 = $('#day2');
         $('#month1').blur(function(){
            var rgMonth1 = $('#month1').val();
                     if (rgMonth1==0) {
                        $(day2).text('날짜를 입력해주세요.');
                        $(day2).css({"color" : "red","font-size" : "11px"});
                        $(day2).prop("disabled",true);
                     }  else {
                        $(day2).text("");
                        $(day2).prop("disabled",false);
                        }    
            });
         });
   
      $(function(){
          var day3 = $('#day3');
         $('#month2').blur(function(){
            var rgMonth2 = $('#month2').val();
                     if (rgMonth2==0) {
                        $(day3).text('날짜를 입력해주세요.');
                        $(day3).css({"color" : "red","font-size" : "11px"});
                        $(day3).prop("disabled",true);
                     }  else {
                        $(day3).text("");
                        $(day3).prop("disabled",false);
                        }    
            });
         });
      
      $(function(){
          var coverImg = $('#coverImg');
         $('#file1').blur(function(){
            var rgFile1 = $('#file1').val();
                     if (rgFile1==0) {
                        $(coverImg).text('커버사진을 등록해주세요.');
                        $(coverImg).css({"color" : "red","font-size" : "11px"});
                        $(coverImg).prop("disabled",true);
                     }  else {
                        $(coverImg).text("");
                        $(coverImg).prop("disabled",false);
                        }    
            });
         });
      
      $(function(){
          var lectureImg = $('#lectureImg');
         $('#addImg').blur(function(){
            var rgAddImg = $('#addImg').val();
                     if (rgAddImg==0) {
                        $(lectureImg).text('수업사진을 등록해주세요.');
                        $(lectureImg).css({"color" : "red","font-size" : "11px"});
                        $(lectureImg).prop("disabled",true);
                     }  else {
                        $(lectureImg).text("");
                        $(lectureImg).prop("disabled",false);
                        }    
            });
         });
   
   
      function checkValue() {
         //요일을 선택안했을때
         var fields = $("input[name='yo']").serializeArray(); 
          if (fields.length === 0) 
          { 
              alert('요일을 체크하세요.'); 
              // cancel submit
              return false;
          }
         //제목 체크글자가 보일때
         if ($('#title').val().length==0) {
            alert("카테고리를 확인하세요.");
            return false;
         }
         //제목 체크글자가 보일때
         if ($('#title').val().length==0) {
            alert("제목을 확인하세요.");
            return false;
         }
         //멘토소개 체크글자가 보일때
         if ($('#mento').val().length==0) {
            alert("멘토소개를 확인하세요.");
            return false;
         }
         //강의소개 체크글자가 보일때
         if ($('#lecture').val().length==0) {
            alert("강의소개를 확인하세요.");
            return false;
         }   
         //카테고리 체크글자가 보일때
         if ($('#maincategory').val()=='' || $('#maincategory').val()==null || $('#maincategory').val().length==0 || $('#maincategory').val()=="0") {
            alert("카테고리를 확인하세요.");
            return false;
         }
         //하위카테고리 체크글자가 보일때
         if ($('#good').val()=='' || $('#good').val()==null || $('#good').val().length==0 || $('#good').val()=="0") {
            alert("하위카테고리를 확인하세요.");
            return false;
         }
         //가격 체크글자가 보일때
         if ($('#hourPrice').val().length==0) {
            alert("가격을 확인하세요.");
            return false;
         }
         //수업시간 체크글자가 보일때
         if ($('#time').val()=="0") {
            alert("수업시간을 선택하세요.");
            return false;
         }
         //총수업횟수 체크글자가 보일때
         if ($('#totalTime').val().length==0) {
            alert("총수업 횟수를 확인하세요.");
            return false;
         }
         //지역 체크글자가 보일때
         if ($('#local1').val()=="0") {
            alert("지역을 선택하세요.");
            return false;
         }
         //세부장소 체크글자가 보일때
         if ($('#local2').val().length==0) {
            alert("세부장소을 입력하세요.");
            return false;
         }
         //날짜1 체크글자가 보일때
         if ($('#month1').val().length==0) {
            alert("날짜를 선택하세요.");
            return false;
         }
         //날짜2 체크글자가 보일때
         if ($('#month2').val().length==0) {
            alert("날짜를 선택하세요.");
            return false;
         }
         //커버사진 체크글자가 보일때
         if ($('#file1').val().length==0) {
            alert("커버사진을 등록하세요.");
            return false;
         }
         //수업사진 체크글자가 보일때
         if ($('#addImg').val().length==0) {
            alert("수업사진을 등록하세요.");
            return false;
         }
      };

//커버사진 미리보기
function readURL(input) {
     if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (e) {
       $('#image_section1').attr('src', e.target.result);  
      }
      
      reader.readAsDataURL(input.files[0]);
      }
    }   
    
    $("#file1").change(function(){
       readURL(this);
    });
    
  //수업사진 미리보기
  function readURL2(input) {
     if (input.files && input.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function (ee) {
       $('#image_section2').attr('src', ee.target.result);  
      }
      
      reader.readAsDataURL(input.files[0]);
      }
    }   
    
    $("#addImg").change(function(){
       readURL2(this);
    });

       //장르선택 카테고리
      $(function(){
         $("#maincategory").click(function(){
            $.ajax({
               url : "<%=request.getContextPath()%>/selectSubCategory?scNum=" + $('#maincategory').val(),
               type : "post",
               dataType : "html",
               success:function(data){
                  $("#good").find("option").remove();

                  var datas = data.split(",");
            
                       for(var i = 0; i < datas.length; i++){    
                          if(data==0){
                             $("#good").append("<option value='1'>과목선택</option>");
                          }else{
                          $('<option value="' + (i+1) +'">' + datas[i] + '</option>').appendTo('#good');
                    }
                       }
               }
            });
         });
      });
             
       //기본수업시간선택
      $("#time").on("propertychange change keyup paste input",
            function() {
               var currentVal = $(this).val();
               var opt = document.getElementById("time2");
               opt.innerHTML=currentVal;
                        
      })
      
      //시간당가격입력
      $("#hourPrice").on("propertychange change keyup paste input",
            function() {
               var currentVal = $(this).val();
               var opt = document.getElementById("price2");
               opt.innerHTML=currentVal;
                        
      })
      
      //한달 기준 총수업
      $("#totalTime").on("propertychange change keyup paste input",
            function() {
               var currentVal = $(this).val();
               var opt = document.getElementById("totalTime2");
               opt.innerHTML=currentVal;
                        
      })
      
      //연결수수료
      $("#hourPrice").on("propertychange change keyup paste input",
            function() {
               var currentVal = $(this).val();
               var opt = document.getElementById("fee2");
               opt.innerHTML=currentVal;
                        
      })
      
      //총액계산
      function total() //total()함수 부분

      {
      
        var hourPrice1=document.getElementById("hourPrice"); //<body>부분에서 num1변수를 getElementById를 이용하여 값을 가져온다.
      
        var hourPrice1s=hourPrice1.value; // num1에서 가져온 값을 num1s에 저장해주고,
      
        var hourPrice1b=parseInt(hourPrice1s); // 계산을 하기위해 그 값을 int형으로 바꿔준다.
      
        var totalTime2=document.getElementById("totalTime"); //위 방법과 같음..
      
        var totalTime2s=totalTime2.value;
      
        var totalTime2b=parseInt(totalTime2s);   
      
        var time1=document.getElementById("time"); //역시 op값을 가져오고
      
        var times=time1.value;
        
        var time2b=parseInt(times);
        
        var totalPrice = hourPrice1b * time2b * totalTime2b;
        document.getElementById("totalPrice2").innerHTML=totalPrice;
      
   
      }
       
       //수업타입 라디오버튼
       $(document).ready(function(){
 
       // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=classType]").click(function(){
    
           if($("input[name=classType]:checked").val() == "그룹"){
               $("input:text[name=studentCount]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=classType]:checked").val() == "1대1"){
                 $("input:text[name=studentCount]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
       
       //날짜선택 라디오 버튼11
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week1]").click(function(){
    
           if($("input[name=week1]:checked").val() == "선택"){
               $("input:text[name=day1]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week1]:checked").val() == "협의"){
                 $("input:text[name=day1]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
      //날짜선택 라디오 버튼11
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week1]").click(function(){
    
           if($("input[name=week1]:checked").val() == "선택"){
               $("input:date[name=month1]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week1]:checked").val() == "협의"){
                 $("input:date[name=month1]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
       
        //날짜선택 라디오 버튼22
      $(document).ready(function(){
      // 라디오버튼 클릭시 이벤트 발생
       $("input:radio[name=week2]").click(function(){
    
           if($("input[name=week2]:checked").val() == "선택"){
               $("input:text[name=day2]").attr("disabled",false);
               // radio 버튼의 value 값이 1이라면 활성화
    
           }else if($("input[name=week2]:checked").val() == "협의"){
                 $("input:text[name=day2]").attr("disabled",true);
               // radio 버튼의 value 값이 0이라면 비활성화
           }
       });
      });
        
      //지역선택 카테고리
         $(function(){
            $("#local1").click(function(){
               $.ajax({
                  url : "<%=request.getContextPath()%>/selectSubLocal?localNum=" + $('#local1').val(),
                  type : "post",
                  dataType : "html",
                  success:function(data){
                     $("#local").find("option").remove();
   
                     var datas = data.split(",");
               
                          for(var i = 0; i < datas.length; i++){    
                             if(data==0){
                                $("#local").append("<option value='1'>지역선택</option>");
                             }else{
                             $('<option value="' + (i+1) +'">' + datas[i] + '</option>').appendTo('#local');
                       }
                          }
                  }
               });
            });
         });
      
               
               var oTbl;
               //Row 추가
               function insRow() {
                 oTbl = document.getElementById("addTable");
                 var oRow = oTbl.insertRow();
                 oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
                 var oCell = oRow.insertCell();

                 //삽입될 Form Tag
                 var frmTag = "<input type=file name=addImg style=width:350px; height:20px;> ";
                 frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
                 oCell.innerHTML = frmTag;
               }
               //Row 삭제
               function removeRow() {
                 oTbl.deleteRow(oTbl.clickedRowIndex);
               }

               function frmCheck()
               {
                 var frm = document.form;
                 
                 for( var i = 0; i <= frm.elements.length - 1; i++ ){
                    if( frm.elements[i].name == "addImg" )
                    {
                        if( !frm.elements[i].value ){
                                frm.elements[i].focus();
                   return;
                         }
                     }
                  }
                }
            </script>

<%@ include file = "/views/common/footer.jsp" %>