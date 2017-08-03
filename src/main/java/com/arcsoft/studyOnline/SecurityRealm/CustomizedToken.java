package com.arcsoft.studyOnline.SecurityRealm;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Component;

public class CustomizedToken extends UsernamePasswordToken {
    //登录类型，判断是员工登陆还是管理员登录
    private String loginType;



    public CustomizedToken(final String username, final String password, String loginType) {
        super(username, password);
        this.loginType = loginType;
    }

    public CustomizedToken(String username, String password) {
        super(username, password);
    }

    public CustomizedToken() {
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }
}
