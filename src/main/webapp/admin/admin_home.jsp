<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Home - Driving School Arena</title>

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
    height: 220px;
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
        padding: 20px;
        height: 180px;
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
}

@media (min-width: 768px) {
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
        <h1 class="admin-hero-title animate__animated animate__fadeInDown">Admin Portal</h1>
        <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Manage Driving School Arena</p>
    </div>
</div>

<div class="separator"></div>

<div class="admin-dashboard-section">
    <h1>Welcome, <%= admin_id %>!</h1>
    <div class="admin-grid">
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp">
            <i class="fas fa-user-cog admin-card-icon"></i>
            <h2>Manage Profile</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/admin_profile.jsp">View Profile</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.1s">
            <i class="fas fa-user-tie admin-card-icon"></i>
            <h2>Assign Trainer</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/assign_trainer.jsp">Assign Trainer</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.2s">
            <i class="fas fa-users admin-card-icon"></i>
            <h2>Manage Trainees</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/panding_admission.jsp">Manage Trainees</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.3s">
            <i class="fas fa-chalkboard-teacher admin-card-icon"></i>
            <h2>Manage Instructors</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/trainer_account.jsp">Manage Instructors</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.4s">
            <i class="fas fa-book-open admin-card-icon"></i>
            <h2>Manage Lessons</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/cource_details.jsp">Manage Lessons</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.5s">
            <i class="fas fa-calendar-alt admin-card-icon"></i>
            <h2>Events</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/event.jsp">Manage Events</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.6s">
            <i class="fas fa-comments admin-card-icon"></i>
            <h2>Manage Feedback</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/viewfeedback.jsp">View Feedback</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.7s">
            <i class="fas fa-headset admin-card-icon"></i>
            <h2>Manage Support</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/viewcontacts.jsp">View Support Requests</a>
            </div>
        </div>
        <div class="admin-card animate__animated" data-animation="animate__fadeInUp animate__delay-0.8s">
            <i class="fas fa-map-marker-alt admin-card-icon"></i>
            <h2>Track Vehicle</h2>
            <div class="admin-link-box">
                <a href="/Drivingmitra/admin/Vehicle_Tracking.jsp">Track Vehicle</a>
                
            </div>
        </div>
    </div>
</div>

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
        const adminCards = document.querySelectorAll('.admin-card');
        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const card = entry.target;
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                    observer.unobserve(card);
                }
            });
        }, {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        });

        adminCards.forEach(card => {
            observer.observe(card);
        });
    });
</script>
</body>
</html>
