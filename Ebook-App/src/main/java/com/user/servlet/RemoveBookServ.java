package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.db.DbConnect;


public class RemoveBookServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			int cid = Integer.parseInt(request.getParameter("cid"));
			
			CartDAOImpl dao = new  CartDAOImpl(DbConnect.getConnection());
			boolean f = dao.removeBook(bid, uid,cid);
			
		   HttpSession session = request.getSession();
		   
		   
		   if(f)
		   {
			   session.setAttribute("succMsg", "Book removed from cart");
			   response.sendRedirect("checkout.jsp");
			   
		   }
		   
		   else {
			   session.setAttribute("failedMsg", "Something Wrong on server");
			   response.sendRedirect("checkout.jsp");
		   }

			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
