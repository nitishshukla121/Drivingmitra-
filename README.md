# Driving School Arena

Driving School Arena is a comprehensive web application designed to manage the operations of a driving school, connecting administrators, trainers, and trainees through a user-friendly portal. The app streamlines processes from online admissions and course management to live vehicle tracking and performance evaluations.

---

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [User Roles and Access](#user-roles-and-access)
- [Styling & Design Principles](#styling--design-principles)
- [Contributing](#contributing)
- [Contact](#contact)


---

## Features

### Public Website
- Dynamic Home Page with animated hero section
- About Us page with interactive team and mission info
- Course Catalog with detailed, dynamic cards
- Online Admission Form for enrolling new trainees
- Secure Payment Gateway integration
- Contact Us form for inquiries
- User Feedback Submission with emoji ratings
- Public display of user testimonials with "Read More" feature

### Admin Portal
- Secure Admin Login and centralized dashboard
- Manage profiles, assign trainers, manage trainees and instructors
- Add and manage driving courses and events
- View feedback and support requests
- Live vehicle tracking (API integration)

### Trainer Portal
- Trainer-specific login and personalized dashboard
- View and edit profile details
- Submit performance reports and ride logs
- Share driving tips
- View assigned trainees and support queries
- Live vehicle tracking of assigned vehicles

### Trainee Portal
- Secure login with personalized dashboard
- View and edit personal profile
- Access assigned trainer info and performance reports
- Submit feedback and contact support
- Live tracking of assigned training vehicles

---

## Technologies Used

**Frontend:**
- JSP (JavaServer Pages)
- HTML5, CSS3 (with CSS Variables)
- JavaScript (ES6+), jQuery
- Bootstrap 5.3.2
- Animate.css 4.1.1
- Font Awesome 6.0.0-beta3
- Leaflet.js 1.0.3 for maps

**Backend:**
- Java with Servlets
- DAO Pattern & Beans (POJOs)
- JDBC for MySQL connectivity
- MySQL database

**Deployment:**
- Apache Tomcat server

---
## Project Structure

- Drivingmitra/
  - src/
    - main/
      - java/
        - dm/
          - beans — POJOs like Trainee, TrainerAccount, Course, Feedbacks, etc.
          - dao — Data Access Objects: Userdao, Traineedao, etc.
          - servlets — Controllers like Admin_login, Admission, Performance, etc.
      - webapp/
        - admin — Admin JSP pages and fragments
        - trainer — Trainer JSP pages
        - trainee — Trainee JSP pages
        - common_jsp — Public-facing JSP pages
        - common — Common HTML fragments and JS
        - css — Global CSS styles
        - images — Project images
        - WEB-INF/
          - web.xml — Deployment descriptor



---

## Setup and Installation

### Prerequisites
- Java JDK 8+
- Apache Tomcat 9+
- MySQL Server
- IDE (Eclipse, IntelliJ IDEA) recommended

### Steps
1. Clone the repository: https://github.com/nitishshukla121/Drivingmitra

2. Create a MySQL database (e.g., `drivingschool_db`).
3. Execute your SQL schema and initial data to create necessary tables.
4. Update database credentials in `dm.dao.DBConnection.java`.
5. Build and deploy the project on Tomcat:
- Use your IDE or build a WAR file.
- Deploy WAR or project folder to Tomcat’s `webapps` directory.
6. Start Tomcat server.
7. Access the application at `http://localhost:8080/Drivingmitra/`.

---

## Usage

- Public pages are accessible at the root URL.
- Admin portal login: `/admin/admin_login.jsp`
- Trainer portal login: `/trainer/trainer_login.jsp`
- Trainee portal login: `/trainee/trainee_login.jsp`

**Note:** Setup default admin/trainer/trainee accounts in the database for initial access.

---

## User Roles and Access

| Role     | Login URL                  | Session Key & Role Check       |
|----------|----------------------------|-------------------------------|
| Admin    | `/admin/admin_login.jsp`    | `sessionKey` + role = "admin" |
| Trainer  | `/trainer/trainer_login.jsp`| `sessionKey` + role = "trainer"|
| Trainee  | `/trainee/trainee_login.jsp`| `sessionKey` + role = "Trainee"|

Unauthorized access redirects to login pages with error messages.

---

## Styling & Design Principles

- Centralized CSS Variables for consistent theming.
- Responsive layout with CSS Grid and Flexbox.
- Animated hero sections and scroll animations using Animate.css.
- Distinct color palettes per user portal for easy role recognition.
- Clean, modern UI with Font Awesome icons and hover effects.

---

## Contributing

Contributions are welcome! To contribute:

1. Fork this repository.
2. Create a branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: your message"`
4. Push branch: `git push origin feature/your-feature`
5. Open a Pull Request.

---

## Contact

For questions or feedback, please contact:

- Maintainer: Nitish Shukla 
- Email: nitish121shuklal@example.com  

---


*Thank you for checking out Driving School Arena!*



