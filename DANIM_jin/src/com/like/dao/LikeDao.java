package com.like.dao;


import org.apache.ibatis.session.SqlSession;

import com.like.dto.LikeDto;

public class LikeDao extends SqlMapConfig{

	private String namespace = "com.like.mapper.";
	
	public int isLiked(LikeDto dto) {
		
		SqlSession session = null;
		
		session = getSqlSessionFactory().openSession(true);
		int res = session.selectOne(namespace + "isLiked", dto);
		session.close();
		
		return res;
	}
	
	public int insertLike(LikeDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.insert(namespace + "insertLike", dto);
		
		return res;
	}
	
	public int deleteLike(LikeDto dto) {
		
		SqlSession session = null;
		int res = 0;
		
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace + "deleteLike", dto);
		
		return res;
	}
}
