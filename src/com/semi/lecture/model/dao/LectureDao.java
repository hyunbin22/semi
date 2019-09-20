package com.semi.lecture.model.dao;

import static common.template.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.lecture.model.vo.Lecture;
import com.semi.lecture.model.vo.LectureUpload;
import com.semi.mento.model.dao.MentoDao;
import com.semi.mento.model.vo.Mento;

public class LectureDao {

	private Properties prop=new Properties();

	public LectureDao() {
		String path=LectureDao.class.getResource("/sql/semi/lecture-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int countLectureApproval(Connection conn) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countLectureApproval");
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<Lecture> lectureApproList(Connection conn, int cPage, int numPerPage) {

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("lectureApproList");
		ResultSet rs = null;
		List<Lecture> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lecture lec = new Lecture();
				lec.setLecNum(rs.getInt("lecnum"));
				lec.setMtNum(rs.getInt("mtnum"));
				lec.setSubNum(rs.getInt("subnum"));
				lec.setLocalSubNum(rs.getInt("sublocalnum"));
				lec.setLecName(rs.getString("lecname"));
				lec.setLecType(rs.getString("lectype"));
				lec.setLecMaxCount(rs.getInt("lecmaxcount"));
				lec.setLecPrice(rs.getInt("lecprice"));
				lec.setLecTime(rs.getInt("lectime"));
				lec.setLecCount(rs.getInt("leccount"));
				lec.setLecWeek(rs.getString("lecweek"));
				lec.setLecMeet(rs.getString("lecmeet"));
				lec.setLecTot(rs.getString("lecTot"));
				lec.setLecTot2(rs.getString("lecTot2"));
				lec.setLecOpenDate(rs.getDate("lecOpenDate"));
				lec.setLecOpenDate2(rs.getDate("lecOpenDate2"));
				lec.setLecLocalContent(rs.getString("lecLocalContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecMentoContent(rs.getString("lecMentoContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecLectureContent(rs.getString("lecLectureContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecStudentCount(rs.getInt("lecStudentCount"));
				lec.setLecADate(rs.getDate("lecaDate"));
				lec.setLecCheck(rs.getString("lecCheck").charAt(0));
				if(rs.getString("lecReason")==null) {
					lec.setLecReason(rs.getString("lecReason"));
				} else {
					lec.setLecReason(rs.getString("lecReason").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				}
				lec.setLecStatus(rs.getString("lecstatus").charAt(0));

				List<LectureUpload> lecUp = new LectureUploadDao().lectureUpCover(conn,rs.getInt("lecnum"));
				Mento m = new MentoDao().mentoView(conn, rs.getInt("mtnum"));
				lec.setLectureUpList(lecUp);
				lec.setLecMento(m);
				list.add(lec);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	//관리자 강의신청목록 검색
	public List<Lecture> lectureApproList(Connection conn, String type, String data, int cPage, int numPerPage) {

		List<LectureUpload> setUpList = new ArrayList();

		Statement stmt = null;
		ResultSet rs = null;
		List<Lecture> list = new ArrayList();
		int start = (cPage-1)*numPerPage+1;
		int end = cPage*numPerPage;
		String sql = "select * from ("
				+ "select rownum as rnum, a.* from("
				+ "select lec.* "
				+ "from tb_lecture lec join tb_mento mt on (lec.mtnum=mt.mtnum) "
				+ "join tb_member m on (mt.mnum=m.mnum) where "
				+ "lec.leccheck='N' and m." + type+ " like '%" + data + "%' "
				+ "order by lec.lecadate)a) where rnum between "+ start + " and " + end;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Lecture lec = new Lecture();
				lec.setLecNum(rs.getInt("lecnum"));
				lec.setMtNum(rs.getInt("mtnum"));
				lec.setSubNum(rs.getInt("subnum"));
				lec.setLocalSubNum(rs.getInt("sublocalnum"));
				lec.setLecName(rs.getString("lecname"));
				lec.setLecType(rs.getString("lectype"));
				lec.setLecMaxCount(rs.getInt("lecmaxcount"));
				lec.setLecPrice(rs.getInt("lecprice"));
				lec.setLecTime(rs.getInt("lectime"));
				lec.setLecCount(rs.getInt("leccount"));
				lec.setLecWeek(rs.getString("lecweek"));
				lec.setLecMeet(rs.getString("lecmeet"));
				lec.setLecTot(rs.getString("lecTot"));
				lec.setLecTot2(rs.getString("lecTot2"));
				lec.setLecOpenDate(rs.getDate("lecOpenDate"));
				lec.setLecOpenDate2(rs.getDate("lecOpenDate2"));
				lec.setLecLocalContent(rs.getString("lecLocalContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecMentoContent(rs.getString("lecMentoContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecLectureContent(rs.getString("lecLectureContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecStudentCount(rs.getInt("lecStudentCount"));
				lec.setLecADate(rs.getDate("lecaDate"));
				lec.setLecCheck(rs.getString("lecCheck").charAt(0));
				if(rs.getString("lecReason")==null) {
					lec.setLecReason(rs.getString("lecReason"));
				} else {
					lec.setLecReason(rs.getString("lecReason").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				}
				lec.setLecStatus(rs.getString("lecstatus").charAt(0));
				List<LectureUpload> lecUp = new LectureUploadDao().lectureUpCover(conn,rs.getInt("lecnum"));
				Mento m = new MentoDao().mentoView(conn, rs.getInt("mtnum"));
				lec.setLectureUpList(lecUp);
				lec.setLecMento(m);
				list.add(lec);
			}

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list;
	}


	//강의 상세보기
	public Lecture lectureView(Connection conn, int lecNum) {

		List<LectureUpload> setUpList = new ArrayList();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("lectureView");
		Lecture lec = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				lec = new Lecture();
				lec.setLecNum(rs.getInt("lecnum"));
				lec.setMtNum(rs.getInt("mtnum"));
				lec.setSubNum(rs.getInt("subnum"));
				lec.setLocalSubNum(rs.getInt("sublocalnum"));
				lec.setLecName(rs.getString("lecname"));
				lec.setLecType(rs.getString("lectype"));
				lec.setLecMaxCount(rs.getInt("lecmaxcount"));
				lec.setLecPrice(rs.getInt("lecprice"));
				lec.setLecTime(rs.getInt("lectime"));
				lec.setLecCount(rs.getInt("leccount"));
				lec.setLecWeek(rs.getString("lecweek"));
				lec.setLecMeet(rs.getString("lecmeet"));
				lec.setLecTot(rs.getString("lecTot"));
				lec.setLecTot2(rs.getString("lecTot2"));
				lec.setLecOpenDate(rs.getDate("lecOpenDate"));
				lec.setLecOpenDate2(rs.getDate("lecOpenDate2"));
				lec.setLecLocalContent(rs.getString("lecLocalContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecMentoContent(rs.getString("lecMentoContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecLectureContent(rs.getString("lecLectureContent").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				lec.setLecStudentCount(rs.getInt("lecStudentCount"));
				lec.setLecADate(rs.getDate("lecaDate"));
				lec.setLecCheck(rs.getString("lecCheck").charAt(0));
				if(rs.getString("lecReason")==null) {
					lec.setLecReason(rs.getString("lecReason"));
				} else {
					lec.setLecReason(rs.getString("lecReason").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				}
				lec.setLecStatus(rs.getString("lecstatus").charAt(0));

				lec.setLectureUpList(new LectureUploadDao().lectureUpList(conn, rs.getInt("lecnum")));
				Mento m = new MentoDao().mentoView(conn, rs.getInt("mtnum"));
				lec.setLecMento(m);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return lec;

	}

	//강의 거절사유 등록
	public int updateRefusalLecture(Connection conn, int lecNum, String reason) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateRefusalLecture");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reason);
			pstmt.setInt(2, lecNum);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//강의 승인
	public int updateCheckLecture(Connection conn, int lecNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateCheckLecture");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//멘토 수업 신청
	public int insertLecture(Connection conn, Lecture l , int mtNum) {

		PreparedStatement pstmt=null;
		int result=0;
		String sql=prop.getProperty("insertLecture");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mtNum);
			pstmt.setInt(2, l.getSubNum());
			pstmt.setInt(3, l.getLocalSubNum());
			pstmt.setString(4, l.getLecName());
			pstmt.setString(5, l.getLecType());
			pstmt.setInt(6, l.getLecMaxCount());
			pstmt.setInt(7, l.getLecPrice());
			pstmt.setInt(8, l.getLecTime());
			pstmt.setInt(9, l.getLecCount());
			pstmt.setString(10, l.getLecWeek());
			pstmt.setString(11, l.getLecMeet());
			pstmt.setString(12, l.getLecTot());
			pstmt.setString(13, l.getLecTot2());
			pstmt.setDate(14, l.getLecOpenDate());
			pstmt.setDate(15, l.getLecOpenDate2());
			pstmt.setString(16, l.getLecLocalContent());
			pstmt.setString(17, l.getLecMentoContent());
			pstmt.setString(18, l.getLecLectureContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//멘토번호로 강의번호 조회
	public int selectSeqLecNum(Connection conn) {

		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select SEQ_LECTURE.currval from dual";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}


	// 강의 전체  갯수 totalLecture(승인된것)
	public int selectLectureCount(Connection conn) {
		Statement stmt=null;
		ResultSet rs = null;
		int result=0;
		String sql="select count(*) from tb_lecture where lecCheck='Y'";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	// 강의 리스트 
	public List<Lecture> selectLectureList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectLectureList");
		ResultSet rs = null;
		List<Lecture> lecturelist = new ArrayList();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs = pstmt.executeQuery();


			while(rs.next()) {
				Lecture lec=new Lecture();
				Mento mt = new Mento();

				lec.setLecNum(rs.getInt("lecnum"));
				lec.setLecName(rs.getString("lecname"));
				lec.setLecType(rs.getString("lectype"));
				lec.setLecPrice(rs.getInt("lecprice"));
				lec.setMtNum(rs.getInt("mtnum"));

				LectureUpload lecUp = new LectureUploadDao().lectureUpCover2(conn, rs.getInt("lecnum"));
				lec.setLectureUpload(lecUp);
				lecturelist.add(lec);

			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return lecturelist;
	}


	public Lecture selectLectureName(Connection conn, int int1) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Lecture l=null;
		String sql=prop.getProperty("selectLectureName");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, int1);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				l = new Lecture();
				l.setLecName(rs.getString("LECNAME"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return l;
	}



	public List<Lecture> lectureListByMtNum(Connection conn, int mtnum) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Lecture> list=new ArrayList();
		String sql="select * from tb_lecture where mtnum="+mtnum;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Lecture l=new Lecture();
				l.setLecName(rs.getString("lecName"));
				l.setLecNum(rs.getInt("lecNum"));
				list.add(l);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public Lecture lectureListByLecNum(Connection conn, int lecNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Lecture lt = null;
		String sql=prop.getProperty("lectureListByLecNum");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lecNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lt = new Lecture();
				lt.setMtNum(rs.getInt("mtNum"));
				lt.setLecNum(rs.getInt("lecNum"));
				lt.setSubNum(rs.getInt("subNum"));
				lt.setLocalSubNum(rs.getInt("sublocalNum"));
				lt.setLecName(rs.getString("lecName"));
				lt.setLecType(rs.getString("lecType"));
				lt.setLecMaxCount(rs.getInt("lecMaxCount"));
				lt.setLecPrice(rs.getInt("lecPrice"));
				lt.setLecTime(rs.getInt("lecTime"));
				lt.setLecCount(rs.getInt("lecCount"));
				lt.setLecWeek(rs.getString("lecWeek"));
				lt.setLecMeet(rs.getString("lecMeet"));
				lt.setLecTot(rs.getString("lecTot"));
				lt.setLecTot2(rs.getString("lecTot2"));
				lt.setLecOpenDate(rs.getDate("lecOpenDate"));
				lt.setLecOpenDate2(rs.getDate("lecOpenDate2"));
				lt.setLecLocalContent(rs.getString("lecLocalContent"));
				lt.setLecMentoContent(rs.getString("lecMentoContent"));
				lt.setLecLectureContent(rs.getString("lecLectureContent"));
				lt.setLectureUpList(new LectureUploadDao().lectureUpList(conn, lecNum));
				lt.setLectureUpload(new LectureUploadDao().lectureUpCover2(conn, lecNum));
				System.out.println(new LectureUploadDao().lectureUpList(conn, lecNum));
				
			}	

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return lt;
	}

	public int updateLecture(Connection conn, Lecture l, int lecNum) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateLecture");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, l.getSubNum());
			pstmt.setInt(2, l.getLocalSubNum());
			pstmt.setString(3, l.getLecName());
			pstmt.setString(4, l.getLecType());
			pstmt.setInt(5, l.getLecMaxCount());
			pstmt.setInt(6, l.getLecPrice());
			pstmt.setInt(7, l.getLecTime());
			pstmt.setInt(8, l.getLecCount());
			pstmt.setString(9, l.getLecWeek());
			pstmt.setString(10, l.getLecMeet());
			pstmt.setString(11, l.getLecTot());
			pstmt.setString(12, l.getLecTot2());
			pstmt.setDate(13, l.getLecOpenDate());
			pstmt.setDate(14, l.getLecOpenDate2());
			pstmt.setString(15, l.getLecLocalContent());
			pstmt.setString(16, l.getLecMentoContent());
			pstmt.setString(17, l.getLecLectureContent());
			pstmt.setInt(18, lecNum);
			result=pstmt.executeUpdate();

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	//결제 완료시 강의 누적 수강인원 증가
	public int updateStudentCount(Connection conn, int oNum) {
		PreparedStatement pstmt = null;
		String sql = "update tb_lecture set lecstudentcount=lecstudentcount+1 where lecnum=(select lecnum from tb_order where onum=?)";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNum);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	public List<Lecture> lectureAllListByLecNum(Connection conn, int lecNum) {
		Statement stmt=null;
		ResultSet rs=null;
		List<Lecture> list=new ArrayList();
		String sql="select * from tb_lecture where lecNum="+lecNum;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Lecture l=new Lecture();
				l.setLecWeek(rs.getString("lecWeek"));
				list.add(l);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}

	public List<LectureUpload> selectLectureUpload(Connection conn, int lecNum) {
		Statement stmt=null;
		ResultSet rs=null;
		List<LectureUpload> list=new ArrayList();
		String sql="select * from tb_upload_lecture where lecNum="+lecNum;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				LectureUpload lu=new LectureUpload();
				lu.setUpLectureCategory(rs.getString("up_lecture_category"));
				lu.setUpLectureOrgName(rs.getString("up_lecture_org_name"));
				lu.setUpLectureReName(rs.getString("up_lecture_re_name"));
				list.add(lu);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
}
