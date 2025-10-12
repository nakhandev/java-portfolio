<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nakhandev.portfolio.dao.ProjectDAO" %>
<%@ page import="com.nakhandev.portfolio.model.Project" %>
<%@ page import="java.util.List" %>

<%
    // Load projects from database
    ProjectDAO projectDAO = new ProjectDAO();
    List<Project> projects = projectDAO.getAllProjects();
    request.setAttribute("projects", projects);
%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Featured projects by Md Nawab Ali Khan - Java Backend Developer showcasing Spring Boot, REST APIs, and MySQL projects">
    <meta name="keywords" content="Java Projects, Spring Boot, REST API, MySQL, Backend Development">
    <meta name="author" content="Md Nawab Ali Khan">
    <title>Projects - Md Nawab Ali Khan</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../css/styles.css" rel="stylesheet">
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="../">
                <i class="bi bi-code-slash me-2"></i>Md Nawab Ali Khan
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../">
                            <i class="bi bi-house-door me-1"></i>Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="bi bi-folder me-1"></i>Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">
                            <i class="bi bi-envelope me-1"></i>Contact
                        </a>
                    </li>
                </ul>
                <!-- Social Links -->
                <div class="navbar-nav ms-lg-3">
                    <a class="nav-link" href="mailto:nawabnak@gmail.com" title="Email">
                        <i class="bi bi-envelope-fill"></i>
                    </a>
                    <a class="nav-link" href="https://github.com/nawabnakhan" target="_blank" title="GitHub">
                        <i class="bi bi-github"></i>
                    </a>
                    <a class="nav-link" href="https://linkedin.com/in/nawabnakhan" target="_blank" title="LinkedIn">
                        <i class="bi bi-linkedin"></i>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="py-5 mt-5" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; min-height: 60vh; display: flex; align-items: center;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-8 mx-auto text-center">
                    <h1 class="display-4 fw-bold mb-4">
                        <i class="bi bi-folder me-3"></i>My Projects
                    </h1>
                    <p class="lead mb-4">
                        💼 Crafting real-world backend projects with clean architecture and scalability in mind
                    </p>
                    <p class="mb-0">
                        Always building, learning, and contributing — one commit at a time.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Projects Section -->
    <section class="py-5 bg-dark">
        <div class="container">
            <!-- Project Categories -->
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h2 class="display-5 fw-bold text-white mb-3">🚀 Project Categories</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                </div>
            </div>

            <!-- Project Category Cards -->
            <div class="row g-4 mb-5">
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body text-center">
                            <i class="bi bi-database display-4 text-warning mb-3"></i>
                            <h5>Backend Systems</h5>
                            <p class="mb-0">REST APIs, Microservices, Database Design</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body text-center">
                            <i class="bi bi-shield-check display-4 text-warning mb-3"></i>
                            <h5>Security</h5>
                            <p class="mb-0">Authentication, Authorization, Data Protection</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body text-center">
                            <i class="bi bi-cart display-4 text-warning mb-3"></i>
                            <h5>E-commerce</h5>
                            <p class="mb-0">Shopping Carts, Payment Integration, Inventory</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Featured Projects -->
            <div class="row">
                <div class="col-12 text-center mb-5">
                    <h2 class="display-5 fw-bold text-white">💼 Featured Projects</h2>
                    <div class="border-bottom border-warning w-25 mx-auto"></div>
                    <p class="lead text-white-50 mt-3">Here are some of my recent backend development projects</p>
                </div>
            </div>

            <!-- Project Cards -->
            <div class="row g-4">
                <c:forEach var="project" items="${projects}">
                    <div class="col-lg-6 col-xl-4">
                        <div class="card bg-secondary text-white h-100 border-secondary">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start mb-3">
                                    <h5 class="card-title text-warning mb-0">${project.name}</h5>
                                    <div class="project-links">
                                        <c:if test="${not empty project.githubLink}">
                                            <a href="${project.githubLink}" target="_blank" class="btn btn-sm btn-outline-warning me-2">
                                                <i class="bi bi-github"></i>
                                            </a>
                                        </c:if>
                                        <c:if test="${not empty project.demoLink}">
                                            <a href="${project.demoLink}" target="_blank" class="btn btn-sm btn-outline-warning">
                                                <i class="bi bi-box-arrow-up-right"></i>
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                                <p class="card-text">${project.description}</p>

                                <!-- Tech Stack -->
                                <div class="mb-3">
                                    <small class="text-muted d-block mb-2">Technologies Used:</small>
                                    <div class="tech-stack-badges">
                                        <c:forEach var="tech" items="${tech}">
                                            <span class="badge bg-dark text-light me-1 mb-1">${tech.trim()}</span>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- Project Meta -->
                                <div class="project-meta d-flex justify-content-between align-items-center">
                                    <small class="text-muted">
                                        <i class="bi bi-calendar me-1"></i>Created: ${project.createdAt}
                                    </small>
                                    <span class="badge bg-success">Active</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Additional Projects (Static for now) -->
                <div class="col-lg-6 col-xl-4">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <h5 class="card-title text-warning mb-0">Blog Management System</h5>
                                <div class="project-links">
                                    <a href="https://github.com/nawabnakhan/blog-system" target="_blank" class="btn btn-sm btn-outline-warning me-2">
                                        <i class="bi bi-github"></i>
                                    </a>
                                </div>
                            </div>
                            <p class="card-text">Complete blog management system with admin panel, user authentication, and content management features.</p>
                            <div class="mb-3">
                                <small class="text-muted d-block mb-2">Technologies Used:</small>
                                <div class="tech-stack-badges">
                                    <span class="badge bg-dark text-light me-1 mb-1">Java</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">Spring Boot</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">MySQL</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">Thymeleaf</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-xl-4">
                    <div class="card bg-secondary text-white h-100 border-secondary">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <h5 class="card-title text-warning mb-0">Task Management API</h5>
                                <div class="project-links">
                                    <a href="https://github.com/nawabnakhan/task-api" target="_blank" class="btn btn-sm btn-outline-warning me-2">
                                        <i class="bi bi-github"></i>
                                    </a>
                                </div>
                            </div>
                            <p class="card-text">RESTful API for task management with user authentication, team collaboration, and real-time updates.</p>
                            <div class="mb-3">
                                <small class="text-muted d-block mb-2">Technologies Used:</small>
                                <div class="tech-stack-badges">
                                    <span class="badge bg-dark text-light me-1 mb-1">Java</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">Spring Boot</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">PostgreSQL</span>
                                    <span class="badge bg-dark text-light me-1 mb-1">JWT</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Call to Action -->
            <div class="row mt-5">
                <div class="col-12 text-center">
                    <div class="card bg-gradient-primary text-white border-0">
                        <div class="card-body p-5">
                            <h3 class="card-title mb-3">🚀 Ready to Start a New Project?</h3>
                            <p class="card-text lead mb-4">
                                I'm always excited to take on new challenges and build amazing backend solutions.
                                Let's discuss how we can bring your ideas to life!
                            </p>
                            <div class="d-flex justify-content-center gap-3 flex-wrap">
                                <a href="contact.jsp" class="btn btn-light btn-lg">
                                    <i class="bi bi-envelope me-2"></i>Get In Touch
                                </a>
                                <a href="../" class="btn btn-outline-light btn-lg">
                                    <i class="bi bi-house me-2"></i>Back to Home
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-black text-light py-4">
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
                        <li><a href="../" class="text-light text-decoration-none">Home</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Projects</a></li>
                        <li><a href="contact.jsp" class="text-light text-decoration-none">Contact</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h6>Connect</h6>
                    <div class="d-flex gap-3">
                        <a href="https://github.com/nawabnakhan" target="_blank" class="text-light">
                            <i class="bi bi-github fs-5"></i>
                        </a>
                        <a href="https://linkedin.com/in/nawabnakhan" target="_blank" class="text-light">
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
    <script src="../js/scripts.js"></script>

    <style>
        .bg-gradient-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .tech-stack-badges {
            max-height: 120px;
            overflow-y: auto;
        }

        .project-links {
            display: flex;
            gap: 0.5rem;
        }

        .project-links .btn {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }
    </style>
</body>
</html>
