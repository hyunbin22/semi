<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.semi.lecture.model.vo.Lecture"%>
<%@ page import="com.semi.lecture.model.vo.LectureReview"%>
<%@ page import="com.semi.order.model.vo.Order" %>
<%@ page import="java.util.List"%>
<%
   Member m = (Member) session.getAttribute("loginMember");
   Lecture lec = (Lecture) request.getAttribute("lecture");
   List<LectureReview> list = (List) request.getAttribute("list");
   List<Order> orderList = (List)request.getAttribute("orderList");
   
   String coverImage = "";
   String profileImage = "";
   String lectureImage = "";
   String toId=lec.getLecMento().getMember().getmId();

   
   int loginOrderMNum = 0;
   for(int i=0; i<orderList.size();i++){
      if(m==null){
         
      }else if(m.getmNum()==orderList.get(i).getmNum()){
         loginOrderMNum=orderList.get(i).getmNum();
      }
   }
   
   for(int i=0;i<lec.getLectureUpList().size();i++){
	      if(lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")){
	         coverImage = lec.getLectureUpList().get(i).getUpLectureReName();
	      }else if (lec.getLectureUpList().get(i).getUpLectureCategory().equals("lecimage")){
	         lectureImage = lec.getLectureUpList().get(i).getUpLectureReName();
	      }
	   }
	   for(int i=0;i<lec.getLecMento().getList().size();i++){
	      if(lec.getLecMento().getList().get(i).getUpMentoCategory().equals("profile")){
	         profileImage = lec.getLecMento().getList().get(i).getUpMentoReName();
	      }
	   }

   
   
   String var = lec.getLecWeek();
   String [] vars = var.split(",");
   
%>



<%@ include file="/views/common/header.jsp"%>


<section class="center">
   <div class="wrap"> 
      <article class="detailwrap">
         <img src="<%=request.getContextPath()%>/upload/lecture/<%=coverImage%>" class="detailimg" alt="...">
         <!--card-img-top -->
         <div class="detailbody">
            <div class="class_info">
            <br><br>
               <h5 class="lecType" name="lectype">
                  [
                  <%=lec.getLecType()%>
                  ]
               </h5>
               <h5 class="title"><%=lec.getLecName()%></h5>

               <table class="detailbar">
                  <tr>
                     <td><a href="#pinfo">프로필</a></td>
                     <td><a href="#cinfo">수업</a></td>
                     <td><a href="#rinfo">리뷰</a></td>
                     <td><a href="#qinfo">질문</a></td>
                  </tr>
               </table>
               <script>
                  $(window).scroll(function() {
                     if ($(window).scrollTop() > 1609) {
                        $('.detailbar').addClass("detailbar2");
                        $('.detailbar2').removeClass("detailbar");

                     } else {
                        $('.detailbar2').addClass("detailbar");
                        $('.detailbar').removeClass("detailbar2");

                     }
                  });
               </script>
               <table border="1" class="proinfo" id="pinfo">
                  <tr>
                     <td colspan="2">
                        <h2 class="subtext">튜터프로필</h2>
                     </td>

                  </tr>
                  <tr>
                     <td><img src="<%=request.getContextPath()%>/upload/mento/<%=profileImage%>"></td>
                     <td>
                        <ul class="tutorpro" name="lecmentocontent">
                           <%=lec.getLecMentoContent()%>
                        </ul>
                     </td>
                  </tr>
               </table>
               <hr>
               <h2 class="subtext">강의 소개</h2><hr>
               <img src="<%=request.getContextPath()%>/upload/lecture/<%=lectureImage%>" class="detailimg" alt="...">
               <p class="content" name="leclecturecontent"><%=lec.getLecLectureContent()%></p>


               <hr>


               <!-- 리뷰화면 -->


               <!-- 리뷰 댓글창 -->
               <p class="reviewinfo" id="rinfo">
               <h2 class="subtext">리뷰</h2><hr>
               <form action="<%=request.getContextPath()%>/LectureReview/reviewWrite" method="post">
                  <input type="hidden" name="lecNum" value="<%=lec.getLecNum()%>">
                  <input type="hidden" name="mNum" value="<%=memberLogin != null ? memberLogin.getmNum() : ""%>">
                  <input type="text" id="rTitle" name="rTitle" rows="1" cols="30" placeholder="제목">
                  <input type="text" id="rText" name="rText" rows="5" cols="60" placeholder="내용">
                  <button type="submit">등록</button>

               </form>
               



               <%
                     for (LectureReview rv : list) {
                        
               %>
                <div class="review">
                  <div class="memprofile">
                     <table class="reviewtable">
                        <tr>
                           <td class="reviewId">수강생<br>
                           <b>
                              <%-- <%
                              String orderName = "";
                              for(int i=0;i<orderList.size();i++){
                                 if(orderList.get(i).getmNum()==rv.getmNum()){
                                    orderName=orderList.get(i).getLecture().getlec
                                 }%>
                              } --%>
                                 <%=rv.getMember().getmName() %>
                           </b>님<br>
                              <small><%=rv.getrDate() %></small>
                           </td>

                           <td class="reviewContent"><%=rv.getrTitle()%>
                              <hr> <%=rv.getrText()%></td>

                           <td>
                              <%
                                 if (memberLogin != null && memberLogin.getmNum()==rv.getmNum())
                                           {
                              %>
                              <br><br><br><br>
                              <br><br><br><br>
                              <button id="deleteReview" value="<%=rv.getrNum()%>">삭제</button>
                              <%
                                 }
                              %>
                           </td>
                        </tr>

                     </table>


                  </div>
                  <!-- <div class="review_content">
                                    <input type="text">
                                    <input type="submit">
                                </div> -->

               </div>

               <%
                  }
                     
                     
               %>
               
               <script>
                  $(function(){
                     $('#deleteReview').click(function(){
                        if(confirm("정말로 리뷰를 삭제하시겠습니까?")){
                           location.href="<%=request.getContextPath()%>/lecture/lectureReviewDelete.do?lecnum=<%=lec.getLecNum()%>&rNum="+$(this).val();
                        }
                     })
                  });
               </script>

               </p>
               <p class="questioninfo" id="qinfo"></p>
            </div>
         </div>
      </article>

   </div>

</section>

<aside class="center">

      <div class="wrap">
         <div class="floatMenu">
            <form action="<%=request.getContextPath()%>/order/OrderEnroll.do"
      method="post" >
      <input type="hidden" value="<%=lec.getLecNum()%>" name="lecNum">
            <div class="floatTitle">
               결제
               <hr>
            </div>
            <div class="floatsubtitle">수업시간</div>
            <div class="lecFViewTot-group">
               <%if(lec.getLecTot()!=null){ %>
                  <input class="lecFViewTot"name="lectot" type="radio" value="<%=lec.getLecTot()%>"><%=lec.getLecTot() %>
               <%} %>
               <%if(lec.getLecTot2()!=null){ %>   
                  <input class="lecFViewTot" name="lectot"  type="radio" value="<%=lec.getLecTot2()%>"><%=lec.getLecTot2()%>
            <%} %>
            <%if(lec.getLecTot()==null&&lec.getLecTot2()==null){ %>
               &nbsp;&nbsp;&nbsp;협의
               <input type="hidden" name="lectot" value="협의">
            <%} %>
            </div>
            <div class="floatsubtitle">총 수업 횟수</div>
            <div id="select_box">
               <label for="color">한달 <%=lec.getLecCount()%>회
               </label>
            </div>
            <div class="floatsubtitle">1회당</div>
            <div id="select_box">
               <label for="color"><%=lec.getLecTime()%>시간</label>

            </div>
            <div class="floatsubtitle">요일</div>
            <div id="select_box">
               <select id="week" name="day">
                  <%for (int i=0; i<vars.length;i++){ %>
                  <option value="<%=vars[i]%>"><%=vars[i]%></option>
                  <%} %>
               </select>
            </div>
            
            <div class="floatsubtitle">장소</div>
            <div id="select_box">
               <label for="color"><%=lec.getLecMeet()%></label>

            </div>
            <div class="floatsubtitle">가격</div>
            <div id="select_box">
               <label for="color"><%=lec.getLecPrice()%></label>

            </div>
            <script>
               $(function() {
                  var select = $("select#color");

                  select.change(function() {
                     var select_name = $(this).children(
                           "option:selected").text();
                     $(this).siblings("label").text(select_name);
                  });
               });
            </script>
            
            <div>
                  <input type="submit" value="신청하기" class="classSubmit btnOrder">
           </div>
              </form>
            <br>
               <div>
               <input type="button" value="문의하기" class="classSubmit btnMessage">
            </div>

         </div>
      </div>
	<%if(m!=null) { %>
       <form name="lecMessage" method="post" id="openMessageFrm">   <!-- 메세지보내기 -->
         <input type="hidden" name="toId" value="<%=toId%>">
         <input type="hidden" name="fromId" value="<%=memberLogin.getmId()%>">
         <input type="hidden" name="lectureName" value="<%=lec.getLecName() %>">
      </form>
      <%} %>

</aside>

<script>
$(function(){
      $('.btnMessage').click(function(){
          if('<%=userId%>'==null || '<%=userId%>'=="") {
            alert("로그인 후 이용 가능합니다.");
            $('#id').focus();
         } else {
            var toId = "<%=toId%>";
            var url = "<%=request.getContextPath()%>/message/openToMessage.do";
            var status = "width=400, height=600, resizable=no, status=no, toolbars=no, menubar=no";
            var title="ABLINGTALK"
            var popUp = open("", title, status);
            window.name="parentWin"; 
            lecMessage.target = title;
            lecMessage.action=url;
            lecMessage.submit();
         }
      })
   });
   
$(function(){
	$('.btnOrder').click(function(){
          if('<%=userId%>'==null || '<%=userId%>'=="") {
            alert("로그인 후 이용 가능합니다.");
            $('#id').focus();
         }
});
});

$(function(){
   $("#rTitle").click(function(){
      if('<%=userId%>'==null || '<%=userId%>'==""){
         alert("로그인해주시기 바랍니다.");
         $('#id').focus();
      }else if('<%=loginOrderMNum%>'==0){
            alert("해당 강의를 수강한 회원만 작성이 가능합니다.");
         }
   });
});
   $(function(){
      $("#rText").click(function(){
         if('<%=userId%>'==null || '<%=userId%>'==""){
            alert("로그인해주시기 바랍니다.");
            $('#id').focus();
         }else if('<%=loginOrderMNum%>'==0){
            alert("해당 강의를 수강한 회원만 작성이 가능합니다.");
         }
      });
   });
   

   $(window).scroll(function() {
     if ($(window).scrollTop() > 323) {
         $('.floatMenu').addClass("fix");
         $('.floatMenu').addClass("right");
         $('.floatMenu').removeClass("floatMenu");

      } else {
         $('.fix').addClass("floatMenu");
         $('.fix').removeClass("fix");

      }
   });
</script>


<%@ include file="/views/common/footer.jsp"%>