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
import com.semi.qna.model.vo.QnaComment;

/**
 * Servlet implementation class QnaCommentServlet
 */
@WebServlet("/qna/qnaComment.do")
public class QnaCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글내용 DB에 저장하기
		int mNum=Integer.parseInt(request.getParameter("qcmNum")); //글작성자
		String content=request.getParameter("qcContentIn"); //댓글내용
		int qRef=Integer.parseInt(request.getParameter("qcNum")); //글번호

		QnaComment qc=new QnaComment(mNum, content, qRef);
		int result=new QnaService().insertComment(qc);
		
		
		String msg="";
	    String loc="";
	      
	    if(result>0) {
	       msg="댓글 등록 완료";
	       request.setAttribute("qc", qc);
	       loc="/qna/qnaView.do?qNum="+qRef;
	    }
	    else{
	       msg="댓글 등록 실패";
	       loc="/qna/qnaView.do?qNum="+qRef;
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
