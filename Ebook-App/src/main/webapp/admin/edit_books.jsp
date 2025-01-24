<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@ include file="allcss.jsp"%>
</head>
<body style="bgcolor: #f0f2f2">
	<%@ include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary">Edit Book</h5>
						

						<%
						int id = Integer.parseInt(request.getParameter("id"));

						BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());

						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editBooks" method="post">
							<div class="form-group">
								 <input
									type="hidden" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="id"
									value="<%=b.getBookId()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname"
									value="<%=b.getBookName()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author"
									value="<%=b.getAuthor()%>">

							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="price" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputeState"> Book Status</label> <select
									id="inputeState" name="status" class="form-control">

									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<%
									}

									else {
									%>

									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								
									<option value="Inactive">Inactive</option>

								</select>
							</div>


							<button type="submit" class="btn btn-primary mt-2">Update</button>
						</form>




					</div>
				</div>

			</div>
		</div>

	</div>

	<div style="margin-top: 168px">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>