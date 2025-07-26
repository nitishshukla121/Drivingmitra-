<%@page import="dm.beans.Ride_log"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,java.util.*,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Performance - Driving School Arena</title>

<%@include file="/common/common_css.html"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
:root {
    --trainee-primary-bg: #E5AA70;
    --trainee-secondary-bg: #FFDAB9;
    --trainee-text-dark: #333333;
    --trainee-text-light: #ffffff;
    --trainee-accent-color: #FF6347;
    --trainee-separator-color: rgba(255, 255, 255, 0.4);
    --trainee-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --trainee-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --table-header-bg: #e0e0e0;
    --table-border-color: #ddd;
    --table-row-odd-bg: #f9f9f9;
    --table-row-even-bg: #ffffff;
    --table-row-hover-bg: #f0f0f0;

    --trainee-footer-bg: #222;
    --trainee-footer-text: #bbb;
}

body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--trainee-primary-bg);
    color: var(--trainee-text-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

a {
    color: var(--trainee-accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #FF8C00;
    text-decoration: underline;
}

.page-hero-container {
    position: relative;
    width: 100%;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--trainee-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px;
}

.page-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3.5em;
    font-weight: bold;
    text-shadow: var(--trainee-heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.page-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    opacity: 0.9;
}

.performance-view-hero {
    background: linear-gradient(135deg, #FF6F61, #FFC107);
}

.separator {
    height: 2px;
    background-color: var(--trainee-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.trainer-table-section {
    padding: 40px 20px;
    max-width: 1400px;
    margin: 0 auto;
    background-color: var(--trainee-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--trainee-box-shadow);
    color: var(--trainee-text-light);
    overflow-x: auto;
}

.trainer-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: var(--trainee-card-bg);
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

.trainer-table thead th {
    background-color: var(--table-header-bg);
    color: var(--trainee-text-dark);
    font-weight: bold;
    padding: 12px 15px;
    text-align: left;
    border-bottom: 2px solid var(--table-border-color);
    text-transform: uppercase;
    font-size: 0.9em;
}

.trainer-table tbody td {
    padding: 10px 15px;
    border-bottom: 1px solid var(--table-border-color);
    color: var(--trainee-text-dark);
    font-size: 0.95em;
    word-break: break-word;
}

.trainer-table tbody tr:last-child td {
    border-bottom: none;
}

.trainer-table tbody tr:nth-child(odd) {
    background-color: var(--table-row-odd-bg);
}

.trainer-table tbody tr:nth-child(even) {
    background-color: var(--table-row-even-bg);
}

.trainer-table tbody tr:hover {
    background-color: var(--table-row-hover-bg);
}

.no-performance-message {
    color: var(--trainee-text-light);
    font-size: 1.5em;
    text-align: center;
    padding: 50px 20px;
    margin: 0 auto;
    max-width: 800px;
}

.trainer-footer {
    background-color: #222;
    color: #bbb;
    padding: 20px;
    text-align: center;
    margin-top: 60px;
    font-size: 0.85em;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

@media (max-width: 768px) {
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
    .trainer-table-section {
        padding: 20px 10px;
    }
    .trainer-table thead th {
        padding: 8px 10px;
        font-size: 0.8em;
    }
    .trainer-table tbody td {
        padding: 6px 10px;
        font-size: 0.8em;
    }
}

@media (min-width: 769px) {
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
    .trainer-table-section {
        padding: 60px 30px;
    }
}
</style>

</head>
<body style="background-color: #C19A6B;">
 <%-- The original page specified trainee_header.html --%>
 <%@include file="/trainee/trainee_header.html" %>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

	<%
	String trainee_id = (String) session.getAttribute("sessionKey");
	String role = (String) session.getAttribute("role");

	if (trainee_id == null || session.isNew()) {
		request.setAttribute("msg", "Unauthorized Access: Please login first.");
		RequestDispatcher rd = request.getRequestDispatcher("/Drivingmitra/trainee/trainee_login.jsp");
		rd.forward(request, response);

	} else {
		if (role != null && role.equals("Trainee")) {
	%>

	<div class="page-hero-container performance-view-hero">
		<div class="trainer-hero-content">
			<h1 class="page-hero-title animate__animated animate__fadeInDown">Your Performance</h1>
			<p class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Track your progress and achievements.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="trainer-table-section">
		<%
		Traineedao dao = new Traineedao();
		ArrayList<Ride_log> PerformanceList = dao.viewPerformance(trainee_id);
		%>
		<% if (PerformanceList != null && !PerformanceList.isEmpty()) { %>
		<table class="trainer-table">
			<thead>
				<tr>
					<th>Performance Details</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Ride_log r : PerformanceList) {
				%>
				<tr>
					<td><%=r.getTrainee_performance() %></td>
					<td><%=r.getDate() %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<% } else { %>
		<p class="no-performance-message">No performance records available yet.</p>
		<% } %>
	</div>

	<div class="separator"></div>

	<% } else { %>
		<%
		request.setAttribute("msg", "You are not a Trainee. Please login first.");
		RequestDispatcher rd = request.getRequestDispatcher("/trainee/trainee_login.jsp");
		rd.forward(request, response);
		%>
	<% } } %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/traineeperformance.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';
        });
    </script>
</body>
</html>