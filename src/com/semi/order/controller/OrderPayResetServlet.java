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
 * Servlet implementation class OrderPayResetServlet
 */
@WebServlet("/order/orderPayReset.do")
public class OrderPayResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderPayResetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oNum = Integer.parseInt(request.getParameter("oNum"));
		int result = new OrderService().orderPayReset(oNum);
		String type = "minus";
		String loc = "";
		String msg = "";
		if(result > 0) {
			int minusStudentCount = new LectureService().updateStudentCount(oNum, type);
			if(minusStudentCount > 0) {
				
				//멘토한테 결제되었다는 메세지 보내기
				String userId = new OrderService().selectOrder(oNum).getLecture().getLecMento().getMember().getmId();
				new MessageService().insertMessage("msgAdmin", userId, " 신청번호 "+oNum+"  결제 취소 되었습니다.");
				msg = " 신청번호 "+oNum+" 결제 취소 되었습니다.";
				
			}
		} else {	//결제취소 실패시
			msg = " 신청번호  " + oNum + " 결제 취소 실패되었습니다. 관리자에게 문의해주세요.";
		}
		
		loc = "/order/orderView.do?oNum=" + oNum;
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
