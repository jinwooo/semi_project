package com.map.dao;

import org.apache.ibatis.session.SqlSession;

import com.map.dto.planDto;

public class planDao extends SqlMapConfig_plan{
	
	private String namespace = "com.map.plan_mapper.";	
	
	public int insertPlan(planDto dto) {
		
		SqlSession session = null;
		int res = 0;
		session=getSqlSessionFactory().openSession(true);
		res = session.insert(namespace+"insertPlan",dto);
		session.close();
		
		return res;
	}
	
	public String selectPno(planDto dto) {
		SqlSession session = null;
		String res = "";
		
		session = getSqlSessionFactory().openSession(true);		
		res = session.selectOne(namespace+"selectPno",dto);
		session.close();
		
		return res;
	}
	
	
}