package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;

		try {

			PreparedStatement ps = conn.prepareStatement("insert into user(name,email,phno,password)values(?,?,?,?)");
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public User login(String email, String password) {
		
		User us = null;
		try {
			
		PreparedStatement ps = conn.prepareStatement("select*from user where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2,password);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			us = new User();
			us.setId(rs.getInt(1));
			us.setName(rs.getString(2));
			us.setEmail(rs.getString(3));
			us.setPhno(rs.getString(4));
			us.setPassword(rs.getString(5));
			us.setAddress(rs.getString(6));
			us.setLandmark(rs.getString(7));
			us.setCity(rs.getString(8));
			us.setState(rs.getString(9));
			us.setPincode(rs.getString(10));
			
		}
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return us;
	}

	@Override
	public boolean checkPasswword(int uid, String pwd) {
	
		boolean f = false;
		try {
			
			PreparedStatement ps = conn.prepareStatement("select*from user where id=? and password=?");
			ps.setInt(1, uid);
			ps.setString(2, pwd);
			
		ResultSet rs =	ps.executeQuery();
		
		while(rs.next())
		{
			f = true;
		}
		
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return f;
	}

	@Override
	public boolean updateProfile(User u) {
		boolean f =false;
		
		try {
			
			PreparedStatement ps = conn.prepareStatement("update user set name=?, email=?, phno=? where id=?");
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhno());
			ps.setInt(4, u.getId());
			
			int i = ps.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkUserExist(String email) {
	
		boolean f =true;
		
		try {
			
			PreparedStatement ps = conn.prepareStatement("select*from user where  email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				f=false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
}
