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
 * Servlet implementation class LectureListSearchServlet
 */
@WebServlet("/lecture/lectureListSearch.do")
public class LectureListSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureListSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 & 서브카테고리
		   List<Category> c= (List)new CategoryService().selectCategory();
		   String subName=request.getParameter("subName");
	       List<SubCategory> sc= (List)new SubCategoryService().selectSubCategory();
	       int subNum=0;
	       
	       for(int i=0; i<sc.size();i++) {
	    	   if(subName.equals(sc.get(i).getSubName())){
	    		   subNum = sc.get(i).getSubNum();
	    	   }
	       }
	       
	       
	      // 강의 리스트 페이징 처리
	      int cPage;
	      try {
	         cPage=Integer.parseInt(request.getParameter("cPage"));
	      }catch(NumberFormatException e) {
	         cPage=1;
	      }
	      
	      
	      int numPerPage=10;
	      LectureService service=new LectureService();
	      int totalLecture=service.selectLectureCount();
	      List<Lecture> lecturelist=service.selectLectureListSubNum(cPage, numPerPage, subNum);
	      

	      int totalPage=(int)Math.ceil((double)totalLecture/numPerPage);
	      String pageBar="";
	      int pageSizeBar=9;
	      int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
	      int pageEnd=pageNo+pageSizeBar-1;
	      
	      if(pageNo==1) {
	         pageBar+="<span><</span>";
	      }else {
	         pageBar+="<a href='"+request.getContextPath()+"/lecture/lectureListSearch.do?subName="+subName+"&cPage="+(pageNo-1)+"'><</a>";
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {
	         if(pageNo==cPage) {
	            pageBar+="<span>"+pageNo+"</span>";
	         } else {
	            pageBar+="<a href='"+request.getContextPath()+"/lecture/lectureListSearch.do?subName="+subName+"&cPage="+pageNo+"'>"+pageNo+"</a>";
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
	      
	      	
	      request.setAttribute("subNum", subNum);
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
