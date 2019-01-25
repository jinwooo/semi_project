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
		
		session.close();
		
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
		
		session.close();
		
		return list;
	}
	
	public int checkPno(String id, String pno) {
		SqlSession session = null;
		int res = 1;
		
		planDto dto = new planDto();
		dto.setId(id);
		dto.setPno(pno);
		
		System.out.println("이게 저장됨 : "+dto.getId() +","+ dto.getPno());
		
		session = getSqlSessionFactory().openSession(true);
		dto = session.selectOne(namespace+"checkPno",dto);
		
		System.out.println(dto.getPdata()+"****");
		
		if(dto.getPdata()==null) {
			res = 0;
		}

		System.out.println(res);

		
		session.close();
		
		return res;
	}
	
	public int insert(planDto dto) {
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
				
		res = session.insert(namespace+"insert",dto);
	
		session.close();
		
		System.out.println("insert에서 : " + res);
		
		return res;
	}
	
	public int setPno() {
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		
		res = session.selectOne(namespace+"setpno");
		
		System.out.println(res);
		
		return res;
	}
}
