package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.SecurityRealm.CustomizedToken;
import com.arcsoft.studyOnline.SecurityRealm.LoginType;
import com.arcsoft.studyOnline.bean.Adminstrator;
import com.arcsoft.studyOnline.service.AdminstratorService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Focus on 2017/5/23.
 */
@Controller
public class AdminstratorController {

    @Autowired
    private AdminstratorService adminstratorService;

    private static final String USER_LOGIN_TYPE = LoginType.ADMIN.toString();

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    /**
     * 管理员登录,shiro进行登陆验证
     *
     * @param username 管理员账号
     * @param password 密码
     * @param model    相当于request，保存登陆成功后的管理员账号
     * @return 登陆成功则跳转到管理主页home.jsp，否则返回登录页面index.jsp
     */
    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        Subject currentUser = SecurityUtils.getSubject();

        CustomizedToken token = new CustomizedToken(username, password, USER_LOGIN_TYPE);
        token.setRememberMe(true);
        try {
            currentUser.login(token);
        } catch (AuthenticationException e) {
            System.out.println("登录失败:" + e.getMessage());
            model.addAttribute("msg", "error");
            return "index";
        }

        model.addAttribute("username", username);
        return "home";
    }


    /**
     * 注销，清除用户信息
     */
    @RequestMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
        }
        return "index";
    }


    /**
     * 根据传进的管理员账号，当前密码和新密码对照后修改密码
     *
     * @param username         管理员账号
     * @param oldPassword      当前密码
     * @param newPassword      新密码
     * @param checkNewPassword 新密码确认
     * @return 根据执行结果，返回Json格式数据
     */
    @RequestMapping("/modifyAdminPwd")
    @ResponseBody
    public Map modifyAdminPwd(@RequestParam String username, @RequestParam String oldPassword, @RequestParam String newPassword, @RequestParam String checkNewPassword) {

        Map<String, String> map = new HashMap<>();

        if (!newPassword.equals(checkNewPassword)) {
            map.put("message", "两次新密码不同，请重新输入！");
            return map;
        }

        Boolean result = adminstratorService.checkPassword(username, oldPassword);
        if (result) {
            adminstratorService.updatePassword(username, newPassword);
            map.put("message", "修改成功！");
            return map;
        } else {
            map.put("message", "旧密码错误！");
            return map;
        }
    }

}