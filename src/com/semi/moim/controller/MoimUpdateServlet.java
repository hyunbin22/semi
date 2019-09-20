//package com.semi.moim.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
//
//import com.oreilly.servlet.MultipartRequest;
//import com.semi.member.model.vo.Member;
//import com.semi.moim.model.service.MoimService;
//import com.semi.moim.model.service.MoimUploadService;
//import com.semi.moim.model.vo.Moim;
//import com.semi.moim.model.vo.MoimUpload;
//
//import common.oreilly.servlet.multipart.AblingFileRenamePolicy;
//
///**
// * Servlet implementation class MoimUpdateServlet
// */
//@WebServlet("/moim/moimUpdate.do")
//public class MoimUpdateServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//    public MoimUpdateServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		if(!ServletFileUpload.isMultipartContent(request)) {
//			request.setAttribute("msg", "수정 실패 ![form:ectype] 관리자에게 문의하세요!");
//			request.setAttribute("loc", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//			
//			return;
//		}
//		String root=getServletContext().getRealPath("/");
//
//		String saveDir=root+"/upload/moim";
//		
//		int maxSize=1024*1024*1024;
//		
//		HttpSession session = request.getSession();
//		Member memberLogin = (Member) session.getAttribute("loginMember");
//		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
//		
//		int mNum = Integer.parseInt(mr.getParameter("mNum"));	
//		int moimNum = Integer.parseInt(mr.getParameter("moimNum"));
//		String title = mr.getParameter("title");
//		String text = mr.getParameter("text");
//		String keyword = mr.getParameter("keyword");
//		String orgFile = mr.getOriginalFileName("moimFile");
//		String reFile = mr.getFilesystemName("moimFile");		
//		
//		Moim moim = new Moim(moimNum, mNum, title, text, keyword);
//		
//		int result = new MoimService().updateMoim(moim);
//		int result2 = 0;	//삭제 돼었는지
//		int result3 = 0;	//파일 새로 올라갔는지
//		MoimUpload mu = new MoimUpload(orgFile, reFile);
//		
//		Moim moim2 = new MoimService().moimView(moimNum);	//기존 등록된 첨부파일 리스트 가져오기
//		
//		if(result > 0) {
//			result2 = new MoimUploadService().moimFileDelete(result);
//			if(result2 > 0) {
//				
//			}
//			
//		}
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//
//}
