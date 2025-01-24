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


public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			String name = request.getParameter("fname");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String password = request.getParameter("password");
			String check = request.getParameter("check");
			
			System.out.println(name+email+password+phno+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			HttpSession session = request.getSession();
			
			if(check!=null)
			{
				UserDAOImpl dao = new UserDAOImpl(DbConnect.getConnection());
				boolean f2 =dao.checkUserExist(email);
				
				if(f2)
				{
					boolean f = dao.userRegister(us);
					
					if(f)
					{
						session.setAttribute("succMsg", "User register successfully..");
						response.sendRedirect("register.jsp");
					}
					
					else {
						session.setAttribute("failedMsg", "Something wrong on server..");
						response.sendRedirect("register.jsp");
					}
				}
				
				else {
					
					session.setAttribute("failedMsg", "User Already Exist");
					response.sendRedirect("register.jsp");
					
				}
				
			}
			
			else {
				session.setAttribute("failedMsg", "Please check terms and conditons..");
				response.sendRedirect("register.jsp");
			}
			
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
