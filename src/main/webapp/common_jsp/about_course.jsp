<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Our Courses - Driving School Arena</title>

<%@include file="/common/common_css.html" %>

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
    --footer-bg: #444;
    --footer-text: #eee;
    --footer-link: #ffcc99;
    --card-bg: #fff;
    --card-text-color: #444;
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
    white-space: nowrap; /* For typing effect */
    overflow: hidden; /* For typing effect */
    border-right: .15em solid orange; /* Typing cursor */
    animation: blink-caret .75s step-end infinite; /* Cursor blink animation */
}

/* Keyframes for typing cursor */
@keyframes blink-caret {
    from, to { border-color: transparent }
    50% { border-color: orange; }
}

.page-hero-subtitle {
    font-family: var(--font-sans-serif);
    font-size: 1.5em;
    opacity: 0.9;
}

.course-list-hero {
    background: linear-gradient(135deg, #4CAF50, #8BC34A);
}

.separator {
    height: 4px;
    background-color: var(--separator-color);
    margin: 60px auto;
    width: 70%;
    max-width: 800px;
    border-radius: 2px;
}

.course-list-section {
    padding: 60px 20px;
    max-width: 1200px;
    margin: 0 auto;
}

.course-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 30px;
    justify-items: center;
}

.course-card {
    background-color: var(--card-bg);
    color: var(--card-text-color);
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    opacity: 0;
    transform: translateY(30px);
    animation-fill-mode: both;
    padding: 25px; /* Initial padding for visible content */
    position: relative;
    min-height: 150px; /* Min height for just the title */
    display: flex;
    flex-direction: column;
    justify-content: flex-start; /* Align content to top */
    cursor: pointer; /* Indicate hoverability */
}

.course-card.animate__animated {
    opacity: 1;
    transform: translateY(0);
}

.course-card:hover {
    transform: translateY(-8px) scale(1.02);
    box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
}

.course-card-title {
    font-size: 1.5em;
    font-weight: bold;
    color: var(--accent-color);
    margin-bottom: 15px;
    text-align: center;
}

/* --- Transaction (Hidden Details) Styling --- */
.course-details-transaction {
    max-height: 0; /* Hidden by default */
    overflow: hidden;
    opacity: 0;
    transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out;
    padding-top: 10px; /* Space between title and details */
}

.course-card:hover .course-details-transaction {
    max-height: 300px; /* Sufficient height to reveal all content */
    opacity: 1;
}

.course-detail-item {
    font-size: 1.1em;
    line-height: 1.6;
    color: var(--card-text-color);
    margin-bottom: 8px;
}

.course-detail-item b {
    color: var(--text-dark);
}

.no-courses {
    color: var(--text-light);
    font-size: 1.3em;
    text-align: center;
    margin-top: 30px;
    width: 100%;
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
        height: 300px;
    }
    .page-hero-title {
        font-size: 3em;
    }
    .page-hero-subtitle {
        font-size: 1.2em;
    }
    .course-grid {
        grid-template-columns: 1fr;
    }
    .course-card {
        padding: 20px;
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
    .course-grid {
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
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
<%
Userdao dao= new Userdao();
ArrayList<Courses>CoursesList=dao.viewcouses();
%>

<!-- Hero Section for Courses Page -->
<div class="page-hero-container course-list-hero">
    <div class="hero-content">
        <h1 class="page-hero-title" id="typed-course-hero-text"></h1>
        <p class="page-hero-subtitle animate__animated animate__fadeInUp animate__delay-0.5s">Find the perfect path to your driving license.</p>
    </div>
</div>

<div class="separator"></div>

<div class="course-list-section">
    <div class="course-grid">
        <%
        if (CoursesList != null && !CoursesList.isEmpty()) {
            for(Courses c:CoursesList) {
        %>
        <div class="course-card animate__animated" data-animation="animate__fadeInUp">
            <h5 class="course-card-title"><%=c.getCourse_name() %></h5>
            <div class="course-details-transaction">
                <p class="course-detail-item"><b>Charge For The Course:</b> <%=c.getCharge()%></p>
                <p class="course-detail-item"><b>Description:</b> <%=c.getDiscription() %></p>
                <p class="course-detail-item"><b>Duration:</b> <%=c.getDuration() %></p>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p class="no-courses" style="grid-column: 1 / -1;">No courses available at the moment. Please check back later!</p>
        <%
        }
        %>
    </div>
</div>

<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
        document.body.style.backgroundSize = 'cover';
        document.body.style.backgroundPosition = 'center';
        document.body.style.backgroundAttachment = 'fixed';

        // --- Typing Effect for Hero Text ---
        const heroTextElement = document.getElementById('typed-course-hero-text');
        const textToType = "Explore Our Courses";
        let charIndex = 0;
        let isDeleting = false;
        let typingSpeed = 100;
        let deletingSpeed = 50;
        let pauseBetweenCycles = 1500;

        function typeWriter() {
            const currentText = textToType.substring(0, charIndex);
            heroTextElement.textContent = currentText;
            // Ensure cursor is visible only during typing/deleting phases
            if (!isDeleting && charIndex < textToType.length || isDeleting && charIndex > 0) {
                 heroTextElement.style.borderRight = '.15em solid orange';
            } else {
                 heroTextElement.style.borderRight = 'none';
            }
           

            if (!isDeleting && charIndex < textToType.length) {
                charIndex++;
                setTimeout(typeWriter, typingSpeed);
            } else if (isDeleting && charIndex > 0) {
                charIndex--;
                setTimeout(typeWriter, deletingSpeed);
            } else if (!isDeleting && charIndex === textToType.length) {
                // Paused after typing, start deleting
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
        typeWriter();


        // --- Scroll Animations for Course Cards ---
        const courseCards = document.querySelectorAll('.course-card');
        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const card = entry.target;
                    const animationClass = card.dataset.animation || 'animate__fadeInUp';
                    card.classList.add('animate__animated', animationClass);
                    observer.unobserve(card);
                }
            });
        }, {
            root: null,
            rootMargin: '0px',
            threshold: 0.1
        });

        courseCards.forEach(card => {
            observer.observe(card);
        });
    });
</script>
</body>
</html>