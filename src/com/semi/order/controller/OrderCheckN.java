package com.semi.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.order.model.service.OrderService;

/**
 * Servlet implementation class OrderCheckN
 */
@WebServlet("/order/orderCheckN.do")
public class OrderCheckN extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCheckN() {
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
		
		int result=new OrderService().checkN(oNum); // mNum 찾아서 update 
		String msg=result>0?"승인취소가 완료됐습니다.":"승인취소기 실패했습니다.";
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
