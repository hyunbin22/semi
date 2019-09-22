package com.semi.lecture.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.LectureReview;

/**
 * Servlet implementation class LectureReviewWriteServlet
 */
@WebServlet("/LectureReview/reviewWrite")
public class LectureReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		String rTitle = request.getParameter("rTitle");
		String rText = request.getParameter("rText");
		
		LectureReview rv = new LectureReview(lecNum, mNum, rTitle, rText);
		int result=new LectureService().insertReview(lecNum, mNum, rTitle, rText);

		String msg=result>0?"리뷰가 등록됐습니다.":"리뷰 등록에 실패했습니다.";
		String loc="/lecture/lectureView?lecnum="+lecNum;
		String view="/views/common/msg.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
