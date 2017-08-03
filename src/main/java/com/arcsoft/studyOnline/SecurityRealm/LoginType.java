package com.arcsoft.studyOnline.SecurityRealm;

public enum LoginType {
    //登录类型
    //普通用户登录，管理员登录
    EMP("Emp"), ADMIN("Admin");
    private String type;

    private LoginType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return this.type.toString();
    }
}
