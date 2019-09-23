package com.semi.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.semi.member.model.vo.Member;
import com.semi.qna.model.service.QnaService;

import common.oreilly.servlet.multipart.AblingFileRenamePolicy;

/**
 * Servlet implementation class QnaUpdateDBServlet
 */
@WebServlet("/qna/updateDB.do")
public class QnaUpdateDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateDBServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root=getServletContext().getRealPath("/");

	    String saveDir=root+"/upload/qnaupload";//저장위치
	    
	    int maxSize=1024*1024*1024; //사이즈제한
		HttpSession session = request.getSession(); //세션
	    Member memberLogin = (Member) session.getAttribute("loginMember"); //로그인세션맴버
	    MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId())); //멀티객체 저장
	    
	    int qNum=Integer.parseInt(mr.getParameter("qNum"));
	    String title = mr.getParameter("qna-title");
		String content = mr.getParameter("qna-content");
		
		QnaService service=new QnaService();
		int result=service.updateQna(title, content, qNum);
		
		String qnaOriName=mr.getOriginalFileName("qnafile");
		String qnaReName=mr.getFilesystemName("qnafile");
		
		int result2 = service.enrollQnaImg(qnaOriName, qnaReName, result);
		
		String msg="";
	    String loc="";
	      
	    if(result>0 && result2>0) {
	       msg="문의 수정 완료";
	       request.setAttribute("result", result);
	       request.setAttribute("result2", result2);
	       loc="/qna/qnaList.do";
	    }
	    else{
	       msg="문의 수정 실패";
	       loc="/notice/qnaList.do";
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
