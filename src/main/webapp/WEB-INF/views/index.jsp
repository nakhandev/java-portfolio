<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nakhandev.portfolio.dao.ProjectDAO" %>
<%@ page import="com.nakhandev.portfolio.dao.SkillDAO" %>
<%@ page import="com.nakhandev.portfolio.dao.EducationDAO" %>
<%@ page import="com.nakhandev.portfolio.model.Project" %>
<%@ page import="com.nakhandev.portfolio.model.Skill" %>
<%@ page import="com.nakhandev.portfolio.model.Education" %>
<%@ page import="java.util.List" %>
<%@ page import="com.nakhandev.portfolio.util.EmailUtil" %>
<%-- Load data from database --%>
<%
    // Load projects
    ProjectDAO projectDAO = new ProjectDAO();
    List<Project> projects = projectDAO.getAllProjects();
    request.setAttribute("projects", projects);

    // Load skills
    SkillDAO skillDAO = new SkillDAO();
    List<Skill> skills = skillDAO.getAllSkills();
    request.setAttribute("skills", skills);

    // Load education
    EducationDAO educationDAO = new EducationDAO();
    List<Education> education = educationDAO.getAllEducation();
    request.setAttribute("education", education);

    // Check email configuration
    boolean emailConfigured = EmailUtil.isEmailConfigured();
    request.setAttribute("emailConfigured", emailConfigured);
%>
<c:set var="name" value="Md Nawab Ali Khan" />
<c:set var="phone" value="+91 9523948889" />
<c:set var="email" value="nawabnak@gmail.com" />

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Portfolio of Md Nawab Ali Khan - Java Backend Developer specializing in Spring Boot, REST APIs, and SQL databases">
    <meta name="keywords" content="Java, Spring Boot, Backend Developer, REST API, MySQL, Portfolio">
    <meta name="author" content="Md Nawab Ali Khan">
    <title>Md Nawab Ali Khan - Portfolio</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">
                <i class="bi bi-code-slash me-2"></i>Md Nawab Ali Khan
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="bi bi-house-door me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jsp/projects.jsp">
                            <i class="bi bi-folder me-1"></i>Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jsp/contact.jsp">
                            <i class="bi bi-envelope me-1"></i>Contact
                        </a>
                    </li>
                </ul>
                <!-- Social Links -->
                <div class="navbar-nav ms-lg-3">
                    <a class="nav-link" href="mailto:nawabnak@gmail.com" title="Email">
                        <i class="bi bi-envelope-fill"></i>
                    </a>
                    <a class="nav-link" href="https://github.com/yourusername" target="_blank" title="GitHub">
                        <i class="bi bi-github"></i>
                    </a>
                    <a class="nav-link" href="https://linkedin.com/in/yourusername" target="_blank" title="LinkedIn">
                        <i class="bi bi-linkedin"></i>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="py-5 mt-5" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; min-height: 100vh; display: flex; align-items: center;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4">
                        Hi, I'm <span class="text-warning">Md Nawab Ali Khan</span>
                    </h1>
                    <p class="lead mb-4">
                        💻 Java Backend Developer | 🌱 Open Source Enthusiast | 🧠 Continuous Learner
                    </p>
                    <p class="mb-4">
                        Java Backend Developer specializing in Spring Boot, REST APIs, and SQL databases, with a strong focus on clean, scalable, and maintainable code.
                    </p>
                    <div class="d-flex gap-3 flex-wrap">
                        <a href="#contact" class="btn btn-light btn-lg">
                            <i class="bi bi-envelope me-2"></i>Get In Touch
                        </a>
                        <a href="jsp/projects.jsp" class="btn btn-outline-light btn-lg">
                            <i class="bi bi-folder me-2"></i>View Projects
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="text-center">
                        <i class="bi bi-code-slash display-1 text-warning"></i>
                        <p class="mt-3 text-light-50">Passionate about creating amazing web experiences</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about" class="py-5 bg-dark">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="display-5 fw-bold text-white">About Me</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="text-white">
                        <p class="lead">💻 Java Backend Developer | 🌱 Open Source Enthusiast | 🧠 Continuous Learner</p>
                        <p>💡 Java Backend Developer specializing in Spring Boot, REST APIs, and SQL databases, with a strong focus on clean, scalable, and maintainable code.</p>
                        <p>🚀 Experienced in designing and implementing microservices, integrating APIs, and optimizing backend performance for real-world applications.</p>
                        <p>🧠 Skilled in Spring Security, JUnit, Mockito, Git, and CI/CD workflows, with a growing interest in cloud deployment and DevOps fundamentals.</p>
                        <p>🤝 Passionate about open-source contribution, continuous learning, and building reliable backend systems that empower seamless user experiences.</p>
                        <p>Committed to writing clean code, learning continuously, and delivering impact through technology.</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="card bg-secondary text-white h-100 border-0">
                                <div class="card-body text-center">
                                    <i class="bi bi-mortarboard display-4 text-warning mb-3"></i>
                                    <h5>Education</h5>
                                    <p class="mb-0">B.Tech & Diploma in Computer Science</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card bg-secondary text-white h-100 border-0">
                                <div class="card-body text-center">
                                    <i class="bi bi-briefcase display-4 text-warning mb-3"></i>
                                    <h5>Experience</h5>
                                    <p class="mb-0">Java Backend Development</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Skills Section -->
    <section id="skills" class="py-5 bg-secondary">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="display-5 fw-bold text-white">Technical Skills</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                </div>
            </div>
            <div class="row g-4">
                <!-- Languages -->
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">Java</h6>
                                <span class="badge bg-warning text-dark">Expert</span>
                            </div>
                            <p class="text-muted mb-0">Languages</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">SQL</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Languages</p>
                        </div>
                    </div>
                </div>
                <!-- Frameworks -->
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">Spring Boot</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Frameworks</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">Hibernate</h6>
                                <span class="badge bg-warning text-dark">Intermediate</span>
                            </div>
                            <p class="text-muted mb-0">Frameworks</p>
                        </div>
                    </div>
                </div>
                <!-- Databases -->
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">MySQL</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Databases</p>
                        </div>
                    </div>
                </div>
                <!-- Tools -->
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">Maven</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Tools</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">Git</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Tools</p>
                        </div>
                    </div>
                </div>
                <!-- Web Technologies -->
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-dark text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h6 class="card-title mb-0">REST API</h6>
                                <span class="badge bg-warning text-dark">Advanced</span>
                            </div>
                            <p class="text-muted mb-0">Web Technologies</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section id="projects" class="py-5 bg-dark">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="display-5 fw-bold text-white">Featured Projects</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                    <p class="lead text-white-50 mt-3">Here are some of my recent projects</p>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body">
                            <h5 class="card-title text-warning">Student Management System</h5>
                            <p class="card-text">CRUD-based REST API for managing student records with comprehensive data validation and error handling</p>
                            <div class="mb-3">
                                <small class="text-muted">Technologies: Java, Spring Boot, MySQL, REST API</small>
                            </div>
                            <a href="https://github.com/yourusername/student-management" target="_blank" class="btn btn-outline-warning btn-sm">
                                <i class="bi bi-github me-1"></i>View Code
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body">
                            <h5 class="card-title text-warning">Login & Registration API</h5>
                            <p class="card-text">Secure user registration and authentication system with JWT token-based authorization and password encryption</p>
                            <div class="mb-3">
                                <small class="text-muted">Technologies: Java, Spring Boot, Spring Security, JWT</small>
                            </div>
                            <a href="https://github.com/yourusername/auth-api" target="_blank" class="btn btn-outline-warning btn-sm">
                                <i class="bi bi-github me-1"></i>View Code
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body">
                            <h5 class="card-title text-warning">E-commerce Cart System</h5>
                            <p class="card-text">Full-featured shopping cart implementation with layered architecture supporting multiple payment gateways</p>
                            <div class="mb-3">
                                <small class="text-muted">Technologies: Java, Spring MVC, MySQL, JSP</small>
                            </div>
                            <a href="https://github.com/yourusername/ecommerce-cart" target="_blank" class="btn btn-outline-warning btn-sm">
                                <i class="bi bi-github me-1"></i>View Code
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="jsp/projects.jsp" class="btn btn-warning btn-lg">
                    <i class="bi bi-folder me-2"></i>View All Projects
                </a>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact" class="py-5 bg-secondary">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="display-5 fw-bold text-white">Get In Touch</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                    <p class="lead text-white-50 mt-3">Let's discuss your next project</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card bg-dark text-white border-0">
                        <div class="card-body p-4">
                            <form action="jsp/contact.jsp" method="post" id="contactForm">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="name" class="form-label">Full Name *</label>
                                        <input type="text" class="form-control bg-secondary text-white border-secondary" id="name" name="name" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email Address *</label>
                                        <input type="email" class="form-control bg-secondary text-white border-secondary" id="email" name="email" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control bg-secondary text-white border-secondary" id="phone" name="phone">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="subject" class="form-label">Subject *</label>
                                        <input type="text" class="form-control bg-secondary text-white border-secondary" id="subject" name="subject" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="message" class="form-label">Message *</label>
                                        <textarea class="form-control bg-secondary text-white border-secondary" id="message" name="message" rows="5" required></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-warning btn-lg px-5">
                                            <i class="bi bi-send me-2"></i>Send Message
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-light py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5><i class="bi bi-code-slash me-2"></i>Md Nawab Ali Khan</h5>
                    <p class="mb-2">Java Backend Developer</p>
                    <p class="mb-3">Passionate about creating scalable web applications and REST APIs</p>
                    <!-- Contact Info -->
                    <div class="d-flex flex-column">
                        <a href="mailto:nawabnak@gmail.com" class="text-light text-decoration-none mb-1">
                            <i class="bi bi-envelope me-2"></i>nawabnak@gmail.com
                        </a>
                        <a href="tel:+919523948889" class="text-light text-decoration-none">
                            <i class="bi bi-telephone me-2"></i>+91 9523948889
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <h6>Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-light text-decoration-none">Home</a></li>
                        <li><a href="jsp/projects.jsp" class="text-light text-decoration-none">Projects</a></li>
                        <li><a href="jsp/contact.jsp" class="text-light text-decoration-none">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h6>Connect</h6>
                    <div class="d-flex gap-3">
                        <a href="https://github.com/yourusername" target="_blank" class="text-light">
                            <i class="bi bi-github fs-5"></i>
                        </a>
                        <a href="https://linkedin.com/in/yourusername" target="_blank" class="text-light">
                            <i class="bi bi-linkedin fs-5"></i>
                        </a>
                        <a href="mailto:nawabnak@gmail.com" class="text-light">
                            <i class="bi bi-envelope fs-5"></i>
                        </a>
                    </div>
                </div>
            </div>
            <hr class="my-4">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="mb-0">&copy; 2024 Md Nawab Ali Khan. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <small class="text-muted">Built with Java, JSP, Servlets & MySQL</small>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="js/script.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Simple alert system
            function showAlert(message, type) {
                var alertPlaceholder = document.getElementById('alertPlaceholder');
                var alertHTML = '<div class="alert alert-' + type + ' alert-dismissible fade show" role="alert">' + message + '<button type="button" class="btn-close" data-bs-dismiss="alert"></button>' + '</div>';
                alertPlaceholder.innerHTML = alertHTML;
                setTimeout(function() {
                    var alert = alertPlaceholder.querySelector('.alert');
                    if (alert) {
                        alert.remove();
                    }
                }, 5000);
            }
        });
    </script>
</body>
</html>
