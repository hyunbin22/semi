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

import com.semi.lecture.model.service.LectureService;
import com.semi.member.model.vo.Member;
import com.semi.mento.model.service.MentoService;
import com.semi.mento.model.service.MentoUploadService;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;

/**
 * Servlet implementation class MentoRegisterServlet
 */
@WebServlet("/mento/mentoUpdateEnd.do")
public class MentoUpdateModifyEndServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoUpdateModifyEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      if(!ServletFileUpload.isMultipartContent(request)) {
         request.setAttribute("msg", "멘토수정 실패 [form:ectype] 관리자에게 문의하세요!");
         request.setAttribute("loc", "/");
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
         
         return;
      }
      
      String root=getServletContext().getRealPath("/");
      System.out.println(root);
      
      String saveDir=root+"/upload/mento";
      
      
      int maxSize=1024*1024*1024;
      
      HttpSession session = request.getSession();
      Member memberLogin = (Member) session.getAttribute("loginMember");
      MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
      
      String profileOriImage = mr.getParameter("mtprofileimg");
      String profileReImage = mr.getParameter("mtprofileimg");
      String confirmOriImage = mr.getParameter("mtconfirming");
      String confirmReImage = mr.getParameter("mtconfirming");
      String licenseOriImage = mr.getParameter("mtlicenseimg");
      String licenseReImage = mr.getParameter("mtlicenseimg");
      
      int mtNum = Integer.parseInt(request.getParameter("mtNum"));
      String mtnickname = mr.getParameter("mtnickname");
      String mthowconfirm = mr.getParameter("mthowconfirm");
      String mtacademic = mr.getParameter("mtacademic");
      String mtacademicdept = mr.getParameter("mtacademicdept");
      String mtgraduation = mr.getParameter("mtgraduation");
      String mtBank = mr.getParameter("mtbank");
      String mtAccountNumber = mr.getParameter("mtAccountNumber");      
      String upMentoNameLicense = mr.getParameter("mtlicense");
      
      Mento mt = new Mento(mtnickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, mtBank, mtAccountNumber);
      
      
      String category="";
      String msg="";
      String loc="";
        
      int result=0;
      int result2=0;
      int result3= new MentoUploadService().deleteMentoImg(mtNum);

      if(result3>0) {
    	  result = new MentoService().updateMento(mtnickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, mtBank, mtAccountNumber, mtNum);
 
      if(mr.getOriginalFileName("mtprofileimg")!=null) {
         category="profile";
         String upMentoOrgProfile=mr.getOriginalFileName("mtprofileimg");
         String upMentoReProfile = mr.getFilesystemName("mtprofileimg");
         MentoUpload mtu1 = new MentoUpload(mtNum, category, upMentoNameLicense, upMentoOrgProfile, upMentoReProfile);
         result2=new MentoUploadService().updateMentoImage(mtu1, mtNum, category);
         System.out.println("카테고리 : "+category+", 파일이름 :"+upMentoOrgProfile);
      }
      if(mr.getOriginalFileName("mtconfirming")!=null) {
         category="confirm";
         String upMentoOrgConfirm =mr.getOriginalFileName("mtconfirming");
         String upMentoReConfirm= mr.getFilesystemName("mtconfirming");
         MentoUpload mtu2 = new MentoUpload(mtNum, category, upMentoNameLicense, upMentoOrgConfirm, upMentoReConfirm);
         result2=new MentoUploadService().updateMentoImage(mtu2, mtNum, category);
         System.out.println("카테고리 : "+category+", 파일이름 :"+upMentoOrgConfirm);
      }

      
      if(mr.getOriginalFileName("mtlicenseimg")!=null) {
         category="license";
         String upMentoOrgLicense =mr.getOriginalFileName("mtlicenseimg");
         String upMentoReLicense= mr.getFilesystemName("mtlicenseimg");   
         MentoUpload mtu3 = new MentoUpload(mtNum, category, upMentoNameLicense, upMentoOrgLicense, upMentoReLicense);
         result2=new MentoUploadService().updateMentoImage(mtu3, mtNum, category);
         System.out.println("카테고리 : "+category+", 파일이름 :"+upMentoOrgLicense);
      }
      }else {
    	 msg="멘토수정 실패!!";
         loc="/";
         request.setAttribute("msg", msg);
	     request.setAttribute("loc", loc);
	     request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
      }
      
      
      
      if(result>0 && result2>0 && result3>0) {
        msg="멘토수정 완료";
        loc="/";
        request.setAttribute("msg", msg);
        request.setAttribute("loc", loc);
        request.getRequestDispatcher("/views/mento/mentoPageView.jsp").forward(request, response);
      
      }
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}