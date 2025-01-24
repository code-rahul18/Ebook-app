package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.db.DbConnect;

public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(request.getParameter("bid"));
			String email = request.getParameter("email");
			String cate = "Old";

			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
			boolean f = dao.oldBookdelete(bid, email, cate);

			HttpSession session = request.getSession();

			if (f) {
				session.setAttribute("succMsg", " Old Book Delete Successfully");
				response.sendRedirect("old_book.jsp");
			}

			else {
				session.setAttribute("failedMsg", "Something wrong on server");
				response.sendRedirect("old_book.jsp");
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
