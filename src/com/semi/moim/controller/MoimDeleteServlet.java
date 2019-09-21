package com.semi.moim.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.service.MoimUploadService;

/**
 * Servlet implementation class MoimDeleteServlet
 */
@WebServlet("/moim/moimDelete.do")
public class MoimDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MoimDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int moimNum = Integer.parseInt(request.getParameter("moimNum"));
		int result = new MoimService().deleteMoim(moimNum);
		
		String msg = "";
		String loc = "/moim/moimList.do";

		if(result > 0) {
			msg = "게시물 삭제가 완료되었습니다.";
		} else {
			msg = "게시물 삭제가 실패하였습니다. 관리자에게 문의하세요.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
