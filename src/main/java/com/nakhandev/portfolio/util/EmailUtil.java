package com.nakhandev.portfolio.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * Email utility class for sending emails via SMTP
 * @author nakhandev
 */
public class EmailUtil {
    private static final Logger LOGGER = Logger.getLogger(EmailUtil.class.getName());
    private static Properties emailProps;

    static {
        loadEmailProperties();
    }

    /**
     * Load email configuration from properties file
     */
    private static void loadEmailProperties() {
        try (InputStream input = EmailUtil.class.getClassLoader().getResourceAsStream("database.properties")) {
            Properties props = new Properties();
            if (input != null) {
                props.load(input);
                emailProps = new Properties();
                emailProps.put("mail.smtp.host", props.getProperty("mail.smtp.host", "smtp.gmail.com"));
                emailProps.put("mail.smtp.port", props.getProperty("mail.smtp.port", "587"));
                emailProps.put("mail.smtp.auth", props.getProperty("mail.smtp.auth", "true"));
                emailProps.put("mail.smtp.starttls.enable", props.getProperty("mail.smtp.starttls.enable", "true"));
            } else {
                LOGGER.log(Level.SEVERE, "Unable to find database.properties file for email configuration");
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error loading email properties", e);
        }
    }

    /**
     * Send email using the configured SMTP settings
     * @param to Recipient email address
     * @param subject Email subject
     * @param body Email body content
     * @return true if email sent successfully, false otherwise
     */
    public static boolean sendEmail(String to, String subject, String body) {
        try {
            // Get email configuration from properties
            String from = getProperty("mail.from");
            String username = getProperty("mail.username");
            String password = getProperty("mail.password");

            if (from == null || username == null || password == null) {
                LOGGER.log(Level.SEVERE, "Email configuration is incomplete");
                return false;
            }

            // Setup mail server properties
            Properties props = new Properties();
            props.putAll(emailProps);

            // Create authenticator
            Authenticator auth = new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            };

            // Create session
            Session session = Session.getInstance(props, auth);

            // Create message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // Send message
            Transport.send(message);

            LOGGER.log(Level.INFO, "Email sent successfully to: " + to);
            return true;

        } catch (MessagingException e) {
            LOGGER.log(Level.SEVERE, "Error sending email to: " + to, e);
            return false;
        }
    }

    /**
     * Send contact form email with formatted content
     * @param name Sender name
     * @param email Sender email
     * @param subject Email subject
     * @param message Message content
     * @return true if email sent successfully, false otherwise
     */
    public static boolean sendContactFormEmail(String name, String email, String subject, String message) {
        String adminEmail = getProperty("mail.from");
        if (adminEmail == null) {
            LOGGER.log(Level.SEVERE, "Admin email not configured");
            return false;
        }

        // Format email body
        StringBuilder emailBody = new StringBuilder();
        emailBody.append("New contact form submission:\n\n");
        emailBody.append("Name: ").append(name).append("\n");
        emailBody.append("Email: ").append(email).append("\n");
        emailBody.append("Subject: ").append(subject).append("\n\n");
        emailBody.append("Message:\n").append(message).append("\n\n");
        emailBody.append("This message was sent from your portfolio contact form.");

        return sendEmail(adminEmail, "Portfolio Contact Form: " + subject, emailBody.toString());
    }

    /**
     * Check if email is properly configured
     * @return true if email configuration is complete, false otherwise
     */
    public static boolean isEmailConfigured() {
        String from = getProperty("mail.from");
        String username = getProperty("mail.username");
        String password = getProperty("mail.password");

        return from != null && username != null && password != null &&
               !from.equals("your-email@gmail.com") &&
               !password.equals("your-app-password");
    }

    /**
     * Get property value from email configuration
     * @param key Property key
     * @return Property value or null if not found
     */
    private static String getProperty(String key) {
        try (InputStream input = EmailUtil.class.getClassLoader().getResourceAsStream("database.properties")) {
            Properties props = new Properties();
            if (input != null) {
                props.load(input);
                return props.getProperty(key);
            }
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error reading property: " + key, e);
        }
        return null;
    }
}
