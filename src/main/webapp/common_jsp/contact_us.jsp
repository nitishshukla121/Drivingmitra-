<style>
/* Add to your existing style.css file */

/* --- General Form Styling --- */
.form-page-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 100px); /* Adjust based on header/footer height */
    padding: 20px;
    background-image: url("/Drivingmitra/images/background.png"); /* Use your background image */
    background-size: cover;
    background-position: center;
    background-attachment: fixed; /* Optional: for parallax-like effect */
}

.form-wrapper {
    width: 90%; /* Responsive width */
    max-width: 700px; /* Max width for larger screens */
    padding: 40px;
    background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent dark background */
    border-radius: 12px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.7); /* Stronger shadow */
    margin: 50px auto; /* Center with margin top/bottom */
    /* Animation properties for initial load */
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.8s ease-out, transform 0.8s ease-out;
}

.form-wrapper.animate__animated { /* Class added by JS to trigger animation */
    opacity: 1;
    transform: translateY(0);
}


.form-heading {
    margin-bottom: 30px;
    color: var(--text-light); /* Use your light text color */
    font-family: var(--font-serif); /* Use your serif font */
    font-weight: bold;
    text-align: center;
    font-size: 3em; /* Responsive font size */
    text-shadow: var(--heading-shadow);
}

.form-group {
    margin-bottom: 25px; /* More spacing between form groups */
    color: var(--text-light);
    font-family: var(--font-sans-serif); /* Use a sans-serif for labels for readability */
    font-weight: normal; /* Labels typically not bold */
    font-size: 1.2em; /* Readable font size for labels */
}

.form-group label {
    display: block;
    margin-bottom: 8px; /* Space between label and input */
    font-weight: bold; /* Make labels slightly bold */
}

input[type="text"],
input[type="email"],
input[type="tel"],
textarea {
    width: calc(100% - 16px); /* Full width minus padding */
    padding: 12px; /* More padding for better touch targets */
    border: 1px solid rgba(255, 255, 255, 0.3); /* Softer white border */
    border-radius: 8px; /* More rounded corners */
    background-color: rgba(255, 255, 255, 0.1); /* Subtle transparent white background */
    color: var(--text-light); /* Input text color */
    font-size: 1.1em;
    transition: border-color 0.3s ease, background-color 0.3s ease;
}

input[type="text"]:focus,
input[type="email"]:focus,
input[type="tel"]:focus,
textarea:focus {
    outline: none;
    border-color: var(--accent-color); /* Highlight on focus */
    background-color: rgba(255, 255, 255, 0.2);
}

textarea {
    resize: vertical;
    min-height: 120px; /* Minimum height for textarea */
}

/* Button styling - using your existing accent/primary colors */
.form-buttons {
    display: flex; /* Arrange buttons side-by-side */
    justify-content: flex-end; /* Push buttons to the right */
    gap: 15px; /* Space between buttons */
    margin-top: 30px; /* Space above buttons */
}

.btn-submit {
    padding: 12px 25px;
    background-color: var(--accent-color); /* Red from your theme */
    color: var(--text-light);
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-submit:hover {
    background-color: #e03f3f; /* Darker red on hover */
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

.btn-reset {
    background-color: #6c757d; /* A neutral gray for reset */
    color: var(--text-light);
    border: none;
    padding: 12px 25px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 1.1em;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

.btn-reset:hover {
    background-color: #5a6268; /* Darker gray on hover */
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.4);
}

/* Separator Line (consistent with other pages) */
.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

/* Media Queries for responsiveness */
@media (max-width: 576px) {
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
    textarea {
        padding: 10px;
        font-size: 1em;
    }
    .btn-submit, .btn-reset {
        padding: 10px 20px;
        font-size: 1em;
    }
    .form-buttons {
        flex-direction: column; /* Stack buttons on small screens */
        gap: 10px;
        align-items: center; /* Center buttons when stacked */
    }
}

</style>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Contact Us - Driving School Arena</title>

<%@include file="/common/common_css.html"%>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<link rel="stylesheet" href="/Drivingmitra/css/style.css"> </head>
<body  style="background-color: #C19A6B;">
	<%@include file="/common/common_header.html"%>

	<div class="form-page-container">
		<div class="form-wrapper animate__animated" data-animation="animate__fadeInUp">
			<h2 class="form-heading">Contact Us</h2>
			<form action="/Drivingmitra/Contactus" method="POST">
				<div class="form-group">
					<label for="name">Name:</label>
					<input type="text" id="name" name="name" required oninput="validateInput(event)">
				</div>
				<div class="form-group">
					<label for="email">Email:</label>
					<input type="email" id="email" name="email" required>
				</div>
				<div class="form-group">
					<label for="phone">Phone:</label>
					<input type="tel" id="phone" name="phone" required maxlength="10">
				</div>
				<div class="form-group"> <%-- Use form-group for consistency with other inputs --%>
					<label for="query">Query:</label>
					<textarea id="query" name="query" rows="4" required></textarea>
				</div>
				<div class="form-buttons">
					<button type="reset" class="btn-reset">Reset</button>
					<button type="submit" class="btn-submit">Submit</button>
				</div>
			</form>
		</div>
	</div>

	<div class="separator"></div>

	<%-- <%@ include file="/common/common_footer.html"%> --%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		// Form validation functions (from your original code, slightly refined)
		document.getElementById('phone').addEventListener('keydown', function(event) {
			// Allow digits, backspace, delete, tab, arrow keys
			if (!(event.key === 'Backspace' || event.key === 'Delete' || event.key === 'Tab' ||
				event.key.startsWith('Arrow') || /\d/.test(event.key))) {
				event.preventDefault(); // Prevent input of non-digit characters
				alert("Only digits are allowed for Phone.");
			}
		});

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
			const formWrapper = document.querySelector('.form-wrapper');

			const observer = new IntersectionObserver((entries, observer) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						const animationClass = formWrapper.dataset.animation || 'animate__fadeInUp';
						formWrapper.classList.add(animationClass); // animate__animated is already on the element
						observer.unobserve(formWrapper); // Animate once
					}
				});
			}, {
				root: null,
				rootMargin: '0px',
				threshold: 0.1 // Trigger when 10% of the form is visible
			});

			observer.observe(formWrapper);
		});
	</script>
</body>
</html>