<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageAside.jsp" %>
        <div class="wrap">
        <div id="myPageContentWrap">
            <div class="bar">
                <br>
                    
                <h1 class="center1"><strong>마이페이지</strong></h1>
                <br><br>
                <hr>
            </div>
            <div class="regdata center1 myPage-content-wrap">
                <table class="tblreg myPageTbl">
                    <tr>
                        <td class = "lecture">아이디</td>
                        <td>
                 			 <%=m.getmId() %>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class = "lecture">이름</td>
                        <td>
                            <%=m.getmName() %>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class = "lecture">생년월일</td>
                        <td> 
                        	<%=m.getmBirth() %> 
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class = "lecture">성별</td>
                        <td> <%=m.getmGender()=='F'?"여자":"남자"%></td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class = "lecture">이메일</td>
                        <td>
                            <span><%=m.getmEmail() %></span> 
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class = "lecture">휴대폰번호</td>
                        <td>
                           <%=m.getmPhone() %>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                </table>
            </div>
            <div class = "center1">
                <input type="button" id = "btnDelete" value="탈퇴하기" class="next center1" onclick="deleteMember();">
            </div>
        </div>
        </div>
        </div>
    </section>
        
        <script>
        function deleteMember(){
			if(confirm("정말로 탈퇴하시겠습니까?")){
				var url="<%=request.getContextPath()%>/member/memberDelete.do?mId=<%=m.getmId()%>";
				location.href=url;
			}
		}
        </script>
    	<%@ include file = "/views/common/footer.jsp" %>