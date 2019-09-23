package com.semi.order.model.service;

import static common.template.JDBCTemplate.close;
import static common.template.JDBCTemplate.commit;
import static common.template.JDBCTemplate.getConnection;
import static common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.semi.lecture.model.vo.Lecture;
import com.semi.order.model.dao.OrderDao;
import com.semi.order.model.vo.Order;

import common.template.JDBCTemplate;

public class OrderService {

	private OrderDao dao = new OrderDao();

	//수업신청
	public int insertOrder(Order order, String mId) {
		Connection conn = getConnection();

		int result = dao.insertOrder(conn, mId, order);
		int result2=0;

		if(result>0) {
			commit(conn);
			result2 = dao.getOnum(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result2;
	}

	//신청내역 가져오기
	public Order selectOrder(int oNum) {
		Connection conn = getConnection();
		Order order = null;
		order = dao.selectOrder(conn, oNum);
		close(conn);
		return order;
		
	}

	//결제 Y로 바꾸기
	public int updatePayment(int oNum) {
		Connection conn = getConnection();
		int result = dao.updatePayment(conn, oNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int selectStudyListCount() {
		Connection conn = getConnection();
		int result = dao.selectStudyListCount(conn);
		close(conn);
		return result;
	}

	public List<Order> selectOrderList(int cPage, int numPerPage, int mNum) {
		Connection conn = getConnection();
		List<Order> list = dao.selectStudyList(conn,cPage,numPerPage, mNum);
		close(conn);
		return list;
	}

	public Order seeMoreStudy(int lecNum) {
		Connection conn = getConnection();
		Order o = dao.seeMoreStudyList(conn, lecNum);
		close(conn);
		return o;
	}

	//결제취소
	public int orderPayReset(int oNum) {
		Connection conn = getConnection();
		int result = dao.orderPayReset(conn, oNum);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	//lecnum가 일치하는 order 불러오기
	public List<Order> orderListByLecNum(int lecnum,int cPage, int numPerPage) {
		Connection conn = getConnection();
		List<Order> list = dao.orderListByLecnum(conn, lecnum, cPage, numPerPage);
		close(conn);
		return list;
	}

	public int checkY(int oNum) {
		Connection conn=getConnection();
		int result=dao.orderCheckY(conn,oNum);
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

	public int checkN(int oNum) {
		Connection conn=getConnection();
		int result=dao.orderCheckN(conn,oNum);
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

	//lecNum이 일치하는 오더 가져오기. (페이징 제외)
	public List<Order> selectLectureOrder(int lecNum) {
		Connection conn = getConnection();
		List<Order> list = dao.selectLectureOrder(conn, lecNum);
		close(conn);
		return list;
	}
	
	//lecNum이랑 mNum이 일치
	public Order selectLoginMemOrder(int mNum, int lectureNo) {
		Connection conn = getConnection();
		Order o = dao.selectLoginMemOrder(conn, mNum, lectureNo);
		close(conn);
		return o;
	}

}
