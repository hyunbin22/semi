package com.semi.subcategory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.subcategory.model.service.SubCategoryService;

/**
 * Servlet implementation class SubCategoryUpdateServlet
 */
@WebServlet("/admin/subcategoryUpdate")
public class SubCategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubCategoryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int subcategory = Integer.parseInt(request.getParameter("subcategory")); //select box에서 선택한 값
		String inputsubcategory = request.getParameter("inputsubcategory2"); //새로 입력한 값
		int result=new SubCategoryService().updateSubCategory(subcategory,inputsubcategory);

		String msg=result>0?"카테고리 수정이 완료되었습니다.":"카테고리 수정이 실패하였습니다.";
		String loc="/admin/subcategoryEnroll";
		
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
