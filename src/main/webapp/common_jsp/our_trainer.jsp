<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dm.dao.*, dm.beans.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Our Trainers - Driving School Arena</title>

<%@ include file="/common/common_css.html"%>

<!-- Animate.css for entrance animations -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<!-- Font Awesome for favicon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />

<style>
:root {
	--primary-color: #C19A6B;
	--accent-color: #ff4d4d;
	--text-light: #ffffff;
	--text-dark: #333;
	--card-bg: #fff;
	--card-text: #444;
	--shadow: rgba(0, 0, 0, 0.15);
}

body {
	font-family: Arial, sans-serif;
	background-color: var(--primary-color);
	margin: 0;
}

/* === HERO SECTION === */
.page-hero-container {
	height: 400px;
	background: linear-gradient(135deg, #FF6F61, #FFC14D);
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: var(--text-light);
}

.page-hero-title {
	font-size: 4em;
	font-weight: bold;
	margin: 0;
}

.page-hero-subtitle {
	font-size: 1.5em;
	opacity: 0.95;
}

/* === TRAINER CARD === */
.trainer-section {
	padding: 60px 40px;
	display: flex;
	flex-wrap: wrap;
	gap: 30px;
	justify-content: center;
}

.card {
	background-color: var(--card-bg);
	color: var(--card-text);
	border-radius: 12px;
	box-shadow: 0 6px 16px var(--shadow);
	width: 280px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
	overflow: hidden;
	position: relative;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 10px 24px rgba(0, 0, 0, 0.25);
}

.card-image {
	background: #eee;
	height: 180px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 5em;
	color: var(--primary-color);
}

.card-body {
	padding: 20px;
	text-align: center;
}

.card-title {
	font-size: 1.3em;
	font-weight: bold;
	color: var(--accent-color);
	margin-bottom: 10px;
}

.transaction {
	display: none;
	transition: all 0.3s ease;
}

.card:hover .transaction {
	display: block;
}

.card-text {
	font-size: 1em;
	margin: 5px 0;
}

.no-trainers {
	color: white;
	text-align: center;
	margin-top: 40px;
	font-size: 1.2em;
	width: 100%;
}

@media ( max-width : 768px) {
	.page-hero-title {
		font-size: 3em;
	}
	.page-hero-subtitle {
		font-size: 1.2em;
	}
}
</style>
</head>

<body>
	<%@ include file="/common/common_header.html"%>

	<!-- HERO SECTION -->
	<div class="page-hero-container">
		<div class="hero-content">
			<h1 class="page-hero-title animate__animated animate__fadeInDown">Meet
				Our Expert Trainers</h1>
			<p
				class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Guidance
				from the best in the field.</p>
		</div>
	</div>

	<!-- TRAINER SECTION -->
	<div class="trainer-section">
		<%
        Userdao dao = new Userdao();
        ArrayList<TrainerAccount> TrainerList = dao.viewtrainer();

        if (TrainerList != null && !TrainerList.isEmpty()) {
            for (TrainerAccount t : TrainerList) {
        %>
		<div class="card animate__animated" data-animation="animate__fadeInUp">
			<div class="card-image">
				<i class="fas fa-user-circle"></i>
			</div>
			<div class="card-body">
				<div class="card-title"><%= t.getName() %></div>

				<!-- Visible Always -->
				<p class="card-text">
					<strong>Experience:</strong>
					<%= t.getExperience() %>
					years
				</p>

				<!-- Hover Reveal -->
				<div class="transaction">
					<p class="card-text">
						<strong>Email:</strong>
						<%= t.getEmail() %></p>
					<p class="card-text">
						<strong>Gender:</strong>
						<%= t.getGender() %></p>
					<%-- <p class="card-text"><strong>Bio:</strong> <%= t.getDricption() %></p> --%>
				</div>
			</div>
		</div>

		<%
            }
        } else {
        %>
		<p class="no-trainers">No trainers available at the moment. Please
			check back later!</p>
		<%
        }
        %>
	</div>


	<script>
        // Intersection Observer for animation trigger
        document.addEventListener('DOMContentLoaded', function () {
            const cards = document.querySelectorAll('.card');
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const card = entry.target;
                        const anim = card.dataset.animation || 'animate__fadeInUp';
                        card.classList.add('animate__animated', anim);
                        observer.unobserve(card);
                    }
                });
            }, { threshold: 0.1 });

            cards.forEach(card => observer.observe(card));
        });
    </script>
</body>
</html>
