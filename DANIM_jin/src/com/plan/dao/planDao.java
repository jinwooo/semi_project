package com.plan.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.plan.dto.planDto;

public class planDao extends SqlMapConfig {
	
	private String namespace = "com.plan.mapper.";
	 
	public int saveText(planDto dto) {
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.update(namespace+"saveText",dto);
		
		return res;
	}
	
	public planDto selectOne(String pno) {
		SqlSession session = null;
		planDto res = null;
		
		session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace+"selectOne",pno);
		
		session.close();
		
		return res;
	}
	
	public List<planDto> selectList(String id) {
		SqlSession session = null;
		List<planDto> list = null;
		
		session = getSqlSessionFactory().openSession(true);
		list = session.selectList(namespace+"selectList",id);
		System.out.println("selectList 작동 됨");
		return list;
	}
}
