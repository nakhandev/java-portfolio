package com.nakhandev.portfolio.dao;

import com.nakhandev.portfolio.model.User;
import com.nakhandev.portfolio.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for User entity (Contact form messages)
 * @author nakhandev
 */
public class UserDAO {
    private static final Logger LOGGER = Logger.getLogger(UserDAO.class.getName());

    /**
     * Save contact form message
     * @param user User message to save
     * @return true if successful, false otherwise
     */
    public boolean saveContactMessage(User user) {
        String sql = "INSERT INTO users (name, email, subject, message) VALUES (?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getSubject());
            stmt.setString(4, user.getMessage());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error saving contact message", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Get all contact messages (for admin purposes)
     * @return List of all contact messages
     */
    public List<User> getAllContactMessages() {
        List<User> messages = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY created_at DESC";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                User user = mapResultSetToUser(rs);
                messages.add(user);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all contact messages", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return messages;
    }

    /**
     * Get contact message by ID
     * @param id Message ID
     * @return User object or null if not found
     */
    public User getContactMessageById(int id) {
        User user = null;
        String sql = "SELECT * FROM users WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                user = mapResultSetToUser(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching contact message by ID: " + id, e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return user;
    }

    /**
     * Delete contact message
     * @param id Message ID to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteContactMessage(int id) {
        String sql = "DELETE FROM users WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting contact message", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Get recent contact messages (for admin dashboard)
     * @param limit Number of recent messages to fetch
     * @return List of recent contact messages
     */
    public List<User> getRecentContactMessages(int limit) {
        List<User> messages = new ArrayList<>();
        String sql = "SELECT * FROM users ORDER BY created_at DESC LIMIT ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, limit);
            rs = stmt.executeQuery();

            while (rs.next()) {
                User user = mapResultSetToUser(rs);
                messages.add(user);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching recent contact messages", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return messages;
    }

    /**
     * Map ResultSet to User object
     * @param rs ResultSet
     * @return User object
     * @throws SQLException if mapping fails
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setEmail(rs.getString("email"));
        user.setSubject(rs.getString("subject"));
        user.setMessage(rs.getString("message"));
        user.setCreatedAt(rs.getTimestamp("created_at"));
        return user;
    }
}
