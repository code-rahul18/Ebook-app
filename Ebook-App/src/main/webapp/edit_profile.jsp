<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>






	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class=" text-center text-primary p-1">Edit Profile</h4>

						<c:if test="${not empty succMsg }">

							<p class="text-success text-center">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />

						</c:if>

						<c:if test="${not empty failedMsg }">

							<p class="text-danger text-center">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />

						</c:if>



						<form action="UpdateProfileUser" method="post">
							<input type="hidden" name="uid" value="${userObj.getId()}">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userObj.name}">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userObj.email}">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phno"
									value="${userObj.phno}">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="pwd">
							</div>

							<button type="submit" class="btn btn-primary mt-2">Edit</button>
						</form>





					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>