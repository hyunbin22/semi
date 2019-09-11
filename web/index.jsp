<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp" %>
 <br>
    <section class = "center1">
    <div>
        <div class="images" onclick="test();">
            <div class="banner">
                <ul>
                    <li><img src="<%=request.getContextPath()%>/image/촬영.jpg" width="1024" height="500px" onclick=""></li>
                    <li><img src="<%=request.getContextPath()%>/image/영어.jpg" width="1024" height="500px" onclick=""></li>
                    <li><img src="<%=request.getContextPath()%>/image/독서.jpg" width="1024" height="500px" onclick=""></li>
                    <li><img src="<%=request.getContextPath()%>/image/운동.jpg" width="1024" height="500px" onclick=""></li>
                </ul>
            </div>
        </div>
    </div>
    <br>
    <div id = most1_1 style="float: right;">인기강좌 3</div>
    <div id = most1_1 style="float: right;" >인기강좌 2</div>
    <div id = most1_1 style="float: right;" >인기강좌 1</div>
    <article>
    <div style="float: left; width: 341.3px;">
            <table class="classtable">
            
                    <tr>
                        <td colspan="4"><img src="<%=request.getContextPath()%>/image/인기기타.jpg" style="width: 339.3px; height: 339.3px;"></td>
                    </tr>
                    <tr>
                        <td colspan="3"class="className">강좌제목</td>
                        <td class="classplace">위치 | 경기수원</td>
                    </tr>

                    <tr>
                        <td colspan="4" class="classinfo">
                            소개설명<br>제매력에 빠져보실래요?<br>개피곤하다우<hr>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="classScore"><b>평점</b><br>4.4/5.0</td>
                        <td colspan="2" class="classmoneytime"><b>돈/시간</b><br>20000원/1시간</td>
                    </tr>
                </table>
    
    </div>

    </article>
    
    </section>
<%@ include file = "/views/common/footer.jsp" %>