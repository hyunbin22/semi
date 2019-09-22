<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <aside class="center">
        <div class="wrap">
            <div class="admin-floatMenu" >
                <div class="admin-floatTitle">
                    	<h3>강의관리</h3>
                    <hr>
                </div>
                <ul class="admin-aside-menu">
                	<li><a href="<%=request.getContextPath() %>/admin/adminLectureList.do" class="appro-aTag">전체 강의 목록</a></li>
                	<li><a href="<%=request.getContextPath() %>/admin/adminLectrueNoList.do" class="appro-aTag">비활성화 강의 목록</a></li>
                </ul>            
            </div>
        </div>
    </aside>
