-- Database schema for Java Developer Portfolio
-- Run this script in MySQL to create the necessary tables

-- Create database (if not exists)
CREATE DATABASE IF NOT EXISTS portfolio_db;
USE portfolio_db;

-- Users table (for contact form messages)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(200),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    tech_stack VARCHAR(500) NOT NULL,
    project_url VARCHAR(500),
    github_url VARCHAR(500),
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Skills table
CREATE TABLE IF NOT EXISTS skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    skill_name VARCHAR(100) NOT NULL,
    proficiency_level VARCHAR(50),
    display_order INT DEFAULT 0
);

-- Education table
CREATE TABLE IF NOT EXISTS education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    institution VARCHAR(200) NOT NULL,
    degree VARCHAR(200) NOT NULL,
    year_completed VARCHAR(20) NOT NULL,
    description TEXT,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data for projects
INSERT INTO projects (title, description, tech_stack, project_url, github_url, featured) VALUES
('Student Management System', 'CRUD-based REST API for managing student records with Spring Boot and MySQL integration.', 'Java, Spring Boot, MySQL, REST API', NULL, 'https://github.com/nakhandev/student-management', TRUE),
('Login & Registration API', 'Secure user registration and authentication system with validation and JWT token support.', 'Java, Spring Boot, Spring Security, JWT', NULL, 'https://github.com/nakhandev/auth-api', TRUE),
('E-commerce Cart System', 'Complete shopping cart implementation with layered architecture and database persistence.', 'Java, Spring MVC, MySQL, JSP', NULL, 'https://github.com/nakhandev/ecommerce-cart', TRUE);

-- Insert sample data for skills
INSERT INTO skills (category, skill_name, proficiency_level, display_order) VALUES
('Languages', 'Java', 'Expert', 1),
('Languages', 'SQL', 'Advanced', 2),
('Frameworks', 'Spring Boot', 'Advanced', 3),
('Frameworks', 'Hibernate', 'Intermediate', 4),
('Frameworks', 'JUnit', 'Intermediate', 5),
('Frameworks', 'Mockito', 'Intermediate', 6),
('Databases', 'MySQL', 'Advanced', 7),
('Databases', 'H2', 'Intermediate', 8),
('Tools', 'Git', 'Advanced', 9),
('Tools', 'GitHub', 'Advanced', 10),
('Tools', 'Postman', 'Advanced', 11),
('Tools', 'Maven', 'Advanced', 12),
('Tools', 'NetBeans', 'Advanced', 13),
('Tools', 'Linux', 'Intermediate', 14);

-- Insert sample data for education
INSERT INTO education (institution, degree, year_completed, description, display_order) VALUES
('Sacred Heart School, Sitamarhi', 'Matriculation (10th)', '2016', 'Built a strong foundation in academics, discipline, and analytical thinking.', 1),
('State Board of Technical Education', 'Diploma in Computer Science & Engineering', '2021', 'Learned core programming concepts, data structures, and software fundamentals. Developed mini-projects and gained hands-on experience in backend development.', 2),
('Integral University, Lucknow', 'Bachelor of Technology (B.Tech) in Computer Science & Engineering', '2024', 'Specialized in Java, Spring Boot, Databases, and Backend Development. Worked on real-world projects and explored API design, Spring Security, and software architecture.', 3);

-- Create index for better performance
CREATE INDEX idx_projects_featured ON projects(featured);
CREATE INDEX idx_skills_category ON skills(category);
CREATE INDEX idx_education_order ON education(display_order);
