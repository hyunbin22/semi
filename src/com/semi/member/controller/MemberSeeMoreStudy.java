package com.semi.member.controller;

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
@WebServlet("/member/seeMoreStudy.do")
public class MemberSeeMoreStudy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSeeMoreStudy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int lecNum = Integer.parseInt(request.getParameter("lecNum"));
		
		OrderService service = new OrderService();
		Order o = service.seeMoreStudy(lecNum);
		
		request.setAttribute("order", o);
		System.out.println(o);
		request.getRequestDispatcher("/views/member/studyListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
