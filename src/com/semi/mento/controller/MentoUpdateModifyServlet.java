
package com.semi.mento.controller;

import java.io.IOException;
import java.util.List;

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
public class MentoUpdateModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentoUpdateModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mtnum=Integer.parseInt(request.getParameter("mtnum"));
		List<MentoUpload> muList = new MentoUploadService().mentoUpList(mtnum);
		
		request.setAttribute("mu", muList);
		
		request.getRequestDispatcher("/views/mento/mentoPageModifyView.jsp").forward(request,response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
