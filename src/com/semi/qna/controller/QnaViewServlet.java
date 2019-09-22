package com.semi.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;
import com.semi.qna.model.vo.QnaUpload;

/**
 * Servlet implementation class QnaViewServlet
 */
@WebServlet("/qna/qnaView.do")
public class QnaViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qNum=Integer.parseInt(request.getParameter("qNum"));
		int qRef=Integer.parseInt(request.getParameter("qNum"));
		
		Qna q=new QnaService().selectQna(qNum);
		QnaUpload qu=new QnaService().selectQnaUpload(qNum);
		QnaComment qc=new QnaService().selectQnaComment(qRef);
		
		
		
		request.setAttribute("qComment", qc);
		request.setAttribute("qna", q);
		request.setAttribute("qnaUpload", qu);
		request.getRequestDispatcher("/views/notice/qna_view.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
