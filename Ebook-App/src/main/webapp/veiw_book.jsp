<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>

<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="bg-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>


	<%
        int bid = Integer.parseInt(request.getParameter("bid"));
	     BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
	    BookDtls b =  dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5 text-center border bg-white">
				<img alt="" src="bookimg/<%=b.getPhotoName()%>"
					style="width: 100px; height: 150px"> <br>
				<h4 class="pt-3">
					BookName: <span class="text-success "><%=b.getBookName()%></span>
				</h4>
				<h4>
					Autor: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Categrory: <span class="text-success"><%=b.getCategories()%></span>
				</h4>

			</div>
			<div class="col-md-6 p-5 border bg-white">
				<h2 class="text-center"><%=b.getBookName()%></h2>

				<% 
				if("Old".equals(b.getCategories()))
				{%>
				<h5 class="text-primary text-center">Contact to sellor</h5>
				<h5 class="text-primary text-center">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail() %></h5>

				<% }%>


				<div class="row">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>

				</div>

				<%
               
               if("Old".equals(b.getCategories()))
               {%>


				<div class="text-center p-3">
					<a href="#" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Continue Shoping </a> <a href="#"
						class="btn btn-success">300 <i
						class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>

				<%}
				
				else{%>
				<div class="text-center p-3">
					<a href="#" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i>Add Cart</a> <a href="#"
						class="btn btn-success">300 <i
						class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>
				<%}%>




				
			</div>
		</div>
	</div>

</body>
</html>