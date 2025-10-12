<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nakhandev.portfolio.dao.UserDAO" %>
<%@ page import="com.nakhandev.portfolio.model.User" %>
<%@ page import="com.nakhandev.portfolio.util.EmailUtil" %>

<%
    // Check if form was submitted
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String subject = request.getParameter("subject");
    String message = request.getParameter("message");

    String successMessage = null;
    String errorMessage = null;

    if (name != null && email != null && subject != null && message != null) {
        try {
            // Validate input
            if (name.trim().isEmpty() || email.trim().isEmpty() || subject.trim().isEmpty() || message.trim().isEmpty()) {
                errorMessage = "All fields are required. Please fill out the form completely.";
            } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                errorMessage = "Please enter a valid email address.";
            } else {
                // Create and save user message
                User user = new User(name.trim(), email.trim(), subject.trim(), message.trim());
                UserDAO userDAO = new UserDAO();

                if (userDAO.saveContactMessage(user)) {
                    // Send email notification
                    boolean emailSent = EmailUtil.sendContactFormEmail(name, email, subject, message);

                    if (emailSent) {
                        successMessage = "Thank you for your message! I'll get back to you soon.";
                    } else {
                        successMessage = "Thank you for your message! I'll get back to you soon. (Email notification failed)";
                    }
                } else {
                    errorMessage = "Sorry, there was an error sending your message. Please try again later.";
                }
            }
        } catch (Exception e) {
            errorMessage = "Sorry, there was an error sending your message. Please try again later.";
        }
    }

    // Set attributes for JSP
    request.setAttribute("successMessage", successMessage);
    request.setAttribute("errorMessage", errorMessage);
%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Contact Md Nawab Ali Khan - Java Backend Developer for projects, collaborations, and inquiries">
    <meta name="keywords" content="Contact Java Developer, Backend Developer Contact, Spring Boot Developer">
    <meta name="author" content="Md Nawab Ali Khan">
    <title>Contact - Md Nawab Ali Khan</title>

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
                        <a class="nav-link" href="projects.jsp">
                            <i class="bi bi-folder me-1"></i>Projects
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
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
                        <i class="bi bi-envelope me-3"></i>Get In Touch
                    </h1>
                    <p class="lead mb-4">
                        🌐 Let's discuss your next project or collaboration opportunity
                    </p>
                    <p class="mb-0">
                        I'm always interested in new opportunities and exciting projects.
                        Let's have a conversation about how we can work together!
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="py-5 bg-dark">
        <div class="container">
            <!-- Alert Messages -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle me-2"></i>${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle me-2"></i>${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="row">
                <!-- Contact Form -->
                <div class="col-lg-8">
                    <div class="card bg-secondary text-white border-secondary">
                        <div class="card-body p-4">
                            <h3 class="card-title text-warning mb-4">
                                <i class="bi bi-envelope-paper me-2"></i>Send Me a Message
                            </h3>

                            <form action="contact.jsp" method="post" id="contactForm">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="name" class="form-label">Full Name *</label>
                                        <input type="text" class="form-control bg-dark text-white border-secondary"
                                               id="name" name="name" value="<%= name != null ? name : "" %>" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email Address *</label>
                                        <input type="email" class="form-control bg-dark text-white border-secondary"
                                               id="email" name="email" value="<%= email != null ? email : "" %>" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control bg-dark text-white border-secondary"
                                               id="phone" name="phone" value="<%= phone != null ? phone : "" %>">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="subject" class="form-label">Subject *</label>
                                        <input type="text" class="form-control bg-dark text-white border-secondary"
                                               id="subject" name="subject" value="<%= subject != null ? subject : "" %>" required>
                                    </div>
                                    <div class="col-12">
                                        <label for="message" class="form-label">Message *</label>
                                        <textarea class="form-control bg-dark text-white border-secondary"
                                                  id="message" name="message" rows="6" required><%= message != null ? message : "" %></textarea>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-warning btn-lg px-5">
                                            <i class="bi bi-send me-2"></i>Send Message
                                        </button>
                                        <a href="../" class="btn btn-outline-secondary btn-lg ms-3">
                                            <i class="bi bi-arrow-left me-2"></i>Back to Home
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Contact Information -->
                <div class="col-lg-4">
                    <!-- Contact Info Card -->
                    <div class="card bg-secondary text-white border-secondary mb-4">
                        <div class="card-body">
                            <h5 class="card-title text-warning mb-4">
                                <i class="bi bi-person-lines-fill me-2"></i>Contact Information
                            </h5>

                            <div class="contact-info-item mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-envelope-fill text-warning me-3 fs-5"></i>
                                    <div>
                                        <strong>Email</strong>
                                        <br>
                                        <a href="mailto:nawabnak@gmail.com" class="text-white text-decoration-none">
                                            nawabnak@gmail.com
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="contact-info-item mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-telephone-fill text-warning me-3 fs-5"></i>
                                    <div>
                                        <strong>Phone</strong>
                                        <br>
                                        <a href="tel:+919523948889" class="text-white text-decoration-none">
                                            +91 9523948889
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="contact-info-item mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-github text-warning me-3 fs-5"></i>
                                    <div>
                                        <strong>GitHub</strong>
                                        <br>
                                        <a href="https://github.com/nawabnakhan" target="_blank" class="text-white text-decoration-none">
                                            github.com/nawabnakhan
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="contact-info-item">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-linkedin text-warning me-3 fs-5"></i>
                                    <div>
                                        <strong>LinkedIn</strong>
                                        <br>
                                        <a href="https://linkedin.com/in/nawabnakhan" target="_blank" class="text-white text-decoration-none">
                                            linkedin.com/in/nawabnakhan
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Availability Card -->
                    <div class="card bg-gradient-primary text-white border-0">
                        <div class="card-body text-center">
                            <i class="bi bi-clock-history display-4 mb-3"></i>
                            <h6 class="card-title">Quick Response</h6>
                            <p class="card-text mb-0">
                                I typically respond to messages within 24 hours.
                                For urgent inquiries, feel free to call me directly.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Information -->
            <div class="row mt-5">
                <div class="col-12">
                    <div class="card bg-secondary text-white border-secondary">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 text-center mb-3 mb-md-0">
                                    <i class="bi bi-rocket display-4 text-warning mb-3"></i>
                                    <h6>Project Collaboration</h6>
                                    <p class="mb-0">Open to discussing new projects and collaborations</p>
                                </div>
                                <div class="col-md-4 text-center mb-3 mb-md-0">
                                    <i class="bi bi-code-slash display-4 text-warning mb-3"></i>
                                    <h6>Code Review</h6>
                                    <p class="mb-0">Available for code reviews and technical discussions</p>
                                </div>
                                <div class="col-md-4 text-center">
                                    <i class="bi bi-people display-4 text-warning mb-3"></i>
                                    <h6>Team Projects</h6>
                                    <p class="mb-0">Experienced in working with development teams</p>
                                </div>
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
                        <li><a href="projects.jsp" class="text-light text-decoration-none">Projects</a></li>
                        <li><a href="#" class="text-light text-decoration-none">Contact</a></li>
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

        .contact-info-item {
            padding: 1rem;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.05);
            transition: all 0.3s ease;
        }

        .contact-info-item:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.1);
            border-color: #ffc107;
            box-shadow: 0 0 0 0.2rem rgba(255, 193, 7, 0.25);
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 193, 7, 0.4);
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Form validation
            const contactForm = document.getElementById('contactForm');
            if (contactForm) {
                contactForm.addEventListener('submit', function(e) {
                    const name = document.getElementById('name').value.trim();
                    const email = document.getElementById('email').value.trim();
                    const subject = document.getElementById('subject').value.trim();
                    const message = document.getElementById('message').value.trim();

                    if (name.length < 2) {
                        alert('Please enter a valid name (at least 2 characters)');
                        e.preventDefault();
                        return false;
                    }

                    if (!email.match(/^[^\s@]+@[^\s@]+\.[^\s@]+$/)) {
                        alert('Please enter a valid email address');
                        e.preventDefault();
                        return false;
                    }

                    if (subject.length < 5) {
                        alert('Please enter a subject (at least 5 characters)');
                        e.preventDefault();
                        return false;
                    }

                    if (message.length < 10) {
                        alert('Please enter a message (at least 10 characters)');
                        e.preventDefault();
                        return false;
                    }

                    return true;
                });
            }
        });
    </script>
</body>
</html>
