package com.semi.mento.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
import com.semi.mento.model.service.MentoService;
import com.semi.mento.model.service.MentoUploadService;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;

/**
 * Servlet implementation class MentoRegisterServlet
 */
@WebServlet("/mento/mentoRegisterEnd.do")
public class MentoRegisterEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoRegisterEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "멘토신청 실패 [form:ectype] 관리자에게 문의하세요!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;
		}
		
		String root=getServletContext().getRealPath("/");
		
		String saveDir=root+"/upload/mento";
		
		
		int maxSize=1024*1024*1024;
		
		HttpSession session = request.getSession();
		Member memberLogin = (Member) session.getAttribute("loginMember");
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
		
		String mtnickname = mr.getParameter("mtnickname");
		String mthowconfirm = mr.getParameter("mthowconfirm");
		String mtacademic = mr.getParameter("mtacademic");
		String mtacademicdept = mr.getParameter("mtacademicdept");
		String mtgraduation = mr.getParameter("mtgraduation");
		String mtBank = mr.getParameter("mtbank");
		String mtAccountNumber = mr.getParameter("mtAccountNumber");
		
		String upMentoNameLicense = mr.getParameter("mtlicense");
		String upMentoNameLicense2 = mr.getParameter("mtlicense2");
		String category="";
		
		
		int mNum = Integer.parseInt(mr.getParameter("mNum"));
		String mId = mr.getParameter("mId");
		
		
		
		Mento mt = new Mento(mtnickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, mtBank, mtAccountNumber);
		Member m = new Member(mNum, mId);

		int result=new MentoService().registerMento(mt, m);
		int result2=0;
		
		if(mr.getOriginalFileName("mtprofileimg")!=null) {
			category="profile";
			String upMentoOrgProfile=mr.getOriginalFileName("mtprofileimg");
			String upMentoReProfile = mr.getFilesystemName("mtprofileimg");
			MentoUpload mtu1 = new MentoUpload(result, category, upMentoOrgProfile, upMentoReProfile);
			result2=new MentoUploadService().registerMentoImage(mtu1, result, category);
		}
		if(mr.getOriginalFileName("mtconfirming")!=null) {
			category="confirm";
			String upMentoOrgConfirm =mr.getOriginalFileName("mtconfirming");
			String upMentoReConfirm= mr.getFilesystemName("mtconfirming");
			MentoUpload mtu2 = new MentoUpload(result, category, upMentoOrgConfirm, upMentoReConfirm);
			result2=new MentoUploadService().registerMentoImage(mtu2, result, category);
		}

		if(mr.getOriginalFileName("mtlicenseimg")!=null) {
			category="license";
			String upMentoOrgLicense =mr.getOriginalFileName("mtlicenseimg");
			String upMentoReLicense= mr.getFilesystemName("mtlicenseimg");	
			MentoUpload mtu3 = new MentoUpload(result, category, upMentoNameLicense, upMentoOrgLicense, upMentoReLicense);
			result2=new MentoUploadService().registerMentoImage2(mtu3, result, category, upMentoNameLicense);
		}
		if(mr.getOriginalFileName("mtImgLicense")!=null) {
			category="license";
			String upMentoOrgLicense =mr.getOriginalFileName("mtImgLicense");
			String upMentoReLicense= mr.getFilesystemName("mtImgLicense");	
			MentoUpload mtu4 = new MentoUpload(result, category, upMentoNameLicense2, upMentoOrgLicense, upMentoReLicense);
			result2=new MentoUploadService().registerMentoImage2(mtu4, result, category, upMentoNameLicense2);
		}
		
		
		String msg="";
		String loc="";
		
		if(result>0&&result2>0) {
			msg="멘토신청 완료";
			loc="/";
		}
		else{
			msg="멘토신청 실패";
			loc="/";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("mentoInfo", mt);
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
