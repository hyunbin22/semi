package com.semi.moim.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MoimFileDownloadServlet
 */
@WebServlet("/moim/filedown.do")
public class MoimFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MoimFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String saveDir = getServletContext().getRealPath(File.separator + "upload" + File.separator + "moim");
		String orgFile = request.getParameter("oriFileName");
		String reFile = request.getParameter("reFileName");
		
		File downFile = new File(saveDir + "/" + reFile);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String encFileName="";
		boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE")!=-1
				|| request.getHeader("user-agent").indexOf("Trident")!=-1;
		if(isMSIE) {
			encFileName = URLEncoder.encode(orgFile, "UTF-8").replaceAll("\\+", "%20");
		} else {
			encFileName = new String(orgFile.getBytes("UTF-8"), "ISO-8859-1");
			
		}
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+encFileName);
		
		int read = -1;
		while((read=bis.read())!=-1) {
			bos.write(read);
		}
		bos.close();
		bis.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
