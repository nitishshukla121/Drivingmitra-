<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assign Trainer - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
:root {
    --admin-primary-bg: #2c3e50;
    --admin-secondary-bg: #34495e;
    --admin-card-bg: #ffffff;
    --admin-text-dark: #333333;
    --admin-text-light: #333333;
    --admin-accent-color: #3498db;
    --admin-separator-color: rgba(255, 255, 255, 0.2);
    --admin-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --admin-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --form-bg-light-transparent: rgba(255, 255, 255, 0.25);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);

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

.admin-form-section {
    padding: 40px 20px;
    max-width: 700px;
    margin: 0 auto;
    background-color: var(--admin-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--admin-box-shadow);
    color: var(--admin-text-light);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 50vh;
}

.admin-form-wrapper {
    width: 100%;
    padding: 30px;
    background-color: var(--form-bg-light-transparent);
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.admin-form-wrapper.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.admin-form-wrapper h2 {
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

.form-group-admin select {
    width: calc(100% - 24px);
    padding: 12px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--admin-text-light);
    font-size: 1.1em;
    box-sizing: border-box;
    -webkit-appearance: none; /* Remove default arrow */
    -moz-appearance: none;
    appearance: none;
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292%22%20height%3D%22292%22%3E%3Cpath%20fill%3D%22%23ffffff%22%20d%3D%22M287%2C197L146%2C56L5%2C197H287z%22%2F%3E%3C%2Fsvg%3E'); /* Custom white arrow */
    background-repeat: no-repeat;
    background-position: right 10px top 50%;
    background-size: 12px auto;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.form-group-admin select:focus {
    outline: none;
    border-color: var(--admin-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.btn-assign {
    display: block;
    width: auto;
    padding: 12px 30px;
    background-color: var(--admin-accent-color); /* Use admin accent color for button */
    color: var(--admin-text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    margin: 30px auto 0 auto; /* Center the button */
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-assign:hover {
    background-color: #2980b9;
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
    .admin-form-section {
        padding: 20px 10px;
        min-height: auto;
    }
    .admin-form-wrapper {
        padding: 20px;
    }
    .admin-form-wrapper h2 {
        font-size: 1.8em;
        margin-bottom: 20px;
    }
    .form-group-admin {
        font-size: 1em;
        margin-bottom: 20px;
    }
    .form-group-admin select {
        padding: 10px;
        font-size: 1em;
        width: calc(100% - 20px);
    }
    .btn-assign {
        padding: 10px 20px;
        font-size: 1em;
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
    .admin-form-section {
        padding: 60px 30px;
    }
    .admin-form-wrapper h2 {
        font-size: 2.8em;
    }
}
</style>

</head>
<body style="background-color: #A7C7E7;">

	<%
	Admindao dao = new Admindao();
	ArrayList<TrainerAccount> TrainerList = dao.viewTrainer();
 	ArrayList<Trainee> TraineeList = dao.viewTrainee();
 	%>
	<%@include file="/admin/admin_header.html"%>

    <div class="admin-hero-container">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Assign Trainer</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Link trainees with their instructors.</p>
        </div>
    </div>

    <div class="separator"></div>

	<div class="admin-form-section">
		<div class="admin-form-wrapper animate__animated" data-animation="animate__fadeInUp">
			<h2>Assign Trainer To Trainee</h2>
			<form method="post" action="/Drivingmitra/Assign_trainer">
				<div class="form-group-admin">
                    <label for="trainer_id">Select Trainer:</label>
                    <select name="trainer_id" id="trainer_id" required>
                        <option value="">Select Trainer</option>
                        <%
                        for(TrainerAccount t:TrainerList) {
                        %>
                        <option value="<%=t.getTrainer_id() %>"><%=t.getName() %></option>
                        <%} %>
                    </select>
				</div>
				<div class="form-group-admin">
                    <label for="trainee_id">Select Trainee:</label>
                    <select name="trainee_id" id="trainee_id" required>
                        <option value="">Select Trainee</option>
                        <%
                        for(Trainee t:TraineeList) {
                        %>
                        <option value="<%=t.getId() %>"><%=t.getName()%></option>
                        <%} %>
                    </select>
				</div>
				<button type="submit" class="btn-assign">Assign</button>
			</form>
		</div>
	</div>
	
    <div class="separator"></div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // --- Scroll Animation for the form container itself ---
            const formWrapper = document.querySelector('.admin-form-wrapper');
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
        });
    </script>
</body>
</html>