<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Home</title>
</head>
<body>

	<h1>User:Home</h1>
	<c:if test="${not empty userobj }">
	<h3> Name: ${userobj.name}</h3>
	
	</c:if>
	
	
</body>
</html>