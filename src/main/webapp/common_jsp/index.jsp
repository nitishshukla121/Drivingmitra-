<style>
:root {
	--primary-color: #C19A6B;
	--accent-color: #ff4d4d;
	--text-light: #ffffff;
	--text-dark: #333333;
	--separator-color: #ffffff;
	--font-serif: "Georgia", serif;
	--font-sans-serif: "Arial", sans-serif;
	--heading-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
	--box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	--footer-bg: #444; /* Darker background for footer */
	--footer-text: #eee;
	--footer-link: #ffcc99; /* A softer orange for links */
}

/* Base Styles & Resets */
body {
	margin: 0;
	font-family: var(--font-sans-serif);
	background-color: var(--primary-color);
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

/* Hero Section Styling */
.hero-container {
	position: relative;
	width: 100%;
	height: 600px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}

.hero-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 0;
}

.hero-content {
	position: relative;
	z-index: 1;
	text-align: center;
	color: var(--text-light);
	padding: 30px;
	background: rgba(0, 0, 0, 0.4);
	border-radius: 10px;
	backdrop-filter: blur(5px);
}

.hero-text {
	font-size: 3.5em;
	font-weight: bold;
	font-family: var(--font-serif);
	margin-bottom: 25px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
	white-space: nowrap;
	overflow: hidden;
}

.hero-button {
	padding: 15px 30px;
	background-color: var(--accent-color);
	color: var(--text-light);
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-size: 1.2em;
	font-weight: bold;
	letter-spacing: 0.5px;
	transition: background-color 0.3s ease, transform 0.2s ease, box-shadow
		0.3s ease;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.hero-button:hover {
	background-color: #e03f3f;
	transform: translateY(-3px);
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

/* Separator Line */
.separator {
	height: 4px;
	background-color: var(--separator-color);
	margin: 60px auto;
	width: 70%;
	max-width: 800px;
	border-radius: 2px;
}

/* Content Sections (Two Columns) */
.content-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 30px 20px;
	max-width: 1200px;
	margin: 0 auto;
	gap: 40px;
	opacity: 0;
	transform: translateY(20px);
	transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.content-section.animate__animated {
	opacity: 1;
	transform: translateY(0);
}

.content-section:nth-child(even) {
	flex-direction: column-reverse;
}

.content-text, .content-image-wrapper {
	flex: 1;
	padding: 20px;
	text-align: center;
	background-color: rgba(255, 255, 255, 0.1);
	border-radius: 12px;
	box-shadow: var(--box-shadow);
}

.content-image-wrapper img {
	border-radius: 10px;
	box-shadow: var(--box-shadow);
	width: 100%;
	max-width: 500px;
	height: auto;
	object-fit: cover;
}

.pheading {
	font-size: 2.5em;
	font-family: var(--font-serif);
	color: var(--text-light);
	margin-bottom: 20px;
	text-shadow: var(--heading-shadow);
}

.para {
	font-size: 1.2em;
	font-family: var(--font-sans-serif);
	color: var(--text-light);
	line-height: 1.8;
}

/* Footer Styling */
.site-footer {
	background-color: var(--footer-bg);
	color: var(--footer-text);
	padding: 40px 20px;
	margin-top: 80px; /* Space above footer */
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

/* Media Queries for Desktop Layout */
@media ( min-width : 768px) {
	.hero-container {
		height: 700px;
	}
	.hero-text {
		font-size: 6em;
	}
	.content-section {
		flex-direction: row;
		text-align: left;
		padding: 40px 30px;
	}
	.content-section:nth-child(even) {
		flex-direction: row-reverse;
	}
	.pheading {
		font-size: 3.5em;
	}
	.para {
		font-size: 1.3em;
	}
	.content-image-wrapper {
		text-align: initial;
	}
	.footer-content {
		flex-direction: row;
		text-align: left;
		justify-content: space-between;
	}
}
</style><%@ page language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<link rel="stylesheet" href="/Drivingmitra/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body style="background-color: #C19A6B;">
	<%@include file="/common/common_header.html"%>

	<div class="hero-container">
		<img class="hero-image" alt="Car running at high speed"
			src="/Drivingmitra/images/view-car-running-high-speed.jpg">
		<div class="hero-content">
			<h1 class="hero-text" id="typed-hero-text"></h1>
			<a href="/Drivingmitra/trainee/onlineadmission.jsp">
				<button class="hero-button">Admission</button>
			</a>
		</div>
	</div>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Experienced Instructors:</h2>
			<p class="para">
				Our driving school boasts a team of highly experienced and certified
				instructors who are dedicated to providing comprehensive and
				professional driving instruction. Learn more about our <a
					href="/Drivingmitra/common_jsp/about_course.jsp">Programs</a>.
			</p>
		</div>
		<div class="content-image-wrapper">
			<a href="/Drivingmitra/common_jsp/about_course.jsp"> <img
				src="/Drivingmitra/images/Screenshot 2024-04-14 232437.png"
				alt="Instructor teaching a student">
			</a>
		</div>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Customized Learning Plans:</h2>
			<p class="para">
				We understand that each learner is unique, which is why we offer
				customized learning plans tailored to individual needs and skill
				levels. Whether you're a beginner or looking to refine your driving
				skills, we have a program for you. Check out our detailed <a
					href="#yourPlansLink">Plans</a>.
			</p>
		</div>
		<div class="content-image-wrapper">
			<a href="/Drivingmitra/common_jsp/about_course.jsp"> <img
				src="/Drivingmitra/images/plan.jpg" alt="Learning plan diagram">
			</a>
		</div>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Flexible Scheduling:</h2>
			<p class="para">
				We offer flexible scheduling options to accommodate busy lifestyles.
				Whether you prefer daytime, evening, or weekend lessons, we can find
				a schedule that works for you. <a
					href="/Drivingmitra/common_jsp/contact_us.jsp">Contact us</a> to
				discuss your availability!
			</p>
		</div>
		<div class="content-image-wrapper">
			<a href="/Drivingmitra/common_jsp/contact_us.jsp"> <img
				src="/Drivingmitra/images/img.jpg"
				alt="Calendar with flexible schedule">
			</a>
		</div>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Modern Fleet of Vehicles:</h2>
			<p class="para">Our driving school maintains a modern fleet of
				vehicles equipped with the latest safety features, providing
				learners with a comfortable and secure learning environment.</p>
		</div>
		<div class="content-image-wrapper">
			<a href="/Drivingmitra/common_jsp/our_trainer.jsp"> <img
				src="/Drivingmitra/images/Screenshot.png" alt="Modern car dashboard">
			</a>
		</div>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Affordable Pricing:</h2>
			<p class="para">
				We strive to make quality driving education accessible to everyone
				by offering competitive pricing and various payment options. View
				our <a href="#yourProgramsLink">Program pricing</a> details.
			</p>
		</div>
		<div class="content-image-wrapper">
			<a href="/Drivingmitra/common_jsp/about_course.jsp"> <img
				src="/Drivingmitra/images/price.jpg"
				alt="Stack of coins and price tag">
			</a>
		</div>
	</section>

	<div class="separator"></div>

	<footer class="site-footer">
		<div class="footer-content">
			<div class="footer-column about-us">
				<h3>About Us</h3>
				<p>Driving School Arena is dedicated to empowering safe and
					confident drivers. We offer comprehensive training for all skill
					levels.</p>
			</div>
			<div class="footer-column quick-links">
				<h3>Quick Links</h3>
				<ul>
					<li><a href="/Drivingmitra/common_jsp/about_course.jsp">Our
							Programs</a></li>
					<!--  <li><a href="#yourPlansLink">Learning Plans</a></li>-->
					<li><a href="/Drivingmitra/trainee/onlineadmission.jsp">Online
							Admission</a></li>
					<li><a href="/Drivingmitra/common_jsp/contact_us.jsp">Contact</a></li>

					<li><a href="/Drivingmitra/common_jsp/view_user_feedback.jsp">Feeds</a></li>
				</ul>
			</div>
			<div class="footer-column contact-info">
				<h3>Contact Us</h3>
				<p>
					<i class="fas fa-map-marker-alt"></i> 123 Driving Lane, Lucknow,
					UP, 12345
				</p>
				<p>
					<i class="fas fa-phone"></i> +91 8887441078
				</p>
				<p>
					<i class="fas fa-envelope"></i> <a
						href="mailto:info@drivingschoolarena.com">info@drivingschoolarena.com</a>
				</p>
				<div class="social-links">
					<a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
					<a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
					<a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
					<a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			&copy;
			<%= new java.util.Date().getYear() + 1900 %>
			Driving School Arena. All rights reserved.
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// --- Typing Effect for Hero Text ---
		const heroTextElement = document.getElementById('typed-hero-text');
		const textToType = "Driving School Arena";
		let charIndex = 0;
		let isDeleting = false;
		let typingSpeed = 100; // ms per character
		let deletingSpeed = 50; // ms per character
		let pauseBetweenCycles = 1500; // ms to pause before untyping

		function typeWriter() {
			const currentText = textToType.substring(0, charIndex);
			heroTextElement.textContent = currentText;
			heroTextElement.style.borderRight = '.15em solid orange'; // Show cursor

			if (!isDeleting && charIndex < textToType.length) {
				// Typing
				charIndex++;
				setTimeout(typeWriter, typingSpeed);
			} else if (isDeleting && charIndex > 0) {
				// Deleting
				charIndex--;
				setTimeout(typeWriter, deletingSpeed);
			} else if (!isDeleting && charIndex === textToType.length) {
				// Paused after typing, start deleting
				heroTextElement.style.borderRight = 'none'; // Hide cursor during pause
				setTimeout(() => {
					isDeleting = true;
					typeWriter();
				}, pauseBetweenCycles);
			} else if (isDeleting && charIndex === 0) {
				// Paused after deleting, start typing again
				isDeleting = false;
				setTimeout(typeWriter, typingSpeed);
			}
		}

		document.addEventListener('DOMContentLoaded', () => {
			typeWriter(); // Start typing effect when DOM is ready

			// --- Scroll Animations (Intersection Observer) ---
			const sections = document.querySelectorAll('.content-section');

			const observer = new IntersectionObserver((entries, observer) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						// Element is in view
						const section = entry.target;
						const animationClass = section.dataset.animation || 'animate__fadeInUp'; // Default or custom animation
						section.classList.add('animate__animated', animationClass);
						// Once animated, stop observing if you only want it to animate once
						observer.unobserve(section);
					}
				});
			}, {
				root: null, // relative to the viewport
				rootMargin: '0px',
				threshold: 0.2 // Trigger when 20% of the element is visible
			});

			sections.forEach(section => {
				observer.observe(section);
			});
		});
	</script>
</body>
</html>