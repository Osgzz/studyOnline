package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.service.AdminstratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * Created by Focus on 2017/5/23.
 */
@Controller
public class AdminstratorController {

    @Autowired
    private AdminstratorService adminstratorService;

    @RequestMapping("login")
    public String login(@RequestParam String username, @RequestParam String password, RedirectAttributes model, HttpSession session) {
        long count = adminstratorService.userNameIfNull(username);
        if (count == 1) {
            boolean result = adminstratorService.checkLogin(username, password);
            if (result) {
                session.setAttribute("username", username);
                return "home";
            }
        }
        model.addFlashAttribute("msg", 1);
        return "index";
    }



}