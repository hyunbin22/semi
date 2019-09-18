package com.semi.mento.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.member.model.vo.Member;
import com.semi.mento.model.dao.MentoDao;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;

import common.template.JDBCTemplate;

public class MentoService {
	
	private MentoDao dao = new MentoDao();

	public int registerMento(Mento mt, Member m) {
		Connection conn = getConnection();
		int result=dao.registerMento(conn, mt, m);
		if(result>0) {
			commit(conn);
			result=dao.selectSeqMento(conn, m.getmNum()); // m.getId

		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public Mento selectMento(int getmNum) {
		Connection conn= JDBCTemplate.getConnection();
		Mento mt = dao.selectNo(conn,getmNum);
		close(conn);
		return mt;
		
	}


//	public int registerMentoImage(MentoUpload mtu, int mtnum) {
//		Connection conn=getConnection();
//		int result=dao.registerMentoImage(conn, mtu, mtnum);
//		if(result>0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close(conn);
//		return result;
//	}

	public MentoUpload selectMentoUpload(int mtnum) {
		Connection conn= JDBCTemplate.getConnection();
		MentoUpload mu = dao.selectMentoUpload(conn,mtnum);
		close(conn);
		return mu;
	}

	public int updateMento(String nickname, String mthowconfirm, String mtacademic, String mtacademicdept, String mtgraduation, String bank, String accountNumber, int mtNum) {
		Connection conn = getConnection();
		int result=dao.updateMento(conn, nickname, mthowconfirm, mtacademic, mtacademicdept, mtgraduation, bank, accountNumber, mtNum);
		if(result>0) {
			commit(conn);

		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int nicknameDupliCheck(String nickname) {
		Connection conn = JDBCTemplate.getConnection();
		int check = dao.idDupliCheck(conn, nickname);
		
		return check;
	}



}
