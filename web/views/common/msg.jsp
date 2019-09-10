<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%@ include file="/views/common/header.jsp"%>
<% 
	String msg = (String)request.getAttribute("msg");
	String title = (String)request.getAttribute("title");
	String loc = (String)request.getAttribute("loc");
	Member m = (Member)request.getAttribute("memberinfo");

%>    
    <section id="all" class="center1">
        <form action="">
            <article id="box1">
                <hr>
                <h3>멘토등록완료</h3><h6>Home>멘토등록>등록완료</h6>
                <hr>
            </article>
            <article id="box2">
                <h3>멘토신청</h3>
                <h2 id="success"><%=title %></h2>
                <img id="rabbit" src="https://data.ac-illust.com/data/thumbnails/54/5450d889873e9ca24a3cb8f2dc58d7e1_t.jpeg" alt="">
                <div id="background"><small><%=msg %> 저희 사이트를 이용해주셔서 감사합니다.</small></div>
                <table class="table1">
                    <tr>
                        <td id="td1">이름</td>
                        <td id="td3"><%=m.getmName() %></td>
                    </tr>
                    <tr>
                        <td id="td2">아이디</td>
                        <td id="td4"><%=m.getmId() %></td>
                    </tr>
                </table>
            </article>
            <div id="ex">
            <input type="button" id="button" name="button" value="홈으로 이동" onclick="location.href='<%=request.getContextPath()%>/'">
            </div>
        </form>
    </section>

    

<%@ include file="/views/common/footer.jsp"%>