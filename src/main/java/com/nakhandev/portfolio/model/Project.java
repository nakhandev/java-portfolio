package com.nakhandev.portfolio.model;

import java.sql.Timestamp;

/**
 * Project model class representing a portfolio project
 * @author nakhandev
 */
public class Project {
    private int id;
    private String name;
    private String description;
    private String techStack;
    private String demoLink;
    private String githubLink;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Project() {}

    public Project(String name, String description, String techStack) {
        this.name = name;
        this.description = description;
        this.techStack = techStack;
    }

    public Project(String name, String description, String techStack, String demoLink, String githubLink) {
        this.name = name;
        this.description = description;
        this.techStack = techStack;
        this.demoLink = demoLink;
        this.githubLink = githubLink;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTechStack() {
        return techStack;
    }

    public void setTechStack(String techStack) {
        this.techStack = techStack;
    }

    public String getDemoLink() {
        return demoLink;
    }

    public void setDemoLink(String demoLink) {
        this.demoLink = demoLink;
    }

    public String getGithubLink() {
        return githubLink;
    }

    public void setGithubLink(String githubLink) {
        this.githubLink = githubLink;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    // Helper methods for compatibility with JSP
    public String getTitle() {
        return name;
    }

    public void setTitle(String title) {
        this.name = title;
    }

    public String getProjectUrl() {
        return demoLink;
    }

    public void setProjectUrl(String projectUrl) {
        this.demoLink = projectUrl;
    }

    public String getGithubUrl() {
        return githubLink;
    }

    public void setGithubUrl(String githubUrl) {
        this.githubLink = githubUrl;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", techStack='" + techStack + '\'' +
                ", demoLink='" + demoLink + '\'' +
                ", githubLink='" + githubLink + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}
