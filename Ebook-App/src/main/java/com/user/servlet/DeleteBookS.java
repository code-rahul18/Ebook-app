package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.db.DbConnect;

public class DeleteBookS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
			boolean f = dao.deletBook(id);
			
			HttpSession session = request.getSession();
			
            if(f)
            {
            	session.setAttribute("succMsg", "Book Delete Successfully");
            	response.sendRedirect("admin/all_books.jsp");
            }
            
            else {
            	session.setAttribute("failedMsg", "Something wrong on server");
            	response.sendRedirect("admin/all_books.jsp");
            }
			
		}
		
		catch(Exception e)
		{
			
		}
	}

}
