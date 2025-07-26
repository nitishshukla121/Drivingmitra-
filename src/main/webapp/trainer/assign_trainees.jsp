<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,java.util.*,dm.beans.Assignment"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assigned Trainees - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
:root {
    --trainer-primary-bg: #4CAF50;
    --trainer-secondary-bg: #66BB6A;
    --trainer-text-dark: #333333;
    --trainer-text-light: #ffffff;
    --trainer-accent-color: #FFC107;
    --trainer-separator-color: rgba(255, 255, 255, 0.3);
    --trainer-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --trainer-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --table-header-bg: #e0e0e0;
    --table-border-color: #ddd;
    --table-row-odd-bg: #f9f9f9;
    --table-row-even-bg: #ffffff;
    --table-row-hover-bg: #f0f0f0;

    --trainer-footer-bg: #222;
    --trainer-footer-text: #bbb;
}

body {
    margin: 0;
    font-family: 'Roboto', sans-serif;
    background-color: var(--trainer-primary-bg);
    color: var(--trainer-text-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

a {
    color: var(--trainer-accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #FFD700;
    text-decoration: underline;
}

.trainer-hero-container {
    position: relative;
    width: 100%;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--trainer-primary-bg), var(--trainer-secondary-bg));
    color: var(--trainer-text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
    margin-top: 60px;
}

.trainer-hero-content {
    z-index: 2;
    padding: 20px;
}

.trainer-hero-title {
    font-family: 'Roboto Condensed', sans-serif;
    font-size: 3.5em;
    font-weight: bold;
    text-shadow: var(--trainer-heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.trainer-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    opacity: 0.9;
}

.assigned-trainees-hero {
    background: linear-gradient(135deg, #1abc9c, #16a085);
}

.separator {
    height: 2px;
    background-color: var(--trainer-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.trainer-table-section {
    padding: 40px 20px;
    max-width: 1400px;
    margin: 0 auto;
    background-color: var(--trainer-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--trainer-box-shadow);
    color: var(--trainer-text-light);
    overflow-x: auto;
}

.trainer-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: var(--admin-card-bg);
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

.trainer-table thead th {
    background-color: var(--table-header-bg);
    color: var(--trainer-text-dark);
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
    color: var(--trainer-text-dark);
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

.no-trainees-message {
    color: var(--trainer-text-light);
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
    .trainer-hero-container {
        height: 200px;
        margin-top: 50px;
    }
    .trainer-hero-title {
        font-size: 2.5em;
    }
    .trainer-hero-subtitle {
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
    .trainer-hero-container {
        height: 400px;
        margin-top: 70px;
    }
    .trainer-hero-title {
        font-size: 5em;
    }
    .trainer-hero-subtitle {
        font-size: 1.5em;
    }
    .trainer-table-section {
        padding: 60px 30px;
    }
}
</style>

</head>
<body style="background-color: #C19A6B;">
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

	<div class="trainer-hero-container assigned-trainees-hero">
		<div class="trainer-hero-content">
			<h1 class="trainer-hero-title animate__animated animate__fadeInDown">Assigned Trainees</h1>
			<p class="trainer-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">View your assigned trainees.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="trainer-table-section">
		<%
		Trainerdao dao = new Trainerdao();
		ArrayList<Assignment> traineeList = dao.viewTrainees(trainer_id);
		%>
		<% if (traineeList != null && !traineeList.isEmpty()) { %>
		<table class="trainer-table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
					<th>City</th>
					<th>Address</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Assignment t : traineeList) {
				%>
				<tr>
					<td><%=t.getTr().getName()%></td>
					<td><%=t.getTr().getEmail()%></td>
					<td><%=t.getTr().getPhone()%></td>
					<td><%=t.getTr().getCity()%></td>
					<td><%=t.getTr().getAddress()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<% } %>
		
    </div>

    <div class="separator"></div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';
        });
    </script>
<% 
    } // closes if (role != null && role.equals("trainer"))
} // closes else for session check
%>
</body>
</html>
