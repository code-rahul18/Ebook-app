package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.db.DbConnect;
import com.entity.BookDtls;


public class EditBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String status = request.getParameter("status");
			
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setAuthor(author);
            b.setBookName(bookName);
            b.setPrice(price);
            b.setStatus(status);
            
            BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
            boolean f = dao.updateBook(b);
            
            HttpSession session = request.getSession();
            
            if(f)
            {
            	session.setAttribute("succMsg", "Book Update Successfully");
            	response.sendRedirect("admin/all_books.jsp");
            }
            
            else {
            	session.setAttribute("failedMsg", "Something wrong on server");
            	response.sendRedirect("admin/all_books.jsp");
            }
			
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
