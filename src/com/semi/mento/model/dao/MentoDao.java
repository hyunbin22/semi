package com.semi.mento.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.mento.model.vo.Mento;
import com.semi.mento.model.vo.MentoUpload;


public class MentoDao {
	
	private Properties prop = new Properties();
	
	public MentoDao() {
		String path=MentoDao.class.getResource("/sql/semi/mento-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int registerMento(Connection conn, Mento mt, Member m) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("registerMento");
		try {
			pstmt=conn.prepareStatement(sql);
			System.out.println("m.getmNum() : "+m.getmNum());
			pstmt.setInt(1, m.getmNum());
			pstmt.setString(2, mt.getMtNickName());
			pstmt.setString(3, mt.getMtHowConfirm());
			pstmt.setString(4, mt.getMtAcademic());
			pstmt.setString(5, mt.getMtAcademicDept());
			pstmt.setString(6, mt.getMtGraduation());
			pstmt.setString(7, mt.getBank());
			pstmt.setString(8, mt.getAccountNumber());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectSeqMento(Connection conn, int mNum) {
		Statement stmt = null;
		ResultSet rs = null;
		int result=0;
		String sql="select mtnum from tb_mento join tb_member using(mNum) where mnum="+mNum; // id를 받아서 멘토테이블 조회한 다음에 번호 조회? select mtnum from tb_mento where mid=?
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public Mento selectNo(Connection conn, int getmNum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectNum");
		Mento mt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getmNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				mt = new Mento();
				mt.setMtNum(rs.getInt("mtnum"));
				mt.setmNum(rs.getInt("mnum"));
				mt.setMtHireDate(rs.getDate("mthiredate"));
				mt.setMtNickName(rs.getString("mtnickname"));
				mt.setMtCheck(rs.getString("mtcheck").charAt(0));
				mt.setMtAcademic(rs.getString("mtacademic"));
				mt.setMtAcademicDept(rs.getString("MTACADEMICDEPT"));
				mt.setMtaDate(rs.getDate("mtadate"));
				mt.setMtGraduation(rs.getString("MTGRADUATION"));
				mt.setBank(rs.getString("MTBANK"));
				mt.setAccountNumber(rs.getString("MTACCOUNTNUMBER"));
				mt.setMtHowConfirm(rs.getString("MTHOWCONFIRM"));
				mt.setMtReason(rs.getString("MTREASON"));
				Member m = new MemberService().selectMember(rs.getInt("mnum"));
				mt.setMember(m);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mt;
	}

	/*
	 * public int registerMentoImage(Connection conn, MentoUpload mtu, int mtnum) {
	 * PreparedStatement pstmt=null;
	 * System.out.println("mtnum : "+mtnum);
	 * int result=0; String sql=prop.getProperty("registerMentoImage");
	 *  try {
	 * pstmt=conn.prepareStatement(sql);
	 * pstmt.setInt(1, mtnum);
	 * pstmt.setString(2, mtu.getUpMentoOrgProfile());
	 * pstmt.setString(3, mtu.getUpMentoReProfile());
	 * pstmt.setString(4, mtu.getUpMentoOrgConfirm());
	 * pstmt.setString(5, mtu.getUpMentoReConfirm());
	 * pstmt.setString(6, mtu.getUpMentoNameLicense());
	 * pstmt.setString(7, mtu.getUpMentoOrgLicense());
	 * pstmt.setString(8, mtu.getUpMentoReLicense());
	 * result=pstmt.executeUpdate();
	 * }catch(SQLException e) {
	 *  e.printStackTrace();
	 *   }finally {
	 *    close(pstmt);
	 *     } return result;
	 *      }
	 */

	public MentoUpload selectMentoUpload(Connection conn, int mtnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("selectMentoUpload");
		MentoUpload mu = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				mu = new MentoUpload();
				mu.setUpMentoNameLicense(rs.getString("up_mento_name_license"));
				
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return mu;
	}

	public int updateMento(Connection conn, String nickname, String mthowconfirm, String mtacademic, String mtacademicdept, String mtgraduation, String bank, String accountNumber, int mtNum) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateMento");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, mthowconfirm);
			pstmt.setString(3, mtacademic);
			pstmt.setString(4, mtacademicdept);
			pstmt.setString(5, mtgraduation);
			pstmt.setString(6, bank);
			pstmt.setString(7, accountNumber);
			pstmt.setInt(8, mtNum);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int idDupliCheck(Connection conn, String nickname) {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from tb_mento where mtnickname='"+nickname+"'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return 0;	//중복된 아이디
			} else {
				return 1;	//가입가능한 아이디
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return -1;	//db오류
	}
	
}



