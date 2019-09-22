<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member, com.semi.moim.model.vo.Moim" %>
<%@ include file="/views/common/header.jsp"%>
<% 
    Member m = (Member) session.getAttribute("loginMember");
	Moim moim = (Moim)request.getAttribute("moim");	
	String moimKeyword = moim.getMoimKeyword()==null?"":moim.getMoimKeyword();
	
%>
  <section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br>
                    <h1 class="center1">모임게시글 수정</h1>
                    <br><br>
                    <hr>
    		</div>
    		<div class="center1">
                <form action="<%=request.getContextPath()%>/moim/moimUpdateEnd.do?moimNum=<%=moim.getMoimNum()%>" method="POST" onsubmit="return checkValue();" enctype="multipart/form-data">
                    <table class="tblreg tblMoim">
                        <tr>
                            <td>작성자 ID</td>
                            <td>
                                <%=m.getmId() %>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:503px;">제목</td>
                            <td>
                                <input class="textfield" type="text" name="title" id = "title" maxlength="200" value="<%=moim.getMoimTitle()%>" placeholder="제목을 입력해주세요.">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea id = "text" name = "text" rows="20" cols="60" style="resize: none;" placeholder="내용을 입력해주세요."><%=moim.getMoimText().replaceAll("<br>", "").replaceAll("&nbsp;","") %></textarea></td>
                        	<td></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>첨부 파일</td>
                            <td>
                            	<input type="button" name="addFile" class="next btnMoimFile" id="addFile" value="추가">
                            </td>
                        </tr>
                        <tr style="float:left;">
                        	<td style="float:left; text-align:left;">
                        	<%if(moim.getMoimUpload().size()>0 || moim.getMoimUpload()!=null) {
                         			for(int i = 0; i < moim.getMoimUpload().size(); i++) {
                         				%>
                         		<div>
                         		<input type="hidden" name = "orgListName" value="<%=moim.getMoimUpload().get(i).getUpMoimOrgName() %>">
                         		<input type="hidden" name = "reListName" value="<%=moim.getMoimUpload().get(i).getUpMoimReName() %>">
                         		<%=i+1%>.&nbsp;&nbsp;<a href="javascript:fn_filedown('<%=moim.getMoimUpload().get(i).getUpMoimOrgName()%>','<%=moim.getMoimUpload().get(i).getUpMoimReName()%>')"><%=moim.getMoimUpload().get(i).getUpMoimOrgName() %></a>
                         		<input type="button" name = "removeFile" class="next btnMoimFile" id="btnRemove" value="삭제">
                         		<br>
                         		</div>
                         		<%} 
                        		}%>
                        	
                        	</td>
                        </tr>
                        <tr>
                        	<td></td>
                        	<td id="boxFile">
                            </td>
                        </tr>
                        <tr>
                        	<td style="width:503px;">검색키워드<br>( , 로 구분)</td>
                            <td>
                                <input class="textfield" type="text" name="keyword" id = "keyword" value="<%=moimKeyword%>">
                            </td>
                            <td></td>
                        </tr>    
                    </table>
                   	<div class = "center1">
                   <input type="submit" id = "submit" value="수정" class="next center1">   
                	</div>
                </form>
                </div>
                </div>
    </section>
    <script>
    function checkValue(){ 
  		var title = $('#title');
  		var text = $('#text');
		var count = 1;
        if(title.val().length==0){
            alert('제목을 입력하세요');
            title.focus();
            return false;
        	}

        if(text.val().length==0){
			alert('내용을 입력하세요');
			text.focus();
            return false;
			}
        return true;
        }
    
    	$(function(){
    		var count = 1;
    		$('#addFile').click(function(){
    			var addWrap = '<div class="fileWrap">';
        		addWrap += '<input id="inputMoimFile" type="file" name="moimFile' + count + '">';
    	        addWrap += '<input type="button" name="removeFile" class="next btnMoimFile" id="btnRemove" value="삭제">';
    	        addWrap += '</div>';
                $('#boxFile').append(addWrap);
                count++;
    			
    		}); 
    	});

    	$(function(){
    		$(document).on("click","#btnRemove",function(event){
    			var pa = $(this).parent();
         		pa.remove();
    		});
    		
    		//확장자, 정규식 검사
    		$(document).on("change","input[name='moimFile']",function(event) {
    			var ext = $(this).val().split('.').pop().toLowerCase();
    			var fileSize = (this).files[0].size;
    			var maxSize = 1024*1024*1024;
    			
    			if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
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
    	});
    	
    	 function fn_filedown(ori, re) {
 	    	var file = encodeURIComponent(ori);
 	    	location.href="<%=request.getContextPath()%>/moim/filedown.do?oriFileName="+file+"&reFileName="+re;
 	    }

    </script>

    <%@ include file="/views/common/footer.jsp"%>