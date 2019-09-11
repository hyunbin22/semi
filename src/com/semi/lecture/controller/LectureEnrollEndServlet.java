package com.semi.lecture.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.AblingFileRenamePolicy;
import com.semi.lecture.model.service.LectureService;
//import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.member.model.vo.Member;
import com.semi.mento.model.vo.Mento;

/**
 * Servlet implementation class ClassEnroll
 */
@WebServlet("/lectureEnrollEnd")
public class LectureEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		  int mtNum = Integer.parseInt(request.getParameter("mtNum")); //멘토 참조번호
		  System.out.println(mtNum);
	      String lecName = request.getParameter("className"); //수업제목
	      System.out.println(lecName);
	      int subCategory = Integer.parseInt(request.getParameter("subcategory")); //부카테고리
	      System.out.println(subCategory);
	      String lecType = request.getParameter("classType"); //수업형태 (1:1수업, 그룹수업)
	      System.out.println(lecType);
	      int lecmaxcount = Integer.parseInt(request.getParameter("studentCount")); //수업정원
	      System.out.println(lecmaxcount);
	      String address= request.getParameter("subcategory");
	      address+=request.getParameter("local2");
	      System.out.println(address);
	      String lecMentoContent =request.getParameter("mentoIntroduce"); //멘토소개
	      System.out.println(lecMentoContent);
	      String lecLectureContent = request.getParameter("classIntroduce"); //수업소개
	      System.out.println(lecLectureContent);
	      int lecPrice = Integer.parseInt(request.getParameter("price")); //시간당 가격
	      System.out.println(lecPrice);
	      int lecTime = Integer.parseInt(request.getParameter("time")); //1회 수업 시간
	      System.out.println(lecTime);
	      int lecCount = Integer.parseInt(request.getParameter("totaltime")); //한달 기준 수업 횟수
	      System.out.println(lecCount);
	      int totalprice = lecPrice*lecTime*lecCount ; //총가격
	      System.out.println(totalprice);
	      int subLocal = Integer.parseInt(request.getParameter("local"));//서브지역카테고리
	      System.out.println(subLocal);
	      String lecLocalContent = request.getParameter("local2"); //세부위치작성
	      System.out.println(lecLocalContent);
	      String lecWeek = request.getParameter("yo"); //요일
	      System.out.println(lecWeek);
	      String lecTot = request.getParameter("day1"); // 수업시간
	      System.out.println(lecTot);
	      String lecMeet = request.getParameter("week1"); // 날짜선택 버튼,날짜협의 버튼
	      System.out.println(lecMeet);
	      Date lecOpenDate = Date.valueOf(request.getParameter("month1"));//개설날짜
	      System.out.println(lecOpenDate);
	      String lecTot2 = request.getParameter("day2"); // 수업시간
	      System.out.println(lecTot2);
	      String week2 = request.getParameter("week2"); //날짜선택 버튼,날짜협S의 버튼
	      System.out.println(week2);
	      Date lecOpenDate2 = Date.valueOf(request.getParameter("month2")); //개설날짜
	      System.out.println(lecOpenDate2);
	      
	      //////////////////////////////////////////////////////////////////////////사진업로드//
//	      String root=getServletContext().getRealPath("/");
//	      System.out.println(root);
//	      
//	      String saveDir=root+"/upload/lectureUpload";
//	      
//	      int maxSize=1024*1024*1024;
//	      
//	      HttpSession session = request.getSession();
//	      Member memberLogin = (Member) session.getAttribute("loginMember");
//	      MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
//	      
//	      String upLectureOrgCover=mr.getOriginalFileName("file1");
//	      String upLectureReCover = mr.getFilesystemName("file1");
//	      String upLectureOrgLecImg =mr.getOriginalFileName("addImg");
//	      String upLectureReLecImg= mr.getFilesystemName("addImg");
	      
	      Lecture l = new Lecture(subCategory, mtNum, subLocal, address, lecName, lecType,
	            lecmaxcount, lecPrice, lecTime, lecCount, lecWeek, lecMeet, lecTot,
	            lecTot2, lecOpenDate, lecOpenDate2, lecLocalContent, lecMentoContent,
	            lecLectureContent);
	      
	      System.out.println(l);      
	      int result = new LectureService().insertLecture(l, mtNum);

//	      LectureUpload ltu = new LectureUpload(upLectureOrgCover, upLectureReCover, upLectureOrgLecImg, upLectureReLecImg);
//	      int result1=new LectureService().insertLectureImage(ltu, mtNum);

	      
	      
	      String msg="";
	      String loc="/";
	      msg=result>0?"수업등록완료":"수업등록실패";
	      request.setAttribute("msg", msg);
	      request.setAttribute("loc", loc);
	      request.getRequestDispatcher("/views/common/msg.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
