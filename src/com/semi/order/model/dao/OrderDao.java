package com.semi.order.model.dao;

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

import com.semi.lecture.model.dao.LectureDao;
import com.semi.lecture.model.service.LectureService;
import com.semi.lecture.model.vo.Lecture;
import com.semi.member.model.service.MemberService;
import com.semi.order.model.vo.Order;

public class OrderDao {
	
	private Properties prop = new Properties();
	public OrderDao() {
		String path = OrderDao.class.getResource("/sql/semi/order-query.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 수업신청
	public int insertOrder(Connection conn, String mId, Order order) {
		PreparedStatement pstmt = null;
		String sql = "insert into tb_order values(seq_order.nextval,(select mnum from tb_member where mid=?),?,?,?,?,default,default,default, null)";
		int result=0;
		ResultSet rs =null;
		System.out.println("dao의 order : "+order);
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setInt(2, order.getLecNum());
			pstmt.setString(3, order.getoTot());
			pstmt.setString(4, order.getoText());
			pstmt.setInt(5, order.getoPrice());
			
			result=pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("dao의 result : "+result);
		
		return result;
	}
	
	


	//신청 등록 후 신청내용 검색(return oNum)
	public Order selectOrder(Connection conn, int oNum) {

		PreparedStatement pstmt = null;
		String sql = "select * from tb_order where onum=?";
		Order order = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				order = new Order();
				order.setoNum(rs.getInt("oNum"));
				order.setmNum(rs.getInt("mnum"));
				order.setLecNum(rs.getInt("lecNum"));
				order.setoTot(rs.getString("otot"));
				order.setoText(rs.getString("otext").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				order.setoPrice(rs.getInt("oprice"));
				order.setoPayment(rs.getString("opayment").charAt(0));
				order.setoCheck(rs.getString("ocheck").charAt(0));
				order.setOrderDate(rs.getDate("orderDate"));
				order.setPayDate(rs.getDate("paydate"));
				
				order.setLecture(new LectureService().lectureView(rs.getInt("lecNum")));
				order.setMember(new MemberService().selectMember(rs.getInt("mnum")));
				
				System.out.println("Dao의 order :"+order);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return order;
	}

	public int updatePayment(Connection conn, int oNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update tb_order set opayment='Y',paydate=default where onum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oNum);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectStudyListCount(Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("countStudyList");
		try {
			pstmt=conn.prepareStatement(sql);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return result;
	}

	public List<Order> selectStudyList(Connection conn, int cPage, int numPerPage, int mNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOrderList");
		List<Order> list=new ArrayList();
		Lecture l = new Lecture();
		LectureDao dao = new LectureDao();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,mNum);
			pstmt.setInt(2,(cPage-1)*numPerPage+1);
			pstmt.setInt(3,cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Order o = new Order();
				o.setoNum(rs.getInt("onum"));
				o.setmNum(rs.getInt("mnum"));
				o.setLecNum(rs.getInt("lecnum"));
				o.setLecture(dao.selectLectureName(conn, rs.getInt("lecnum")));
				o.setoText(rs.getString("otext").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				o.setoTot(rs.getString("otot"));
				o.setoPrice(rs.getInt("oprice"));
				o.setoPayment(rs.getString("opayment").charAt(0));
				o.setoCheck(rs.getString("ocheck").charAt(0));
				o.setOrderDate(rs.getDate("orderDate"));
				list.add(o);  
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public Order seeMoreStudyList(Connection conn, int lecNum) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("selectOrder");
		Order o = null;
		Lecture l = new Lecture();
		LectureDao dao = new LectureDao();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,lecNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Order();
				o.setoNum(rs.getInt("onum"));
				o.setmNum(rs.getInt("mnum"));
				o.setLecNum(rs.getInt("lecnum"));
				o.setLecture(dao.selectLectureName(conn, rs.getInt("lecnum")));
				o.setoText(rs.getString("otext").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>"));
				o.setoTot(rs.getString("otot"));
				o.setoPrice(rs.getInt("oprice"));
				o.setoPayment(rs.getString("opayment").charAt(0));
				o.setoCheck(rs.getString("ocheck").charAt(0));  
				o.setOrderDate(rs.getDate("orderDate"));
				o.setPayDate(rs.getDate("payDate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return o;
	}

	// oNum 검색
	public int getOnum(Connection conn) {
		Statement stmt = null;
		int result=0;
		ResultSet rs = null;
		String sql="select seq_order.currval from dual";
		try {
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
		}
		
		return result;
	}


}
