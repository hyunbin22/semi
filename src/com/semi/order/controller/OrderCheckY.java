package com.semi.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.order.model.service.OrderService;

/**
 * Servlet implementation class OrderCheckY
 */
@WebServlet("/order/orderCheckY.do")
public class OrderCheckY extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCheckY() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oNum=Integer.parseInt(request.getParameter("oNum"));
		int lecnum = Integer.parseInt(request.getParameter("lecNum"));
		int mtNum = Integer.parseInt(request.getParameter("mtNum"));
		
		int result=new OrderService().checkY(oNum); // mNum 찾아서 update 
		String msg=result>0?"승인완료":"승인실패";
		String loc="/order/orderMemberList.do?lecNum="+lecnum+"&mtNum="+mtNum;
		request.setAttribute("msg",msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
