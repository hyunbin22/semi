package com.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.category.model.service.CategoryService;
import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.local.model.service.LocalService;

/**
 * Servlet implementation class AdminLectureNoListDetailServlet
 */
@WebServlet("/admin/AdminLectureNoListDetail.do")
public class AdminLectureNoListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLectureNoListDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));

		Lecture lec = new LectureService().lectureView(lecNum);
		String cate = new CategoryService().lecCategory(lecNum);
		String local = new LocalService().selectLocal(lec.getLocalSubNum());
		
		request.setAttribute("cate", cate);
		request.setAttribute("local", local);
		request.setAttribute("lecture", lec);
		request.getRequestDispatcher("/views/admin/adminLectureNoListDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
