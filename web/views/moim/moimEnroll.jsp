<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%@ include file="/views/common/header.jsp"%>
<% 
   Member m = (Member) session.getAttribute("loginMember");
	
%>
  <section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br>
                    <h1 class="center1">모임게시글 작성</h1>
                    <br><br>
                    <hr>
    		</div>
    		<div class="center1">
                <form action="<%=request.getContextPath()%>/moim/moimEnrollEnd.do?mNum=<%=m.getmNum() %>" method="POST" onsubmit="return checkValue();" enctype="multipart/form-data">
                    <table class="tblreg">
                        <tr>
                            <td>작성자 ID</td>
                            <td>
                                <%=m.getmId() %>
                            </td>
                            <td>
   
                            </td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>
                                <input class="textfield" type="text" name="title" id = "title">
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea id = "reportContent1" name = "text" rows="20" cols="60" style="resize: none;" placeholder="내용을 입력해주세요."></textarea></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>첨부 파일</td>
                            <td>
                                <input id="reportPhoto1" type="file" name="moimFile" onchange="previewImage(this,'View_area')">
                            </td>
                        </tr>
                        <tr>
                        	<td>검색키워드 작성<br>(,로 구분)</td>
                            <td>
                                <input class="textfield" type="text" name="keyword" id = "keyword">
                            </td>
                        </tr>    
                    </table>
                   	<div class = "center1">
                   <input type="submit" id = "submit" value="등록" class="next center1">   
                	</div>
                </form>
                </div>
                </div>
    </section>
    <script>
    function checkValue(){ 
  		var title = $('#title');
  		var text = $('#text');

        if(title.val().length==0){
            alert('제목을 입력하세요');
            title.focus();
            return false;
        	}

        if(text.val().length==0){
			alert('신고 내용을 입력하세요');
			text.focus();
            return false;
			}
        return true;
        }

    </script>

    <%@ include file="/views/common/footer.jsp"%>