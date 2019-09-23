package com.semi.mento.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

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
		
		int getmNum=Integer.parseInt(request.getParameter("getmNum"));
		int getMtNum=Integer.parseInt(request.getParameter("getMtNum"));

		
		List<MentoUpload> muList = new MentoUploadService().mentoUpList(getMtNum);
		Mento mt= new MentoService().mentoView(getMtNum);

		request.setAttribute("mento", mt);
		request.setAttribute("mentoUpload", muList);
		
		request.getRequestDispatcher("/views/mento/mentoPageView.jsp").forward(request,response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
