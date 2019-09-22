package com.semi.member.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.order.model.vo.Order;

import static common.template.JDBCTemplate.getConnection;

public class MemberService {

	MemberDao dao = new MemberDao();

	//회원가입
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.register(conn, m);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);

		return result;
	}

	//회원가입 중복체크
	public int idDupliCheck(String userId) {
		Connection conn = getConnection();
		int check = dao.idDupliCheck(conn, userId);
		close(conn);
		return check;
	}

	//로그인
	public Member selectId(String mId, String mPw) {
		Connection conn= getConnection();
		Member m=dao.selectId(conn,mId,mPw);
		close(conn);
		return m;
	}

	//이메일 중복체크
	public int emailDupliCheck(String email) {
		Connection conn = getConnection();
		int check = dao.emailDupliCheck(conn, email);
		close(conn);
		return check;
	}

	//멤버번호로 조회
	public Member selectMember(int mNum) {
		Connection conn=getConnection();
		Member m = dao.selectMemberMnum(conn,mNum);
		close(conn);
		return m;
	}


	//마이페이지
	public Member selectMember(String mId) {
		Connection conn= getConnection();
		Member m=dao.selectMember(conn,mId);
		close(conn);
		return m;		
	}

	//회원탈퇴
	public int deleteMember(String mId) {
		Connection conn=getConnection();
		int result=dao.deleteMember(conn,mId);
		if(result>0) 
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

	//회원 수정
	public int updateMember(String mPw , String mEmail, String mPhone, String mId) {
		Connection conn= getConnection();
		int result=dao.updateMember(conn,mPw,mEmail,mPhone, mId);
		if(result>0) 
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

	//admin_member_list
	public int selectCountMember() {
		Connection conn=getConnection();
		int count=dao.selectCountMember(conn);
		close(conn);
		return count;
	}
	public List<Member> selectListPage(int cPage,int numPerPage){
		Connection conn=getConnection();
		List<Member> list=dao.selectListPage(conn,cPage,numPerPage);
		close(conn);
		return list;

	}

	//비밀번호 찾기
	public Member findMemberPwd(String mId, String email) {
		Connection conn = getConnection();
		Member m = dao.findMemberPwd(conn , mId , email);
		close(conn);
		return m;
	}

	//비밀번호 변경
	public int updatePassword(String mId , String pwd) {
		Connection conn = getConnection();
		int result = dao.updatePwd(conn, mId ,pwd);
		if(result>0)
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

	//아이디 찾기
	public Member findMemberId(String name, String date, String phone) {
		Connection conn = getConnection();
		Member m = dao.findMemberId(conn, name, date, phone);
		close(conn);
		return m;
	}


	//멤버 사용 정지시키기
	public int memberUse(int mAttackerNum) {
		Connection conn=getConnection();
		int result = dao.memberUse(conn,mAttackerNum);
		close(conn);
		return result;
	}

	public List<Member> selectBlackListPage(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Member> list=dao.selectBlackListPage(conn,cPage,numPerPage);
		close(conn);
		return list;
	}

	public int selectCountBlackMember() {
		Connection conn=getConnection();
		int result=dao.selectCountMember2(conn);
		close(conn);
		return result;
	}

	public int memberUse(String mId) {
		Connection conn=getConnection();
		int result = dao.memberUse(conn,mId);
		close(conn);
		return result;
	}

	public int rebirthMember(String mId) {
		Connection conn=getConnection();
		int result = dao.memberRebirth(conn,mId);
		close(conn);
		return result;
	}

	public int countMemberApproval(String type, String data) {
		Connection conn = getConnection();
		int result = dao.countMemberApproval(conn, type, data);
		close(conn);
		return result;
	}

	public List<Member> memberFindList(String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = dao.memberFindList(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int countMemberBalckApproval(String type, String data) {
		Connection conn = getConnection();
		int result = dao.countMemberBlackApproval(conn, type, data);
		close(conn);
		return result;
	}

	public List<Member> memberFindBlackList(String data, int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Member> list = dao.memberFindBlackList(conn, data, cPage, numPerPage);
		close(conn);
		return list;
	}


}