package com.semi.moim.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.vo.Moim;

/**
 * Servlet implementation class MoimUpdateServlet
 */
@WebServlet("/moim/moimUpdate.do")
public class MoimUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MoimUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int moimNum = Integer.parseInt(request.getParameter("moimNum"));
		Moim moim = new MoimService().moimView(moimNum);
		request.setAttribute("moim", moim);
		request.getRequestDispatcher("/views/moim/moimUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
