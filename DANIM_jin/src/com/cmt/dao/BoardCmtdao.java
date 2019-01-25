package com.cmt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cmt.dto.BoardCmtDto;

public class BoardCmtdao extends SqlMapConfig {
	
	private String namespace = "com.cmt.mapper.";
	
	public List<BoardCmtDto> selectCmt(int boardno) {
		
		SqlSession session = null;
		List<BoardCmtDto> res = null;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace + "selectCmt", boardno);
		session.close();
		
		return res;
	}
	
	public int CmtCount(int boardno) {
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		int res = session.selectOne(namespace + "CmtCount", boardno);
		System.out.println(res);
		session.close();
		
		return res;
	}
	
	public int insertCmt(BoardCmtDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.insert(namespace + "insertCmt", dto);
		
		return res;
	}
	
	public int deleteCmt(int cmtno) {
		
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace + "deleteCmt", cmtno);
		
		return res;
	}
	
}
