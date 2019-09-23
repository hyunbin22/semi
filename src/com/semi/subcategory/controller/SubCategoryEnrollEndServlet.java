package com.semi.subcategory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.subcategory.model.service.SubCategoryService;

/**
 * Servlet implementation class SubCategoryEnrollEndServlet
 */
@WebServlet("/admin/subcategoryEnrollEnd")
public class SubCategoryEnrollEndServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubCategoryEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int maincategory = Integer.parseInt(request.getParameter("maincategory"));
      String inputsubcategory = request.getParameter("inputsubcategory");
      
      
      int result=new SubCategoryService().enrollSubCategory(inputsubcategory,maincategory);

      String msg="";
      String loc="/admin/subcategoryEnroll";
      msg=result>0?"서브카테고리 등록 성공":"서브카테고리 등록 실패";
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