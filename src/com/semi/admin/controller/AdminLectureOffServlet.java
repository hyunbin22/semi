package com.semi.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;

/**
 * Servlet implementation class AdminLectureOffServlet
 */
@WebServlet("/admin/lectureOff.do")
public class AdminLectureOffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLectureOffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));
		System.out.println(lecNum);
		LectureService service = new LectureService();
		int result = service.lectureOff(lecNum);
		
		
		String msg = "";
		String loc = "/admin/adminLectrueNoList.do";
		
		if(result > 0)
		{
			msg = "강의 비활성화 처리 완료";
		}
		else
		{
			msg = "오류 발생! 재시도 바랍니다!";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
