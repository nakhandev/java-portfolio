package com.nakhandev.portfolio.model;

import java.sql.Timestamp;

/**
 * Education model class representing educational background
 * @author nakhandev
 */
public class Education {
    private int id;
    private String institution;
    private String degree;
    private int startYear;
    private Integer endYear; // Nullable
    private String description;
    private int displayOrder;
    private Timestamp createdAt;

    public Education() {}

    public Education(String institution, String degree, int startYear, Integer endYear, String description) {
        this.institution = institution;
        this.degree = degree;
        this.startYear = startYear;
        this.endYear = endYear;
        this.description = description;
    }

    public Education(String institution, String degree, int startYear, Integer endYear, String description, int displayOrder) {
        this.institution = institution;
        this.degree = degree;
        this.startYear = startYear;
        this.endYear = endYear;
        this.description = description;
        this.displayOrder = displayOrder;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public int getStartYear() {
        return startYear;
    }

    public void setStartYear(int startYear) {
        this.startYear = startYear;
    }

    public Integer getEndYear() {
        return endYear;
    }

    public void setEndYear(Integer endYear) {
        this.endYear = endYear;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Helper method for JSP compatibility
    public String getYearCompleted() {
        if (endYear != null) {
            return endYear.toString();
        }
        return "Present";
    }

    public void setYearCompleted(String yearCompleted) {
        // This is for JSP compatibility - do nothing
    }

    @Override
    public String toString() {
        return "Education{" +
                "id=" + id +
                ", institution='" + institution + '\'' +
                ", degree='" + degree + '\'' +
                ", startYear=" + startYear +
                ", endYear=" + endYear +
                ", description='" + description + '\'' +
                ", displayOrder=" + displayOrder +
                ", createdAt=" + createdAt +
                '}';
    }
}
