package com.semi.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.vo.Member;
import com.semi.order.model.service.OrderService;
import com.semi.order.model.vo.Order;

/**
 * Servlet implementation class OrderEnrollEndServlet
 */
@WebServlet("/order/OrderEnrollEnd.do")
public class OrderEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member memberLogin = (Member) session.getAttribute("loginMember");
		
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));
		String oTot = request.getParameter("oTot");
		String oText = request.getParameter("oText");
		int oPrice = Integer.parseInt(request.getParameter("oPrice"));
		int mNum = memberLogin.getmNum();
		String mId = memberLogin.getmId();
		Order order = new Order(mNum, lecNum, oTot, oText, oPrice);
		int result= new OrderService().insertOrder(order, mId);
		
		
	    String msg="";
	    String loc="";
	      
		if(result>0) {
	         msg="강의신청이 완료됐습니다.";
	         request.setAttribute("msg", msg);
	         request.getRequestDispatcher("/order/orderList.do?mNum="+mNum).forward(request, response);
	      }
	      else{
	         msg="강의신청이 실패했습니다.";
	         loc="/";
	         request.setAttribute("msg", msg);
		     request.setAttribute("loc", loc);
		     request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	      }

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
