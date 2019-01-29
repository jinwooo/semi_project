package com.map.dao;

import java.util.List;

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
	
	public List<planDto> diaryList(String id) {
		SqlSession session = null;
		List<planDto> res = null;
		
		session = getSqlSessionFactory().openSession(true);		
		res = session.selectList(namespace+"diaryList",id);
		session.close();
		
		return res;
	}
	
	public planDto selectOne(String pno) {
		SqlSession session = null;
		planDto dto = new planDto();
		
		session = getSqlSessionFactory().openSession(true);		
		dto = session.selectOne(namespace+"selectOne",pno);
		session.close();
		
		return dto;
	}
	
	public int deletePlan(String pno) {
		SqlSession session = null;
		int res = 0;
				
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace+"deletePlan",pno);	
		session.close();
		
		return res;
	}	
	
	
}
