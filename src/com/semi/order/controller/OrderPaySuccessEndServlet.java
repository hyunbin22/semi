package com.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderPaySuccessServlet
 */
@WebServlet("/order/orderPaySuccess.do")
public class OrderPaySuccessEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderPaySuccessEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg = request.getParameter("msg");
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		String loc = "/order/orderView.do?oNum="+oNum;
		request.setAttribute("loc", loc);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
