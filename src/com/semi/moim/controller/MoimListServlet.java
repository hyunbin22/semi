package com.semi.moim.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.vo.Moim;

/**
 * Servlet implementation class MoimListServlet
 */
@WebServlet("/moim/moimList.do")
public class MoimListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MoimListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage=10;
		
		int count = new MoimService().countMoimList();
		List<Moim> list = new MoimService().moimList(cPage, numPerPage);
		
		int totalPage=(int)Math.ceil((double)count/numPerPage);
		String pageBar="";
		int pageSizeBar=5;
		int pageNo=((cPage-1)/pageSizeBar)*pageSizeBar+1;
		int pageEnd=pageNo+pageSizeBar-1;
		
		pageBar += "<nav aria-label=\"...\" class=\"moimNav\">" + 
				"  <ul class=\"pagination\">" + 
				"  <li class=\"page-item disabled\">";
		if(pageNo==1) {
			pageBar+="<a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-disabled=\"true\">Previous</a></li>";
		}
		else {
			pageBar+="<a class=\"page-link\" href="+request.getContextPath()+"/moim/moimList.do?cPage="+(pageNo-1)+" tabindex=\"-1\" aria-disabled=\"true\">Previous</a></li>";
		}
		pageBar += "<li class=\"page-item active\" aria-current=\"page\">";
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<a class=\"page-link\" href=\"#\">"+pageNo+" <span class=\"sr-only\">(current)</span></a></li>";
			}
			else {
				pageBar+="<a href="+request.getContextPath()+"/moim/moimList.do?cPage="+pageNo+" class=\"page-link\">"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		pageBar += "<li class=\"page-item\">";
		if(pageNo>totalPage) {
			pageBar+="<a class=\"page-link\" href=\"#\">Next</a></li>";
		}
		else {
			pageBar+="<a href="+request.getContextPath()+
			"/moim/moimList.do?cPage="+(pageNo)+">Next</a></li>";
		}
		pageBar += "</ul></nav>";
		//view페이지에 데이터 전송
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list",list);
		request.getRequestDispatcher("/views/moim/moimList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
