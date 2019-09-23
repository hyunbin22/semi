<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ page import="com.semi.member.model.vo.Member" %>
    <%@ include file = "/views/common/header.jsp" %>
    <% 
    	Member m = (Member) session.getAttribute("loginMember");
    %>
	<section class = "center1">
            <div class="wrap">
                <div class="bar">
                    <br><table class = "MYLIST">
                                <tr>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/report.do" id = "listBtn">신고하기</button></td>
                                    <td><button onclick="location.href='<%=request.getContextPath()%>/member/reportHistroy?mNum=<%=m.getmNum() %>'" id = "listBtn">신고내역</button></td>
                                </tr>
                        </table><br><br>
                    <h1 class="center1">신고하기</h1>
                    <br><br>
                    <hr>
    		</div>
    		<div class="center1">
                <form action="<%=request.getContextPath()%>/Report.do?mNum=<%=m.getmNum()%>" method="POST" onsubmit="return checkValue();" enctype="multipart/form-data">
                    <table class="tblreg">
                        <tr>
                            <td class = "lecture" colspan = 1>작성자 ID</td>
                            <td>
                                <%=m.getmId() %>
                            </td>
                            <td>
   
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class = "lecture" colspan = 1>신고 대상 ID</td>
                            <td>
                                <input class="textfield title2" type="text" name="rId" id = "reportId1" placeholder="신고할 사용자의 ID 입력">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class = "lecture" colspan = 1>제목</td>
                            <td>
                                <input class="textfield title2" type="text" name="rTitle" id = "reportTitle1">
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                            <td class = "lecture" colspan = 1>내용</td>
                            <td><strong>신고 사유를 정확하게 작성해주세요.</strong></td>
                        </tr>
                        <tr>
 							<td>
 							</td>
                            <td>
                               <textarea id = "reportContent1" name = "rContent" rows="30" cols="50" style="resize: none;" placeholder="날짜 및 상황을 자세하게 작성해주세요." class = "title2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class = "lecture" colspan = 1>첨부 파일</td>
                            <td>
                                <input id="reportPhoto1" type="file" name="reportPhoto" onchange="previewImage(this,'View_area')">
                            </td>
                        </tr>
                        <tr>
                        </tr>    
                    </table>
                   	<div class = "center1">
                   <input type="submit" id = "btnReport" value="신고하기" class="next center1">   
                	</div>
                </form>
                </div>
                </div>
    </section>
    <script>
    function checkValue(){ 
    		var reportId = $('#reportId1');
    		var reportTitle = $('#reportTitle1');
    		var reportContent = $('#reportContent1');
    	
    		
    		if(reportId.val().length==0){
    			alert('신고할 ID를 입력하세요');
    			reportId.focus();
                return false;
    			}
    		
    		
              if(reportTitle.val().length==0){
                  alert('제목을 입력하세요');
                  reportTitle.focus();
                  return false;
              	}
   
              if(reportContent.val().length==0){
      			alert('신고 내용을 입력하세요');
      			reportId.focus();
                  return false;
      			}
              return true;
              }
    
    $(function(){
        
        //확장자, 정규식 검사
        $(document).on("change","input[name='reportPhoto']",function(event) {
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
              

    	
    </script>

    <%@ include file = "/views/common/footer.jsp" %>