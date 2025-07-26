<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vehicle Tracking - Driving School Arena</title>

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
    --table-row-odd-bg: #f9f9f9;
    --table-row-even-bg: #ffffff;
    --table-row-hover-bg: #f0f0f0;

    --btn-track-bg: #FFC107; /* Warning-like color for Track button */
    --btn-track-text: #333;
    --btn-track-hover-bg: #ffae00;

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

.ride-tracking-hero {
    background: linear-gradient(135deg, #FF6F61, #FFC14D);
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
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

.admin-table thead th {
    background-color: var(--table-header-bg);
    color: var(--admin-text-dark);
    font-weight: bold;
    padding: 12px 15px;
    text-align: left;
    border-bottom: 2px solid var(--table-border-color);
    text-transform: uppercase;
    font-size: 0.9em;
}

.admin-table tbody td {
    padding: 10px 15px;
    border-bottom: 1px solid var(--table-border-color);
    color: var(--admin-text-dark);
    font-size: 0.95em;
    word-break: break-word;
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

.btn-track-vehicle {
    padding: 8px 15px;
    background-color: var(--btn-track-bg);
    color: var(--btn-track-text);
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
}

.btn-track-vehicle:hover {
    background-color: var(--btn-track-hover-bg);
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
}

.no-rides-message {
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
<%
String id=(String)session.getAttribute("sessionKey");
if(id==null)
{
    // If Messages.UNATHORIZED_MESSAGE is a constant you have defined elsewhere, use it.
    // Otherwise, provide a direct string message.
    request.setAttribute("msg", "Unauthorized Access: Please login first.");
    RequestDispatcher rd=request.getRequestDispatcher("/admin/admin_login.jsp");
    rd.forward(request, response);
}
else
{
%>
	<%@include file="/admin/admin_header.html"%>

    <div class="admin-hero-container ride-tracking-hero">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Vehicle Ride Logs</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Review past and ongoing vehicle activities.</p>
        </div>
    </div>

    <div class="separator"></div>

    <div class="admin-table-section">
        <%
        Traineedao dao = new Traineedao();
        ArrayList<Ride_log> ridlist= dao.viewRideAdmin();
        %>

        <% if (ridlist != null && !ridlist.isEmpty()) { %>
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Device Number</th>
                    <th>Vehicle Number</th>
                    <th>Trainer ID</th>
                    <th>Trainee ID</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Track Vehicle</th>
                </tr>
            </thead>
            <tbody>
                <%
                for(Ride_log r:ridlist) {
                    Vehicle_Details vd = r.getVd();
                %>
                <tr>
                    <td><%=vd.getDeviceno()%></td>
                    <td><%=r.getVehicle_no() %></td>
                    <td><%=r.getTrainer_id() %></td>
                    <td><%=r.getTrainee_id() %></td>
                    <td><%=r.getSource() %></td>
                    <td><%=r.getDestination() %></td>
                    <td><a href="/Drivingmitra/admin/livetrack.jsp?did=<%=vd.getDeviceno() %>"><button class="btn-track-vehicle">Track Vehicle</button></a></td>
                </tr>
                <%} %>
            </tbody>
        </table>
        <% } else { %>
        <p class="no-rides-message">No ride logs available.</p>
        <% } %>
    </div>

    <div class="separator"></div>

<%}%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>