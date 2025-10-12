package com.nakhandev.portfolio.dao;

import com.nakhandev.portfolio.model.Education;
import com.nakhandev.portfolio.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Education entity
 * @author nakhandev
 */
public class EducationDAO {
    private static final Logger LOGGER = Logger.getLogger(EducationDAO.class.getName());

    /**
     * Get all education records ordered by display order
     * @return List of education records
     */
    public List<Education> getAllEducation() {
        List<Education> educationList = new ArrayList<>();
        String sql = "SELECT * FROM education ORDER BY display_order, end_year DESC";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Education education = mapResultSetToEducation(rs);
                educationList.add(education);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all education records", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return educationList;
    }

    /**
     * Get education by ID
     * @param id Education ID
     * @return Education object or null if not found
     */
    public Education getEducationById(int id) {
        Education education = null;
        String sql = "SELECT * FROM education WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                education = mapResultSetToEducation(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching education by ID: " + id, e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return education;
    }

    /**
     * Add new education record
     * @param education Education to add
     * @return true if successful, false otherwise
     */
    public boolean addEducation(Education education) {
        String sql = "INSERT INTO education (institution, degree, start_year, end_year, description, display_order) VALUES (?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, education.getInstitution());
            stmt.setString(2, education.getDegree());
            stmt.setInt(3, education.getStartYear());
            stmt.setObject(4, education.getEndYear()); // Can be null
            stmt.setString(5, education.getDescription());
            stmt.setInt(6, education.getDisplayOrder());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding education", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Update education record
     * @param education Education to update
     * @return true if successful, false otherwise
     */
    public boolean updateEducation(Education education) {
        String sql = "UPDATE education SET institution = ?, degree = ?, start_year = ?, end_year = ?, description = ?, display_order = ? WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, education.getInstitution());
            stmt.setString(2, education.getDegree());
            stmt.setInt(3, education.getStartYear());
            stmt.setObject(4, education.getEndYear()); // Can be null
            stmt.setString(5, education.getDescription());
            stmt.setInt(6, education.getDisplayOrder());
            stmt.setInt(7, education.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating education", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Delete education record
     * @param id Education ID to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteEducation(int id) {
        String sql = "DELETE FROM education WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting education", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Map ResultSet to Education object
     * @param rs ResultSet
     * @return Education object
     * @throws SQLException if mapping fails
     */
    private Education mapResultSetToEducation(ResultSet rs) throws SQLException {
        Education education = new Education();
        education.setId(rs.getInt("id"));
        education.setInstitution(rs.getString("institution"));
        education.setDegree(rs.getString("degree"));
        education.setStartYear(rs.getInt("start_year"));
        education.setEndYear((Integer) rs.getObject("end_year")); // Can be null
        education.setDescription(rs.getString("description"));
        education.setDisplayOrder(rs.getInt("display_order"));
        education.setCreatedAt(rs.getTimestamp("created_at"));
        return education;
    }
}
