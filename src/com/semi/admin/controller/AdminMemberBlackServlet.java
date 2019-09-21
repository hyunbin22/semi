package com.semi.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class AdminMemberBlackServlet
 */
@WebServlet("/admin/blackList.do")
public class AdminMemberBlackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberBlackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징처리 추가하기
	      int cPage;
	      try {
	         cPage=Integer.parseInt(request.getParameter("cPage"));
	      }catch(NumberFormatException e) {
	         cPage=1;
	      }
	      
	      int numPerPage=5;//페이지당 출력할 데이터
	      int totalBlackMember=new MemberService().selectCountBlackMember();     
	      List<Member> list=new MemberService().selectBlackListPage(cPage,numPerPage);
	      System.out.println("리스트 : " + list);
	      
	      	int blackTotalPage=(int)Math.ceil((double)totalBlackMember/numPerPage);
			String pageBar="";
			int pageSizeBar=5;
			int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
			int pageEnd=pageNo+pageSizeBar-1;
			if(pageNo==1) {
				pageBar+="<span>[이전]</span>&nbsp;";
			}
			else {
				pageBar+="<a href="+request.getContextPath()+"/admin/blackList.do?cPage="+(pageNo-1)+">[이전]</a>&nbsp;";
			}
			while(!(pageNo>pageEnd||pageNo>totalBlackMember)) {
				if(pageNo==cPage) {
					pageBar+="<span class='admin-appro-cPage'>"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar+="<a href="+request.getContextPath()+"/admin/blackList.do?cPage="+pageNo+">"+pageNo+"</a>&nbsp;";
				}
				pageNo++;
			}
			if(pageNo>blackTotalPage) {
				pageBar+="<span>[다음]</span>";
			}
			else {
				pageBar+="<a href="+request.getContextPath()+
				"/admin/blackList.do?cPage="+(pageNo)+">[다음]</a>";
			}
	      
	            
	      //view페이지에 데이터 전송
	      request.setAttribute("pageBar", pageBar);
	      request.setAttribute("cPage", cPage);
	      request.setAttribute("members",list);
	      request.getRequestDispatcher("/views/admin/adminMemberBlackList.jsp").forward(request, response);
	  }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}