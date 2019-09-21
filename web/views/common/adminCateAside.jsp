<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <aside class="center">
        <div class="wrap">
            <div class="admin-floatMenu" >
                <div class="admin-floatTitle">
                    	<h3>카테고리관리</h3>
                    <hr>
                </div>
                <ul class="admin-aside-menu">
                	<li><a href="<%=request.getContextPath()%>/admin/categoryEnroll" class="appro-aTag">수업카테고리메인</a></li>
                	<li><a href="<%=request.getContextPath()%>/admin/subcategoryEnroll" class="appro-aTag">수업카테고리서브</a></li>
                	<li><a href="<%=request.getContextPath()%>/admin/localEnroll" class="appro-aTag"></a></li>
                	<li><a href="<%=request.getContextPath()%>/admin/sublocalEnroll" class="appro-aTag"></a></li>
                </ul>            
            </div>
        </div>

    </aside>
