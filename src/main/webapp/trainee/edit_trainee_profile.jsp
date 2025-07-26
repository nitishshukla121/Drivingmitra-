<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="dm.dao.* ,dm.beans.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trainee Edit Profile - Driving School Arena</title>

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
    --trainee-primary-bg: #E5AA70;
    --trainee-secondary-bg: #FFDAB9;
    --trainee-card-bg: #ffffff;
    --trainee-text-dark: #333333;
    --trainee-text-light: #ffffff;
    --trainee-accent-color: #FF6347;
    --trainee-separator-color: rgba(255, 255, 255, 0.4);
    --trainee-box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
    --trainee-heading-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);

    --form-bg-transparent: rgba(255, 255, 255, 0.2);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --input-border-color: rgba(255, 255, 255, 0.4);
    --button-submit-bg: #4CAF50;
    --button-submit-hover: #45a049;

    --trainee-edit-profile-hero: linear-gradient(135deg, #FFB300, #FFD54F);

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

.trainer-hero-container {
    position: relative;
    width: 100%;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--trainee-primary-bg), var(--trainee-secondary-bg));
    color: var(--trainee-text-light);
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
    text-shadow: var(--trainee-heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.trainer-hero-subtitle {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    opacity: 0.9;
}

.separator {
    height: 2px;
    background-color: var(--trainee-separator-color);
    margin: 40px auto;
    width: 80%;
    max-width: 900px;
    border-radius: 1px;
}

.trainer-form-section {
    padding: 40px 20px;
    max-width: 700px;
    margin: 0 auto;
    background-color: var(--trainee-secondary-bg);
    border-radius: 10px;
    box-shadow: var(--trainee-box-shadow);
    color: var(--trainee-text-light);
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
    color: var(--trainee-text-light);
    font-size: 2.2em;
    margin-bottom: 30px;
    text-shadow: var(--trainee-heading-shadow);
}

.form-group-trainer {
    margin-bottom: 25px;
    color: var(--trainee-text-light);
    font-family: var(--font-sans-serif);
    font-size: 1.1em;
}

.form-group-trainer label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-group-trainer input[type="text"],
.form-group-trainer input[type="email"],
.form-group-trainer textarea {
    width: calc(100% - 24px);
    padding: 12px;
    border: 1px solid var(--input-border-color);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--trainer-text-light);
    font-size: 1.1em;
    box-sizing: border-box;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

.form-group-trainer input[type="text"]:focus,
.form-group-trainer input[type="email"]:focus,
.form-group-trainer textarea:focus {
    outline: none;
    border-color: var(--trainee-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.btn-submit-trainer {
    display: block;
    width: auto;
    padding: 12px 30px;
    background-color: var(--button-submit-bg);
    color: var(--trainee-text-light);
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
    .form-group-trainer input[type="email"],
    .form-group-trainer textarea {
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

 <%@include file="/trainee/trainee_header.html" %>



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

	<div class="trainer-hero-container trainee-edit-profile-hero">
		<div class="trainer-hero-content">
			<h1 class="trainer-hero-title animate__animated animate__fadeInDown">Edit Trainee Profile</h1>
			<p class="trainer-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Update your personal information.</p>
		</div>
	</div>

	<div class="separator"></div>

	<div class="trainer-form-section">
	<%
	Traineedao dao = new Traineedao();
	Trainee t = dao.viewProfile(trainee_id);
	%>
	<div class="trainer-form-wrapper animate__animated" data-animation="animate__fadeInUp">
		<h2>Update Profile Details</h2>
		<form action="/Drivingmitra/Trainee_Edit_Profile" method="post">
			<div class="form-group-trainer">
				<label for="name">Name:</label>
				<input type="text" id="name" name="name" class="form-control" value="<%=t.getName() %>" oninput="validateName(event)">
			</div>
			<div class="form-group-trainer">
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" class="form-control" value="<%=t.getEmail() %>">
			</div>
			<div class="form-group-trainer">
				<label for="address">Address:</label>
				<textarea id="address" name="address" rows="3" class="form-control"><%=t.getAddress() %></textarea>
			</div>
			<div class="form-group-trainer">
				<label for="phone">Contact Number:</label>
				<input type="text" id="phone" name="phone" class="form-control" value="<%=t.getPhone() %>" oninput="validatePhone(event)">
			</div>
			<div class="form-group-trainer">
				<label for="age">Age:</label>
				<input type="text" id="age" name="age" class="form-control" value="<%=t.getAge() %>" oninput="validateNumber(event)">
			</div>
			<div class="form-buttons-trainer">
				<button type="submit" class="btn-submit-trainer">Submit</button>
			</div>
		</form>
	</div>

	</div>

	<div class="separator"></div>

	<%
	} else {
	request.setAttribute("msg", "You are not a Trainee. Please login first.");
	RequestDispatcher rd = request.getRequestDispatcher("/trainee/trainee_login.jsp");
	rd.forward(request, response);
	}}
	%>

<script>
function validateName(event) {
    const input = event.target;
    const value = input.value;
    const regex = /^[a-zA-Z\s]*$/;
    if (!regex.test(value)) {
        input.value = value.replace(/[^a-zA-Z\s]/g, '');
        alert("Only alphabets and spaces allowed for Name");
    }
}

function validatePhone(event) {
    const input = event.target;
    const value = input.value;
    const sanitizedValue = value.replace(/\D/g, '');
    if (sanitizedValue !== value) {
        input.value = sanitizedValue;
        alert("Only digits allowed for Phone");
    }
    if (sanitizedValue.length > 10) {
        input.value = sanitizedValue.slice(0, 10);
        alert("Phone number cannot exceed 10 digits");
    }
}

function validateNumber(event) {
    const input = event.target;
    const value = input.value;
    const sanitizedValue = value.replace(/[^0-9]/g, '');
    if (sanitizedValue !== value) {
        input.value = sanitizedValue;
        alert("Only digits allowed for Age");
    }
}

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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>