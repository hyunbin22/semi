package com.semi.lecture.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.category.model.service.CategoryService;
import com.semi.category.model.vo.Category;
import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.subcategory.model.service.SubCategoryService;
import com.semi.subcategory.model.vo.SubCategory;

/**
 * Servlet implementation class LectureListSubcategory
 */
@WebServlet("/lecture/lectureListSubcategory.do")
public class LectureListSubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureListSubcategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<Category> c= (List)new CategoryService().selectCategory();
			List<SubCategory> sc= (List)new SubCategoryService().selectSubCategory();
		   
	      // 강의 리스트 페이징 처리
	      int cPage;
	      try {
	         cPage=Integer.parseInt(request.getParameter("cPage"));
	      }catch(NumberFormatException e) {
	         cPage=1;
	      }
	      int numPerPage=5;
	      LectureService service=new LectureService();
	      int totalLecture=service.selectLectureCount();
	      List<Lecture> lecturelist=service.selectLectureList(cPage, numPerPage);
	      

	      int totalPage=(int)Math.ceil((double)totalLecture/numPerPage);
	      String pageBar="";
	      int pageSizeBar=9;
	      int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
	      int pageEnd=pageNo+pageSizeBar-1;
	      
	      if(pageNo==1) {
	         pageBar+="<span><</span>";
	      }else {
	         pageBar+="<a href='"+request.getContextPath()+"/lecture/lectureList.do?cPage="+(pageNo-1)+"'><</a>";
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {
	         if(pageNo==cPage) {
	            pageBar+="<span>"+pageNo+"</span>";
	         } else {
	            pageBar+="<a href='"+request.getContextPath()+"/lecture/lectureList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
	         }
	         pageNo++;
	      }
	      
	      if(pageNo>totalPage) {
	         pageBar+="<span>></span>";
	      }
	      else {
	         pageBar+="<a href='"+request.getContextPath()
	         +"/lecture/lectureList.do?cPage="+(pageNo)+"'>></a>";
	      }
	      
	      
	      request.setAttribute("category", c);
	      request.setAttribute("subcategory", sc);
	      request.setAttribute("pageBar", pageBar);
	      request.setAttribute("cPage", cPage);
	      request.setAttribute("list", lecturelist);
	      request.getRequestDispatcher("/views/lecture/lectureList.jsp")
	      .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
