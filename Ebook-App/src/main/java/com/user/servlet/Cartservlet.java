package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.db.DbConnect;
import com.entity.BookDtls;
import com.entity.Cart;


public class Cartservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
		    BookDtls b	= dao.getBookById(bid);
		    
		   Cart c = new Cart();
		   c.setBid(bid);
		   c.setUserId(uid);
		   c.setBookName(b.getBookName());
           c.setAuthor(b.getAuthor());
           c.setPrice( Double.parseDouble(b.getPrice()));
           c.setTotalPrice(Double.parseDouble(b.getPrice()));
           
		    CartDAOImpl dao2 = new  CartDAOImpl(DbConnect.getConnection());
		    HttpSession session = request.getSession();
		    
		    boolean f = dao2.addCart(c);
		    
		    if(f)
		    {
		    	 session.setAttribute("addCart", "Book Added to cart");
		    	 response.sendRedirect("all_new_book.jsp");
		    }
		    
		    else {
		    	 session.setAttribute("failedMsg", "Something went on server");
		    	 response.sendRedirect("all_new_book.jsp");
		    }
		    
		    

		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
	}

}
