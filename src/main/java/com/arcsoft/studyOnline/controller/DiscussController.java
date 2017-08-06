package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.Discuss;
import com.arcsoft.studyOnline.bean.DiscussWithEmpName;
import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.service.DiscussService;
import com.arcsoft.studyOnline.service.EmployeeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DiscussController {
    @Autowired
    private DiscussService discussService;
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/addDiscuss")
    @ResponseBody
    public Map addDiscuss(@RequestParam String content, @RequestParam Integer videoId, @RequestParam(value = "preId", required = false) Integer preId) {
        Map<String, Object> map = new HashMap<>();
        Subject currentUser = SecurityUtils.getSubject();
        String userName = currentUser.getPrincipal().toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date = new Date();

        try {
            date = simpleDateFormat.parse(date.toString());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Employee employee = employeeService.selectEmployeeByName(userName);
        Integer empId = employee.getId();
        discussService.insertDiscuss(content, videoId, empId, date, preId);
        List<DiscussWithEmpName> discussList = discussService.selectDiscussListByVideoId(videoId);

        map.put("discussList", discussList);
        map.put("empNiciName", employee.getNickname());
        return map;
    }

    @RequestMapping("/getAllDiscuss")
    @ResponseBody
    public Map getAllDiscuss(@RequestParam Integer videoId) {
        Map<String, Object> map = new HashMap<>();
        String userName = SecurityUtils.getSubject().getPrincipal().toString();
        Employee employee = employeeService.selectEmployeeByName(userName);
        Integer empId = employee.getId();
        String empNiciName = employee.getNickname();
        List<DiscussWithEmpName> discussList = discussService.selectDiscussListByVideoId(videoId);

        map.put("discussList", discussList);
        map.put("empNiciName", empNiciName);
        map.put("empId", empId);
        return map;
    }
}
