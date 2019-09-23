package com.semi.qna.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.semi.notice.model.vo.Notice;
import com.semi.qna.model.dao.QnaDao;
import com.semi.qna.model.vo.Qna;
import com.semi.qna.model.vo.QnaComment;
import com.semi.qna.model.vo.QnaUpload;

import common.template.JDBCTemplate;

public class QnaService {

	private QnaDao dao=new QnaDao();

	public int selectQnaCount() {
		Connection conn=getConnection();
		int result=dao.selectCountQna(conn);
		close(conn);
		return result;
	}
	public List<Qna> selectQnaList(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Qna> list=dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int enrollQna(String mId , String title , String content) {
		Connection conn=getConnection();
		int result=dao.enrollQna(conn, mId, title, content);
		if(result > 0) {
			commit(conn);
			result = dao.selectSeqQna(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int enrollQnaImg(String qnaOriName, String qnaReName, int result) {
		Connection conn=getConnection();
		int result2 = dao.enrollQnaImg(conn, qnaOriName, qnaReName, result);
		if(result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result2;
	}

	public Qna selectQna(int qNum) {
		Connection conn = getConnection();
		Qna q=dao.selectQna(conn, qNum);
		close(conn);
		return q;
	}


	/* 댓글 */
	//댓글 데이터저장
	public int insertComment(QnaComment qc) {
		Connection conn=getConnection();
		int result=dao.insertComment(conn, qc);
		if(result > 0) {
			commit(conn);
			result = dao.selectSeqQnaComment(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	//댓글 불러오기
	public QnaComment selectQnaComment(int qRef) {
		Connection conn = getConnection();
		QnaComment qc=dao.selectQnaComment(conn, qRef);
		close(conn);
		return qc;
	}
	//댓글 삭제하기
	public int deleteComment( int qcNo) {
		Connection conn=getConnection();
		int result=dao.deleteComment(conn, qcNo);
		if(result>0) {
			commit(conn);
		}else {rollback(conn);}
		close(conn);
		return result;
	}

	/* 파일불러오기 */
	public QnaUpload selectQnaUpload(int qNum) {
		Connection conn=getConnection();
		QnaUpload qu=dao.selectQnaUpload(conn, qNum);
		close(conn);
		return qu;
	}

	/* Qna글 수정 */
	public Qna QnaUpdate(int qNum) {
		Connection conn=getConnection();
		Qna q=dao.QnaUpdate(conn, qNum);
		close(conn);
		return q;
	}


	//서비스
	public int updateQna(String title , String content, int qNum) {
		Connection conn=getConnection();
		int result=dao.updateQna(conn, title, content, qNum);
		close(conn);
		return result;
	}
}

