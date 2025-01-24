<%@page import="com.entity.Book_Order"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order detail</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>

	<div class="container p-1">
		<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table table-hover  border mt-3">
			<thead class="bg-danger text-white">
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">BookName</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Pyment type</th>
				</tr>
			</thead>
			<tbody>
			
			<% 
			
			    User u = (User)session.getAttribute("userObj");
			    BookOrderDAOImpl dao = new   BookOrderDAOImpl(DbConnect.getConnection());
			   List<Book_Order> blist =  dao.getBook(u.getEmail());
			   
			   
			   for(Book_Order b : blist)
			   {%>
			   
			   <tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
			   
			   
				   
			   <%}
			   

		
			%>
			


			</tbody>
		</table>


	</div>

</body>
</html>