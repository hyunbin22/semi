package com.semi.report.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.member.model.vo.Member;
import com.semi.mento.model.vo.Mento;
import com.semi.report.model.dao.ReportDao;
import com.semi.report.model.vo.Report;
import com.semi.report.model.vo.ReportUpload;

public class ReportService {

	private ReportDao dao = new ReportDao();
	
	//신고신청
	public int regsterReport(Report rp, Member m) {
		
		Connection conn = getConnection();
		int result = dao.registerReport(conn, rp, m);
		if(result > 0)
		{
			commit(conn);
			result = dao.selectSeqReport(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}

	//신고 이미지 등록
	public int regsterReportImage(ReportUpload ru, int reportNum) {
		Connection conn = getConnection();
		int result = dao.registerReportImage(conn, ru , reportNum);
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Report> selectAllReport(int cPage,int numPerPage) {
		Connection conn=getConnection();
		List<Report> list=dao.selectReportList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectReportCount() {
		Connection conn=getConnection();
		int result=dao.selectReportCount(conn);
		close(conn);
		return result;
	}
	
	public int selectReportCount2() {
		Connection conn=getConnection();
		int result=dao.selectReportCount2(conn);
		close(conn);
		return result;
	}
	
	public int selectReportCount3() {
		Connection conn=getConnection();
		int result=dao.selectReportCount3(conn);
		close(conn);
		return result;
	}

	public List<Report> selectAllReportComplete(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Report> list=dao.selectReportCompleteList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public Report selectReportContent(int reportNo) {
		Connection conn=getConnection();
		Report rp = dao.selectReportContent(conn,reportNo);
		close(conn);
		return rp;
		
	}

	public ReportUpload selectReportUpload(int reportNo) {
		Connection conn=getConnection();
		ReportUpload rpu = dao.selectReportUpload(conn,reportNo);
		close(conn);
		return rpu;
	}

	public Report selectReportContent2(int reportNo) {
		Connection conn=getConnection();
		Report rp = dao.selectReportContent2(conn,reportNo);
		close(conn);
		return rp;
	}

	public List<Report> reportHistoyry(int cPage, int numPerPage, int mNum) {
		Connection conn=getConnection();
		List<Report> list=dao.reportHistory(conn, cPage, numPerPage, mNum);
		close(conn);
		return list;
	}

	public int regsterReport2(int attackNum,String rReply) {
		Connection conn = getConnection();
		int result = dao.registerReport2(conn, attackNum,rReply);
		close(conn);
		return result;
	}

	public Report seeReport(String title) {
		Connection conn = getConnection();
		Report rp = dao.seeReport(conn, title);
		close(conn);
		return rp;
	}
	
	
	//멤버 신고처리 여부 확인(report를 Y로 바꾸는것)
	public int memberBlack(int mAttackerNum) {
		Connection conn=getConnection();
		int result = dao.memberBlack(conn,mAttackerNum);
		close(conn);
		return result;
	}

	public int countReportApproval(String type, String data) {
		Connection conn = getConnection();
		int result = dao.countReportApproval(conn, type, data);
		close(conn);
		return result;
	}

	public List<Report> reportFindList(String data, int cPage, int numPerPage){
	    Connection conn = getConnection();
		List<Report> list = dao.reportFindList(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public List<Report> reportFindListCom(String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Report> list = dao.reportFindListCom(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int modifyReason(int reportNo, String reportReason) {
		Connection conn=getConnection();
		int result = dao.modifyReason(conn, reportNo, reportReason);
		close(conn);
		return result;
	}
	



}
