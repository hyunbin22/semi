package com.semi.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import common.oreilly.servlet.multipart.AblingFileRenamePolicy;
import com.semi.member.model.vo.Member;
import com.semi.notice.model.service.NoticeService;
import com.semi.notice.model.vo.Notice;
import com.semi.notice.model.vo.NoticeUpload;

/**
 * Servlet implementation class NoticeEnlloEndServlet
 */
@WebServlet("/notice/noticeFormEnd.do")
public class NoticeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)) {
	         request.setAttribute("msg", "공지등록 실패 ![form:ectype] 관리자에게 문의하세요!");
	         request.setAttribute("loc", "/");
	         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	         
	         return;
	      }
	      
	    String root=getServletContext().getRealPath("/");
	      
	    String saveDir=root+"/upload/notice";
	      
	    int maxSize=1024*1024*1024;
	      
	    HttpSession session = request.getSession();
	    Member memberLogin = (Member) session.getAttribute("loginMember");
	    MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
		
	      
	      
		int aIdNum = Integer.parseInt(mr.getParameter("aIdNum"));
		String title = mr.getParameter("qna-title");
		String content = mr.getParameter("qna-content");
		
		String noticeOriFile=mr.getOriginalFileName("noticefile");
		String noticeReFile=mr.getFilesystemName("noticefile");
		
		
		Notice n = new Notice(aIdNum, title, content);
		NoticeUpload nu = new NoticeUpload(noticeOriFile,noticeReFile);
		
		NoticeService nw=new NoticeService();
		int result = nw.enrollNotice(n);
		
		int result2= nw.enrollNoticeImg(nu, result);
		
		String msg="";
	      String loc="";
	      
	      if(result>0 && result2>0) {
	         msg="공지사항 등록 완료";
	         request.setAttribute("n", n);
	         request.setAttribute("nu", nu);
	         loc="/notice/noticeList.do";
	      }
	      else{
	         msg="공지사항 등록 실패";
	         loc="/notice/noticeList.do";
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
