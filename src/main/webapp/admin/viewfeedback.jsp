<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,java.util.*,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Support Requests - Driving School Arena</title>

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

    --table-header-bg: #e0e0e0;
    --table-border-color: #ddd;
    --table-row-odd-bg: #f9f9f9; /* Light stripe */
    --table-row-even-bg: #ffffff; /* White stripe */
    --table-row-hover-bg: #f0f0f0; /* Lighter on hover */

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

.view-contacts-hero {
    background: linear-gradient(135deg, #FF6F61, #FFC14D); /* Warm gradient, like support/attention */
}

.separator {
    height: 2px;
    background-color: var(--admin-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.admin-table-section {
    padding: 40px 20px;
    max-width: 1400px;
    margin: 0 auto;
    background-color: var(--admin-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--admin-box-shadow);
    color: var(--admin-text-light);
    overflow-x: auto;
}

.admin-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    background-color: var(--admin-card-bg);
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1); /* Subtle shadow for the table itself */
}

.admin-table thead th {
    background-color: var(--table-header-bg);
    color: var(--admin-text-dark);
    font-weight: bold;
    padding: 12px 15px;
    text-align: left;
    border-bottom: 2px solid var(--table-border-color);
    text-transform: uppercase; /* Make headers uppercase */
    font-size: 0.9em;
}

.admin-table tbody td {
    padding: 10px 15px;
    border-bottom: 1px solid var(--table-border-color);
    color: var(--admin-text-dark);
    font-size: 0.95em;
    word-break: break-word; /* Allow long words to break */
}

.admin-table tbody tr:last-child td {
    border-bottom: none;
}

.admin-table tbody tr:nth-child(odd) {
    background-color: var(--table-row-odd-bg);
}

.admin-table tbody tr:nth-child(even) {
    background-color: var(--table-row-even-bg);
}

.admin-table tbody tr:hover {
    background-color: var(--table-row-hover-bg);
}

.no-contacts-message {
    color: var(--admin-text-light);
    font-size: 1.5em;
    text-align: center;
    padding: 50px 20px;
    margin: 0 auto;
    max-width: 800px;
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
    .admin-table-section {
        padding: 20px 10px;
    }
    .admin-table thead th {
        padding: 8px 10px;
        font-size: 0.8em;
    }
    .admin-table tbody td {
        padding: 6px 10px;
        font-size: 0.8em;
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
    .admin-table-section {
        padding: 60px 30px;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">
	<%@include file="/admin/admin_header.html"%>

    <div class="admin-hero-container view-contacts-hero">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Support Requests</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Review messages from users.</p>
        </div>
    </div>

    <div class="separator"></div>

	<div class="admin-table-section">
		<%
		Admindao dao = new Admindao();
		ArrayList<Feedbacks> feedbackList = dao.viewfeebacks();
		
		// NOTE: Your page is named "view contacts" but fetches feedbackList.
		// Assuming Feedbacks bean also has methods for Name, Email, Remarks, Rating.
		// If 'viewfeebacks()' actually returns contact messages, consider renaming the ArrayList variable
		// and the loop variable for clarity (e.g., 'contactList', 'c').
		// For now, I'm using your existing 'feedbackList' and 'f' variables.
		%>
		
		<% if (feedbackList != null && !feedbackList.isEmpty()) { %>
		<table class="admin-table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Query/Remark</th>
					<th>Rating</th>
				</tr>
			</thead>
			<tbody>
			<%
			for( Feedbacks f: feedbackList) {
			%>
			<tr>
				<td><%=f.getName()%></td>
				<td><%=f.getEmail()%></td>
				<td><%=f.getRemarks()%></td>
				<td>
                    <%
                    // Display rating visually, e.g., with stars if applicable, or just the number
                    int rating = 0;
                    try {
                        rating = Integer.parseInt(f.getRating());
                    } catch (NumberFormatException e) {
                        System.err.println("Invalid rating format for user " + f.getName() + ": " + f.getRating());
                    }
                    if (rating > 0) {
                        for (int i = 0; i < rating; i++) { %>
                            <i class="fas fa-star" style="color: gold;"></i>
                        <% }
                    } else { %>
                        <%= f.getRating() %>
                    <% } %>
                </td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table>
		<% } else { %>
		<p class="no-contacts-message">No support requests/feedback messages available.</p>
		<% } %>
	</div>

    <div class="separator"></div>

	<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>