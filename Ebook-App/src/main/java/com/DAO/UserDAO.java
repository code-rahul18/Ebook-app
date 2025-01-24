package com.DAO;

import com.entity.User;

public interface UserDAO {

	public boolean userRegister(User us);
	public User login(String email,String password);
	
	boolean checkPasswword(int uid,String pwd);
	boolean updateProfile(User u);
	public boolean checkUserExist(String email);
}
