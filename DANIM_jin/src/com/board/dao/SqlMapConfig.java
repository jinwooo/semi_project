package com.board.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlMapConfig {

	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		// 설정과 관련된 파일 가져옴
		String resource="com/board/db/board_config.xml";
		
		try {
			Reader reader=Resources.getResourceAsReader(resource);
			// SqlSessionFactoryBuilder()로 sqlSessionFactory 객체 만들기
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
