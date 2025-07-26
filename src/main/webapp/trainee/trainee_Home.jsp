<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.* ,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainee Home</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>


<style>
:root {
    --trainee-primary-bg: #E5AA70;
    --trainee-secondary-bg: #FFDAB9;
    --trainee-card-bg: #ffffff;
    --trainee-text-dark: #333333;
    --trainee-text-light: #ffffff;
    --trainee-accent-color: #FF6347;
    --trainee-separator-color: rgba(255, 255, 255, 0.4);
    --trainee-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --trainee-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --logout-button-bg: #dc3545;
    --logout-button-hover-bg: #c82333;
    --link-box-hover-bg: #FF8C00; /* Darker accent for link-box hover */
}

body {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--trainee-primary-bg);
    color: var(--trainee-text-dark);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    flex-direction: column; /* Allows content to stack vertically */
    background-image: url("/Drivingmitra/images/background.png"); /* Assuming this is your background image */
    background-size: cover;
    background-position: center;
    background-attachment: fixed; /* Parallax effect */
}

.trainee-hero-header { /* New class for the main page title */
    margin-top: 80px; /* Space from top or header */
    margin-bottom: 40px;
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3.5em;
    font-weight: bold;
    color: var(--trainee-text-light);
    text-shadow: var(--trainee-heading-shadow);
    text-align: center;
}

.container {
    max-width: 1200px; /* Increased max-width for better dashboard spread */
    width: 95%; /* Responsive width */
    margin: 20px auto;
    padding: 30px;
    background-color: var(--trainee-secondary-bg);
    border-radius: 15px;
    box-shadow: var(--trainee-box-shadow);
}

h1, h2, h3 {
    text-align: center;
    color: var(--trainee-text-dark);
    text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
}

h1 {
    font-size: 2.5em; /* Specific size for dashboard title */
    margin-bottom: 30px;
    font-family: 'Roboto Condensed', sans-serif;
}

h2 {
    font-size: 1.8em; /* Specific size for card titles */
    margin-bottom: 20px;
    font-family: 'Roboto Condensed', sans-serif;
    color: var(--trainee-accent-color);
}

p {
    margin: 5px 0;
    color: var(--trainee-text-dark);
    font-size: 1.05em; /* Slightly larger text */
    line-height: 1.5;
}

.dashboard {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 30px;
    margin-top: 40px;
}

.profile-info,
.resource,
.support {
    background-color: var(--trainee-card-bg);
    border-radius: 15px;
    padding: 25px;
    box-shadow: var(--trainee-box-shadow);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex; /* Enable flex for vertical alignment */
    flex-direction: column;
    justify-content: space-between; /* Space out content vertically */
    min-height: 200px; /* Ensure a consistent minimum height for all cards */
    text-align: center; /* Center content within cards */
}

.profile-info:hover,
.resource:hover,
.support:hover {
    transform: translateY(-8px); /* More pronounced lift */
    box-shadow: var(--hover-shadow);
}

.profile-info p { /* Profile info specific text */
    text-align: left; /* Align profile details left */
    font-size: 0.95em;
}

.profile-info p strong {
    color: var(--trainee-accent-color);
    margin-right: 5px;
    font-size: 1em;
}


.resource .link-box,
.support .link-box {
    margin-top: auto; /* Pushes link box to bottom of flex container */
}

.link-box {
    display: block; /* Make it a block for full width */
    width: auto; /* Auto width based on content */
    padding: 12px 25px; /* Larger padding */
    background-color: var(--trainee-accent-color);
    color: var(--trainee-text-light);
    border-radius: 8px; /* More rounded corners */
    font-weight: bold;
    font-size: 1.05em; /* Slightly larger font */
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    text-align: center; /* Center text within link box */
    text-decoration: none; /* Remove underline */
}

.link-box:hover {
    background-color: var(--link-box-hover-bg);
    transform: translateY(-3px); /* More pronounced lift */
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.link-box a { /* Ensure the anchor tag itself fills the link-box */
    display: block;
    color: inherit;
    text-decoration: none;
}

.logout {
    text-align: center;
    margin-top: 40px;
}

.btn-logout {
    padding: 12px 30px; /* Larger padding */
    background-color: var(--logout-button-bg);
    color: var(--trainee-text-light);
    border: none;
    border-radius: 8px; /* More rounded corners */
    font-weight: bold;
    font-size: 1.1em;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    text-decoration: none;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
    display: inline-block;
}

.btn-logout:hover {
    background-color: var(--logout-button-hover-bg);
    transform: translateY(-3px); /* More pronounced lift */
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.35);
}

/* Specific styling for the 'Edit Profile' icon link */
.profile-info .far.fa-edit {
    font-size: 1.5em; /* Larger icon */
    color: var(--trainee-accent-color);
    margin-top: 15px; /* Space below text */
    transition: transform 0.2s ease, color 0.3s ease;
}

.profile-info .far.fa-edit:hover {
    transform: scale(1.2);
    color: #FF8C00;
}

/* Ensure images from trainer section are styled */
img {
    max-width: 100%;
    height: auto;
    display: block;
}

@media (max-width: 768px) {
    body {
        padding: 10px;
    }
    .trainee-hero-header {
        font-size: 2.5em;
        margin-top: 50px;
        margin-bottom: 20px;
    }
    .container {
        padding: 20px;
        margin: 10px auto;
    }
    h1 {
        font-size: 2em;
        margin-bottom: 20px;
    }
    h2 {
        font-size: 1.5em;
        margin-bottom: 15px;
    }
    p {
        font-size: 0.95em;
    }
    .dashboard {
        grid-template-columns: 1fr;
        gap: 20px;
        margin-top: 20px;
    }
    .profile-info,
    .resource,
    .support {
        padding: 20px;
        min-height: 180px; /* Adjusted min height for mobile */
    }
    .link-box {
        padding: 10px 20px;
        font-size: 0.95em;
    }
    .btn-logout {
        padding: 10px 20px;
        font-size: 0.95em;
        width: 120px;
    }
    .profile-info p {
        font-size: 0.9em;
    }
}

@media (min-width: 769px) and (max-width: 1024px) {
    .dashboard {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* More columns on tablets */
    }
    .container {
        padding: 30px;
    }
    .profile-info,
    .resource,
    .support {
        min-height: 220px;
    }
}
</style>

</head>
<body style="background-color: powderblue;">



	<h1 class="trainee-hero-header">Trainee Home</h1>


	
	<%String id = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	if (id == null || session.isNew()) {
		request.setAttribute("msg", "Unauthorized Access: Please login first.");
		RequestDispatcher rd = request.getRequestDispatcher("/trainee/trainee_login.jsp");
		rd.forward(request, response);

	} else {
		if (role != null && role.equals("Trainee")) {%>
	
	<div class="container">

		<%
		Traineedao dao = new Traineedao();
		Trainee t = dao.viewProfile(id);
		TrainerAccount a = dao.viewTrainer(id);
		%>



		<h1>Welcome to Driving School Arena Trainee Portal</h1>


		<div class="dashboard">
			<div class="profile-info">
				<h2>Profile</h2>
				<p>
					<strong>Name:</strong>
					<%=t.getName()%>
				</p>
				<p>
					<strong>Age:</strong>
					<%=t.getAge()%>
				</p>
				<p>
					<strong>Email:</strong>
					<%=t.getEmail()%>

				</p>
				<p>
					<strong>Contact Number:</strong>
					<%=t.getPhone()%>

				</p>
				<p>
					<strong>Address:</strong>
					<%=t.getAddress()%>

				</p>
				<a href="/Drivingmitra/trainee/edit_trainee_profile.jsp"><i
					class="far fa-edit mb-5"></i></a>

			</div>

			<div class="resource">
				<h2>Performance</h2>
				<div class="link-box">
					<strong>Performance:</strong> <a
						href="/Drivingmitra/trainee/performance.jsp">View
						performance </a>
				</div>
			</div>
			<div class="profile-info">
				<h2>Assigned Trainer</h2>
				<% if (a != null) { %>
				<p>
					<strong>Name:</strong>
					<%=a.getName()%>
				</p>
				<p>
					<strong>Gender:</strong>
					<%=a.getGender()%>
				</p>
				<p>
					<strong>Email:</strong>
					<%=a.getEmail()%>
				</p>
				<p>
					<strong>Contact Number:</strong>
					<%=a.getPhone()%>

				</p>
				<% } else { %>
				<p>No trainer assigned yet.</p>
				<% } %>

			</div>
			<!--  <div class="resource">
				<h2>Feedback</h2>
				<div class="link-box">
					<strong>Submit Feedback:</strong> <a
						href="/Drivingmitra/common_jsp/feedback.jsp">Feedback </a>
				</div>
			</div>
			<div class="resource">
				<h2>Support</h2>
				<div class="link-box">
					<strong>Contact Support:</strong> <a
						href="/Drivingmitra/common_jsp/contact_us.jsp">Contact </a>
				</div>
			</div>-->
			<div class="support">
				<h2>TrackVehicle</h2>
				<div class="link-box">
					<strong>Track:</strong> <a href="/Drivingmitra/common_jsp/livetrack.jsp">TrackVehicle</a>
				</div>
			</div>


		</div>

		<%
	} else {
	request.setAttribute("msg", "You are not a Trainee. Please login first.");
	RequestDispatcher rd = request.getRequestDispatcher("/trainee/trainee_login.jsp");
	rd.forward(request, response);
	}
	}%>
		<button class="btn-logout" >
			<a href="/Drivingmitra/Trainee_logout">Logout </a>
		</button>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>