package com.semi.mento.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.service.LectureUploadService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.member.model.vo.Member;

import common.oreilly.servlet.multipart.AblingFileRenamePolicy;

/**
 * Servlet implementation class MentoUpdateLectureServlet
 */
@WebServlet("/mento/updateLecture.do")
public class MentoUpdateLectureEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoUpdateLectureEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		if(!ServletFileUpload.isMultipartContent(request)) {
	         request.setAttribute("msg", "강의수정 실패 ![form:ectype] 관리자에게 문의하세요!");
	         request.setAttribute("loc", "/");
	         request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	         
	         return;
	      }
	      
	      String root=getServletContext().getRealPath("/");
	      
	      String saveDir=root+"/upload/lecture";
	      
	      int maxSize=1024*1024*1024;
	      
	      HttpSession session = request.getSession();
	      Member memberLogin = (Member) session.getAttribute("loginMember");
	      MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
	                              
	      String coverOriImage = mr.getOriginalFileName("file1");
	      String coverReImage = mr.getFilesystemName("file1");
	      String lecOriImage = mr.getOriginalFileName("addImg");
	      String lecReImage = mr.getFilesystemName("addImg");
	                            
	      	int lecNum = Integer.parseInt(mr.getParameter("lecNum"));
	      	int mtNum = Integer.parseInt(mr.getParameter("mtNum")); //멘토 참조번호
			String lecName = mr.getParameter("className"); //수업제목
			int subCategory = Integer.parseInt(mr.getParameter("subcategory")); //부카테고리
			String lecType = mr.getParameter("classType"); //수업형태 (1:1수업, 그룹수업)
			int lecmaxcount = 0;
			if(lecType.equals("그룹")) {
			lecmaxcount = Integer.parseInt(mr.getParameter("studentCount"));
				
			} //수업정원
			String address= mr.getParameter("subcategory");
			address+=mr.getParameter("local2");
			String lecMentoContent =mr.getParameter("mentoIntroduce"); //멘토소개
			String lecLectureContent = mr.getParameter("classIntroduce"); //수업소개
			int lecPrice = Integer.parseInt(mr.getParameter("price")); //시간당 가격
			int lecTime = Integer.parseInt(mr.getParameter("time")); //1회 수업 시간
			int lecCount = Integer.parseInt(mr.getParameter("totaltime")); //한달 기준 수업 횟수
			int totalprice = lecPrice*lecTime*lecCount ; //총가격
			int subLocal = Integer.parseInt(mr.getParameter("local"));//서브지역카테고리
			String lecLocalContent = mr.getParameter("local2"); //세부위치작성
			String lecWeek = mr.getParameter("yo"); //요일
			String lecTot = mr.getParameter("day1"); // 수업시간
			String lecMeet = mr.getParameter("week1"); // 날짜선택 버튼,날짜협의 버튼
			Date lecOpenDate = Date.valueOf(mr.getParameter("month1"));//개설날짜
			String lecTot2 = mr.getParameter("day2"); // 수업시간
			String week2 = mr.getParameter("week2"); //날짜선택 버튼,날짜협S의 버튼
			Date lecOpenDate2 = Date.valueOf(mr.getParameter("month2")); //개설날짜
		
  
	      Lecture l = new Lecture(lecNum, mtNum, subCategory, subLocal, lecName, lecType,
	            lecmaxcount, lecPrice, lecTime, lecCount, lecWeek, lecMeet, lecTot,
	            lecTot2, lecOpenDate, lecOpenDate2, lecLocalContent, lecMentoContent,
	            lecLectureContent);
	      
	      String msg="";
	      String loc="";
	      String category="";

	      Lecture orgLecture = new LectureService().lectureListByLecNum(lecNum);
	      int result= new LectureService().updateLecture(l, lecNum); 
	      int result2=0;
	      if(result>0) {
		      for(int i=0; i<orgLecture.getLectureUpList().size(); i++) {
			    	  switch(orgLecture.getLectureUpList().get(i).getUpLectureCategory()) {
			    	  case "cover" :
			    		  if(coverOriImage!=null){
			    			  
			    			  result2=new LectureUploadService().deleteLectureImg(lecNum);
			    			  if(result2>0) {
			    			  category="cover";
			    			  LectureUpload lecup1 = new LectureUpload(lecNum, category, coverOriImage, coverReImage);
			    			  result2=new LectureUploadService().insertLectureImage(lecup1, lecNum, category);			    			  
			    		  }
			    		  } break;
			    	  case "lecimage" :
			    		  if(lecOriImage!=null) {	
			    			 
			    			  result2=new LectureUploadService().deleteLectureImg(lecNum);
			    			  if(result2>0) {
			    			  category="lecimage";
			    			
			    			  LectureUpload lecup2 = new LectureUpload(lecNum, category, lecOriImage, lecReImage);
			    			  result2=new LectureUploadService().insertLectureImage(lecup2, lecNum, category);
			    		  }
			    	  }break;
			    	  default: result2 = 1; break;
			      }
		      }
	      
	}

	      
	  	if(result>0) {	
			msg="수업수정 완료";
			loc="/mento/studyList.do?mtnum="+orgLecture.getMtNum();
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);

		} else {
			msg="수업수정 실패!!";
			loc="/mento/studyList.do?mtnum="+orgLecture.getMtNum();
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
