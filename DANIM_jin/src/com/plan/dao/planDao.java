package com.plan.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.paging.Paging;
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
	
	public int countAll() {
		SqlSession session=null;
		session=getSqlSessionFactory().openSession(true);
		
		int total=session.selectOne(namespace+"getCount");
		System.out.println(total);
		session.close();
		
		return total;
	}
	
	public List<planDto> getPaging(Paging paging){
		
		int startPage=(paging.getCurPageNum()-1)*paging.getPagecount()+1;
		int endPage=startPage+paging.getPagecount();
		System.out.println("start :" +startPage + "end : " + endPage);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		
		map.put("startPageNo",startPage);
		map.put("endPageNo", endPage);
		
		System.out.println(map);
		
		SqlSession session=null;
		session=getSqlSessionFactory().openSession(true);
		List<planDto> pagelist=null;
		
		pagelist=session.selectList(namespace+"getPaging",map);
		System.out.println("getPage");
		session.close();
			
		return pagelist;
	}
	
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
	
	public int deletePlan(String pno) {
		SqlSession session = null;
		int res = 0;
				
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace+"deletePlan",pno);	
		session.close();
		
		return res;
	}	
	
	

}
	
	

