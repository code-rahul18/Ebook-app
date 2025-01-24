<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Orders</title>
<%@ include file="allcss.jsp"%>
</head>


<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>

	</c:if>

	<h3 class="text-center text-primary">Hello Admin</h3>
	<table class="table table-striped ">
		<thead class="bg-success text-white">
			<tr>

				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phno</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Pyment Type</th>

			</tr>
		</thead>
		<tbody>


			<%
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DbConnect.getConnection());
			List<Book_Order> blist = dao.getAllBook();

			for (Book_Order b : blist) {
			%>

			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUserName()%></td>
				<td><%=b.getEmail()%></td>
				<td><%=b.getFulladd()%></td>
				<td><%=b.getPhno()%></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getPaymentType()%></td>
			</tr>



			<%
			}
			%>




		</tbody>
	</table>
	<div style="margin-top: 177px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>