<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.semi.lecture.model.vo.Lecture"%>
<%@ page import="com.semi.lecture.model.vo.LectureReview"%>
<%@ page import="java.util.List"%>
<%
	Lecture lec = (Lecture) request.getAttribute("lecture");
	Member m = null;
	if (session.getAttribute("loginMember") != null) {
		m = (Member) session.getAttribute("loginMember");
	}
	System.out.println("View m :" + m);
	List<LectureReview> list = (List) request.getAttribute("list");
	String toId = lec.getLecMento().getMember().getmId();
	String coverImage = "";
	String profileImage = "";
	String lectureImage[] = null;
	for (int i = 0; i < lec.getLectureUpList().size(); i++) {
		if (lec.getLectureUpList().get(i).getUpLectureCategory().equals("cover")) {
			coverImage = lec.getLectureUpList().get(i).getUpLectureReName();
		} /* else if (lec.getLectureUpList().get(i).getUpLectureCategory().equals("lecimage")){
			lectureImage[i] = lec.getLectureUpList().get(i).getUpLectureReName();
			} */
		else if (lec.getLecMento().getList().get(i).getUpMentoCategory().equals("profile")) {
			profileImage = lec.getLecMento().getList().get(i).getUpMentoReName();
		}
	}

	String var = lec.getLecWeek();
	String[] vars = var.split(",");
%>



<%@ include file="/views/common/header.jsp"%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/classdetail.css">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css"> --%>

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
                     <td><img src="<%=request.getContextPath()%>/upload/lecture/<%=profileImage%>"></td>
                     <td>
                        <ul class="tutorpro" name="lecmentocontent">
                           <%=lec.getLecMentoContent()%>
                        </ul>
                     </td>
                  </tr>
               </table>
               <hr>
               <p class="content" name="leclecturecontent"><%=lec.getLecLectureContent()%></p>

               <!-- <h2 class="subtext">커리큘럼</h2>
                            <ul>
                                <li>1회차 : 아이라이너 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                                <li>2회차 : 립스틱 테크닉</li>
                            </ul> -->
               <hr>


               <!-- 리뷰화면 -->


               <!-- 리뷰 댓글창 -->
               <%-- <p class="reviewinfo" id="rinfo">
               <form
                  action="<%=request.getContextPath()%>/LectureReview/reviewWrite"
                  method="post">
                  <input type="hidden" name="rNum"> <input type="hidden"
                     name="lecNum" value="<%=lec.getLecNum()%>"> <input
                     type="hidden" name="mNum"
                     value="<%=memberLogin != null ? memberLogin.getmNum() : ""%>">
                  <textarea name="rTitle" rows="1" cols="60"></textarea>
                  <textarea name="rText" rows="5" cols="60"></textarea>

                  <button type="submit">등록</button>

               </form>

               <script>
                  $(function() {
                     $("textarea[name=rTitle]").focuse(function() {
                        if (
               <%=memberLogin == null%>
                  ) {
                           alert("로그인해주시기 바랍니다.");
                        }
                     });
                  });
                  $(function() {
                     $("textarea[name=rText]").focuse(function() {
                        if (
               <%=memberLogin == null%>
                  ) {
                           alert("로그인해주시기 바랍니다.");
                        }
                     });
                  });
               </script>

               <%
                  if (list != null && !list.isEmpty()) {
                     for (LectureReview lr : list) {
                        if (memberLogin != null
                              && (lr.getmNum() == memberLogin.getmNum() || memberLogin.getmId().equals("admin"))) {
               %>

               <div class="review">
                  <div class="memprofile">
                     <table class="reviewtable">
                        <tr>
                           <td class="reviewId">수강생<br> <b><%=lr.getmNum() %></b>님
                              <small>3.3/5.0</small>
                           </td>

                           <td class="reviewContent"><%=lr.getrTitle() %>
                              <hr> <%=lr.getrText() %></td>
                              
                           <td>
                              <%if(memberLogin!=null
                              &&("admin".equals(memberLogin.getmId())/*&& 리뷰작성자와 동일한 멤버로그인아이디일경우 */
                              )) {%>
                              <button class="btn-delete"
                                 value="<%=lr.getLecnum() %>">삭제</button> <%} %>
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
                     }
                  }
               %>

               </p>
               <p class="questioninfo" id="qinfo"></p> --%>
            </div>
         </div>
      </article>

   </div>
   <!-- <div id="floatMenu" onload="floatMenu"> 내용 입력 </div> -->

</section>

<aside class="center">

      <div class="wrap">
         <div class="floatMenu">
            <form action="<%=request.getContextPath()%>/lecture/OrderEnroll.do"
      method="post" >
      <input type="hidden" value="<%=lec.getLecNum()%>" name="lecnum">
            <div class="floatTitle">
               결제
               <hr>
            </div>
            <div class="floatsubtitle">수업시간</div>
            <div class="lecFViewTot-group">
	               <input class="lecFViewTot"name="lectot" type="radio" value="<%=lec.getLecTot()%>"><%=lec.getLecTot() %>
	               <input class="lecFViewTot" name="lectot" type="radio" value="<%=lec.getLecTot2()%>"><%=lec.getLecTot2()%>

               <!-- <select id="color" title="select color">
                        <option selected="selected">asdf</option>
                    </select> -->
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
            		<%-- <option value="<%=lec.getLecWeek() %>"><%=lec.getLecWeek() %></option> --%>
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
	            	<input type="submit" value="신청하기" class="classSubmit">
	        </div>
	           </form>
            <br>
            <div>
				<button class="classSubmit" id="sendMessage">문의하기</button>

			</div>
			<%if(m!=null){ %>
				<form name="openMessageFrm" method="post">
					<input type="hidden" name="toId" value="<%=lec.getLecMento().getMember().getmId()%>">
					<input type="hidden" name="fromId" value="<%=m.getmId()%>">

					<input type="hidden" name="lectureName" value="<%=lec.getLecName() %>">
				</form>
			<%} %>

         </div>
      </div>


</aside>

<script>
$(function(){
    $('#sendMessage').click(function(){
 	   
       var toId = "<%=toId%>";
       if(<%=m!=null%>){
       	var fromId = "<%=m.getmId()%>";
       }
       if(fromId==null||fromId==""){
     	  alert("로그인 후 사용이 문의가 가능합니다.");
     	  $('#id').focus();
       }else{
           var url = "<%=request.getContextPath()%>/message/openLecMessage.do?toId="+toId;
           var status = "width=400, height=600, resizable=no, status=no, toolbars=no, menubar=no";
           var title="ABLINGTALK"
           var popUp = open("", title, status);
           window.name="parentWin"; 
           openMessageFrm.target = title;
           openMessageFrm.action=url;
           openMessageFrm.submit();
       }
    });
 });
 
   $(window).scroll(function() {
      if ($(window).scrollTop() > 371) {
         $('.floatMenu').addClass("fix");
         $('.floatMenu').addClass("right");
         $('.floatMenu').removeClass("floatMenu");

      } else {
         $('.fix').addClass("floatMenu");
         $('.fix').removeClass("fix");

      }
   });
</script>

<script src="js/bootstrap.js"></script>


<%@ include file="/views/common/footer.jsp"%>