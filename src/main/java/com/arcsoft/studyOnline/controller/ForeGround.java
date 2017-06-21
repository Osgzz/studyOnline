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

    @RequestMapping("/toCustomerLogin")
    public String toCustomer() {
        return "login";
    }

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

    @RequestMapping("/backToCustomer")
    public String backToCustomer(Model model) {
        List<LessonWithRoute> lessonWithRouteList = lessonService.selectLessonListWithRoute();
        model.addAttribute("lessonList", lessonWithRouteList);
        return "customer";

    }

    @RequestMapping("/showRoute")
    public String showRoute(Integer routeId, Model model) {
        RouteWithResource routeWithResources = routeService.selectRouteWithResource(routeId);
        model.addAttribute("route", routeWithResources);
        return "video";
    }


}
