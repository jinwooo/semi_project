package com.board.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.paging.Paging;


public class BoardDao extends SqlMapConfig {
	
	private String namespace="com.board.mapper.";
	
	// board 모든 값 출력
	public List<BoardDto> selectAll(){
		
		SqlSession session= null;
		List<BoardDto> list=null;
		
		session=getSqlSessionFactory().openSession(true);
		list=session.selectList(namespace+"selectList");
		session.close();
		
		return list;
	}
	
	public int countAll() {
		/*
		Connection con=getConnection();
		PreparedStatement pstm=null;
		int res=0;
		
		String sql="SELECT COUNT(*) FROM BOARD";	
		try {
			pstm=con.prepareStatement(sql);
			System.out.println("03.query 준비 :" +sql);
			
			res=pstm.executeUpdate();
			System.out.println(res);
			System.out.println("04. query 실행");
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
		}
		return res;
		*/
		SqlSession session= null;
		session=getSqlSessionFactory().openSession(true);
		
		int total=session.selectOne(namespace+"getCount");
		System.out.println(total);
		session.close();
		
		return total;
	}
	
	public List<BoardDto> getPaging(Paging paging){
			
		int startPage=(paging.getCurPageNum()-1)*paging.getPagecount()+1;
		int endPage=startPage+paging.getPagecount();
		System.out.println("start :" +startPage + "end : " + endPage);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		//int startPage=((page - 1) / pagesize) * pagesize + 1;
		//int endPage= startPage+pagesize-1;
		//int startPage  
		
		map.put("startPageNo",startPage);
		map.put("endPageNo", endPage);
		
		System.out.println(map);
		
		SqlSession session=null;
		session=getSqlSessionFactory().openSession(true);
		List<BoardDto> pagelist=null;
		
		pagelist=session.selectList(namespace+"getPaging",map);
		System.out.println("getPage");
		session.close();
			
		return pagelist;
	}
	
	public BoardDto selectOne(int boardno) {
		
		SqlSession session= null;
		session=getSqlSessionFactory().openSession(true);
		
		BoardDto dto =session.selectOne(namespace+"selectOne", boardno);
		session.close();
		
		return dto;
		
	}
	
	public List<BoardDto> idList(String id){
		
		SqlSession session= null;
		List<BoardDto> list=null;
		
		session=getSqlSessionFactory().openSession(true);
		list=session.selectList(namespace+"idList",id);
		session.close();
		
		return list;
	}
	
}

































