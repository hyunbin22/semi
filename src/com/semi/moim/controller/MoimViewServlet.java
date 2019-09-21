package com.semi.moim.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.vo.Moim;

/**
 * Servlet implementation class MoimViewServlet
 */
@WebServlet("/moim/moimView.do")
public class MoimViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoimViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int moimNum = Integer.parseInt(request.getParameter("moimNum"));
		
		String moimCookieVal = "";
		boolean hasRead = false;
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			out:
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				if("moimCookie".equals(name)) {
					moimCookieVal = value;
					if(value.contains("|" + moimNum + "|")) {
						hasRead = true;
						break out;
					}
				}
			}
		}
		if(!hasRead) {
			Cookie moimCookie = new Cookie("moimCookie", moimCookieVal + "|" + moimNum + "|");
			moimCookie.setMaxAge(-1);
			response.addCookie(moimCookie);
			
		}
		
		Moim moim = new MoimService().moimView(moimNum, hasRead);

		request.setAttribute("moim", moim);
		request.getRequestDispatcher("/views/moim/moimView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
