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


public class UpdateProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			String name = request.getParameter("fname");
			int uid = Integer.parseInt(request.getParameter("uid"));
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String pwd = request.getParameter("pwd"); 
			
			UserDAOImpl dao = new UserDAOImpl(DbConnect.getConnection());
			boolean f = dao.checkPasswword(uid, pwd);
			
			HttpSession session = request.getSession();
		
			User u = new User();
			u.setName(name);
			u.setEmail(email);
			u.setPhno(phno);
			u.setId(uid);
			
			
		
			
			if(f)
			{
				
				boolean f2 = dao.updateProfile(u);
				if(f2)
				{
					session.setAttribute("succMsg", "Update profile succesfully");
					response.sendRedirect("edit_profile.jsp");
					
				}
				else {
					session.setAttribute("failedMsg", "Something wrong");
					response.sendRedirect("edit_profile.jsp");
				}
			}
			
			else {
				
				session.setAttribute("failedMsg", "Check Your password");
				response.sendRedirect("edit_profile.jsp");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
