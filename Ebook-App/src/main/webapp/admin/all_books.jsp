<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@ include file="allcss.jsp"%>
</head>


<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>

	</c:if>


	<h3 class="text-center text-primary">Hello Admin</h3>

	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />

	</c:if>

	<c:if test="${not empty failedMsg }">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>

				<th scope="col">BookId</th>
				<th scope="col">Image</th>
				<th scope="col">BookName</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categores</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list = dao.getAllBooks();

			for (BookDtls b : list) {
			%>

			<tr>
				<td><%=b.getBookId()%></td>
				<td><img alt="" src="../bookimg/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>

				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getCategories()%></td>
				<td><%=b.getStatus()%></td>
				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i
						class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../deleteS?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
						Delete</a></td>
			</tr>


			<%
			}
			%>






		</tbody>
	</table>
	<div style="margin-top: 258px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>