package com.arcsoft.studyOnline.bean;

public class EmployeeWithDeptNameAndPositon {
    private Integer deptId;
    private String deptName;

    private Integer employeeId;
    private String employeeName;
    private String employeeNickname;
    private String employeePassword;
    private String employeeGender;
    private String employeePhone;
    private String employeeEmail;

    private Integer positionId;
    private String positionName;
    private Integer premissionLevel;


    @Override
    public String toString() {
        return "EmployeeWithDeptNameAndPositon{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", employeeId=" + employeeId +
                ", employeeName='" + employeeName + '\'' +
                ", employeeNickname='" + employeeNickname + '\'' +
                ", employeePassword='" + employeePassword + '\'' +
                ", employeeGender='" + employeeGender + '\'' +
                ", employeePhone='" + employeePhone + '\'' +
                ", employeeEmail='" + employeeEmail + '\'' +
                ", positionId=" + positionId +
                ", positionName='" + positionName + '\'' +
                ", premissionLevel=" + premissionLevel +
                '}';
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeNickname() {
        return employeeNickname;
    }

    public void setEmployeeNickname(String employeeNickname) {
        this.employeeNickname = employeeNickname;
    }

    public String getEmployeePassword() {
        return employeePassword;
    }

    public void setEmployeePassword(String employeePassword) {
        this.employeePassword = employeePassword;
    }

    public String getEmployeeGender() {
        return employeeGender;
    }

    public void setEmployeeGender(String employeeGender) {
        this.employeeGender = employeeGender;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public Integer getPremissionLevel() {
        return premissionLevel;
    }

    public void setPremissionLevel(Integer premissionLevel) {
        this.premissionLevel = premissionLevel;
    }
}