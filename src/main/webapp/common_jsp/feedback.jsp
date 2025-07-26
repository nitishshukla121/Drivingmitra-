<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feedback - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<link rel="stylesheet" href="/Drivingmitra/css/style.css"> </head>
<body style="background-color: #C19A6B;"> <%-- Keep body background for consistency until JS loads background image --%>
	<%@include file="/common/common_header.html"%>

	<div class="feedback-hero-container">
		<div class="feedback-hero-content">
			<h1 class="feedback-hero-title animate__animated animate__fadeInDown">Your Feedback Matters!</h1>
			<p class="feedback-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Help us improve your driving journey.</p>
		</div>
	</div>

   <!--  <div class="separator"></div>-->

	<div class="form-wrapper animate__animated" data-animation="animate__fadeInUp">
		<%-- Removed the h2 inside form-wrapper as it's now in the hero --%>
		<form action="/Drivingmitra/Feedback" method="POST">
			<div class="form-group">
				<label for="name">Name:</label>
				<input type="text" id="name" name="name" required oninput="validateInput(event)">
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="remarks">Remarks:</label>
				<textarea id="remarks" name="remarks" rows="4" required></textarea>
			</div>

			<div class="form-group">
				<label>How was your experience?</label>
				<div class="rating-container">
					<div class="rating-item">
						<label for="0">
							<input class="radio-input" type="radio" name="feedback" id="0" value="0" required />
							<span class="emoji-icon" role="img" aria-label="Very Sad">&#128543;</span>
						</label>
					</div>
					<div class="rating-item">
						<label for="1">
							<input class="radio-input" type="radio" name="feedback" id="1" value="1" />
							<span class="emoji-icon" role="img" aria-label="Sad">&#128532;</span>
						</label>
					</div>
					<div class="rating-item">
						<label for="2">
							<input class="radio-input" type="radio" name="feedback" id="2" value="2" />
							<span class="emoji-icon" role="img" aria-label="Neutral">&#128524;</span>
						</label>
					</div>
					<div class="rating-item">
						<label for="3">
							<input class="radio-input" type="radio" name="feedback" id="3" value="3" />
							<span class="emoji-icon" role="img" aria-label="Happy">&#128516;</span>
						</label>
					</div>
					<div class="rating-item">
						<label for="4">
							<input class="radio-input" type="radio" name="feedback" id="4" value="4" />
							<span class="emoji-icon" role="img" aria-label="Very Happy">&#128512;</span>
						</label>
					</div>
				</div>
			</div>

			<div class="form-buttons">
				<button type="submit" class="btn-submit">Submit Feedback</button>
			</div>
		</form>
	</div>

	<!--  <div class="separator"></div>-->

	<%-- Include the improved footer for consistency across the site --%>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Form validation functions
		function validateInput(event) {
			const input = event.target;
			const inputValue = input.value;
			const regex = /^[a-zA-Z\s]*$/; // Allow alphabets and spaces
			if (!regex.test(inputValue)) {
				input.value = inputValue.replace(/[^a-zA-Z\s]/g, ''); // Remove non-alphabet/space characters
				alert("Only alphabets and spaces are allowed for Name.");
			}
		}

		// --- Scroll Animation for the form container itself ---
		document.addEventListener('DOMContentLoaded', () => {
			// Apply background image to body for consistent feel
			document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';

            // Observe the form wrapper for animation
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

<style>

:root {
    --primary-color: #C19A6B; /* Your main background color */
    --accent-color: #ff4d4d; /* Bright Red - for buttons, highlights */
    --text-light: #ffffff;
    --text-dark: #333333;
    --separator-color: #ffffff;
    --font-serif: "Georgia", serif; /* Consider 'Playfair Display' or 'Lora' if you want more modern serifs */
    --font-sans-serif: "Arial", sans-serif; /* Consider 'Roboto', 'Open Sans', 'Lato' for modern sans-serifs */
    --heading-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8); /* Stronger shadow for prominent headings */
    --box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    --footer-bg: #444; /* Darker background for footer */
    --footer-text: #eee;
    --footer-link: #ffcc99; /* A softer orange for links */

    /* New/Adjusted colors for form elements and highlights */
    --input-bg-transparent: rgba(255, 255, 255, 0.15); /* Slightly more transparent input background */
    --form-bg-light-transparent: rgba(255, 255, 255, 0.25); /* Lighter, more vibrant form wrapper background */
    --emoji-glow-color: #ffe066; /* Bright yellow/orange for selected emoji glow */
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

/* --- Hero Section Styling (Used on Index & About Us) --- */
.hero-container {
    position: relative;
    width: 100%;
    height: 600px; /* Base height */
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
    font-size: 3.5em; /* Base font size */
    font-weight: bold;
    font-family: var(--font-serif);
    margin-bottom: 25px;
    text-shadow: var(--heading-shadow);
    white-space: nowrap;
    overflow: hidden;
    /* Optional: Typing cursor for index page hero text */
    /* border-right: .15em solid orange; */
    /* animation: blink-caret .75s step-end infinite; */
}
/* Optional: Typing cursor animation */
/* @keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: orange; }
} */

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

/* --- Separator Line --- */
.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

/* --- Content Sections (Two Columns) --- */
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

.content-text,
.content-image-wrapper {
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

/* --- About Us Specific Text Blocks --- */
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
    text-shadow: var(--heading-shadow);
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
    padding-left: 25px;
    color: var(--text-light);
}

.about-text-block ul li::before {
    content: '★';
    color: var(--accent-color);
    position: absolute;
    left: 0;
    top: 0;
}

/* --- Generic Form Page Container (for Contact Us & Feedback) --- */
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
    max-width: 700px;
    padding: 40px;
    background-color: var(--form-bg-light-transparent); /* Lighter translucent background */
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
    margin: 50px auto;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.form-wrapper.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.form-heading {
    margin-bottom: 30px;
    color: var(--text-light);
    font-family: var(--font-serif);
    font-weight: bold;
    text-align: center;
    font-size: 3em;
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
input[type="email"],
input[type="tel"],
textarea,
select { /* Added select for consistency */
    width: calc(100% - 24px); /* Adjusted for 12px padding on both sides */
    padding: 12px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    background-color: var(--input-bg-transparent); /* More transparent input background */
    color: var(--text-light);
    font-size: 1.1em;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
textarea:focus,
select:focus {
    outline: none;
    border-color: var(--accent-color);
    background-color: rgba(255, 255, 255, 0.25);
}

textarea {
    resize: vertical;
    min-height: 120px;
}

/* Button styling */
.form-buttons {
    display: flex;
    justify-content: flex-end;
    gap: 15px;
    margin-top: 30px;
}

.btn-submit {
    padding: 12px 25px;
    background-color: var(--accent-color);
    color: var(--text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-submit:hover {
    background-color: #e03f3f;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

.btn-reset {
    background-color: #6c757d;
    color: var(--text-light);
    border: none;
    padding: 12px 25px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    letter-spacing: 0.5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-reset:hover {
    background-color: #5a6268;
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

/* --- Feedback Page Specific Styling (Overriding for more vibrancy) --- */

/* Hero for Feedback Page */
.feedback-hero-container {
    position: relative;
    width: 100%;
    height: 400px; /* Adjust height as needed */
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, var(--accent-color), #ff7a00); /* Vibrant gradient */
    color: var(--text-light);
    text-align: center;
    overflow: hidden;
    box-shadow: 0 5px 20px rgba(0,0,0,0.5); /* Shadow for depth */
}

.feedback-hero-content {
    position: relative;
    z-index: 2; /* Ensure text is above any potential background patterns */
    padding: 20px;
}

.feedback-hero-title {
    font-family: var(--font-serif);
    font-size: 4.5em; /* Large, impressive title */
    font-weight: bold;
    text-shadow: var(--heading-shadow);
    margin-bottom: 10px;
    line-height: 1; /* Tighter line height */
    animation: fadeInDown 1s ease-out; /* Animate.css for title */
}

.feedback-hero-subtitle {
    font-family: var(--font-sans-serif);
    font-size: 1.5em;
    opacity: 0.9;
    animation: fadeInUp 1s ease-out 0.3s; /* Animate.css for subtitle with delay */
    animation-fill-mode: both; /* Keep animation end state */
}

/* Enhancements for Emoji Rating */
.rating-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: center;
    gap: 20px; /* More space between emojis for visual impact */
    margin-top: 30px; /* More space above emojis */
    margin-bottom: 40px; /* More space below emojis */
}

.rating-item {
    width: 70px; /* Base size */
    height: 70px;
    background-color: rgba(255, 255, 255, 0.25); /* Lighter background for better contrast */
    border-radius: 50%; /* Make them perfectly round */
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.4); /* Stronger shadow */
    border: 2px solid transparent; /* Border for checked state */
}
.rating-item {
    width: 70px; /* Keep size */
    height: 70px;
    display: flex; /* Ensure flex properties remain */
    justify-content: center;
    align-items: center;
    user-select: none;
    cursor: pointer;
    /* REMOVED: background-color, border-radius, box-shadow, border */
    transition: transform 0.2s ease; /* Only transform transition */
}

.rating-item:hover {
    transform: scale(1.1); /* Keep scaling on hover */
    /* REMOVED: background-color, box-shadow */
}

/* ... and for the checked state, modify the glow only ... */
.radio-input:checked ~ .rating-item { /* Apply checked style to parent item */
    /* REMOVED: border-color, background-color */
    box-shadow: 0 0 10px var(--emoji-glow-color), 0 0 20px var(--emoji-glow-color); /* Only glow effect on box-shadow */
}

/* Media Queries for responsiveness */
@media (max-width: 576px) {
    .hero-container, .feedback-hero-container {
        height: 300px; /* Shorter hero on mobile */
    }
    .hero-text, .feedback-hero-title {
        font-size: 3em;
    }
    .feedback-hero-subtitle {
        font-size: 1.2em;
    }
    .form-wrapper {
        padding: 25px;
        width: 95%;
    }
    .form-heading {
        font-size: 2.2em;
    }
    .form-group {
        font-size: 1.1em;
    }
    input[type="text"],
    input[type="email"],
    input[type="tel"],
    textarea,
    select {
        padding: 10px;
        font-size: 1em;
        width: calc(100% - 20px); /* Adjust for 10px padding on both sides */
    }
    .btn-submit, .btn-reset {
        padding: 10px 20px;
        font-size: 1em;
    }
    .form-buttons {
        flex-direction: column;
        gap: 10px;
        align-items: stretch; /* Stretch buttons to full width */
    }
    .rating-item {
        width: 50px;
        height: 50px;
    }
    .emoji-icon {
        font-size: 2rem;
    }
    .radio-input:checked ~ .emoji-icon {
        font-size: 3rem;
    }
}

@media (min-width: 768px) {
    .hero-container {
        height: 700px;
    }
    .hero-text {
        font-size: 6em;
    }
    .feedback-hero-container {
        height: 500px;
    }
    .feedback-hero-title {
        font-size: 6em;
    }
    .feedback-hero-subtitle {
        font-size: 1.8em;
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
    .about-text-block h2 {
        font-size: 3.5em;
    }
    .about-text-block p, .about-text-block ul li {
        font-size: 1.3em;
    }
    .rating-item {
        width: 90px;
        height: 90px;
    }
    .emoji-icon {
        font-size: 3.5rem;
    }
    .radio-input:checked ~ .emoji-icon {
        font-size: 5rem; /* Max size for selected emoji */
    }
}

</style>