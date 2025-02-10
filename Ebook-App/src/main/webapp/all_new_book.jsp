<%@page import="com.entity.User"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@ include file="all_component/allcss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #fcf7f7;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>

	<% User u = (User) session.getAttribute("userObj");

	%>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>


<c:remove var="addCart" scope="session"/>

	</c:if>


	<%@ include file="all_component/navbar.jsp"%>

	<div class=" container-fluid p-3">
		<div class="row">
			<%
			BookDAOImpl dao = new BookDAOImpl(DbConnect.getConnection());
			List<BookDtls> list = dao.getNewBooks();

			for (BookDtls b : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="bookimg/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumbnil">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categaries:
							<%=b.getCategories()%></p>
						<div class="row">
						
							<%
						if(u == null)
						{%>
						<a href="login.jsp" class="btn  ml-5 text-white " style="background-color:#09122C"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
						<%}
						
						else{%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn  ml-1 " class="btn btn-primary ml-1 " style="background-color:#09122C"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
							
						<%}%>
						
							 <a href="veiw_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-primary ml-1 " style="background-color:#578FCA">View Details</a> 
							 <a href="#"class="btn text-white ml-5 "><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>

</body>
</html>