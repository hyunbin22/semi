package com.semi.mento.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.mento.model.service.MentoService;
import com.semi.mento.model.service.MentoUploadService;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;

/**
 * Servlet implementation class MentoMyPageServlet
 */
@WebServlet("/mento/mentoMyPage.do")
public class MentoMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int getmNum=Integer.parseInt(request.getParameter("getmNum"));
//		
//		int getMtNum=Integer.parseInt(request.getParameter("getMtNum"));
//		
//		System.out.println("넘어온거 " + getmNum + "/" + getMtNum);
//		
//		MentoUpload mu = new MentoUploadService().selectMentoUpload(getMtNum);
//		Mento mt= new MentoService().selectMento(getmNum);
//		
//		request.setAttribute("mento", mt);
//		System.out.println(mt);
//		request.setAttribute("mentoUpload", mu);
//		System.out.println(mu);
//		
//		request.getRequestDispatcher("/views/mento/mentoPageView.jsp").forward(request,response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}