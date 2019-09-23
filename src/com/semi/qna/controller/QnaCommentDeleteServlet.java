package com.semi.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;

/**
 * Servlet implementation class QnaCommentDeleteServlet
 */
@WebServlet("/qna/qnaCommentDelete.do")
public class QnaCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qnaNo=Integer.parseInt(request.getParameter("qnaNo"));
		int qcNo=Integer.parseInt(request.getParameter("commentNo"));

		
		int result=new QnaService().deleteComment(qcNo);
		
		String loc="/qna/qnaView.do?qNum="+qnaNo;
		String msg=result>0?"댓글삭제완료":"댓글삭제실패";
		String view="/views/common/msg.jsp";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher(view)
		.forward(request,response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
