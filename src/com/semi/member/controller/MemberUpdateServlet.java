package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet(name="UpdateMember",urlPatterns ="/member/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String mId=request.getParameter("mId");
      String mPw = request.getParameter("mPw");
      String mEmail = request.getParameter("email");
      String phone = request.getParameter("tel1");
      phone+=request.getParameter("tel2");
      phone+=request.getParameter("tel3");
      
      if(phone.length() == 0)
      {
         Member m1 = new MemberService().selectMember(mId);
         phone = m1.getmPhone();
      }
   
      
   
      
      int result=new MemberService().updateMember(mPw, mEmail,phone,mId);
      Member m = new MemberService().selectMember(mId);
      
      if(result> 0) {
         HttpSession session = request.getSession();
         session.setAttribute("loginMember", m);
      }
      
      String msg=result>0?"회원수정이 완료되었습니다.":"회원수정을 실패하였습니다.";
      String loc="/";
      
      request.setAttribute("msg", msg);
      request.setAttribute("loc", loc);
      request.getRequestDispatcher("/views/common/msg.jsp")
      .forward(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}