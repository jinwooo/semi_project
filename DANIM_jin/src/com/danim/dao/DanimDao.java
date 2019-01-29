package com.danim.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.danim.dto.DanimDto;

public class DanimDao extends SqlMapConfig{
	
	private String namespace="com.danim.mapper.";
	
	
	public DanimDto selectOne(String id) {
		
		SqlSession session=null;
		DanimDto res=null;
		session=getSqlSessionFactory().openSession(true);
		res=session.selectOne(namespace+"selectOne",id);
		session.close();
		
		return res;
	}
	
	public int join(DanimDto dto) {
		
		SqlSession session =null;
		int res = 0;
		session=getSqlSessionFactory().openSession(true);
		res = session.insert(namespace+"join",dto);
		session.close();
		
		return res;
	}
	
	public int snsJoin(DanimDto dto) {
		
		SqlSession session =null;
		int res = 0;
		session=getSqlSessionFactory().openSession(true);
		res = session.insert(namespace+"snsJoin",dto);
		session.close();
		
		return res;
	}
	
	public DanimDto login(String id) {
		SqlSession session = null;
		DanimDto res = null;
		
		session =getSqlSessionFactory().openSession(true);
		res = session.selectOne(namespace+"login",id);
		session.close();
		
		return res;
	}
	
	public int confirm(String id) {
		SqlSession session = null;
		int res = 0;
		
		session =getSqlSessionFactory().openSession(true);
		res = session.update(namespace+"confirm",id);
		session.close();
		
		return res;
	}
	
	public DanimDto findInfo(String email) {
		SqlSession session = null;
		DanimDto res = null;
		
		session =getSqlSessionFactory().openSession(true);
		res = session.selectOne(namespace+"findInfo",email);
		session.close();
		
		return res;
	}
	
	public int updatePw(String id,String pw) {
		SqlSession session = null;
		int res = 0;
		
		session =getSqlSessionFactory().openSession(true);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pw", pw);
		res = session.update(namespace+"updatePw",map);
		session.close();
		
		return res;
	}
	
		public DanimDto idCheck(String dto) {
		
		SqlSession session=null;
		DanimDto res = null;
		session=getSqlSessionFactory().openSession(true);
		res=session.selectOne(namespace+"idCheck",dto);
		session.close();
		
		return res;
		
	}
		
		public int changeInfo(String id,String pw,String name,String email,String phone,String addr) {
			SqlSession session = null;
			int res = 0;
			
			session =getSqlSessionFactory().openSession(true);
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("id", id);
			map.put("pw", pw);
			map.put("name", name);
			map.put("email", email);
			map.put("phone", phone);
			map.put("addr", addr);
			res = session.update(namespace+"changeInfo",map);
			session.close();
			
			return res;
	}
		
		public List<DanimDto> manageUser(){

			SqlSession session= null;
			List<DanimDto> list=null;

			session=getSqlSessionFactory().openSession(true);
			list=session.selectList(namespace+"manageUser");
			session.close();

			return list;
		}
		
	
}
