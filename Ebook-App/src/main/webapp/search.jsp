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
			
			String ch = request.getParameter("ch");
			BookDAOImpl dao2= new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list1 = dao2.getAllBookBySearch(ch);

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
							<a href="#" class="btn btn-primary ml-5 ">View Details</a> <a
								href="#" class="btn btn-success ml-1 "><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>

						<%
						}

						else {
						%>

						<div class="row">
							<a href="#" class="btn btn-danger ml-1 "><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a> <a href="#"
								class="btn btn-primary ml-1  ">View Details</a> <a href="#"
								class="btn btn-success ml-1 "><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"></i></a>
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