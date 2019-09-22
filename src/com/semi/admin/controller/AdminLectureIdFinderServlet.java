package com.semi.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminLectureIdFinderServlet
 */
@WebServlet("/admin/lectureIdFinder.do")
public class AdminLectureIdFinderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLectureIdFinderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String type = request.getParameter("searchType");
//		String data = request.getParameter("searchKeyword").trim();
//		
//		System.out.println(type);
//		System.out.println(data);
//		
//		int cPage;
//		try {
//			cPage = Integer.parseInt(request.getParameter("cPage"));
//		} catch(NumberFormatException e) {
//			cPage = 1;
//		}
//		int numPerPage=10;
//		int countLectureId = new LectureService().countLectureIdFind(type, data);
//		List<Lecture> lectureFindIdList = new LectureService().LectureFindIdList(data, cPage, numPerPage);
//		System.out.println("리스트 : " + lectureFindIdList);
//		
//		int reportTotalPage=(int)Math.ceil((double)countLectureId/numPerPage);
//		String pageBar="";
//		int pageSizeBar=5;
//		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
//		int pageEnd=pageNo+pageSizeBar-1;
//		if(pageNo==1) {
//			pageBar+="<span>[이전]</span>&nbsp;";
//		}
//		else {
//			pageBar+="<a href="+request.getContextPath()+"/admin/lectureIdFinder.do?cPage="+(pageNo-1)+">[이전]</a>&nbsp;";
//		}
//		while(!(pageNo>pageEnd||pageNo>reportTotalPage)) {
//			if(pageNo==cPage) {
//				pageBar+="<span class='admin-appro-cPage'>"+pageNo+"</span>&nbsp;";
//			}
//			else {
//				pageBar+="<a href="+request.getContextPath()+"/admin/lectureIdFinder.do?cPage="+pageNo+">"+pageNo+"</a>&nbsp;";
//			}
//			pageNo++;
//		}
//		if(pageNo>reportTotalPage) {
//			pageBar+="<span>[다음]</span>";
//		}
//		else {
//			pageBar+="<a href="+request.getContextPath()+
//			"/admin/lectureIdFinder.do?cPage="+(pageNo)+">[다음]</a>";
//		}
//		
//		request.setAttribute("pageBar", pageBar);
//		request.setAttribute("cPage", cPage);
//		request.setAttribute("list",lectureFindIdList);
//		request.getRequestDispatcher("/views/admin/lectureIdFind.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
