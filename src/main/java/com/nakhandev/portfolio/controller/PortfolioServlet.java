package com.nakhandev.portfolio.controller;

import com.nakhandev.portfolio.dao.*;
import com.nakhandev.portfolio.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Main servlet for handling portfolio home page requests
 * @author nakhandev
 */
@WebServlet("/")
public class PortfolioServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(PortfolioServlet.class.getName());

    private ProjectDAO projectDAO;
    private SkillDAO skillDAO;
    private EducationDAO educationDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        projectDAO = new ProjectDAO();
        skillDAO = new SkillDAO();
        educationDAO = new EducationDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Load portfolio data
            List<Project> featuredProjects = projectDAO.getAllFeaturedProjects();
            List<Skill> skills = skillDAO.getAllSkills();
            List<String> categories = skillDAO.getAllCategories();
            List<Education> educationList = educationDAO.getAllEducation();

            // Set attributes for JSP
            request.setAttribute("featuredProjects", featuredProjects);
            request.setAttribute("skills", skills);
            request.setAttribute("categories", categories);
            request.setAttribute("educationList", educationList);

            // Set page metadata
            request.setAttribute("pageTitle", "Java Backend Developer | Portfolio");
            request.setAttribute("pageDescription", "Experienced Java Backend Developer specializing in Spring Boot, REST APIs, and SQL databases");

            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error loading portfolio data", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading portfolio");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if needed (e.g., search functionality)
        doGet(request, response);
    }
}
