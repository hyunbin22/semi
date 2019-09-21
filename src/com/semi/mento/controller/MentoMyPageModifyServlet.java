package com.semi.mento.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.mento.model.service.MentoUploadService;
import com.semi.mento.model.vo.MentoUpload;

/**
 * Servlet implementation class MentoMyPageModifyServlet
 */
@WebServlet("/mento/mypageModify.do")
public class MentoMyPageModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoMyPageModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mtnum=Integer.parseInt(request.getParameter("mtnum"));
//		MentoUpload mu = new MentoUploadService().selectMentoUpload(mtnum);
//		
//		request.setAttribute("mu", mu);
//		System.out.println(mu);
		
		request.getRequestDispatcher("/views/mento/mentoPage_modifyView.jsp").forward(request,response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
