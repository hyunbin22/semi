<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <aside class="center">
        <div class="wrap">
            <div class="admin-floatMenu" >
                <div class="admin-floatTitle">
                    	<h3>회원관리</h3>
                    <hr>
                </div>
                <ul class="admin-aside-menu">
                	<li><a href="<%=request.getContextPath()%>/admin/memberList.do" class="appro-aTag">전체회원목록</a></li>
                	<li><a href="<%=request.getContextPath()%>/admin/blackList.do" class="appro-aTag">이용정지회원목록</a></li>
                </ul>            
            </div>
        </div>
    </aside>
