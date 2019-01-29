package com.pay.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.pay.dto.payDto;

public class payDao extends SqlMapConfig{

	private String namespace="com.pay.mapper.";
	
	public payDto selecOne(String id) {
		
		SqlSession session=null;
		payDto res = null;
		session=getSqlSessionFactory().openSession(true);
		res=session.selectOne(namespace+"paySelect",id);
		session.close();
		
		return res;
		
	}
	
	  
	public int payInsert(payDto dto) {
		
		SqlSession session=null;
		int res = 0;
		session=getSqlSessionFactory().openSession(true);
		res=session.insert(namespace+"payInsert",dto);
		session.close();
		
		
		return res;
	}
	
	public List<BoardDto> payList(String id){
		
		SqlSession session= null;
		List<BoardDto> list=null;
		
		session=getSqlSessionFactory().openSession(true);
		list=session.selectList(namespace+"payList",id);
		session.close();
		
		return list;
	}
	
}
