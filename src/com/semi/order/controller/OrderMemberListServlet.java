package com.semi.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.order.model.service.OrderService;
import com.semi.order.model.vo.Order;

/**
 * Servlet implementation class OrderMemberListServlet
 */
@WebServlet("/order/orderMemberList.do")
public class OrderMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderMemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=10;
		int totalStudy = new OrderService().selectStudyListCount();
		
		int totalPage=(int)Math.ceil((double)totalStudy/numPerPage);
		
		String pageBar="";
		int pageSizeBar=4;
		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
		int pageEnd=pageNo+pageSizeBar-1;
		
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()
			+"/member/studyList.do?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}
			else {
				pageBar+="<a href='"+request.getContextPath()
				+"/member/studyList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()
			+"/member/studyList.do?cPage="+(pageNo)+"'>[다음]</a>";
		}
		
		int mtnum =Integer.parseInt(request.getParameter("mtNum"));
		int lecnum = Integer.parseInt(request.getParameter("lecNum"));
		List<Lecture> lec = new LectureService().lectureListByMtNum(mtnum);
		List<Order> order = new OrderService().orderListByLecNum(lecnum, cPage, numPerPage);

			
		request.setAttribute("pageBar", pageBar);
	    request.setAttribute("cPage", cPage);
		request.setAttribute("mtnum", mtnum);
		request.setAttribute("lecnum", lecnum);
		request.setAttribute("lecture", lec);
		request.setAttribute("order", order);
		
		request.getRequestDispatcher("/views/order/orderMemberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
