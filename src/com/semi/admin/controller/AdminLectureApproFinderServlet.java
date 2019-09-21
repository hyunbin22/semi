package com.semi.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.service.LectureUploadService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.mento.model.service.MentoService;
import com.semi.mento.model.vo.Mento;

/**
 * Servlet implementation class AdminlectureApproFinderServlet
 */
@WebServlet("/admin/lectureApproFinder.do")
public class AdminLectureApproFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLectureApproFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("searchType");
		String data = request.getParameter("searchKeyword").trim();
		int temp = Integer.parseInt(request.getParameter("temp"));
		String path = "";
		if(temp==0) {
			path="/admin/AdminLectureApproval.do";	//승인완료 리스트로 변경해야함
		} else if(temp==1 ) {
			path="/admin/AdminLectureApproval.do";
		} else if(temp==2) {
			path="/admin/AdminLectureNoApproval.do";
		}
		
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage=10;
		int countLectureApproval = new LectureService().countLectureApproval(type, data);
		
		List<Lecture> lectureList = new LectureService().lectureApproFindList(type, data, cPage, numPerPage);
		int mentoTotalPage=(int)Math.ceil((double)countLectureApproval/numPerPage);
		String pageBar="";
		int pageSizeBar=5;
		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
		int pageEnd=pageNo+pageSizeBar-1;
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>&nbsp;";
		}
		else {
			pageBar+="<a href="+request.getContextPath() + path + "?cPage="+(pageNo-1)+">[이전]</a>&nbsp;";
		}
		while(!(pageNo>pageEnd||pageNo>mentoTotalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span class='admin-appro-cPage'>"+pageNo+"</span>&nbsp;";
			}
			else {
				pageBar+="<a href="+request.getContextPath() + path + "?cPage="+pageNo+">"+pageNo+"</a>&nbsp;";
			}
			pageNo++;
		}
		if(pageNo>mentoTotalPage) {
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href="+request.getContextPath() + path + "?cPage="+(pageNo)+">[다음]</a>";
		}
		
		//view페이지에 데이터 전송
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list",lectureList);
		if(temp==0) {	//승인완료된 리스트
			request.getRequestDispatcher("/views/admin/adminLectureList.jsp").forward(request, response);
		} else if(temp==1){	//승인전 거절안된 리스트
			request.getRequestDispatcher("/views/admin/adminLectureApproval.jsp").forward(request, response);
		} else if(temp==2) {	//승인전 거절된 리스트
			request.getRequestDispatcher("/views/admin/adminLectureNoApproval.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
