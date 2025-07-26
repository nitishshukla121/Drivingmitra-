<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<!-- Animate.css for scroll animations and hero text floating animation -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<!-- Font Awesome (if needed for any icons, though not directly used in this form) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
/* --- CSS Variables for consistent theming (copied from your site's main theme) --- */
:root {
    --primary-color: #C19A6B;
    --accent-color: #ff4d4d;
    --text-light: #ffffff;
    --text-dark: #333333;
    --separator-color: #ffffff;
    --font-serif: "Georgia", serif;
    --font-sans-serif: "Arial", sans-serif;
    --heading-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
    --box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    --footer-bg: #444;
    --footer-text: #eee;
    --footer-link: #ffcc99;
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --form-bg-light-transparent: rgba(255, 255, 255, 0.25);
    --alert-bg-error: rgba(255, 77, 77, 0.8); /* Semi-transparent red for errors */
    --alert-text-error: #fff;
}

/* --- Base Styles & Resets (consistent with your site) --- */
body {
    margin: 0;
    font-family: var(--font-sans-serif);
    background-color: var(--primary-color); /* Fallback background color */
    color: var(--text-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

img {
    display: block;
    max-width: 100%;
    height: auto;
}

a {
    color: var(--accent-color);
    text-decoration: none;
    transition: color 0.3s ease;
}

a:hover {
    color: #e03f3f;
    text-decoration: underline;
}

/* --- Page-Specific Hero Section Styling (consistent with other pages) --- */
.page-hero-container {
    position: relative;
    width: 100%;
    height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5);
}

.page-hero-title {
    font-family: var(--font-serif);
    font-size: 4.5em;
    font-weight: bold;
    text-shadow: var(--heading-shadow);
    margin-bottom: 10px;
    line-height: 1;
}

.page-hero-subtitle {
    font-family: var(--font-sans-serif);
    font-size: 1.5em;
    opacity: 0.9;
}

.admin-login-hero { /* Specific gradient for Admin Login page hero */
    background: linear-gradient(135deg, #4a4a4a, #2c3e50); /* Dark, professional gradient */
}

/* --- Separator Line (consistent with your site) --- */
.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

/* --- Form Page Container (for Admin Login) --- */
/* Reusing .form-page-container from contactus.jsp for background and centering */
.form-page-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 100px); /* Adjust based on header/footer height */
    padding: 20px;
    background-image: url("/Drivingmitra/images/background.png"); /* Your main site background */
    background-size: cover;
    background-position: center;
    background-attachment: fixed; /* Optional: for parallax-like effect */
}

.form-wrapper {
    width: 90%;
    max-width: 450px; /* Smaller max-width for a login form */
    padding: 40px;
    background-color: var(--form-bg-light-transparent);
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    margin: 50px auto;
    opacity: 0; /* Initial state for animation */
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.form-wrapper.animate__animated { /* Class added by JS to trigger animation */
    opacity: 1;
    transform: translateY(0);
}

.form-heading { /* Replaces H1 for consistent styling */
    margin-bottom: 30px;
    color: var(--text-light);
    font-family: var(--font-serif);
    font-weight: bold;
    text-align: center;
    font-size: 2.5em; /* Adjusted for a login form */
    text-shadow: var(--heading-shadow);
}

.form-group {
    margin-bottom: 25px;
    color: var(--text-light);
    font-family: var(--font-sans-serif);
    font-weight: normal;
    font-size: 1.2em;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

input[type="text"],
input[type="password"] {
    width: calc(100% - 24px); /* Adjusted for 12px padding on both sides */
    padding: 12px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--text-light);
    font-size: 1.1em;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

input[type="text"]:focus,
input[type="password"]:focus {
    outline: none;
    border-color: var(--accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.btn-submit { /* Styled for submit button */
    width: 100%; /* Full width button */
    padding: 12px 25px;
    background-color: #4CAF50; /* Green for submit */
    color: var(--text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    margin-top: 20px; /* Space above button */
}

.btn-submit:hover {
    background-color: #45a049; /* Darker green on hover */
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

/* --- Bootstrap Alert Styling (for messages) --- */
.alert {
    margin-top: 20px;
    border-radius: 8px;
    padding: 15px 20px;
    font-size: 1em;
    font-weight: bold;
    text-align: center;
    position: relative;
    color: var(--alert-text-error);
    background-color: var(--alert-bg-error); /* Use custom error background */
    border: 1px solid rgba(255, 77, 77, 0.5);
}

.alert .btn-close {
    color: var(--alert-text-error);
    opacity: 0.8;
    background: none;
    border: none;
    font-size: 1.2em;
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
}

.alert .btn-close:hover {
    opacity: 1;
}

/* --- Footer Styling (consistent with your site) --- */
.site-footer {
    background-color: var(--footer-bg);
    color: var(--footer-text);
    padding: 40px 20px;
    margin-top: 80px;
    font-size: 0.95em;
}

.footer-content {
    display: flex;
    flex-direction: column;
    gap: 30px;
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;
}

.footer-column {
    flex: 1;
}

.footer-column h3 {
    color: var(--footer-link);
    font-size: 1.3em;
    margin-bottom: 20px;
}

.footer-column ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.footer-column ul li {
    margin-bottom: 10px;
}

.footer-column ul li a {
    color: var(--footer-text);
    transition: color 0.3s ease;
}

.footer-column ul li a:hover {
    color: var(--footer-link);
}

.social-links a {
    display: inline-block;
    color: var(--footer-text);
    font-size: 1.8em;
    margin: 0 10px;
    transition: color 0.3s ease, transform 0.2s ease;
}

.social-links a:hover {
    color: var(--footer-link);
    transform: translateY(-3px);
}

.footer-bottom {
    text-align: center;
    margin-top: 40px;
    padding-top: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    color: rgba(255, 255, 255, 0.7);
}

/* --- Media Queries for Responsiveness --- */
@media (max-width: 576px) {
    .page-hero-container {
        height: 300px;
    }
    .page-hero-title {
        font-size: 3em;
    }
    .page-hero-subtitle {
        font-size: 1.2em;
    }
    .form-wrapper {
        padding: 25px;
        width: 95%;
    }
    .form-heading {
        font-size: 2em;
    }
    input[type="text"],
    input[type="password"] {
        padding: 10px;
        font-size: 1em;
        width: calc(100% - 20px);
    }
    .btn-submit {
        padding: 10px 20px;
        font-size: 1em;
    }
    .footer-content {
        flex-direction: column;
        text-align: center;
    }
}

@media (min-width: 768px) {
    .page-hero-container {
        height: 500px;
    }
    .page-hero-title {
        font-size: 6em;
    }
    .page-hero-subtitle {
        font-size: 1.8em;
    }
    .footer-content {
        flex-direction: row;
        text-align: left;
        justify-content: space-between;
    }
}
</style>

</head>
<body style="background-color: #C19A6B;">
	<%@include file= "/common/common_header.html" %> 

    <!-- Hero Section for Admin Login Page -->
    <div class="page-hero-container admin-login-hero">
        <div class="hero-content">
            <h1 class="page-hero-title animate__animated animate__fadeInDown">Admin Login</h1>
            <p class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Secure access for administrators.</p>
        </div>
    </div>


    <div class="form-page-container">
        <div class="form-wrapper animate__animated" data-animation="animate__fadeInUp">
            <h2 class="form-heading">Login to Admin Panel</h2>

            <form action="/Drivingmitra/Admin_login" method="post" novalidate class="needs-validation">
                <div class="form-group">
                    <label for="id">Admin ID:</label>
                    <input type="text" id="id" name="id" required>
                    <div class="invalid-feedback">
                        Please enter your Admin ID.
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                    <div class="invalid-feedback">
                        Please enter your password.
                    </div>
                </div>
                <input type="submit" value="Login" class="btn-submit">

                <% String message = (String)request.getAttribute("msg"); %>
                <% if(message != null && !message.isEmpty()){ %>
                <div class="alert alert-dismissible fade show" role="alert">
                  <strong><%=message %></strong> 
                  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% } %>
            </form>
        </div>
    </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/Drivingmitra/common/validation.js"></script>
		
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Apply background image to body for consistent feel
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';

            // --- Scroll Animation for the form container itself ---
            const formWrapper = document.querySelector('.form-wrapper');
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