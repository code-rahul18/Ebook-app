<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>

<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
		
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list3 = dao2.getOldBooks();

			for (BookDtls b : list3) {
			%>



			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categaries:<%=b.getCategories()%></p>

						<div class="row">
							<a href="veiw_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary ml-5 ">View Details</a> <a
								href="#" class="btn btn-success ml-1 "><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>



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