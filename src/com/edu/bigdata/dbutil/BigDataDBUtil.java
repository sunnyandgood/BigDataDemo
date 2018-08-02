package com.edu.bigdata.dbutil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 数据库连接与关闭类
 */
public class BigDataDBUtil {

	private Connection connection = null;
	private Statement statement = null;
	private ResultSet resultSet = null;
	private DataSource data = new ComboPooledDataSource();
	
	public Connection getConnection()
	{
		try {
			connection = data.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public Statement getStatement() {   
        connection = getConnection();
        try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return statement;
    }
	
	
    public ResultSet getResultSet(String sql) {
    	statement = getStatement();
        try {
			resultSet = statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return resultSet;
    }

    
	public void close() {		
		
		if(resultSet != null){
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			resultSet = null;
		}
		
		
		if(statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			statement = null;
		}
		
		
		if(resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			resultSet = null;
		}
	}
	
//	public static void main(String[] args) {
//		DbUtils dbUtils = new DbUtils();
//		Connection connection = dbUtils.getConnection();
//		if(connection != null)
//			System.out.println("数据库连接成功！");
//		else
//			System.out.println("数据库连接失败！");
//	}
}
