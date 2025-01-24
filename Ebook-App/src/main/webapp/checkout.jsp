<%@ page import="com.entity.Cart"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.User"%>
<%@ page import="com.db.DbConnect"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${ not empty succMsg }">
		<div class="alert alert-info text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${ not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
	
	
	
	
		<div class="row p-2">
			<!-- Cart Items -->
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								if (user != null) {
									CartDAOImpl dao = new CartDAOImpl(DbConnect.getConnection());
									List<Cart> cart = dao.getBookByUser(user.getId());

									if (cart != null) {
										double totalPrice = 0.00;
										for (Cart c : cart) {
									totalPrice += c.getPrice();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removebook?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td colspan="2"><strong>Total Price</strong></td>
									<td></td>
									<td colspan="2"><%=totalPrice%></td>
								</tr>
								<%
								} else {
								%>
								<tr>
									<td colspan="4" class="text-center">No items in your cart</td>
								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="4" class="text-center">Please log in to view
										your cart</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- User Details Form -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
						
						<input type="hidden" name="uid" value="<%= user.getId()%>">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">Name</label> <input type="text"
										class="form-control" id="name" name="username" value="<%=user.getName()%>"  required >
								</div>
								<div class="form-group col-md-6">
									<label for="email">Email</label> <input type="email"
										class="form-control" id="email" name="email" value="<%=user.getEmail() %>"  required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="phone">Phone Number</label> <input type="number"
										class="form-control" id="phone" name="phno"  value="<%=user.getPhno()%>"required>
								</div>
								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address" required>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="landmark">Landmark</label> <input type="text"
										class="form-control" id="landmark" name="landmark" required>
								</div>
								
								<div class="form-group col-md-6">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="pincode">Pincode</label> <input type="text"
										class="form-control" id="pincode" name="pincode" required>
								</div>
							</div>
							<div class="form-group">
								<label for="paymentType">Payment Type</label> <select
									class="form-control" id="paymentType" name="paymentType"
									required >
									<option value="noselect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>
							<div class="text-center ">
								<button type="submit" class="btn btn-warning ">Order Now</button>
								<a href="shop.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
