package com.semi.member.model.service;

import java.sql.Connection;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;

import common.template.JDBCTemplate;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;
import static common.template.JDBCTemplate.close;

public class MemberService {

	MemberDao dao = new MemberDao();

	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.register(conn, m);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);

		return result;
	}

	public int idDupliCheck(String userId) {
		Connection conn = getConnection();
		int check = dao.idDupliCheck(conn, userId);

		return check;
	}

	public int emailDupliCheck(String email) {
		Connection conn = getConnection();
		int check = dao.emailDupliCheck(conn, email);

		return check;
	}

	public Member selectMember(String mId) {
		Connection conn= JDBCTemplate.getConnection();
		Member m=dao.selectMember(conn,mId);
		close(conn);
		return m;      
	}
}
