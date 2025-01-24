package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	private static Connection conn;
	
	public static Connection getConnection() {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebookapp", "root", "dj123");

		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

}

