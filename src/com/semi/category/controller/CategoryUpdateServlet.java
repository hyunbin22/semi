package com.semi.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.category.model.service.CategoryService;

/**
 * Servlet implementation class CategoryUpdateServlet
 */
@WebServlet("/admin/categoryUpdate")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int selectbank = Integer.parseInt(request.getParameter("selectbank")); //select box에서 선택한 값
		String inputcategory = request.getParameter("inputcategory"); //새로 입력한 값
		int result=new CategoryService().updateCategory(selectbank,inputcategory);
		
		String msg=result>0?"카테고리 수정이 완료되었습니다.":"카테고리 수정이 실패하였습니다.";
		String loc="/admin/categoryEnroll";
		
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