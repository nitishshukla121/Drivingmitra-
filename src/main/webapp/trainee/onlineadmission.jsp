<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Admission - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
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

    --form-bg-light-transparent: rgba(255, 255, 255, 0.25);
    --input-bg-transparent: rgba(255, 255, 255, 0.15);
    --input-border-color: rgba(255, 255, 255, 0.4);
    --button-submit-bg: #4CAF50;
    --button-submit-hover: #45a049;
    --button-danger-bg: #dc3545;
    --button-danger-hover: #c82333;

    --footer-bg: #444;
    --footer-text: #eee;
    --footer-link: #ffcc99;
}

body {
    margin: 0;
    padding: 0;
    font-family: var(--font-sans-serif);
    background-color: var(--primary-color);
    color: var(--text-dark);
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
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

.admission-hero {
    background: linear-gradient(135deg, #FF6F61, #FFA07A); /* A warm, inviting gradient */
}

.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

.public-form-section {
    padding: 40px 20px;
    max-width: 800px;
    margin: 0 auto;
    background-color: var(--primary-color); /* Use main site background for section */
    border-radius: 10px;
    box-shadow: var(--box-shadow);
    color: var(--text-light); /* Light text for consistency */
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 60vh; /* Ensure sufficient height */
}

.public-form-wrapper {
    width: 100%;
    padding: 30px;
    background-color: var(--form-bg-light-transparent);
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.public-form-wrapper.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.public-form-wrapper h2 {
    font-family: var(--font-serif);
    text-align: center;
    color: var(--text-light);
    font-size: 2.2em;
    margin-bottom: 30px;
    text-shadow: var(--heading-shadow);
}

.form-group-public {
    margin-bottom: 25px;
    color: var(--text-light);
    font-family: var(--font-sans-serif);
    font-size: 1.1em;
}

.form-group-public label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.form-group-public select,
.form-group-public input[type="text"],
.form-group-public input[type="email"] {
    width: calc(100% - 24px);
    padding: 12px;
    border: 1px solid var(--input-border-color);
    border-radius: 8px;
    background-color: var(--input-bg-transparent);
    color: var(--text-light);
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

.form-group-public select {
    background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292%22%20height%3D%22292%22%3E%3Cpath%20fill%3D%22%23ffffff%22%20d%3D%22M287%2C197L146%2C56L5%2C197H287z%22%2F%3E%3C%2Fsvg%3E');
}

.form-group-public input[type="text"]:focus,
.form-group-public input[type="email"]:focus,
.form-group-public select:focus {
    outline: none;
    border-color: var(--accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

.form-group-public input[type="radio"] {
    margin-right: 8px;
    transform: scale(1.2);
}

.form-buttons-public {
    display: flex;
    justify-content: center; /* Center submit button */
    margin-top: 30px;
}

.btn-submit-public {
    padding: 12px 30px;
    background-color: var(--button-danger-bg); /* Using danger red as per your original submit button */
    color: var(--text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
}

.btn-submit-public:hover {
    background-color: var(--button-danger-hover);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

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

@media (max-width: 576px) {
    .page-hero-container {
        height: 250px;
    }
    .page-hero-title {
        font-size: 2.8em;
    }
    .page-hero-subtitle {
        font-size: 1em;
    }
    .public-form-section {
        padding: 20px 10px;
        min-height: auto;
    }
    .public-form-wrapper {
        padding: 20px;
    }
    .public-form-wrapper h2 {
        font-size: 2em;
        margin-bottom: 20px;
    }
    .form-group-public {
        font-size: 1em;
        margin-bottom: 20px;
    }
    .form-group-public label {
        width: 100%;
        margin-bottom: 5px;
    }
    .form-group-public select,
    .form-group-public input[type="text"],
    .form-group-public input[type="email"] {
        padding: 10px;
        font-size: 1em;
        width: calc(100% - 20px);
    }
    .btn-submit-public {
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
        height: 400px;
    }
    .page-hero-title {
        font-size: 4.5em;
    }
    .page-hero-subtitle {
        font-size: 1.5em;
    }
    .public-form-section {
        padding: 60px 30px;
    }
    .public-form-wrapper h2 {
        font-size: 2.8em;
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
	<%@include file="/common/common_header.html"%>

	<div class="page-hero-container admission-hero">
        <div class="hero-content">
            <h1 class="page-hero-title animate__animated animate__fadeInDown">Online Admission</h1>
            <p class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Start your driving journey with us today!</p>
        </div>
    </div>

    <div class="separator"></div>

	<div class="public-form-section">
		<div class="public-form-wrapper animate__animated" data-animation="animate__fadeInUp">
			<h2>Enroll for a Course</h2>
			<form action="/Drivingmitra/Admission" method="post">
				<div class="form-group-public">
					<label for="selectcourse">Select Course:</label>
					<select name="selectcourse" id="selectcourse" required>
						<option value="">Select course</option>
						<%
						Userdao dao = new Userdao();
						ArrayList<Courses> coursesList = dao.viewcouses();
						for (Courses c : coursesList) {
						%>
						<option value="<%=c.getCourse_name()%>"><%=c.getCourse_name()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div class="form-group-public">
					<label for="name">Name:</label>
					<input type="text" name="name" id="name" required oninput="validateName(event)">
				</div>
				<div class="form-group-public">
					<label for="age">Age:</label>
					<input type="text" name="age" id="age" required maxlength="2" oninput="validateNumber(event)">
				</div>
				<div class="form-group-public">
					<label for="phone">Phone:</label>
					<input type="text" name="phone" id="phone" required maxlength="10" oninput="validatePhone(event)">
				</div>
				<div class="form-group-public">
					<label for="email">Email:</label>
					<input type="email" name="email" id="email" required>
				</div>
				<div class="form-group-public">
					<label for="occupation">Occupation:</label>
					<input type="text" name="occupation" id="occupation" required oninput="validateName(event)">
				</div>
				<div class="form-group-public">
					<label for="address">Address:</label>
					<input type="text" name="address" id="address" required>
				</div>
				<div class="form-group-public">
					<label for="city">City:</label>
					<input type="text" name="city" id="city" required oninput="validateName(event)">
				</div>
				<div class="form-group-public">
					<label for="learninglicence">Learning Licence:</label>
					<input type="text" name="learninglicence" id="learninglicence" required maxlength="16">
				</div>
				<div class="form-group-public">
					<label for="gender">Gender:</label>
					<select name="gender" id="gender" required>
						<option value="">Select Gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select>
				</div>
				<div class="form-group-public">
					<label for="mothername">Mother's Name:</label>
					<input type="text" name="mothername" id="mothername" oninput="validateName(event)">
				</div>
				<div class="form-group-public">
					<label for="fathername">Father's Name:</label>
					<input type="text" name="fathername" id="fathername" oninput="validateName(event)">
				</div>
				<div class="form-group-public">
					<label for="alternatenumber">Alternate Number:</label>
					<input type="text" name="alternatenumber" id="alternatenumber" maxlength="10" oninput="validatePhone(event)">
				</div>
				<div class="form-buttons-public">
					<button type="submit" class="btn-submit-public">Submit Admission</button>
				</div>
			</form>
		</div>
	</div>

	<div class="separator"></div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

		function validateNumber(event) {
			const input = event.target;
			const value = input.value;
			const sanitizedValue = value.replace(/[^0-9]/g, '');
			if (sanitizedValue !== value) {
				input.value = sanitizedValue;
				alert("Only digits allowed");
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
		
		document.addEventListener('DOMContentLoaded', function() {
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';

            const formWrapper = document.querySelector('.public-form-wrapper');
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