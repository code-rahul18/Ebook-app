package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.db.DbConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			
			int uid = Integer.parseInt(req.getParameter("uid"));
			String name  = req.getParameter("username");
			String email  = req.getParameter("email");
			String phno  = req.getParameter("phno");
			String address  = req.getParameter("address");
			String city  = req.getParameter("city");
			String state  = req.getParameter("state");
			String pincode  = req.getParameter("pincode");
			String landmark  = req.getParameter("landmark");
			String paymentType  = req.getParameter("paymentType");
			
			
			String fullAdd = address + " "+ city + " "+ landmark+" "+ state + " "+ pincode ;
		
			
			CartDAOImpl dao  = new CartDAOImpl(DbConnect.getConnection());
			List<Cart> blist = dao.getBookByUser(uid);
		
			
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "Please Add Book");
				resp.sendRedirect("checkout.jsp");
				
			}
			
			else {

				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DbConnect.getConnection());
				Book_Order o = null;
				 ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
				 Random r = new Random();
				for(Cart c : blist)
				{
					o =new Book_Order();
					o.setOrderId("Book-ord-00"+ r.nextInt(1000));
					o.setBookName(c.getBookName());
					o.setEmail(email);
					o.setUserName(name);
					o.setPhno(phno);
				    o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderlist.add(o);
			
					
				}
				
				if("noselect".equals(paymentType))		
				{
					session.setAttribute("failedMsg", "Please choose Payment method");
					resp.sendRedirect("checkout.jsp");
					
				}
				
				else {
					
					boolean f = dao2.saveOrder(orderlist);
				if(f)
					{
					    resp.sendRedirect("order_success.jsp");
				
					}
					
					else {
						
						session.setAttribute("failedMsg", " Order failed something wrong on server");
						resp.sendRedirect("checkout.jsp");
					}
				}
			
			}
			
		}
		
		catch(Exception e)
		{
		   e.printStackTrace();
		}
	}

	
	
}
