package com.pay.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class SqlMapConfig {

	private SqlSessionFactory sqlSessionFactory;
	
	public SqlSessionFactory getSqlSessionFactory() {
		// ?Ñ§?†ïÍ≥? Í¥??†®?êú ?åå?ùº Í∞??†∏?ò¥
		String resource="com/pay/db/pay_config.xml";
		
		try {
			Reader reader=Resources.getResourceAsReader(resource);
			// SqlSessionFactoryBuilder()Î°? sqlSessionFactory Í∞ùÏ≤¥ ÎßåÎì§Í∏?
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
