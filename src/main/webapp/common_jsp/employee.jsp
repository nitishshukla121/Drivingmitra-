<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>

<%@include file="/common/common_css.html"%>

</head>
<body>
<%-- 	<%@include file="/common/common_header.html"%>
 --%>
	<form method="post" action="/Drivingmitra/employee">
		<label> id <input type="text" name="id"></label> 
		<label>pass<input type="password" name="pass"></label>
		 	<label> name <input type="text" name="name" ></label> 
		 	<label>email <input type="email" name="email"></label> 
		 	<label> phone <input type="number"name="phone" ></label> 
		 
		 
		 
		<button type="submit">Submit</button>

	</form>

<%-- 	<%@ include file="/common/common_footer.html"%>
 --%>	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>