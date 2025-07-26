<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ride Log Management - Driving School Arena</title>

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

    --form-bg-transparent: rgba(255, 255, 255, 0.2);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --input-border-color: rgba(255, 255, 255, 0.4);
    --button-submit-bg: #FF6F61;
    --button-submit-hover: #E55B4C;

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

.ride-log-hero {
    background: linear-gradient(135deg, #008CBA, #00BFFF); /* A blue gradient for ride log/maps */
}

.separator {
    height: 2px;
    background-color: var(--trainer-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.trainer-form-section {
    padding: 40px 20px;
    max-width: 800px;
    margin: 0 auto;
    background-color: var(--trainer-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--trainer-box-shadow);
    color: var(--trainer-text-light);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 50vh;
}

.trainer-form-wrapper {
    width: 100%;
    padding: 30px;
    background-color: var(--form-bg-transparent);
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.trainer-form-wrapper.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.trainer-form-wrapper h2 {
    font-family: var(--font-serif);
    text-align: center;
    color: var(--trainer-text-light);
    font-size: 2.2em;
    margin-bottom: 30px;
    text-shadow: var(--trainer-heading-shadow);
}

.form-group-trainer {
    margin-bottom: 25px;
    color: var(--trainer-text-light);
    font-family: var(--font-sans-serif);
    font-size: 1.1em;
}

.form-group-trainer label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-group-trainer input[type="text"],
.form-group-trainer input[type="time"],
.form-group-trainer select {
    width: calc(100% - 24px);
    padding: 12px;
    border: 1px solid var(--input-border-color);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--trainer-text-light);
    font-size: 1.1em;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background-repeat: no-repeat;
    background-position: right 10px top 50%;
    background-size: 12px auto;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.form-group-trainer select {
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292%22%20height%3D%22292%22%3E%3Cpath%20fill%3D%22%23ffffff%22%20d%3D%22M287%2C197L146%2C56L5%2C197H287z%22%2F%3E%3C%2Fsvg%3E');
}

.form-group-trainer input[type="text"]:focus,
.form-group-trainer input[type="time"]:focus,
.form-group-trainer select:focus {
    outline: none;
    border-color: var(--trainer-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.form-buttons-trainer {
    display: flex;
    justify-content: flex-end;
    gap: 15px;
    margin-top: 30px;
}

.btn-submit-trainer {
    display: block;
    width: auto;
    padding: 12px 30px;
    background-color: var(--button-submit-bg);
    color: var(--trainer-text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    margin: 30px auto 0 auto;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
}

.btn-submit-trainer:hover {
    background-color: var(--button-submit-hover);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
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

@media (max-width: 576px) {
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
    .trainer-form-section {
        padding: 20px 10px;
        min-height: auto;
    }
    .trainer-form-wrapper {
        padding: 20px;
    }
    .trainer-form-wrapper h2 {
        font-size: 1.8em;
        margin-bottom: 20px;
    }
    .form-group-trainer {
        font-size: 1em;
        margin-bottom: 20px;
    }
    .form-group-trainer label {
        width: 100%;
        margin-bottom: 5px;
    }
    .form-group-trainer input[type="text"],
    .form-group-trainer input[type="time"],
    .form-group-trainer select {
        padding: 10px;
        font-size: 1em;
        width: calc(100% - 20px);
    }
    .btn-submit-trainer {
        padding: 10px 20px;
        font-size: 1em;
    }
}

@media (min-width: 768px) {
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
    .trainer-form-section {
        padding: 60px 30px;
    }
    .trainer-form-wrapper h2 {
        font-size: 2.8em;
    }
}
</style>

</head>
<body style="background-color: #C19A6B;">
	<%@include file="/trainer/trainer_header.html"%>

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

	<%
	Admindao dao = new Admindao();
	ArrayList<Assignment> assignList = dao.trainerWiseTrainee(trainer_id);
	%>

	<div class="trainer-hero-container ride-log-hero">
		<div class="trainer-hero-content">
			<h1 class="trainer-hero-title animate__animated animate__fadeInDown">Ride Log Management</h1>
			<p class="trainer-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Record ride details for your trainees.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="trainer-form-section">
		<% if (assignList.isEmpty()) { %>
		<p class="no-trainees-message">No trainees assigned to you yet to log rides for.</p>
		<% } else { %>
		<div class="trainer-form-wrapper animate__animated" data-animation="animate__fadeInUp">
			<h2>Log a New Ride</h2>
			<form method="post" action="/Drivingmitra/Ridelog">
				<div class="form-group-trainer">
					<label for="trainee_id">Select Trainee:</label>
					<select name="trainee_id" id="trainee_id" required>
						<option value="">Select Trainee</option>
						<%
						for (Assignment a : assignList) {
						%>
						<option value="<%=a.getTrainee_id()%>"><%=a.getTrainee_id()%> - <%=a.getTr().getName()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="form-group-trainer">
					<label for="Source">Source:</label>
					<input type="text" name="Source" id="Source" placeholder="Enter starting location" required>
				</div>
				<div class="form-group-trainer">
					<label for="Destination">Destination:</label>
					<input type="text" name="Destination" id="Destination" placeholder="Enter destination location" required>
				</div>
				<div class="form-group-trainer">
					<label for="time">Time:</label>
					<input type="time" name="time" id="time" required>
				</div>
				<div class="form-buttons-trainer">
					<button type="submit" class="btn-submit-trainer">Submit Ride Log</button>
				</div>
			</form>
		</div>
		<% } %>
	</div>

	<div class="separator"></div>
	
	<% } } %>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';

            const formWrapper = document.querySelector('.trainer-form-wrapper');
            if (formWrapper) {
                const observer = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const animationClass = formWrapper.dataset.animation || 'animate__fadeInUp';
                            formWrapper.classList.add(animationClass);
                            observer.unobserve(formWrapper);
                        }
                    });
                }, {
                    root: null,
                    rootMargin: '0px',
                    threshold: 0.1
                });
                observer.observe(formWrapper);
            }
        });
    </script>
</body>
</html>