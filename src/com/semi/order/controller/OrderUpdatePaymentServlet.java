package com.semi.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureService;
import com.semi.message.model.service.MessageService;
import com.semi.order.model.service.OrderService;

/**
 * Servlet implementation class OrderUpdatePaymentServlet
 */
@WebServlet("/order/orderUpdatePayment.do")
public class OrderUpdatePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderUpdatePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		int result = new OrderService().updatePayment(oNum);
		String type = "add";
		if(result > 0) {
			//누적수강인원 증가
			int addStudentCount = new LectureService().updateStudentCount(oNum, type);
			if(addStudentCount > 0) {
				response.getWriter().write(result+"");
				
				//멘토한테 결제되었다는 메세지 보내기
				String userId = new OrderService().selectOrder(oNum).getLecture().getLecMento().getMember().getmId();
				new MessageService().insertMessage("msgAdmin", userId, " 신청번호 '"+oNum+"'  결제 완료 되었습니다.");
			}
		}
		
		response.getWriter().write("0");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
