package com.semi.subcategory.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.category.model.service.CategoryService;
import com.semi.category.model.vo.Category;
import com.semi.subcategory.model.service.SubCategoryService;
import com.semi.subcategory.model.vo.SubCategory;

/**
 * Servlet implementation class SubCategoryEnrollServlet
 */
@WebServlet("/admin/subcategoryEnroll")
public class SubCategoryEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubCategoryEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<SubCategory> sc= (List)new SubCategoryService().selectSubCategory();
		List<Category> c= (List)new CategoryService().selectCategory();
		
        
        request.setAttribute("subcategory", sc);
        request.setAttribute("category", c);
		request.getRequestDispatcher("/views/admin/subcategoryEnroll.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
