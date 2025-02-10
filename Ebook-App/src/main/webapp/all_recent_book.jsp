<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>

<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class=" container-fluid p-3">
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list1 = dao2.getAllRecentBooks();
			
			User u = (User) session.getAttribute("userObj");

			for (BookDtls b : list1) {
			%>



			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumbnil">
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
							<a href="veiw_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary ml-5 " style="background-color: #578FCA">View
								Details</a> <a href="#" class="btn btn-success ml-1 "><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}

						else {
						%>

						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn text-white ml-1 "style="background-color:#09122C"><i
								class="fa-solid fa-cart-plus" ></i> Add Cart</a>
							<%
							}

							else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn  ml-1 text-white"  style="background-color:#09122C"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>

							<%
							}
							%>

							<a href="veiw_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-primary ml-1 " style="background-color: #AD49E1">View
								Details</a> <a href="#" class="btn btn-success ml-1 "><%=b.getPrice()%>
								<i class="fa-solid fa-indian-rupee-sign"></i></a>
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
	</div>

</body>
</html>