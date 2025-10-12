package com.nakhandev.portfolio.dao;

import com.nakhandev.portfolio.model.Project;
import com.nakhandev.portfolio.util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Project entity
 * @author nakhandev
 */
public class ProjectDAO {
    private static final Logger LOGGER = Logger.getLogger(ProjectDAO.class.getName());

    /**
     * Get all featured projects (for now, return all projects since featured column doesn't exist)
     * @return List of featured projects
     */
    public List<Project> getAllFeaturedProjects() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects ORDER BY created_at DESC LIMIT 6";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Project project = mapResultSetToProject(rs);
                projects.add(project);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching featured projects", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return projects;
    }

    /**
     * Get all projects
     * @return List of all projects
     */
    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects ORDER BY created_at DESC";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Project project = mapResultSetToProject(rs);
                projects.add(project);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching all projects", e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return projects;
    }

    /**
     * Get project by ID
     * @param id Project ID
     * @return Project object or null if not found
     */
    public Project getProjectById(int id) {
        Project project = null;
        String sql = "SELECT * FROM projects WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                project = mapResultSetToProject(rs);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching project by ID: " + id, e);
        } finally {
            DatabaseUtil.closeResources(conn, stmt, rs);
        }

        return project;
    }

    /**
     * Add new project
     * @param project Project to add
     * @return true if successful, false otherwise
     */
    public boolean addProject(Project project) {
        String sql = "INSERT INTO projects (name, description, tech_stack, demo_link, github_link) VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setString(3, project.getTechStack());
            stmt.setString(4, project.getDemoLink());
            stmt.setString(5, project.getGithubLink());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding project", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Update project
     * @param project Project to update
     * @return true if successful, false otherwise
     */
    public boolean updateProject(Project project) {
        String sql = "UPDATE projects SET name = ?, description = ?, tech_stack = ?, demo_link = ?, github_link = ? WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setString(3, project.getTechStack());
            stmt.setString(4, project.getDemoLink());
            stmt.setString(5, project.getGithubLink());
            stmt.setInt(6, project.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating project", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Delete project
     * @param id Project ID to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteProject(int id) {
        String sql = "DELETE FROM projects WHERE id = ?";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting project", e);
            return false;
        } finally {
            DatabaseUtil.closeResources(conn, stmt, null);
        }
    }

    /**
     * Map ResultSet to Project object
     * @param rs ResultSet
     * @return Project object
     * @throws SQLException if mapping fails
     */
    private Project mapResultSetToProject(ResultSet rs) throws SQLException {
        Project project = new Project();
        project.setId(rs.getInt("id"));
        project.setName(rs.getString("name"));
        project.setDescription(rs.getString("description"));
        project.setTechStack(rs.getString("tech_stack"));
        project.setDemoLink(rs.getString("demo_link"));
        project.setGithubLink(rs.getString("github_link"));
        project.setCreatedAt(rs.getTimestamp("created_at"));
        project.setUpdatedAt(rs.getTimestamp("updated_at"));
        return project;
    }
}
