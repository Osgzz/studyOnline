package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.bean.LessonWithRoute;
import com.arcsoft.studyOnline.bean.RouteWithResource;
import com.arcsoft.studyOnline.service.EmployeeService;
import com.arcsoft.studyOnline.service.LessonService;
import com.arcsoft.studyOnline.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Focus on 2017/6/21.
 */
@Controller
public class ForeGround {
    @Autowired
    private EmployeeService employeeService;
    @Autowired
    private LessonService lessonService;
    @Autowired
    private RouteService routeService;


    /**
     * @return 跳转到login.jsp 页面
     */
    @RequestMapping("/toCustomerLogin")
    public String toCustomer() {
        return "login";
    }

    /**
     * @param username 获取用户输入的用户名
     * @param password 获取用户输入的密码
     * @param model    相当于request，用于传递查到的课程列表
     * @return 判断是否登录，是则跳转到 customer.jsp 页面，否则重定向到toCustomerLogin()方法，登陆页面
     */
    @RequestMapping("/customerLogin")
    public String customerLogin(String username, String password, Model model) {
        Employee employee = employeeService.getEmployeeByUsername(username);
        if (employee != null) {
            if (employee.getPassword().equals(password)) {
                List<LessonWithRoute> lessonWithRouteList = lessonService.selectLessonListWithRoute();
                model.addAttribute("lessonList", lessonWithRouteList);
                return "customer";
            }
        }
        return "redirect:/toCustomerLogin";
    }

    /**
     * @param model 相当于request
     * @return 重新查询课程信息后返回到用户主页, customer.jsp
     */
    @RequestMapping("/backToCustomer")
    public String backToCustomer(Model model) {
        List<LessonWithRoute> lessonWithRouteList = lessonService.selectLessonListWithRoute();
        model.addAttribute("lessonList", lessonWithRouteList);
        return "customer";
    }

    /**
     * @param routeId 从前台传入的子课程ID
     * @param model   相当于request，传参用
     * @return 跳转到video.jsp页面
     */
    @RequestMapping("/showRoute")
    public String showRoute(Integer routeId, Model model) {
        RouteWithResource routeWithResources = routeService.selectRouteWithResource(routeId);
        model.addAttribute("route", routeWithResources);
        return "video";
    }


}
