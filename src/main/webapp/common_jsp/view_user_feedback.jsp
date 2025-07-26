<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="dm.dao.*,dm.beans.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Feedbacks - Driving School Arena</title>

    <%@include file="/common/common_css.html"%>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <style>
        :root {
            --primary-color: #C19A6B;
            --accent-color: #ff4d4d;
            --text-light: #ffffff;
            --text-dark: #333333;
            --separator-color: #ffffff;
            --card-bg: #fff;
            --card-text-color: #444;
            --star-color: #FFD700;
            --read-more-color: #007bff; /* This is now unused for remarks, but kept for consistency */
        }

        body {
            font-family: Arial, sans-serif; /* Fallback font */
            margin: 0;
            padding: 0;
            background-color: var(--primary-color); /* Default background color from theme */
        }

        /* --- Hero Section Styling --- */
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
            background: linear-gradient(135deg, #007bff, #00c6ff); /* Calming blue gradient */
            box-shadow: 0 5px 20px rgba(0,0,0,0.5);
        }

        .hero-content {
            z-index: 2; /* Ensures text is above any background patterns */
            padding: 20px;
        }

        .page-hero-title {
            font-family: Georgia, serif; /* Using a more common serif font */
            font-size: 3.5em;
            font-weight: bold;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.8);
            margin-bottom: 10px;
            line-height: 1.2;
        }

        .page-hero-subtitle {
            font-family: Arial, sans-serif; /* Using a more common sans-serif font */
            font-size: 1.5em;
            opacity: 0.95;
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

        /* --- Feedback Section Styling (for Bootstrap-like grid) --- */
        .feedback-container {
            padding: 40px 20px;
            max-width: 1200px;
            margin: auto;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: -10px; /* Adjust for spacing within cols */
            justify-content: center;
        }

        .col-md-4.col-sm-6 { /* Targeting Bootstrap columns directly if used */
            padding: 10px; /* Space around each card */
        }

        .card {
            background-color: var(--card-bg);
            color: var(--card-text-color);
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%; /* Take full width of its column */
            max-width: 350px; /* Max width for consistent card size */
            padding: 20px;
            overflow: hidden; /* For transaction reveal */
            cursor: pointer; /* Indicate it's interactive */
            min-height: 200px; /* Ensure a minimum height for all cards */
        }

        .card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
        }

        .card-body {
            padding: 0; /* Adjust padding if inner elements have their own */
        }

        .card-title {
            font-size: 1.4em;
            font-weight: bold;
            color: var(--accent-color);
            margin-bottom: 15px;
        }

        .card-text {
            font-size: 1.05em;
            line-height: 1.6;
            margin-bottom: 10px;
            color: var(--card-text-color); /* Ensure text is visible */
        }

        .star-rating {
            font-size: 1.2em;
            color: var(--star-color);
            margin-top: 10px;
        }

        /* --- Transaction (Remarks and Rating) Reveal --- */
        .transaction {
            max-height: 0; /* Start hidden */
            overflow: hidden;
            opacity: 0;
            transition: max-height 0.5s ease-in-out, opacity 0.5s ease-in-out;
            padding-top: 5px; /* Small space after title before reveal */
        }

        .card:hover .transaction {
            max-height: 300px; /* Sufficient height to show content on hover */
            opacity: 1;
        }

        .no-feedback {
            color: var(--text-light);
            font-size: 1.3em;
            text-align: center;
            margin-top: 30px;
            width: 100%; /* Ensure it spans full width */
        }

        /* --- Mobile Adjustments --- */
        @media (max-width: 768px) {
            .page-hero-title {
                font-size: 2.5em;
            }

            .page-hero-subtitle {
                font-size: 1.2em;
            }

            .card {
                max-width: 100%; /* Cards take full width on smaller screens */
            }

            .feedback-container {
                padding: 20px 10px;
            }

            .row {
                gap: 15px; /* Slightly less gap on mobile */
            }
        }

        @media (min-width: 769px) {
            /* Desktop animations for hero text */
            .page-hero-title.animate__animated {
                animation: fadeInDown 1s ease-out;
            }
            .page-hero-subtitle.animate__animated {
                animation: fadeInUp 1s ease-out 0.3s;
                animation-fill-mode: both;
            }
        }
    </style>
</head>
<body style="background-color: #C19A6B;">
    <%@include file="/common/common_header.html"%>
    
    <div class="page-hero-container feedback-list-hero">
        <div class="hero-content">
            <h1 class="page-hero-title animate__animated">Hear From Our Students!</h1>
            <p class="page-hero-subtitle animate__animated">Real experiences, real progress.</p>
        </div>
    </div>

    <div class="separator"></div>
    
    <div class="container feedback-container">
        <div class="row">
            <%
            Userdao dao = new Userdao();
            ArrayList<Feedbacks> feedbackList = dao.viewfeebacks();
            if (feedbackList != null && !feedbackList.isEmpty()) {
                for (Feedbacks f : feedbackList) {
            %>
            <div class="col-md-4 col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title">User: <%= f.getName() %></h3>
                        <div class="transaction">
                            <p class="card-text">Remark: <%= f.getRemarks() %></p>
                            <div class="star-rating">
                                <%
                                int rating = 0;
                                try {
                                    rating = Integer.parseInt(f.getRating());
                                } catch (NumberFormatException e) {
                                    rating = 0; // Default to 0 if parsing fails
                                }

                                for (int i = 0; i < 5; i++) {
                                    if (i < rating) {
                                %>
                                    <i class="fas fa-star"></i>
                                <%
                                    } else {
                                %>
                                    <i class="far fa-star"></i>
                                <%
                                    }
                                }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12">
                <p class="no-feedback">No feedbacks available yet. Be the first to share your experience!</p>
            </div>
            <%
            }
            %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Apply background image to body for consistent feel
            document.body.style.backgroundImage = 'url("/Drivingmitra/images/background.png")';
            document.body.style.backgroundSize = 'cover';
            document.body.style.backgroundPosition = 'center';
            document.body.style.backgroundAttachment = 'fixed';

            // Animate hero title and subtitle
            const pageHeroTitle = document.querySelector('.page-hero-title');
            const pageHeroSubtitle = document.querySelector('.page-hero-subtitle');

            if (pageHeroTitle) {
                pageHeroTitle.classList.add('animate__fadeInDown');
            }
            if (pageHeroSubtitle) {
                pageHeroSubtitle.classList.add('animate__fadeInUp', 'animate__delay-0.5s');
            }

            // Scroll animation for cards (using Intersection Observer)
            const cards = document.querySelectorAll('.card');
            const cardObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                        observer.unobserve(entry.target);
                    }
                });
            }, {
                root: null,
                rootMargin: '0px',
                threshold: 0.1
            });

            cards.forEach(card => {
                cardObserver.observe(card);
            });
        });
    </script>
</body>
</html>