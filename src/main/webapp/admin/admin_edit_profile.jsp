<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.* ,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Edit Profile - Driving School Arena</title>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
:root {
    --admin-primary-bg: #2c3e50;
    --admin-secondary-bg: #34495e;
    --admin-card-bg: #ffffff;
    --admin-text-dark: #333333;
    --admin-text-light: #ecf0f1;
    --admin-accent-color: #3498db;
    --admin-separator-color: rgba(255, 255, 255, 0.2);
    --admin-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --admin-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --profile-card-bg: #ffffff;
    --profile-gradient-start: #3498db;
    --profile-gradient-end: #2980b9;
    --profile-text-color: #ecf0f1;
    --profile-info-label: #555;
    --profile-info-value: #333;

    --admin-footer-bg: #222;
    --admin-footer-text: #bbb;
}

body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--admin-primary-bg);
    color: var(--admin-text-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

a {
    color: var(--admin-accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #2980b9;
    text-decoration: underline;
}

.admin-hero-container {
    position: relative;
    width: 100%;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #1abc9c, #16a085);
    color: var(--admin-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px;
}

.admin-hero-content {
    z-index: 2;
    padding: 20px;
}

.admin-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3.5em;
    font-weight: bold;
    text-shadow: var(--admin-heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.admin-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    opacity: 0.9;
}

.separator {
    height: 2px;
    background-color: var(--admin-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.admin-profile-edit-section {
    padding: 40px 20px;
    max-width: 900px;
    margin: 0 auto;
    background-color: var(--admin-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--admin-box-shadow);
    color: var(--admin-text-light);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 60vh;
}

.profile-edit-card {
    background-color: var(--profile-card-bg);
    border-radius: .5rem;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    display: flex;
    width: 100%;
    overflow: hidden;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.profile-edit-card.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.profile-sidebar-edit {
    flex: 0 0 35%;
    background: linear-gradient(to right bottom, var(--profile-gradient-start), var(--profile-gradient-end));
    color: var(--profile-text-color);
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    border-top-left-radius: .5rem;
    border-bottom-left-radius: .5rem;
}

.profile-avatar-edit {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid rgba(255, 255, 255, 0.5);
    margin-bottom: 15px;
}

.profile-name-edit-input {
    background-color: rgba(255, 255, 255, 0.2);
    border: 1px solid rgba(255, 255, 255, 0.4);
    color: var(--profile-text-color);
    padding: 8px 12px;
    border-radius: 5px;
    font-size: 1.2em;
    font-weight: bold;
    text-align: center;
    width: calc(100% - 24px);
    box-sizing: border-box;
    transition: background-color 0.3s ease, border-color 0.3s ease;
}

.profile-name-edit-input:focus {
    outline: none;
    background-color: rgba(255, 255, 255, 0.3);
    border-color: var(--admin-accent-color);
}

.profile-details-edit-content {
    flex: 1;
    padding: 30px;
    color: var(--admin-text-dark);
}

.profile-details-edit-content h6 {
    font-size: 1.2em;
    font-weight: bold;
    color: var(--admin-accent-color);
    margin-bottom: 15px;
}

.profile-details-edit-content hr {
    border: 0;
    height: 1px;
    background-color: #eee;
    margin-top: 0;
    margin-bottom: 20px;
}

.profile-info-edit-row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 15px;
}

.profile-info-edit-col {
    flex: 0 0 50%;
    max-width: 50%;
    margin-bottom: 15px;
}

.profile-info-edit-col label {
    font-size: 1em;
    font-weight: bold;
    color: var(--profile-info-label);
    margin-bottom: 5px;
    display: block;
}

.profile-info-edit-col input[type="text"] {
    width: calc(100% - 24px);
    padding: 8px 12px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 1em;
    color: var(--admin-text-dark);
    background-color: #f9f9f9;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.profile-info-edit-col input[type="text"]:focus {
    outline: none;
    border-color: var(--admin-accent-color);
    background-color: #fff;
}

.btn-submit-profile {
    display: block;
    width: auto;
    padding: 10px 25px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    margin-top: 20px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.btn-submit-profile:hover {
    background-color: #45a049;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
}

.admin-footer {
    background-color: #222;
    color: #bbb;
    padding: 20px;
    text-align: center;
    margin-top: 60px;
    font-size: 0.85em;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

@media (max-width: 768px) {
    .admin-hero-container {
        height: 200px;
        margin-top: 50px;
    }
    .admin-hero-title {
        font-size: 2.5em;
    }
    .admin-hero-subtitle {
        font-size: 1em;
    }
    .admin-profile-edit-section {
        padding: 20px 10px;
        min-height: auto;
    }
    .profile-edit-card {
        flex-direction: column;
    }
    .profile-sidebar-edit {
        flex: none;
        width: 100%;
        border-radius: .5rem .5rem 0 0;
        padding: 30px 20px;
    }
    .profile-avatar-edit {
        width: 80px;
        height: 80px;
        margin-bottom: 10px;
    }
    .profile-name-edit-input {
        font-size: 1em;
        padding: 6px 10px;
    }
    .profile-details-edit-content {
        padding: 20px;
    }
    .profile-info-edit-row {
        flex-direction: column;
        margin-bottom: 0;
    }
    .profile-info-edit-col {
        flex: none;
        max-width: 100%;
        margin-bottom: 10px;
    }
    .profile-info-edit-col:last-child {
        margin-bottom: 0;
    }
    .profile-details-edit-content hr {
        margin-bottom: 15px;
    }
    .btn-submit-profile {
        padding: 8px 15px;
        font-size: 1em;
    }
}

@media (min-width: 769px) {
    .admin-hero-container {
        height: 400px;
        margin-top: 70px;
    }
    .admin-hero-title {
        font-size: 5em;
    }
    .admin-hero-subtitle {
        font-size: 1.5em;
    }
    .admin-profile-edit-section {
        padding: 60px 30px;
    }
    .profile-edit-card {
        flex-direction: row;
    }
    .profile-sidebar-edit {
        padding: 30px;
    }
    .profile-avatar-edit {
        width: 120px;
        height: 120px;
    }
    .profile-name-edit-input {
        font-size: 1.3em;
    }
    .profile-details-edit-content {
        padding: 40px;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">
	<%@include file="/admin/admin_header.html"%>


	<%
	String admin_id=(String)session.getAttribute("sessionKey");
	String role=(String)session.getAttribute("role");

	if(admin_id==null||session.isNew()){
		request.setAttribute("msg", "Unauthorized Access: Please login first.");
		RequestDispatcher rd= request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	}
	else{
		if(role!=null && role.equals("admin")){
	%>
	
	<div class="admin-hero-container">
		<div class="admin-hero-content">
			<h1 class="admin-hero-title animate__animated animate__fadeInDown">Edit Profile</h1>
			<p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Update your personal information.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="admin-profile-edit-section">
		<%
		Admindao dao = new Admindao();
		Admins a= dao.viewProfile(admin_id);
		%>
		<form action="/Drivingmitra/Admin_Edit_Profile" method="post" class="profile-edit-card animate__animated" data-animation="animate__fadeInUp">
			<div class="profile-sidebar-edit">
				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
					alt="Avatar" class="profile-avatar-edit" />
				<input type="text" name="name" class="profile-name-edit-input"
					value="<%=a.getName() %>" oninput="validateInput(event)">
			</div>
			<div class="profile-details-edit-content">
				<h6>Your Information</h6>
				<hr>
				<div class="profile-info-edit-row">
					<div class="profile-info-edit-col">
						<label for="email">Email</label>
						<input type="text" id="email" name="email" value="<%=a.getEmail() %>">
					</div>
					<div class="profile-info-edit-col">
						<label for="phone">Phone</label>
						<input type="text" id="phone" name="phone" value="<%=a.getPhone() %>">
					</div>
				</div>
                <button type="submit" class="btn-submit-profile">Submit Changes</button>
			</div>
		</form>
	</div>

	<div class="separator"></div>

	<%}
	else{
		request.setAttribute("msg", "You are not authorized to access this page.");
		RequestDispatcher rd= request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	}
	}%>

<script>
function validateInput(event) {
const input = event.target.value;
const regex = /^[a-zA-Z\s]*$/;
if (!regex.test(input)) {
event.target.value = input.replace(/[^a-zA-Z\s]/g, '');
alert("Only alphabets and spaces allowed");
}
}
</script>

	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>