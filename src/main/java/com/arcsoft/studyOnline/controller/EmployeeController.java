package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by Focus on 2017/7/9.
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    public String addEmployee() {
        return "";
    }
}
