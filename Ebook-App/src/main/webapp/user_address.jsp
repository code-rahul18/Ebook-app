<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="/login.jsp"></c:redirect>

	</c:if>

	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-success">Add Address</h5>

						<form action="">

							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="address">Address</label> <input type="text"
										class="form-control" id="address" name="address" required>
								</div>

								<div class="form-group col-md-6">
									<label for="address">LandMark</label> <input type="text"
										class="form-control" id="address" name="address" required>
								</div>

							</div>

							<div class="form-row">

								<div class="form-group col-md-4">
									<label for="landmark">City</label> <input type="text"
										class="form-control" id="landmark" name="landmark">
								</div>

								<div class="form-group col-md-4">
									<label for="landmark">State</label> <input type="text"
										class="form-control" id="landmark" name="landmark">
								</div>

								<div class="form-group col-md-4">
									<label for="landmark">Pin</label> <input type="text"
										class="form-control">
								</div>

							</div>



							<div class="text-center">
								<button class="btn btn-warning text-white">Add Address</button>
							</div>

						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>