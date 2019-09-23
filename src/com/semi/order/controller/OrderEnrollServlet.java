package com.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;

/**
 * Servlet implementation class lectureMemberRegistServlet
 */
@WebServlet("/order/OrderEnroll.do")
public class OrderEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int lectureNo = Integer.parseInt(request.getParameter("lecNum")); // 강의번호
	      String days = request.getParameter("day"); // 요일
	      String lecTot = request.getParameter("lectot"); // 시간
	      Lecture lec=new LectureService().lectureView(lectureNo);
	      
	      request.setAttribute("day", days);
	      request.setAttribute("lecture", lec);
	      request.setAttribute("lecTot", lecTot);
	      request.getRequestDispatcher("/views/order/orderEnroll.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
