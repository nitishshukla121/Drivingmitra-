<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - DRIVING SCHOOL ARENA</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<link rel="stylesheet" href="/Drivingmitra/css/style.css"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
    --footer-bg: #444;
    --footer-text: #eee;
    --footer-link: #ffcc99;
}

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
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.hero-button:hover {
    background-color: #e03f3f;
    transform: translateY(-3px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

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

.content-text {
    flex: 1;
    padding: 20px;
    text-align: center;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    box-shadow: var(--box-shadow);
}

.pheading {
    font-size: 2.5em;
    font-family: var(--font-serif);
    color: var(--text-light);
    margin-bottom: 20px;
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
}

.para {
    font-size: 1.2em;
    font-family: var(--font-sans-serif);
    color: var(--text-light);
    line-height: 1.8;
}

.about-text-block {
    max-width: 900px;
    margin: 0 auto 40px auto;
    padding: 20px;
    color: var(--text-light);
    background-color: rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    box-shadow: var(--box-shadow);
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

.about-text-block.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.about-text-block h2 {
    font-size: 2.8em;
    margin-bottom: 20px;
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
}

.about-text-block p {
    font-size: 1.2em;
    line-height: 1.8;
}

.about-text-block ul {
    list-style: none;
    padding: 0;
    margin-top: 20px;
}

.about-text-block ul li {
    font-size: 1.2em;
    margin-bottom: 10px;
    position: relative;
    padding-left: 0; /* Removed padding for custom bullet */
    color: var(--text-light);
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

@media (min-width: 768px) {
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

    .content-text {
        flex: 1; /* Ensure text takes available space */
    }

    .footer-content {
        flex-direction: row;
        text-align: left;
        justify-content: space-between;
    }

    .about-text-block h2 {
        font-size: 3.5em;
    }

    .about-text-block p, .about-text-block ul li {
        font-size: 1.3em;
    }
}
</style>
</head>
<body style="background-color: #C19A6B;">
	<%@include file="/common/common_header.html"%>

	<div class="hero-container">
		<img class="hero-image" alt="Our Driving School Building" src="/Drivingmitra/images/Screenshot 2024-03-29 233028.png">
		<div class="hero-content">
			<h1 class="hero-text" id="typed-about-text">About Us</h1>
			<a href="#about-content-start">
				<button class="hero-button">Discover Our Story</button>
			</a>
		</div>
	</div>

	<div class="separator"></div>

	<section class="about-text-block animate__animated" data-animation="animate__fadeInUp" id="about-content-start">
		<p>
			Welcome to <strong>DRIVING SCHOOL ARENA</strong>! We are passionate
			about empowering individuals with the essential skills and confidence needed for safe and responsible driving. Our mission is to foster a love for learning and road safety.
		</p>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Our Vision</h2>
			<p class="para">
				At <strong>DRIVING SCHOOL ARENA</strong>, we envision a world where
				every driver is skilled, confident, and responsible. Our mission is to empower students with
				knowledge, practical skills, and a strong sense of road safety to become excellent drivers and global citizens. We
				believe in:
			</p>
			<ul>
				<li><strong>Excellence:</strong> Striving for the highest
					standards in driving education and safety.</li>
				<li><strong>Community:</strong> Building a supportive and
					inclusive learning environment for all students.</li>
				<li><strong>Holistic Development:</strong> Nurturing
					practical skills, theoretical knowledge, and responsible driving habits.</li>
			</ul>
		</div>
	</section>

	<div class="separator"></div>

	<section class="content-section" data-animation="animate__fadeInUp">
		<div class="content-text">
			<h2 class="pheading">Our Mission</h2>
			<p class="para">Our goal is to provide a safe, stimulating environment where
				students can:</p>
			<ul>
				<li>Develop strong <strong>morals</strong> and make ethical
					choices on the road.
				</li>
				<li>Embrace <strong>values</strong> that shape their unique
					beliefs about safe driving.
				</li>
				<li>Practice effective <strong>problem-solving techniques</strong> for
					various driving challenges.
				</li>
				<li>Cultivate a <strong>positive attitude</strong> towards
					continuous learning and safe driving practices.
				</li>
			</ul>
		</div>
	</section>

	<div class="separator"></div>

	<section class="about-text-block animate__animated" data-animation="animate__fadeInUp">
		<h2>Meet Our Team</h2>
		<p>Our dedicated educators and staff work tirelessly to create a
			nurturing and effective learning environment. We celebrate diversity, encourage curiosity,
			and inspire lifelong learning and safe driving.</p>
		<p>
			Feel free to explore our website and learn more about our <a href="/Drivingmitra/common_jsp/about_course.jsp">programs</a>,
			achievements, and the incredible journey we've had since our
			inception in <strong>2024</strong>.
		</p>
		<p>
			If you have any questions or would like to visit our campus, don't
			hesitate to <a href="/Drivingmitra/common_jsp/contact_us.jsp">reach out</a>. We look forward to welcoming you to the <strong>DRIVING
				SCHOOL ARENA</strong> family!
		</p>
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

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		const sectionsToAnimate = document.querySelectorAll('.content-section, .about-text-block');

		const observer = new IntersectionObserver((entries, observer) => {
			entries.forEach(entry => {
				if (entry.isIntersecting) {
					const section = entry.target;
					const animationClass = section.dataset.animation || 'animate__fadeInUp';
					section.classList.add('animate__animated', animationClass);
					observer.unobserve(section);
				}
			});
		}, {
			root: null,
			rootMargin: '0px',
			threshold: 0.2
		});

		sectionsToAnimate.forEach(section => {
			observer.observe(section);
		});

		document.querySelector('.hero-button').addEventListener('click', function(e) {
            const targetId = this.getAttribute('href');
            if (targetId.startsWith('#')) {
                e.preventDefault();
                document.querySelector(targetId).scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });

	</script>

</body>
</html>
The syntax error has come in the css from the root tag