package com.nakhandev.portfolio.model;

/**
 * Skill model class representing a technical skill
 * @author nakhandev
 */
public class Skill {
    private int id;
    private String category;
    private String skillName;
    private String proficiencyLevel; // Will store enum values: beginner, intermediate, advanced, expert
    private int displayOrder;

    public Skill() {}

    public Skill(String category, String skillName, String proficiencyLevel) {
        this.category = category;
        this.skillName = skillName;
        this.proficiencyLevel = proficiencyLevel;
    }

    public Skill(String category, String skillName, String proficiencyLevel, int displayOrder) {
        this.category = category;
        this.skillName = skillName;
        this.proficiencyLevel = proficiencyLevel;
        this.displayOrder = displayOrder;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getProficiencyLevel() {
        return proficiencyLevel;
    }

    public void setProficiencyLevel(String proficiencyLevel) {
        this.proficiencyLevel = proficiencyLevel;
    }

    public int getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

    @Override
    public String toString() {
        return "Skill{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", skillName='" + skillName + '\'' +
                ", proficiencyLevel='" + proficiencyLevel + '\'' +
                ", displayOrder=" + displayOrder +
                '}';
    }
}
