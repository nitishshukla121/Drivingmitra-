<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.* ,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile - Driving School Arena</title>

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

.admin-profile-section {
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

.profile-card {
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

.profile-card.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.profile-sidebar {
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

.profile-avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid rgba(255, 255, 255, 0.5);
    margin-bottom: 15px;
}

.profile-name {
    font-size: 1.8em;
    font-weight: bold;
    margin-bottom: 5px;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}

.profile-role {
    font-size: 1em;
    opacity: 0.9;
    margin-bottom: 20px;
}

.profile-edit-link {
    color: var(--profile-text-color);
    font-size: 1.2em;
    transition: color 0.3s ease, transform 0.2s ease;
}

.profile-edit-link:hover {
    color: #ecf0f1;
    transform: scale(1.1);
}

.profile-details-content {
    flex: 1;
    padding: 30px;
    color: var(--admin-text-dark);
}

.profile-details-content h6 {
    font-size: 1.2em;
    font-weight: bold;
    color: var(--admin-accent-color);
    margin-bottom: 15px;
}

.profile-details-content hr {
    border: 0;
    height: 1px;
    background-color: #eee;
    margin-top: 0;
    margin-bottom: 20px;
}

.profile-info-row {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 15px;
}

.profile-info-col {
    flex: 0 0 50%;
    max-width: 50%;
    margin-bottom: 15px;
}

.profile-info-col h6 {
    font-size: 1em;
    font-weight: bold;
    color: var(--profile-info-label);
    margin-bottom: 5px;
}

.profile-info-col p {
    font-size: 1.1em;
    color: var(--profile-info-value);
    margin: 0;
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
    .admin-profile-section {
        padding: 20px 10px;
        min-height: auto;
    }
    .profile-card {
        flex-direction: column;
    }
    .profile-sidebar {
        flex: none;
        width: 100%;
        border-radius: .5rem .5rem 0 0;
        padding: 30px 20px;
    }
    .profile-avatar {
        width: 80px;
        height: 80px;
        margin-bottom: 10px;
    }
    .profile-name {
        font-size: 1.5em;
    }
    .profile-role {
        font-size: 0.9em;
        margin-bottom: 15px;
    }
    .profile-edit-link {
        font-size: 1em;
    }
    .profile-details-content {
        padding: 20px;
    }
    .profile-info-row {
        flex-direction: column;
        margin-bottom: 0;
    }
    .profile-info-col {
        flex: none;
        max-width: 100%;
        margin-bottom: 10px;
    }
    .profile-info-col:last-child {
        margin-bottom: 0;
    }
    .profile-details-content hr {
        margin-bottom: 15px;
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
    .admin-profile-section {
        padding: 60px 30px;
    }
    .profile-card {
        flex-direction: row;
    }
    .profile-sidebar {
        padding: 30px;
    }
    .profile-avatar {
        width: 120px;
        height: 120px;
    }
    .profile-name {
        font-size: 2em;
    }
    .profile-role {
        font-size: 1.1em;
    }
    .profile-edit-link {
        font-size: 1.3em;
    }
    .profile-details-content {
        padding: 40px;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">
	<%
	String admin_id = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	if (admin_id == null || session.isNew()) {
		request.setAttribute("msg", "Unauthorized Access: Please login first.");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
		rd.forward(request, response);
	} else {
		if (role != null && role.equals("admin")) {
	%>
	<%@include file="/admin/admin_header.html"%>

	<div class="admin-hero-container">
		<div class="admin-hero-content">
			<h1 class="admin-hero-title animate__animated animate__fadeInDown">Admin Profile</h1>
			<p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Manage your personal information.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="admin-profile-section">
		<%
		Admindao dao = new Admindao();
		Admins a = dao.viewProfile(admin_id);
		%>

		<div class="profile-card animate__animated" data-animation="animate__fadeInUp">
			<div class="profile-sidebar">
				<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
					alt="Admin Avatar" class="profile-avatar" />
				<h5 class="profile-name"><%=a.getName() %></h5>
				<p class="profile-role">Administrator</p>
				<a href="/Drivingmitra/admin/admin_edit_profile.jsp" class="profile-edit-link">
					<i class="far fa-edit"></i> Edit Profile
				</a>
			</div>
			<div class="profile-details-content">
				<h6>Your Information</h6>
				<hr>
				<div class="profile-info-row">
					<div class="profile-info-col">
						<h6>Email</h6>
						<p><%=a.getEmail() %></p>
					</div>
					<div class="profile-info-col">
						<h6>Phone</h6>
						<p><%=a.getPhone() %></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<%
		} else {
			request.setAttribute("msg", "You are not authorized to access this page.");
			RequestDispatcher rd = request.getRequestDispatcher("/admin/admin_login.jsp");
			rd.forward(request, response);
		}
	}
	%>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const profileCard = document.querySelector('.profile-card');
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const card = entry.target;
                        const animationClass = card.dataset.animation || 'animate__fadeInUp';
                        card.classList.add('animate__animated', animationClass);
                        observer.unobserve(card);
                    }
                });
            }, {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            });

            if (profileCard) {
                observer.observe(profileCard);
            }
        });
    </script>
</body>
</html>