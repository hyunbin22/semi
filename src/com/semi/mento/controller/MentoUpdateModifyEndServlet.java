package com.semi.mento.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.member.model.vo.Member;
import com.semi.mento.model.service.MentoService;
import com.semi.mento.model.service.MentoUploadService;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;

import common.oreilly.servlet.multipart.AblingFileRenamePolicy;

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

      //기존 파일이름
      String proOre = mr.getParameter("profileOrgName");
      String proRe = mr.getParameter("profileReName");
      String conOre = mr.getParameter("profileOrgName");
      String conRe = mr.getParameter("profileReName");
      String[] liOre = mr.getParameterValues("licenseOrgName");
      String[] liRe = mr.getParameterValues("licenseReName");


      //수정했을때 새로 받아오는 파일이름
      String profileOriImage = mr.getOriginalFileName("mtprofileimg");
      String profileReImage = mr.getFilesystemName("mtprofileimg");
      String confirmOriImage = mr.getOriginalFileName("mtconfirming");
      String confirmReImage = mr.getFilesystemName("mtconfirming");
      String licenseOriImage = mr.getOriginalFileName("mtlicenseimg1");
      String licenseReImage = mr.getFilesystemName("mtlicenseimg1");
      String licenseOriImage1 = mr.getOriginalFileName("mtlicenseimg2");
      String licenseReImage1 = mr.getFilesystemName("mtlicenseimg2");


      System.out.println("licenseOriImage "+licenseOriImage);
      System.out.println("licenseReImage "+licenseReImage);
      System.out.println("licenseOriImage1 "+licenseOriImage1);
      System.out.println("licenseReImage1 "+licenseReImage1);
      int mtNum = Integer.parseInt(request.getParameter("mtNum"));

      Mento mt = new Mento(mtnickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, mtBank, mtAccountNumber);
      Mento mt1 = new MentoService().mentoView(mtNum);
      String upMentoNameLicense = mr.getParameter("mtlicense1");
      String upMentoNameLicense1 = mr.getParameter("mtlicense2");

      Mento orgMento = new MentoService().mentoView(mtNum);
      
      List<MentoUpload> list = new ArrayList();
      for(int i = 0; i < orgMento.getList().size(); i++) {
         if(orgMento.getList().get(i).getUpMentoCategory().equals("license")) {
            list.add(orgMento.getList().get(i));
            
         }
         
      }
         
      int result = new MentoService().updateMento(mtnickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, mtBank, mtAccountNumber, mtNum);
      int result2=0;
      if(result>0) {
         for(int i = 0; i < orgMento.getList().size(); i++) {
            //            result2 = 0;
            switch(orgMento.getList().get(i).getUpMentoCategory()) {
            case "profile" : 
               if(profileOriImage!=null) {

                  result2 = new MentoUploadService().deleteMentoImg(orgMento.getList().get(i).getUpMentoNum());
                  if(result2>0) {
                     String category="profile";

                     MentoUpload mtu1 = new MentoUpload(mtNum, category, null, profileOriImage, profileReImage);
                     result2=new MentoUploadService().updateMentoImage(mtu1, mtNum, category);
                  }
               } break;
            case "confirm" :
               if(confirmOriImage!=null) {
                  result2 = new MentoUploadService().deleteMentoImg(orgMento.getList().get(i).getUpMentoNum());
                  if(result2>0) {
                     String category="confirm";
                     MentoUpload mtu1 = new MentoUpload(mtNum, category, null, confirmOriImage, confirmReImage);
                     result2=new MentoUploadService().updateMentoImage(mtu1, mtNum, category);
                  }
               } break;
            case "license" :
               if(licenseOriImage!=null) {
                  System.out.println("1번 : " + list.get(1).getUpMentoNum());
                  result2 = new MentoUploadService().deleteMentoImg(list.get(1).getUpMentoNum());
   
                  if(result2>0) {
                     String category="license";
                     MentoUpload mtu1 = new MentoUpload(mtNum, category, upMentoNameLicense, licenseOriImage, licenseReImage);
                     result2=new MentoUploadService().updateMentoImage(mtu1, mtNum, category);
                  }
               }
               if(licenseOriImage1!=null) {
            
                  result2 = new MentoUploadService().deleteMentoImg(list.get(0).getUpMentoNum());
   
                  if(result2>0) {

                     String category="license";
                     MentoUpload mtu1 = new MentoUpload(mtNum, category, upMentoNameLicense1, licenseOriImage1, licenseReImage1);
                     System.out.println("mtu1 : "+mtu1);
                     result2=new MentoUploadService().updateMentoImage(mtu1, mtNum, category);
                  }
               }


               break;

            default: result2 = 1; break;

            }

         }

      }


      String msg="";
      String loc="";


      if(result>0) {

         session.setAttribute("loginMento", mt1);
         System.out.println(session.getAttribute("loginMento").toString());
         msg="멘토수정 완료";
         loc="/mento/mentoMyPage.do?getmNum="+orgMento.getmNum()+"&getMtNum="+orgMento.getMtNum();
         request.setAttribute("msg", msg);
         request.setAttribute("loc", loc);
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

      } else {
         msg="멘토수정 실패!!";
         loc="/mento/mentoMyPage.do?getmNum="+orgMento.getmNum()+"&getMtNum="+orgMento.getMtNum();
         request.setAttribute("msg", msg);
         request.setAttribute("loc", loc);
         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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