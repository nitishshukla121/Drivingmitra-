<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="dm.dao.* ,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainer Home - Driving School Arena</title>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
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

    --trainer-hero-gradient-start: #4FC3F7; /* Light Blue */
    --trainer-hero-gradient-end: #29B6F6; /* Brighter Blue */

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

.page-hero-container {
    position: relative;
    width: 100%;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--admin-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px;
}

.page-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3.5em;
    font-weight: bold;
    text-shadow: var(--admin-heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.page-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    opacity: 0.9;
}

.trainer-portal-hero {
    background: linear-gradient(135deg, var(--trainer-hero-gradient-start), var(--trainer-hero-gradient-end));
}

.separator {
    height: 2px;
    background-color: var(--admin-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.admin-dashboard-section {
    padding: 40px 20px;
    max-width: 1200px;
    margin: 0 auto;
    background-color: var(--admin-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--admin-box-shadow);
    color: var(--admin-text-light);
}

.admin-dashboard-section h1 {
    text-align: center;
    color: var(--admin-text-light);
    font-family: var(--font-serif);
    font-size: 2.5em;
    margin-bottom: 40px;
    text-shadow: var(--admin-heading-shadow);
}

.admin-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 30px;
    justify-items: center;
}

.admin-card {
    background-color: var(--admin-card-bg);
    color: var(--admin-text-dark);
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    padding: 25px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    opacity: 0;
    transform: translateY(20px);
    animation-fill-mode: both;
    height: 220px; /* Fixed height for consistent card size */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
}

.admin-card.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.admin-card:hover {
    transform: translateY(-5px) scale(1.02);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
}

.admin-card-icon {
    font-size: 3em;
    color: var(--admin-accent-color);
    margin-bottom: 15px;
    transition: transform 0.3s ease;
}

.admin-card:hover .admin-card-icon {
    transform: translateY(-5px);
}

.admin-card h2 {
    font-size: 1.5em;
    color: var(--admin-accent-color);
    margin-bottom: 15px;
    font-family: 'Roboto Condensed', sans-serif;
}

.admin-link-box {
    display: block;
    width: 100%;
    padding: 10px 15px;
    background-color: var(--admin-accent-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    margin-top: auto;
}

.admin-link-box:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.admin-link-box a {
    color: inherit;
    text-decoration: none;
    display: block;
}

/* Trainer Profile Card specifics */
.trainer-profile-card {
    background-color: var(--admin-card-bg);
    color: var(--admin-text-dark);
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
    padding: 25px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    opacity: 0;
    transform: translateY(20px);
    animation-fill-mode: both;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    grid-column: 1 / -1; /* Span full width in grid for larger profile card */
    margin-bottom: 30px; /* Space below profile card */
}

.trainer-profile-card.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.trainer-profile-card:hover {
    transform: translateY(-5px) scale(1.01);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
}

.profile-avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid var(--admin-accent-color);
    margin-bottom: 15px;
}

.profile-details-grid {
    display: grid;
    grid-template-columns: 1fr 1fr; /* Two columns for details */
    gap: 10px 20px; /* Row and column gap */
    width: 100%;
    text-align: left;
    margin-top: 15px;
}

.profile-detail-item {
    font-size: 0.95em;
    line-height: 1.4;
    color: var(--admin-text-dark);
    word-break: break-word; /* Allow long words to break */
}

.profile-detail-item strong {
    color: var(--admin-accent-color);
    margin-right: 5px;
    font-size: 1.05em;
}

.profile-edit-button {
    display: inline-block;
    padding: 8px 15px;
    background-color: var(--admin-accent-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    margin-top: 20px;
}

.profile-edit-button:hover {
    background-color: #2980b9;
    transform: translateY(-2px);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.btn-logout { /* Specific style for logout button */
    display: block;
    width: 150px;
    padding: 10px 20px;
    background-color: #dc3545; /* Red color for logout */
    color: var(--admin-text-light);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    margin: 40px auto 0 auto; /* Center button below dashboard */
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-logout:hover {
    background-color: #c82333;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
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

@media (max-width: 576px) {
    .page-hero-container {
        height: 200px;
        margin-top: 50px;
    }
    .page-hero-title {
        font-size: 2.5em;
    }
    .page-hero-subtitle {
        font-size: 1em;
    }
    .admin-dashboard-section {
        padding: 20px 10px;
    }
    .admin-dashboard-section h1 {
        font-size: 2em;
        margin-bottom: 30px;
    }
    .admin-grid {
        grid-template-columns: 1fr;
    }
    .admin-card {
        height: 180px;
        padding: 20px;
    }
    .admin-card-icon {
        font-size: 2.5em;
        margin-bottom: 10px;
    }
    .admin-card h2 {
        font-size: 1.3em;
    }
    .admin-link-box {
        padding: 8px 10px;
        font-size: 0.9em;
    }
    .trainer-profile-card {
        flex-direction: column;
        padding: 20px;
        min-height: auto;
        height: auto;
    }
    .profile-avatar {
        width: 80px;
        height: 80px;
        margin-bottom: 10px;
    }
    .profile-details-grid {
        grid-template-columns: 1fr;
        gap: 5px 0;
        text-align: center;
    }
    .profile-detail-item {
        font-size: 0.9em;
    }
    .profile-detail-item strong {
        display: block;
        font-size: 1em;
    }
    .profile-edit-button {
        font-size: 0.9em;
        padding: 6px 12px;
    }
    .btn-logout {
        width: 120px;
        padding: 8px 15px;
        font-size: 0.9em;
    }
}

@media (min-width: 768px) {
    .page-hero-container {
        height: 400px;
        margin-top: 70px;
    }
    .page-hero-title {
        font-size: 5em;
    }
    .page-hero-subtitle {
        font-size: 1.5em;
    }
    .admin-dashboard-section {
        padding: 60px 30px;
    }
    .admin-dashboard-section h1 {
        font-size: 3.5em;
    }
    .admin-grid {
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    }
    .admin-card {
        height: 220px;
    }
    .admin-card h2 {
        font-size: 1.8em;
    }
    .trainer-profile-card {
        flex-direction: row;
        padding: 30px;
    }
    .profile-avatar {
        width: 120px;
        height: 120px;
    }
    .profile-details-grid {
        grid-template-columns: 1fr 1fr;
        gap: 10px 30px;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">
<%@include file="/trainer/trainer_header.html" %>

	<%
	String trainer_id = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	if (trainer_id == null || session.isNew()) {
		request.setAttribute("msg", "Unauthorized Access: Please login first.");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/trainer_login.jsp");
		rd.forward(request, response);

	} else {
		if (role != null && role.equals("trainer")) {
	%>

	<div class="page-hero-container trainer-portal-hero">
		<div class="hero-content">
			<h1 class="page-hero-title animate__animated animate__fadeInDown">Trainer Portal</h1>
			<p class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Manage your training activities.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="admin-dashboard-section">
	    <h1>Welcome, <%= trainer_id %>!</h1>
        <div class="admin-grid">
            <%
            Trainerdao dao = new Trainerdao();
            TrainerAccount t = dao.viewProfile(trainer_id);
            %>
            <div class="trainer-profile-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.1s">
               <!--   <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp"
                    alt="Trainer Avatar" class="profile-avatar"> -->
                <div class="profile-details-grid">
                    <p class="profile-detail-item"><strong>ID:</strong> <%=t.getTrainer_id()%></p>
                    <p class="profile-detail-item"><strong>Name:</strong> <%=t.getName()%></p>
                    <p class="profile-detail-item"><strong>Email:</strong> <%=t.getEmail()%></p>
                    <p class="profile-detail-item"><strong>Contact:</strong> <%=t.getPhone()%></p>
                    <p class="profile-detail-item"><strong>Experience:</strong> <%=t.getExperience()%></p>
                    <p class="profile-detail-item"><strong>Gender:</strong> <%=t.getGender()%></p>
                    <p class="profile-detail-item" style="grid-column: 1 / -1;"><strong>Address:</strong> <%=t.getAddress()%></p>
                    <p class="profile-detail-item" style="grid-column: 1 / -1;"><strong>Description:</strong> <%=t.getDricption()%></p>
                </div>
                <a href="/Drivingmitra/trainer/trainer_edit_profile.jsp" class="profile-edit-button">
                    <i class="far fa-edit"></i> Edit Profile
                </a>
            </div>

            <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.2s">
                <i class="fas fa-chart-line admin-card-icon"></i>
                <h2>Performance Tracking</h2>
                <div class="admin-link-box">
                    <a href="/Drivingmitra/trainer/performance.jsp">Fill Performance</a>
                </div>
            </div>

            <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.3s">
                <i class="fas fa-road admin-card-icon"></i>
                <h2>Ride Log Management</h2>
                <div class="admin-link-box">
                    <a href="/Drivingmitra/trainer/RideLogManagement.jsp">Manage Ride Logs</a>
                </div>
            </div>
            
            <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.4s">
                <i class="fas fa-lightbulb admin-card-icon"></i>
                <h2>Tips</h2>
                <div class="admin-link-box">
                    <a href="/Drivingmitra/trainer/add_tips.jsp">Add Tips</a>
                </div>
            </div>

            <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.5s">
                <i class="fas fa-users admin-card-icon"></i>
                <h2>Assigned Trainees</h2>
                <div class="admin-link-box">
                    <a href="/Drivingmitra/trainer/assign_trainees.jsp">View Trainees</a>
                </div>
            </div>

            <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.6s">
                <i class="fas fa-comments admin-card-icon"></i>
                <h2>Contact Queries</h2>
                <div class="admin-link-box">
                    <a href="/Drivingmitra/trainer/trainer_viewfeedback.jsp">View Queries</a>
                </div>
            </div>
        </div>

        <button class="btn-logout">
            <a href="/Drivingmitra/Trainer_Logout">Logout</a>
        </button>
	</div>

	<%
		} else {
		request.setAttribute("msg", "You are not authorized to access this page.");
		RequestDispatcher rd = request.getRequestDispatcher("/admin/trainer_login.jsp");
		rd.forward(request, response);
		}
	}
	%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            // --- Scroll Animations for Cards ---
            const dashboardItems = document.querySelectorAll('.trainer-profile-card, .admin-card');
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const item = entry.target;
                        // Animate.css classes and delays are already in HTML
                        item.style.opacity = '1';
                        item.style.transform = 'translateY(0)';
                        observer.unobserve(item);
                    }
                });
            }, {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            });

            dashboardItems.forEach(item => {
                observer.observe(item);
            });
        });
    </script>
</body>
</html>