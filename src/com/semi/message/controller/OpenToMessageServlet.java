package com.semi.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OpenLecMessageServlet
 */
@WebServlet("/message/openToMessage.do")
public class OpenToMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OpenToMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String toId = request.getParameter("toId");
		String lecName = request.getParameter("lectureName")!=null && !request.getParameter("lectureName").equals("") ? request.getParameter("lectureName"):"";
		String moimTitle = request.getParameter("moimTitle")!=null && !request.getParameter("moimTitle").equals("") ? request.getParameter("moimTitle"):"";
		request.setAttribute("toId", toId);
		request.setAttribute("lecName", lecName);
		request.setAttribute("moimTitle", moimTitle);
		request.getRequestDispatcher("/views/common/webMessageView.jsp?toId="+toId).forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
