package com.semi.notice.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.notice.model.vo.Notice;
import com.semi.notice.model.vo.NoticeUpload;
import com.semi.qna.model.vo.QnaUpload;
import com.semi.notice.model.dao.NoticeDao;

public class NoticeService {
	private NoticeDao dao=new NoticeDao();

	public List<Notice> selectNoticeList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Notice> list=dao.selectNoticeList(conn,cPage,numPerPage);
		close(conn);
		return list;
	}
	public int selectNoticeCount() {
		Connection conn=getConnection();
		int result=dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	
	public int enrollNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.enrollNotice(conn, n);
		if(result > 0) {
			commit(conn);
			result = dao.selectSeqNotice(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int enrollNoticeImg(NoticeUpload nu, int seqNo) {
		Connection conn=getConnection();
		int result = dao.enrollNoticeImg(conn, nu, seqNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Notice selectNotice(String nNum) {
		Connection conn = getConnection();
		Notice n=dao.selectNotice(conn, nNum);
		close(conn);
		return n;
	}
	
	/* 첨부ㅏ파일 불러오기*/
	public NoticeUpload selectNoticeUpload(String nNum) {
		Connection conn=getConnection();
		NoticeUpload nu=dao.selectQnaUpload(conn, nNum);
		close(conn);
		return nu;
	}
}
