package com.semi.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.order.model.service.OrderService;
import com.semi.order.model.vo.Order;

/**
 * Servlet implementation class MemberSeeMoreStudy
 */
@WebServlet("/order/orderView.do")
public class OrderViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		
		String str = "";
		OrderService service = new OrderService();
		Order o = service.selectOrder(oNum);
		if(o.getoPayment()=='Y') {
			str="Y";
		} else {
			str="N";
		}
		request.setAttribute("str", str);
		request.setAttribute("order", o);
		request.getRequestDispatcher("/views/order/orderView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}