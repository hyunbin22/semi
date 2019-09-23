package com.semi.lecture.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.lecture.model.service.LectureReviewService;
import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureReview;
//import com.semi.lecture.model.vo.LectureReview;
import com.semi.order.model.service.OrderService;
import com.semi.order.model.vo.Order;

/**
 * Servlet implementation class LectureViewServlet
 */
@WebServlet("/lecture/lectureView")
public class LectureViewServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int lectureNo = Integer.parseInt(request.getParameter("lecnum"));
        Lecture lec=new LectureService().lectureView(lectureNo);
        
        List<LectureReview> list=new LectureReviewService().selectReview(lectureNo);
        List<Order> orderList = new OrderService().selectLectureOrder(lectureNo);
        request.setAttribute("orderList", orderList);
        request.setAttribute("lecture", lec);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/views/lecture/lectureView.jsp").forward(request, response);
     }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}