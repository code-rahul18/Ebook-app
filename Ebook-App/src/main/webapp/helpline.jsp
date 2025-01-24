<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelpLine</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-success">
					<i class="fas fa-phone-square-alt fa-5x"></i>
				</div>
				<h3>24*7 Service</h3>
				<h4>Help Line Number</h4>
				<h5>+918305674402</h5>
				<a href="index.jsp" class="btn btn-primary ">Home</a>

			</div>
		</div>

	</div>

</body>
</html>