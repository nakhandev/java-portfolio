package com.nakhandev.portfolio.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Database utility class for managing database connections
 * @author nakhandev
 */
public class DatabaseUtil {
    private static final Logger LOGGER = Logger.getLogger(DatabaseUtil.class.getName());
    private static String URL;
    private static String USERNAME;
    private static String PASSWORD;
    private static String DRIVER;

    static {
        loadDatabaseProperties();
    }

    /**
     * Load database configuration from properties file
     */
    private static void loadDatabaseProperties() {
        try (InputStream input = DatabaseUtil.class.getClassLoader().getResourceAsStream("database.properties")) {
            Properties props = new Properties();
            if (input != null) {
                props.load(input);
                URL = props.getProperty("db.url");
                USERNAME = props.getProperty("db.username");
                PASSWORD = props.getProperty("db.password");
                DRIVER = props.getProperty("db.driver");

                // Load JDBC driver
                Class.forName(DRIVER);
            } else {
                LOGGER.log(Level.SEVERE, "Unable to find database.properties file");
            }
        } catch (IOException | ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "Error loading database properties", e);
        }
    }

    /**
     * Get database connection
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error connecting to database", e);
            throw e;
        }
    }

    /**
     * Close database resources
     * @param conn Connection to close
     * @param stmt Statement to close
     * @param rs ResultSet to close
     */
    public static void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing ResultSet", e);
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing PreparedStatement", e);
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error closing Connection", e);
            }
        }
    }
}
