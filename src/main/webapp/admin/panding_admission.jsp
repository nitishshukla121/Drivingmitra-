<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,java.util.*,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Admissions - Driving School Arena</title>

<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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

    --form-bg-light-transparent: rgba(255, 255, 255, 0.25);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --btn-submit-color: #4CAF50;
    --btn-reset-color: #dc3545;

    --table-header-bg: #e0e0e0;
    --table-border-color: #ddd;
    --table-row-hover-bg: #f5f5f5;
    --ajax-msg-success: #198754;
    --ajax-msg-error: #dc3545;

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
    background: linear-gradient(135deg, #f87609, #ffc107);
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
}

.admin-table thead th {
    background-color: var(--table-header-bg);
    color: var(--admin-text-dark);
    font-weight: bold;
    padding: 12px 15px;
    text-align: left;
    border-bottom: 2px solid var(--table-border-color);
}

.admin-table tbody td {
    padding: 10px 15px;
    border-bottom: 1px solid var(--table-border-color);
    color: var(--admin-text-dark);
    font-size: 0.95em;
}

.admin-table tbody tr:last-child td {
    border-bottom: none;
}

.admin-table tbody tr:hover {
    background-color: var(--table-row-hover-bg);
}

.admin-table input[type="radio"] {
    margin-right: 5px;
}

.admin-table th:first-child, .admin-table td:first-child {
    text-align: center;
}

.admin-assign-form-wrapper {
    width: 100%;
    max-width: 500px;
    padding: 30px;
    background-color: var(--form-bg-light-transparent);
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    margin: 40px auto;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.admin-assign-form-wrapper.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.admin-assign-form-wrapper .form-heading {
    font-family: var(--font-serif);
    text-align: center;
    color: var(--admin-text-light);
    font-size: 2.2em;
    margin-bottom: 30px;
    text-shadow: var(--admin-heading-shadow);
}

.form-group-admin {
    margin-bottom: 25px;
    color: var(--admin-text-light);
    font-family: var(--font-sans-serif);
    font-size: 1.1em;
}

.form-group-admin label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-group-admin input[type="text"],
.form-group-admin input[type="password"] {
    width: calc(100% - 24px);
    padding: 12px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--admin-text-light);
    font-size: 1.1em;
    box-sizing: border-box;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.form-group-admin input[type="text"]:focus,
.form-group-admin input[type="password"]:focus {
    outline: none;
    border-color: var(--admin-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

#ajaxmsg {
    display: block;
    margin-top: 10px;
    text-align: center;
    font-weight: bold;
    font-size: 1.1em;
    min-height: 1.5em;
}

.ajax-success {
    color: var(--ajax-msg-success);
}

.ajax-error {
    color: var(--ajax-msg-error);
}

.btn-submit-admin {
    display: block;
    width: 100%;
    padding: 12px 25px;
    background-color: var(--btn-submit-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    margin-top: 30px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-submit-admin:hover {
    background-color: #45a049;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

.no-admission-message {
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
        font-size: 0.85em;
    }
    .admin-table tbody td {
        padding: 6px 10px;
        font-size: 0.8em;
    }
    .admin-assign-form-wrapper {
        padding: 25px;
        max-width: 95%;
    }
    .admin-assign-form-wrapper .form-heading {
        font-size: 1.8em;
        margin-bottom: 20px;
    }
    .form-group-admin {
        font-size: 1em;
        margin-bottom: 20px;
    }
    .form-group-admin label {
        margin-bottom: 5px;
    }
    .form-group-admin input[type="text"],
    .form-group-admin input[type="password"] {
        padding: 10px;
        font-size: 0.9em;
        width: calc(100% - 20px);
    }
    .btn-submit-admin {
        padding: 10px 20px;
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
    .admin-table-section {
        padding: 60px 30px;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">

	<%@include file="/admin/admin_header.html"%>

    <div class="admin-hero-container">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Pending Admissions</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Review and approve new trainee registrations.</p>
        </div>
    </div>

    <div class="separator"></div>

	<div class="admin-table-section">
		<% Traineedao dao= new Traineedao();
		ArrayList<Trainee> TraineeList = dao.viewTrainee();
		if(TraineeList.size()>0)
		{
		%>
		<table class="admin-table">
			<thead>
				<tr>
					<th>Select</th>
					<th>Course</th>
					<th>Name</th>
					<th>Age</th>
					<th>Phone</th>
					<th>Email</th>
					<th>Occupation</th>
					<th>Address</th>
					<th>City</th>
					<th>Learning Licence No.</th>
					<th>Gender</th>
					<th>Mother Name</th>
					<th>Father Name</th>
					<th>Alternate Number</th>
				</tr>
			</thead>
			<tbody>
				<%
				for( Trainee t: TraineeList) {
				%>
				<tr>
					<td><input type="radio" name="formid" value="<%=t.getSnumber()%>"> <%=t.getSnumber()%></td>
					<td><%=t.getSelectcourse()%></td>
					<td><%=t.getName()%></td>
					<td><%=t.getAge()%></td>
					<td><%=t.getPhone()%></td>
					<td><%=t.getEmail()%></td>
					<td><%=t.getOccupation()%></td>
					<td><%=t.getAddress()%></td>
					<td><%=t.getCity()%></td>
					<td><%=t.getLearning_licence()%></td>
					<td><%=t.getGender()%></td>
					<td><%=t.getMothername()%></td>
					<td><%=t.getFathername()%></td>
					<td><%=t.getFathername()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div class="admin-assign-form-wrapper animate__animated" data-animation="animate__fadeInUp">
            <h2 class="form-heading">Assign Trainee ID & Password</h2>
            <form method="post" action="/Drivingmitra/Trainee_account">
                <div class="form-group-admin">
                    <label for="id">Trainee ID:</label>
                    <input type="text" name="id" id="id">
                    <span id="ajaxmsg"></span>
                </div>
                <div class="form-group-admin">
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password">
                </div>
                <button type="submit" class="btn-submit-admin">Submit</button>
            </form>
		</div>
		<%}
		else{%>
		<p class="no-admission-message">No Admission left to confirm.</p>
		<%} %>
	</div>

    <div class="separator"></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/Drivingmitra/common/validation.js"></script>

    <script>
        $(document).ready(function(){
            $("#id").on("input", function(){
               var id = $(this).val();
               if(id.length > 0) {
                    $.ajax({
                        url: "/Drivingmitra/Trainee_account",
                        type : "GET",
                        data:{
                            'id': id,
                        },
                        success: function(response_data) {
                            var ajaxMsgSpan = $("#ajaxmsg");
                            if(response_data && response_data.trim() !== "") {
                                ajaxMsgSpan.text(response_data).addClass('ajax-error').removeClass('ajax-success');
                            } else {
                                ajaxMsgSpan.text("ID is available!").addClass('ajax-success').removeClass('ajax-error');
                            }
                        },
                        error: function() {
                            $("#ajaxmsg").text("Error checking ID availability.").addClass('ajax-error').removeClass('ajax-success');
                        }
                    });
               } else {
                   $("#ajaxmsg").text("").removeClass('ajax-success ajax-error');
               }
            });
        
            const assignFormWrapper = document.querySelector('.admin-assign-form-wrapper');
            if (assignFormWrapper) {
                const formObserver = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const animationClass = entry.target.dataset.animation || 'animate__fadeInUp';
                            entry.target.classList.add(animationClass);
                            observer.unobserve(entry.target);
                        }
                    });
                }, {
                    root: null,
                    rootMargin: '0px',
                    threshold: 0.1
                });
                formObserver.observe(assignFormWrapper);
            }
        });
        
        function validateInput(event) { }
    </script>
</body>
</html>