<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.semi.member.model.vo.Member"%>
    
    <%
    	
     Member memberLogin = (Member) session.getAttribute("loginMember");
     Cookie[] cookies = request.getCookies();

   	 String saveId = null;
	 if(cookies!=null){
     for(Cookie c : cookies){

         String key=c.getName();
         String value=c.getValue();
         System.out.println("key : "+key);
         System.out.println("value : "+value);
         if(key.equals("saveId")){
            saveId=value;
   			}
      	}
	}
   
    
    
    %>
    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/MAIN.css">
    <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <title>KH SEMI</title>

</head>
<body>

        <script>

        function validate(){
            if($('#id').val().length==0){
                alert('아이디를 입력하세요');
                $('#id').focus();
                return false; //form제출 막는 것
            }
            if($('#pwd').val().length==0){
                alert('비밀번호를 입력하세요');
                $('#pwd').focus();
                return false;
            }
            return true;
        }
        


                $(document).ready(function() {
                    var $banner = $(".banner").find("ul");
                    var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
                    var $bannerHeight = $banner.children().outerHeight(); // 높이
                    var $length = $banner.children().length;//이미지의 갯수
                    var rollingId;
                    //정해진 초마다 함수 실행
                    rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
                    function rollingStart() {
                        $banner.css("width", $bannerWidth * $length + "px");
                        $banner.css("height", $bannerHeight + "px");
                        //alert(bannerHeight);
                        //배너의 좌측 위치를 옮겨 준다.
                        $banner.animate({left: - $bannerWidth + "px"}, 1, function() { //숫자는 롤링 진행되는 시간이다.
                            //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
                            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
                            //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
                            $(this).find("li:first").remove();
                            //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
                            $(this).css("left", 0);
                            //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
                        });
                    }
                }); 
                
                
                
                
            </script>

    <header>
        <div id="head" >
            <div><a href = "<%=request.getContextPath()%>"><img id = "Main" src = "<%=request.getContextPath()%>/image/LOGO.png"></a></div> <!--메인 아이콘 이미지-->
            <%if(memberLogin != null && (memberLogin.getmId().equals("admin"))) {%><div><span onclick = "location.href='<%=request.getContextPath()%>/views/admin/adminMain.jsp'" id = "join">관리자전용</span></div><%} %>
                <%if(memberLogin == null){ %>
            <div id = loginmenu>
            <form id = "loginFrm" action = "<%=request.getContextPath() %>/member/memberLoginServlet.do" method="POST" onsubmit="return validate();">
                <input id = "id" type = "text" name = "mId" placeholder="아이디">
                <input id = "pwd" type = "password" name = "mPw" placeholder="비밀번호">
                <input type="submit" value="로그인" id="login">
            </form>
            </div>
                <div id = "loginmenu2">
                <span onclick = "location.href='<%=request.getContextPath()%>/views/member/register_choice.jsp'" id = "join">회원가입</span>
                <span onclick = "location.href='<%=request.getContextPath()%>/views/member/FINDID.jsp'" id = findId>아이디 찾기</span>
                <span onclick = "location.href='<%=request.getContextPath()%>/views/member/FINDPWD.jsp'" id = findPw>비밀번호 찾기</span>
                   <%} else {%>
                <div id = profile1>
                <div id = "myPro">
                    <div id = "myPro2"><%=memberLogin.getmId()%>님 환영합니다!</div>
                </div>
                <div id = "mypromenu">
                    <button onclick = "location.href='<%=request.getContextPath()%>/memberLogoutServlet.do'" id = logout>로그아웃</button>
                    <button onclick = "location.href='<%=request.getContextPath()%>/member/memberMyPage.do?mId=<%=memberLogin.getmId()%>'" id = mypage>마이페이지</button>
                </div>
            </div>
                   <%} %>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br><br>
        
        <br>
        <div id = menu class = "center1">
    
 		<nav>
                        <ul class="center1">
                        
                        <li><a href="#">ABLING</a></li>
                        <li><a href="#">강의찾기</a></li>
                        <li><a href="#">수업모임</a></li>
                        <li><a href="#">이벤트</a></li>
                        
                  
                           <li><a href="#">고객지원</a>
                              <ul>
                              <li><a href="#">공지사항</a></li>
                  
                           <li><a href="#">F & A</a>  
                           </li>
                 
                            <%if(memberLogin != null) { %>
                            <li><a href="#">1대1문의</a>
                            </li>
                            
                            <li><a href="<%=request.getContextPath()%>/views/report/reportForm.jsp">신고하기</a>
                            </li>
                            <% } %>
                              </ul>
                           </li>
                           
                           <!--  1   -->
                           
                           
                  
                          <!--  <li><a href="#">뷰티</a>
                  
                              <ul>
                                 <li><a href="#">메이크업</a></li>
                                 <li><a href="#">네일</a></li>
                                 <li><a href="#">헤어</a></li>
                              </ul>
                           </li>
                  
                           <li><a href="#">미디어</a>
                  
                               <ul>
                                   <li><a href="#">마케팅</a></li>
                                   <li><a href="#">편집</a></li>
                                   <li><a href="#">촬영</a></li>
                               </ul>
                           </li>
                  
                           <li><a href="#">운동</a>
                  
                                <ul>
                                    <li><a href="#">헬스</a></li>
                                    <li><a href="#">축구</a></li>
                                    <li><a href="#">요가</a></li>
                                </ul>
                            </li>

                            <li><a href="#">음악</a>
                  
                                <ul>
                                    <li><a href="#">기타</a></li>
                                    <li><a href="#">DJ</a></li>
                                    <li><a href="#">보컬</a></li>
                                </ul>
                            </li>

                            <li><a href="#">외국어</a>
                  
                                <ul>
                                    <li><a href="#">영어</a></li>
                                    <li><a href="#">중국어</a></li>
                                    <li><a href="#">스페인어</a></li>
                                </ul>
                            </li> -->
                            </ul>
                            
                            </nav>

        </div>
    </header> 
    <script>

    </script>

