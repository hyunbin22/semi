package com.semi.moim.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.member.model.vo.Member;
import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.service.MoimUploadService;
import com.semi.moim.model.vo.Moim;
import com.semi.moim.model.vo.MoimUpload;

import common.oreilly.servlet.multipart.AblingFileRenamePolicy;

/**
 * Servlet implementation class MoimEnrollEndServlet
 */
@WebServlet("/moim/moimEnrollEnd.do")
public class MoimEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoimEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "등록 실패 ![form:ectype] 관리자에게 문의하세요!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;
		}
		
		String root=getServletContext().getRealPath("/");

		String saveDir=root+"/upload/moim";
		
		int maxSize=1024*1024*1024;
		
		HttpSession session = request.getSession();
		Member memberLogin = (Member) session.getAttribute("loginMember");
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
		
		int mNum = Integer.parseInt(mr.getParameter("mNum"));	
		String title = mr.getParameter("title");
		String text = mr.getParameter("text");
		String keyword = mr.getParameter("keyword");
		
		Moim moim = new Moim(mNum, title, text, keyword);
		
		int result = new MoimService().moimEnroll(moim);
		int result2=0;


		Enumeration fileNames = null;
		//reportDB에 저장
		if(result>0) {
			fileNames = mr.getFileNames();
			if(fileNames!=null) {
				while(fileNames.hasMoreElements()) {
					String param = (String)fileNames.nextElement();
					String orgFile = mr.getOriginalFileName(param);
					String reFile = mr.getFilesystemName(param);
					if(orgFile == null) continue;
					MoimUpload mu = new MoimUpload(orgFile, reFile);
					result2 = new MoimUploadService().moimFileInsert(mu, result);
					
				}
			} if(fileNames==null) result2 = 1; 	//작성자가 파일업로드를 1개도 안한경우
		}

		
		
		
		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="작성 완료";
			loc="/moim/moimView.do?moimNum="+result;
		}
		else{
			msg="작성 실패";
			loc="/moim/moimView.do?moimNum="+result;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("moim", moim);
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
