package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.SecurityRealm.CustomizedToken;
import com.arcsoft.studyOnline.SecurityRealm.LoginType;
import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.bean.LessonWithRoute;
import com.arcsoft.studyOnline.bean.RouteWithResource;
import com.arcsoft.studyOnline.service.EmployeeService;
import com.arcsoft.studyOnline.service.LessonService;
import com.arcsoft.studyOnline.service.RouteService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.poi.hpsf.CustomProperties;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private static final String USER_LOGIN_TYPE = LoginType.EMP.toString();



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
        Subject currentUser = SecurityUtils.getSubject();

        if (!currentUser.isAuthenticated()) {
            CustomizedToken token = new CustomizedToken(username, password,USER_LOGIN_TYPE);
            token.setRememberMe(true);
            try {
                currentUser.login(token);
            } catch (AuthenticationException e) {
                System.out.println("登录失败:" + e.getMessage());
                model.addAttribute("msg", "error");
                return "redirect:/html/login.html";
            }
        }

        List<LessonWithRoute> lessonWithRouteList = lessonService.selectLessonListWithRoute();
        model.addAttribute("lessonList", lessonWithRouteList);
        Employee employee = employeeService.selectEmployeeByName(username);
        model.addAttribute("employeeId",employee.getId());
        return "redirect:/html/index.html";
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
    @ResponseBody
    public RouteWithResource showRoute(Integer routeId, Model model) {
        RouteWithResource routeWithResources = routeService.selectRouteWithResource(routeId);
        return routeWithResources;
    }

    @RequestMapping("/toPerson")
    public String toPerson(Model model,Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        return "person";
    }
}
