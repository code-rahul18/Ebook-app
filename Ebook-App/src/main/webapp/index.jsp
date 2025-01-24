<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:index</title>
<%@ include file="all_component/allcss.jsp"%>

<style type="text/css">


.bg-img {
	background: url(img/book1.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	height: 50vh;
	width: 100%;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>

<body style="background-color: #f7f7f7">

	<!-- check connection -->
	<% /*
	 Connection con = DbConnect.getConnection();
	out.print(con);
	
	*/%> 
	
	
	
	<% User u = (User) session.getAttribute("userObj");

	%>
	


	<%@ include file="all_component/navbar.jsp"%>
	
	

	<div class="container-fluid  bg-img">
		<h1 class="text-white text-center text-secondary" >EBook Management
			System</h1>
	</div>

	<!-- Recent Books -->

	<div class="container-fluid">
		<h2 class="text-center">Recent Book</h2>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list1 = dao2.getRecentBooks();

			for (BookDtls b : list1) {
			%>



			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p>
							<%=b.getAuthor()%></p>
						<p>
							Categaries:
							<%=b.getCategories()%></p>

						<%
						if (b.getCategories().equals("Old")) {
						%>

						<div class="row">
							<a href="veiw_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary ml-5 " style="background-color:#304D30">View Details</a> <a
								href="#" class="btn btn-success ml-1 " style="background-color:#4335A7"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}
						
						else {
						%>

						<div class="row">
						
							<%
						if(u == null)
						{%>
						<a href="login.jsp" class="btn btn-primary ml-1 " style="background-color:#09122C"><i class="fa-solid fa-cart-plus" ></i> Add Cart</a>
						<%}
						
						else{%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-primary ml-1 " style="background-color:#09122C"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
							
						<%}%>
			
							 <a href="veiw_book.jsp?bid=<%=b.getBookId()%>"class="btn btn-primary ml-1 "  style="background-color:#304D30">View Details</a> 
							 <a href="#" class="btn btn-success ml-1  "  style="background-color:#4335A7"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
						<%
						}
						%>




					</div>
				</div>
			</div>

			<%
			}
			%>




		</div>

		<div class="text-center text-white mt-2">
			<a href="#" class="btn btn-primary " style="background-color:#024CAA">View All</a>
		</div>


	</div>



	<!-- End Recent Book -->
	<hr>
	
	
	<!-- Start New Books -->
	<div class="container-fluid">

		<h2 class="text-center">New Book</h2>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list = dao.getNewBooks();

			for (BookDtls b : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categaries:
							<%=b.getCategories()%></p>
						<div class="row">
						
						<%
						if(u == null)
						{%>
						<a href="login.jsp" class="btn btn-primary ml-1 " style="background-color:#09122C"><i class="fa-solid fa-cart-plus" ></i> Add Cart</a>
						<%}
						
						else{%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-primary ml-1 " style="background-color:#09122C"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
							
						<%}%>
						
						
							 <a href="veiw_book.jsp?bid=<%=b.getBookId()%>"class="btn btn-primary ml-1 "style="background-color:#304D30">View Details</a>
							  <a href="#"class="btn btn-success ml-1 " style="background-color:#4335A7" ><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			
			<%}%>
			


		</div>

		<div class="text-center text-white mt-2">
			<a href="#" class="btn btn-primary" style="background-color:#024CAA">View All</a>
		</div>

	</div>
	<!-- End New Book -->
	<hr>


	<!-- Old Books -->

	<div class="container-fluid">
		<h2 class="text-center">Old Book</h2>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list3 = dao2.getOldBooks();

			for (BookDtls b : list3) {
			%>



			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 200px; height: 250px" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categaries:<%=b.getCategories()%></p>

						<div class="row">
							<a href="veiw_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary ml-5 " style="background-color:#304D30">View Details</a> <a href="#"
								class="btn btn-success ml-1 "  style="background-color:#4335A7"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>



					</div>
				</div>
			</div>

			<%
			}
			%>









		</div>
		

		<div class="text-center text-white mt-2">
			<a href="#" class="btn btn-primary"  style="background-color:#024CAA">View All</a>
		</div>

	</div>
	<!-- End Old Book -->

	<%@ include file="all_component/footer.jsp"%>

</body>
</html>