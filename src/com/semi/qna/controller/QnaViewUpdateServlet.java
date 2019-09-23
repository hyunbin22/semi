package com.semi.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.vo.Member;
import com.semi.qna.model.service.QnaService;
import com.semi.qna.model.vo.Qna;

/**
 * Servlet implementation class QnaViewUpdateServlet
 */
@WebServlet("/qna/qnaUpdate.do")
public class QnaViewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaViewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//가져와야하는 값|원글의 번호 제목 내용 첨부파일 로그인값
		HttpSession session = request.getSession();
		Member memberLogin = (Member)session.getAttribute("loginMember");
		
		int qNum=Integer.parseInt(request.getParameter("qNum"));
		
		Qna q=new QnaService().QnaUpdate(qNum);
		
		request.setAttribute("qna", q);
		request.getRequestDispatcher("/views/notice/qna_update.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
