<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user:old book</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>


	<c:if test="${empty userObj }">
		<c:redirect url="/login.jsp"></c:redirect>

	</c:if>




	<c:if test="${not empty succMsg }">
		<div class="altert alert-success text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />

	</c:if>


	<div class="container p-5">

		<c:if test="${not empty failedMsg }">
			<h4 class="text-center text-danger">${failedMsg}</h4>
			<c:remove var="failedMsg" scope="session" />
		</c:if>

		<table class="table table-hover">
			<thead class="bg-success text-white">
				<tr>

					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>

			</thead>
			<tbody>


				<%
				User u = (User) session.getAttribute("userObj");
				BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
				String email = u.getEmail();
				List<BookDtls> oldBook = dao.getOldBookByUser(email, "Old");

				for (BookDtls b : oldBook) {
				%>


				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><a
						href="deleteOldBook?bid=<%=b.getBookId()%>&&email=<%=email%>"
						class="btn  btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}
				%>




			</tbody>
		</table>

	</div>

</body>
</html>