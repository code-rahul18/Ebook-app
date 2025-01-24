package com.user.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.db.DbConnect;
import com.entity.BookDtls;

@MultipartConfig
public class AddOldBookServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
try {
			
			String bookName = request.getParameter("bname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String categories = "Old";
			String status = "Active";
			String useremail = request.getParameter("user");
			Part part = request.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
	           BookDtls b = new BookDtls(bookName,author,price,categories,status,fileName,useremail);
	           
	           BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
	           boolean f = dao.addBooks(b);
	           
	           HttpSession session = request.getSession();
	           
//	            String path = getServletContext().getRealPath("");
	            
	            File fn = new File("D:\\\\Projectjava\\\\Ebook-App\\\\src\\\\main\\\\webapp\\\\bookimg");
	            part.write(fn +File.separator+fileName);
	            
//	           System.out.print(path);
	           
           if(f) {
	        	   
	        	   session.setAttribute("succMsg", "Book Add Succesfully");
	        	   response.sendRedirect("sell_book.jsp");
	           }
	           
	           else {
	        	   session.setAttribute("failedMsg", "Something went wrong");
	        	   response.sendRedirect("sell_book.jsp");
	           }
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		
		
	}

