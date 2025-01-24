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
	
	<c:if test="${empty userObj }">
<c:redirect url="../login.jsp"></c:redirect>

</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary">Book Add</h5>
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success"> ${succMsg}</p>
						<c:remove var="succMsg" scope="session"/>
					
						</c:if>
						
						<c:if test="${not empty failedMsg }">
						<p class="text-center text-danger"> ${failedMsg}</p>
						<c:remove var="failedMsg" scope="session"/>
					
						</c:if>

						<form action="../book_add" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="author">

							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Price</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputeState">Categories</label> <select
									id="inputeState" name="categories" class="form-control">
									<option selected>---Select---</option>
									<option value="New">New Book</option>
									<option value="Old">Old Book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputeState"> Book Status</label> <select
									id="inputeState" name="status" class="form-control">
									<option selected>---Select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Upload File</label> <input
									type="file" class="form-control-file"
									id="exampleInputPassword1" required="required" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary mt-2">Add</button>
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