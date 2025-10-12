package com.nakhandev.portfolio.dao;

import com.nakhandev.portfolio.model.Skill;
import com.nakhandev.portfolio.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Skill entity
 * @author nakhandev
 */
public class SkillDAO {
    private static final Logger LOGGER = Logger.getLogger(SkillDAO.class.getName());

    /**
     * Get all skills grouped by category
     * @return List of skills ordered by category and display order
     */
    public List<Skill> getAllSkills() {
        List<Skill> skills = new ArrayList<>();
        String sql = "SELECT * FROM skills ORDER BY category, display_order, skill_name";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Skill skill = mapResultSetToSkill(rs);
                skills.add(skill);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all skills", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return skills;
    }

    /**
     * Get skills by category
     * @param category Skill category
     * @return List of skills in the specified category
     */
    public List<Skill> getSkillsByCategory(String category) {
        List<Skill> skills = new ArrayList<>();
        String sql = "SELECT * FROM skills WHERE category = ? ORDER BY display_order, skill_name";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, category);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Skill skill = mapResultSetToSkill(rs);
                skills.add(skill);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching skills by category: " + category, e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return skills;
    }

    /**
     * Get all unique categories
     * @return List of unique skill categories
     */
    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        String sql = "SELECT DISTINCT category FROM skills ORDER BY category";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching skill categories", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return categories;
    }

    /**
     * Get skill by ID
     * @param id Skill ID
     * @return Skill object or null if not found
     */
    public Skill getSkillById(int id) {
        Skill skill = null;
        String sql = "SELECT * FROM skills WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                skill = mapResultSetToSkill(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching skill by ID: " + id, e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return skill;
    }

    /**
     * Add new skill
     * @param skill Skill to add
     * @return true if successful, false otherwise
     */
    public boolean addSkill(Skill skill) {
        String sql = "INSERT INTO skills (category, skill_name, proficiency_level, display_order) VALUES (?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, skill.getCategory());
            stmt.setString(2, skill.getSkillName());
            stmt.setString(3, skill.getProficiencyLevel());
            stmt.setInt(4, skill.getDisplayOrder());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding skill", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Update skill
     * @param skill Skill to update
     * @return true if successful, false otherwise
     */
    public boolean updateSkill(Skill skill) {
        String sql = "UPDATE skills SET category = ?, skill_name = ?, proficiency_level = ?, display_order = ? WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, skill.getCategory());
            stmt.setString(2, skill.getSkillName());
            stmt.setString(3, skill.getProficiencyLevel());
            stmt.setInt(4, skill.getDisplayOrder());
            stmt.setInt(5, skill.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating skill", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Delete skill
     * @param id Skill ID to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteSkill(int id) {
        String sql = "DELETE FROM skills WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting skill", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Map ResultSet to Skill object
     * @param rs ResultSet
     * @return Skill object
     * @throws SQLException if mapping fails
     */
    private Skill mapResultSetToSkill(ResultSet rs) throws SQLException {
        Skill skill = new Skill();
        skill.setId(rs.getInt("id"));
        skill.setCategory(rs.getString("category"));
        skill.setSkillName(rs.getString("skill_name"));
        skill.setProficiencyLevel(rs.getString("proficiency_level"));
        skill.setDisplayOrder(rs.getInt("display_order"));
        return skill;
    }
}
