// JavaScript for Java Developer Portfolio

document.addEventListener('DOMContentLoaded', function() {
    // Typing animation for hero section
    initTypingAnimation();

    // Smooth scrolling for navigation links
    initSmoothScrolling();

    // Navbar background on scroll
    initNavbarScroll();

    // Animate elements on scroll
    initScrollAnimations();

    // Form validation enhancement
    initFormValidation();
});

// Typing Animation
function initTypingAnimation() {
    const typingText = document.getElementById('typing-text');
    if (!typingText) return;

    const roles = [
        'Backend Developer',
        'Spring Boot Expert',
        'REST API Designer',
        'Problem Solver'
    ];

    let currentRole = 0;
    let currentChar = 0;
    let isDeleting = false;

    function typeWriter() {
        const role = roles[currentRole];

        if (isDeleting) {
            typingText.textContent = role.substring(0, currentChar - 1);
            currentChar--;
        } else {
            typingText.textContent = role.substring(0, currentChar + 1);
            currentChar++;
        }

        if (!isDeleting && currentChar === role.length) {
            setTimeout(() => isDeleting = true, 2000);
        } else if (isDeleting && currentChar === 0) {
            isDeleting = false;
            currentRole = (currentRole + 1) % roles.length;
        }

        setTimeout(typeWriter, isDeleting ? 100 : 200);
    }

    typeWriter();
}

// Smooth Scrolling
function initSmoothScrolling() {
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');

    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            const targetSection = document.querySelector(targetId);

            if (targetSection) {
                const offsetTop = targetSection.offsetTop - 80; // Account for fixed navbar

                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });

                // Close mobile menu if open
                const navbarCollapse = document.querySelector('.navbar-collapse');
                if (navbarCollapse.classList.contains('show')) {
                    bootstrap.Collapse.getInstance(navbarCollapse).hide();
                }
            }
        });
    });
}

// Navbar background on scroll
function initNavbarScroll() {
    const navbar = document.querySelector('.navbar');

    window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
            navbar.classList.add('navbar-scrolled');
        } else {
            navbar.classList.remove('navbar-scrolled');
        }
    });
}

// Scroll Animations
function initScrollAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);

    // Observe elements for animation
    const animateElements = document.querySelectorAll(
        '.skill-category, .project-card, .timeline-item, .stat-card, .focus-item'
    );

    animateElements.forEach(el => {
        observer.observe(el);
    });
}

// Form Validation Enhancement
function initFormValidation() {
    const contactForm = document.querySelector('.contact-form');
    if (!contactForm) return;

    const nameInput = document.getElementById('name');
    const emailInput = document.getElementById('email');
    const subjectInput = document.getElementById('subject');
    const messageInput = document.getElementById('message');

    // Real-time validation
    nameInput?.addEventListener('blur', validateName);
    emailInput?.addEventListener('blur', validateEmail);
    subjectInput?.addEventListener('blur', validateSubject);
    messageInput?.addEventListener('blur', validateMessage);

    // Form submission validation
    contactForm.addEventListener('submit', function(e) {
        let isValid = true;

        isValid = validateName() && isValid;
        isValid = validateEmail() && isValid;
        isValid = validateSubject() && isValid;
        isValid = validateMessage() && isValid;

        if (!isValid) {
            e.preventDefault();
        }
    });

    function validateName() {
        return showValidation(nameInput, nameInput?.value.length >= 2, 'Name must be at least 2 characters');
    }

    function validateEmail() {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return showValidation(emailInput, emailRegex.test(emailInput?.value), 'Please enter a valid email address');
    }

    function validateSubject() {
        return showValidation(subjectInput, subjectInput?.value.length >= 5, 'Subject must be at least 5 characters');
    }

    function validateMessage() {
        return showValidation(messageInput, messageInput?.value.length >= 10, 'Message must be at least 10 characters');
    }

    function showValidation(input, isValid, message) {
        if (!input) return true;

        const formGroup = input.closest('.mb-3');
        const feedback = formGroup.querySelector('.invalid-feedback');

        if (!isValid) {
            input.classList.add('is-invalid');
            input.classList.remove('is-valid');

            if (!feedback) {
                const feedbackEl = document.createElement('div');
                feedbackEl.className = 'invalid-feedback';
                feedbackEl.textContent = message;
                formGroup.appendChild(feedbackEl);
            } else {
                feedback.textContent = message;
            }
            return false;
        } else {
            input.classList.add('is-valid');
            input.classList.remove('is-invalid');
            return true;
        }
    }
}

// Theme Toggle (for future enhancement)
function toggleTheme() {
    document.body.classList.toggle('light-theme');
    localStorage.setItem('theme', document.body.classList.contains('light-theme') ? 'light' : 'dark');
}

// Load saved theme
function loadTheme() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'light') {
        document.body.classList.add('light-theme');
    }
}

// Initialize theme on load
loadTheme();

// Add CSS for animations
const animationCSS = `
    .animate-in {
        opacity: 1 !important;
        transform: translateY(0) !important;
        transition: opacity 0.6s ease, transform 0.6s ease;
    }

    .skill-category,
    .project-card,
    .timeline-item,
    .stat-card,
    .focus-item {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.6s ease, transform 0.6s ease;
    }

    .navbar-scrolled {
        background: rgba(26, 26, 26, 0.95) !important;
        backdrop-filter: blur(10px);
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    }

    .light-theme {
        background-color: #ffffff !important;
        color: #212529 !important;
    }

    .light-theme .hero-section {
        background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%) !important;
        color: #212529 !important;
    }

    .light-theme .section-title {
        color: #212529 !important;
    }

    .form-control:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
    }

    .btn {
        border-radius: 8px;
        font-weight: 600;
    }

    .btn-primary {
        background: linear-gradient(45deg, #0d6efd, #0056b3);
        border: none;
    }

    .btn-primary:hover {
        background: linear-gradient(45deg, #0056b3, #004085);
        transform: translateY(-2px);
    }
`;

// Inject animation CSS
const style = document.createElement('style');
style.textContent = animationCSS;
document.head.appendChild(style);
