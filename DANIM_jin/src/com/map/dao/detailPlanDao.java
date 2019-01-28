package com.map.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.map.dto.detailPlanDto;

public class detailPlanDao extends SqlMapConfig_detailPlan {
	
	private String namespace = "com.map.detailPlan_mapper.";	

	public int insertDetailPlan(List<detailPlanDto> list) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		SqlSession session = null;
		int res = 0;
		session=getSqlSessionFactory().openSession(true);
		res = session.insert(namespace+"insertDetailPlan",map);
		session.close();
		
		return res;
	}
}