package com.nakhandev.portfolio.controller;

import com.nakhandev.portfolio.dao.UserDAO;
import com.nakhandev.portfolio.model.User;
import com.nakhandev.portfolio.util.EmailUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet for handling contact form submissions
 * @author nakhandev
 */
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(ContactServlet.class.getName());

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to home page for GET requests
        response.sendRedirect(request.getContextPath() + "/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set character encoding
        request.setCharacterEncoding("UTF-8");

        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate input
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            subject == null || subject.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required. Please fill out the form completely.");
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
            return;
        }

        // Validate email format (basic validation)
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
            return;
        }

        try {
            // Create User object
            User user = new User(name.trim(), email.trim(), subject.trim(), message.trim());

            // Save to database
            boolean saved = userDAO.saveContactMessage(user);

            if (saved) {
                // Send email notification
                boolean emailSent = EmailUtil.sendContactFormEmail(name, email, subject, message);

                if (emailSent) {
                    LOGGER.log(Level.INFO, "Contact form submitted successfully by: " + name + " (" + email + ")");
                    request.setAttribute("success", "Thank you for your message! I'll get back to you soon.");
                } else {
                    LOGGER.log(Level.WARNING, "Contact form saved but email notification failed for: " + email);
                    request.setAttribute("success", "Thank you for your message! I'll get back to you soon. (Email notification failed)");
                }
            } else {
                LOGGER.log(Level.SEVERE, "Failed to save contact form message from: " + email);
                request.setAttribute("error", "Sorry, there was an error sending your message. Please try again later.");
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing contact form", e);
            request.setAttribute("error", "Sorry, there was an error sending your message. Please try again later.");
        }

        // Forward back to home page with success/error message
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }
}
