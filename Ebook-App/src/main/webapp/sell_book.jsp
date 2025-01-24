<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Old Books</title>
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
						<h5 class="text-center text-primary p-2">Sell Book</h5>

                        	<c:if test="${not empty succMsg }">
                        	<h5 class="text-center text-success"> ${succMsg} </h5>
                        	<c:remove var="succMsg" scope="session"/>
                        	</c:if>
                        	
                        	<c:if test="${not empty failedMsg }">
                        	<h5 class="text-center text-danger"> ${failedMsg} </h5>
                        	<c:remove var="failedMsg" scope="session"/>
                        	</c:if>
                        
						<form action="AddOldBookServ" method="post" enctype="multipart/form-data">
						 <input type="hidden" value="${userObj.email}" name="user">
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
								<label for="exampleInputPassword1">Upload File</label> <input
									type="file" class="form-control-file"
									id="exampleInputPassword1" required="required" name="bimg">
							</div>
							<button type="submit" class="btn btn-primary mt-2">Sell</button>
						</form>






					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>