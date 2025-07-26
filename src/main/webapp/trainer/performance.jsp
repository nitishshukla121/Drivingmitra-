<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Fill Performance - Driving School Arena</title>

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

.performance-hero {
    background: linear-gradient(135deg, #FF6F61, #FFC14D);
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
    max-width: 700px;
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
    display: flex;
    align-items: center;
    flex-wrap: wrap;
}

.form-group-trainer label {
    flex-basis: 30%;
    margin-bottom: 0;
    font-weight: bold;
    text-align: left;
    padding-right: 15px;
}

.form-group-trainer select,
.form-group-trainer textarea {
    flex-basis: 70%;
    width: auto;
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
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292%22%20height%3D%22292%22%3E%3Cpath%20fill%3D%22%23ffffff%22%20d%3D%22M287%2C197L146%2C56L5%2C197H287z%22%2F%3E%3C%2Fsvg%3E');
    background-repeat: no-repeat;
    background-position: right 10px top 50%;
    background-size: 12px auto;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.form-group-trainer select:focus,
.form-group-trainer textarea:focus {
    outline: none;
    border-color: var(--trainer-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.form-group-trainer textarea {
    min-height: 150px;
    resize: vertical;
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
        flex-direction: column;
        align-items: flex-start;
    }
    .form-group-trainer label {
        flex-basis: auto;
        width: 100%;
        margin-bottom: 5px;
        padding-right: 0;
    }
    .form-group-trainer select,
    .form-group-trainer textarea {
        flex-basis: auto;
        width: calc(100% - 20px);
        padding: 10px;
        font-size: 1em;
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
	Trainerdao dao = new Trainerdao();
	ArrayList<Ride_log> traineeRideLogs = dao.viewTrainee(trainer_id);
	%>

	<div class="trainer-hero-container performance-hero">
		<div class="trainer-hero-content">
			<h1 class="trainer-hero-title animate__animated animate__fadeInDown">Fill Performance</h1>
			<p class="trainer-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Evaluate assigned trainees' progress.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="trainer-form-section">
	<% if (traineeRideLogs.isEmpty()) { %>
		<p class="no-trainees-message">No trainees to fill the performance for.</p>
	<% } else { %>
		<div class="trainer-form-wrapper animate__animated" data-animation="animate__fadeInUp">
			<h2>Submit Performance Report</h2>
			<form action="/Drivingmitra/Performance" method="post">
				<div class="form-group-trainer">
					<label for="selectTrainee">Select Trainee Ride Log:</label>
					<select name="ride_id" id="selectTrainee" required>
						<option value="">Select Trainee Ride Log</option>
						<%
						for (Ride_log r : traineeRideLogs) {
						%>
						<option value="<%=r.getRideId()%>"><%=r.getTrainee_id()%> (Ride ID: <%=r.getRideId()%>)</option>
						<%} %>
					</select>
				</div>

				<div class="form-group-trainer">
					<label for="performance">Performance Report:</label>
					<textarea id="performance" name="performance" placeholder="Enter performance details here" required></textarea>
				</div>
				
				<button type="submit" class="btn-submit-trainer">Submit Performance</button>
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