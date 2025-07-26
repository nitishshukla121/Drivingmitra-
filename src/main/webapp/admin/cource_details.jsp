<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Course Details - Driving School Arena</title>
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

    --form-bg-light-transparent: rgba(255, 255, 255, 0.25);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --btn-submit-color: #4CAF50;
    --btn-reset-color: #dc3545;

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
    display: flex; /* For side-by-side label and input */
    align-items: center;
    justify-content: space-between;
}

.form-group-admin label {
    flex-basis: 30%; /* Allocate space for labels */
    margin-bottom: 0; /* Remove bottom margin if using flex */
    font-weight: bold;
    text-align: left;
    padding-right: 15px; /* Space between label and input */
}

.form-group-admin input[type="text"],
.form-group-admin textarea {
    flex-basis: 70%; /* Allocate space for inputs/textarea */
    width: auto; /* Override default width from input[type="text"] */
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
.form-group-admin textarea:focus {
    outline: none;
    border-color: var(--admin-accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.form-group-admin textarea {
    resize: vertical;
    min-height: 100px;
}

.form-buttons-admin {
    display: flex;
    justify-content: flex-end; /* Align buttons to the right */
    gap: 15px;
    margin-top: 30px;
}

.btn-submit-admin {
    padding: 12px 25px;
    background-color: var(--btn-submit-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-submit-admin:hover {
    background-color: #45a049;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

.btn-reset-admin {
    padding: 12px 25px;
    background-color: var(--btn-reset-color);
    color: var(--admin-text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-reset-admin:hover {
    background-color: #c82333;
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
        flex-direction: column; /* Stack labels and inputs */
        align-items: flex-start;
        margin-bottom: 20px;
    }
    .form-group-admin label {
        flex-basis: auto;
        width: 100%;
        margin-bottom: 5px;
        padding-right: 0;
    }
    .form-group-admin input[type="text"],
    .form-group-admin textarea {
        flex-basis: auto;
        width: calc(100% - 20px); /* Adjust padding */
        padding: 10px;
        font-size: 1em;
    }
    .form-buttons-admin {
        flex-direction: column;
        gap: 10px;
        align-items: stretch;
    }
    .btn-submit-admin, .btn-reset-admin {
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
	<%@include file="/admin/admin_header.html"%>

    <div class="admin-hero-container">
        <div class="admin-hero-content">
            <h1 class="admin-hero-title animate__animated animate__fadeInDown">Add Course Details</h1>
            <p class="admin-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Define new courses for trainees.</p>
        </div>
    </div>

    <div class="separator"></div>

	<div class="admin-form-section">
		<div class="admin-form-wrapper animate__animated" data-animation="animate__fadeInUp">
            <h2>Enter Course Information</h2>
            <form method="post" action="/Drivingmitra/Course_details">
                <div class="form-group-admin">
                    <label for="courseName">Course Name:</label>
                    <input type="text" id="courseName" name="courseName" oninput="validateInput(event)">
                </div>
                <div class="form-group-admin">
                    <label for="charge">Charge:</label>
                    <input type="text" id="charge" name="charge" oninput="validateCharge(event)">
                </div>
                <div class="form-group-admin">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="5"></textarea>
                </div>
                <div class="form-group-admin">
                    <label for="duration">Duration:</label>
                    <input type="text" id="duration" name="duration" placeholder="e.g., 30 Days, 2 Weeks">
                </div>
                <div class="form-buttons-admin">
                    <button type="submit" class="btn-submit-admin">Submit</button>
                    <button type="reset" class="btn-reset-admin">Reset</button>
                </div>
            </form>
		</div>
	</div>

    <div class="separator"></div>

	<script>
function validateInput(event) {
    const input = event.target.value;
    const regex = /^[a-zA-Z\s]*$/;
    if (!regex.test(input)) {
        event.target.value = input.replace(/[^a-zA-Z\s]/g, '');
        alert("Only alphabets and spaces allowed for Course Name");
    }
}

function validateCharge(event) {
    const input = event.target;
    const value = input.value;
    const sanitizedValue = value.replace(/[^0-9.]/g, ''); // Allow digits and a single decimal point

    if (sanitizedValue !== value) {
        input.value = sanitizedValue;
        alert("Only numbers and a decimal point allowed for Charge");
    }
}

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