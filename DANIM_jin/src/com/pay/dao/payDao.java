package com.pay.dao;

import org.apache.ibatis.session.SqlSession;

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
	
}
