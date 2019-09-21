package com.semi.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.bookmark.model.service.BookmarkService;
import com.semi.bookmark.model.vo.Bookmark;
import com.semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberLikeListServlet
 */
@WebServlet("/member/likeList.do")
public class MemberLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLikeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		int numPerPage=10;
		
		BookmarkService service = new BookmarkService();
		List<Bookmark> list = service.selectBookMarkList(cPage,numPerPage,mNum);
		int totalStudy = service.selectBookmarkListCount();
		
		//페이징처리 구현
				int totalPage=(int)Math.ceil((double)totalStudy/numPerPage);
				
				String pageBar="";
				int pageSizeBar=4;
				int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
				int pageEnd=pageNo+pageSizeBar-1;
				
				if(pageNo==1) {
					pageBar+="<span>[이전]</span>";
				}else {
					pageBar+="<a href='"+request.getContextPath()
					+"/member/likeList.do?cPage="+(pageNo-1)+"'>[이전]</a>";
				}
				
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(pageNo==cPage) {
						pageBar+="<span>"+pageNo+"</span>";
					}
					else {
						pageBar+="<a href='"+request.getContextPath()
						+"/member/likeList.do?cPage="+pageNo+"'>"+pageNo+"</a>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<span>[다음]</span>";
				}
				else {
					pageBar+="<a href='"+request.getContextPath()
					+"/member/likeList.do?cPage="+(pageNo)+"'>[다음]</a>";
				}
				
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("cPage", cPage);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/views/member/likeList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}