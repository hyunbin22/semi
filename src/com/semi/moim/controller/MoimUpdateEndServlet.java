package com.semi.moim.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.semi.member.model.vo.Member;
import com.semi.moim.model.service.MoimService;
import com.semi.moim.model.service.MoimUploadService;
import com.semi.moim.model.vo.Moim;
import com.semi.moim.model.vo.MoimUpload;

import common.oreilly.servlet.multipart.AblingFileRenamePolicy;

/**
 * Servlet implementation class MoimUpdateServlet
 */
@WebServlet("/moim/moimUpdateEnd.do")
public class MoimUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MoimUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "수정 실패 ![form:ectype] 관리자에게 문의하세요!");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
			return;
		}
		String root=getServletContext().getRealPath("/");

		String saveDir=root+"/upload/moim";
		
		int maxSize=1024*1024*1024;
		
		HttpSession session = request.getSession();
		Member memberLogin = (Member) session.getAttribute("loginMember");
		MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new AblingFileRenamePolicy(memberLogin.getmId()));
		
		int moimNum = Integer.parseInt(mr.getParameter("moimNum"));
		String title = mr.getParameter("title");
		String text = mr.getParameter("text");
		String keyword = mr.getParameter("keyword");
		
		Moim orgMoim = new MoimService().moimView(moimNum);	//원래게시글
		
		int result = new MoimService().updateMoim(moimNum,title,text,keyword);
		int result2=0;

		//원래있던 파일
		String[] orgListName = mr.getParameterValues("orgListName")!=null ? mr.getParameterValues("orgListName"):null;
		String[] reListName =mr.getParameterValues("reListName")!=null ? mr.getParameterValues("reListName"):null;
		int count = 0;
		int deleteResult = 0;
		
		//원래있던 파일을 삭제했을떄
		if(orgListName==null) {	//원래있던파일 전부다 삭제했을때
			for(int i = 0; i < orgMoim.getMoimUpload().size(); i++) {
				deleteResult = new MoimUploadService().allDeleteUpload(orgMoim.getMoimUpload().get(i).getMoimNum());
			}
		} else {
			for(int i = 0; i < orgMoim.getMoimUpload().size(); i++) {	//db에 저장되어있는 업로드 리스트
				count = 0;
				for(int j = 0; j < orgListName.length; j++) {	//폼에서 넘어온 첨부파일 리스트(기존)
					if(orgMoim.getMoimUpload().get(i).getUpMoimOrgName().equals(orgListName[j]) && 
							orgMoim.getMoimUpload().get(i).getUpMoimReName().equals(reListName[j])) {	//같은 이름이 있다면
						count++;	//count 증가
					}
				}
				if(count==0) {	//같은 이름이 없을때 삭제로직
					deleteResult = new MoimUploadService().deleteUpload(orgMoim.getMoimUpload().get(i).getUpMoimNum());
				}
			}
		}
		
		
		
		Enumeration fileNames = null;
		//reportDB에 저장
		if(result>0) {
			fileNames = mr.getFileNames();
			if(fileNames!=null) {
				while(fileNames.hasMoreElements()) {
					String param = (String)fileNames.nextElement();
					String orgFile = mr.getOriginalFileName(param);
					String reFile = mr.getFilesystemName(param);
					if(orgFile == null) continue;
					MoimUpload mu = new MoimUpload(orgFile, reFile);
					result2 = new MoimUploadService().moimFileInsert(mu, result);
					
				}
			} else result2 = 1; 	//작성자가 파일업로드를 1개도 안한경우
		}
		
		//수정완료된 게시물
		Moim moim = new MoimService().moimView(moimNum, false);

		
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="게시물 수정이 완료되었습니다.";
			loc="/moim/moimView.do?moimNum="+moimNum;
		}
		else{
			msg="게시물 수정이 실패하였습니다. 관리자에게 문의해주세요.";
			loc="/moim/moimView.do?moimNum="+moimNum;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.setAttribute("moim", moim);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
