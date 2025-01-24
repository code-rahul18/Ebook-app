package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.db.DbConnect;
import com.entity.User;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			String email = request.getParameter("email");
			String  password = request.getParameter("password");
			
			
			UserDAOImpl dao = new UserDAOImpl(DbConnect.getConnection());
			HttpSession session = request.getSession();
			
			if("muvelrahul42@gmail.com".equals(email) && "dj123".equals(password))
			{
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userObj", us);
			response.sendRedirect("admin/home.jsp");
				
			}
			
			else {
			
				User us = dao.login(email, password);
				
				if(us!=null)
				{
					session.setAttribute("userObj", us);
					response.sendRedirect("index.jsp");
					
				}
				
				else {
					
					session.setAttribute("failedMsg", "Email and Password Invalid");
					response.sendRedirect("login.jsp");
				}
			
			}
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
