package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.Department;
import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.bean.Position;
import com.arcsoft.studyOnline.service.DepartmentService;
import com.arcsoft.studyOnline.service.EmployeeService;
import com.arcsoft.studyOnline.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Focus on 2017/7/9.
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    @Autowired
    PositionService positionService;

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/toEmployeeList")
    public String toEmployeeList(Model model) {
        List<Employee> employeeList = employeeService.selectEmployeeList();
        model.addAttribute("employeeList",employeeList);
        return "employeeList";
    }

    @RequestMapping("/toAddEmployee")
    public String toAddEmployee(Model model){
        List<Position> positionList = positionService.selectPositionList();
        model.addAttribute("positionList",positionList);
        List<Department> departmentList = departmentService.selectDepartmentList();
        model.addAttribute("departmentList",departmentList);
        return "addEmployee";
    }

    @RequestMapping("/addEmployee")
    public String addEmployee(Model model, @RequestParam("departmentId") Integer departmentId, @RequestParam("positionId") Integer positionId, @RequestParam("employeeName") String employeeName, @RequestParam("employeeNickname") String employeeNickname, @RequestParam("employeePassword") String employeePassword, @RequestParam("employeeGender") String employeeGender, @RequestParam("employeePhone") String employeePhone, @RequestParam("employeeMail") String employeeMail, HttpServletRequest request){
        employeeService.insertEmployee(departmentId,positionId,employeeName,employeeNickname,employeePassword,employeeGender,employeePhone,employeeMail,request);
        return "redirect:/toAddEmployee";
    }

    @RequestMapping("/toUpdateEmployee")
    public String toUpdateEmployee(Model model,@RequestParam("id") Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        List<Position> positionList = positionService.selectPositionList();
        model.addAttribute("positionList",positionList);
        List<Department> departmentList = departmentService.selectDepartmentList();
        model.addAttribute("departmentList",departmentList);
        return "updateEmployee";
    }

    @RequestMapping("/updateEmployee")
    public String updateEmployee(@RequestParam("id") Integer id, @RequestParam("employeeName") String employeeName, @RequestParam("employeeNickname") String employeeNickname, @RequestParam("employeePassword") String employeePassword, @RequestParam("employeeGender") String employeeGender, @RequestParam("departmentId") Integer departmentId, @RequestParam("positionId") Integer positionId, @RequestParam("employeePhone") String employeePhone, @RequestParam("employeeMail") String employeeMail, HttpServletRequest request){
        employeeService.updateEmployee(id,employeeName,employeeNickname,employeePassword,employeeGender,departmentId,positionId,employeePhone,employeeMail,request);
        return "redirect:/toEmployeeList";
    }

    @RequestMapping("/delEmployee")
    public String delEmployee(Integer id){
        employeeService.delEmployee(id);
        return "redirect:/toEmployeeList";
    }

    @RequestMapping("/toPersonMessage")
    public String toPerson(Model model,Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        List<Position> positionList = positionService.selectPositionList();
        model.addAttribute("positionList",positionList);
        List<Department> departmentList = departmentService.selectDepartmentList();
        model.addAttribute("departmentList",departmentList);
        return "person";
    }

    @RequestMapping("/toModifyPassword")
    public String toModifyPassword(Model model,Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        return "modifyPassword";
    }

    @RequestMapping("/modifyPassword")
    public Map modifyPassword(@RequestParam Integer id, @RequestParam String originalPassword,@RequestParam String newPassword,@RequestParam String newPasswordAgain){

        Map<String,String> map = new HashMap<>();

        Employee employee = employeeService.selectEmployeeById(id);

        if(originalPassword.equals(employee.getPassword())){
            if(newPassword.equals(newPasswordAgain)){
                employeeService.updateEmployeePassword(id,newPassword);
                map.put("message","修改密码成功");
                return map;
            }else {
                map.put("message","两次新密码不同，请重新输入！");
                return map;
            }
        }else{
            map.put("message","旧密码错误");
            return map;
        }
    }

    @RequestMapping("/modifyPersonInfo")
    public String modifyPersonInfo(@RequestParam("employeeId") Integer id,@RequestParam("name") String name,@RequestParam("nickname") String nickname,@RequestParam("gender") String gender,@RequestParam("department") Integer department,@RequestParam("position") Integer position,@RequestParam("phone") String phone,@RequestParam("email") String email,RedirectAttributes redirectAttributes){

        employeeService.updateEmployeeInfo(id,name,nickname,gender,department,position,phone,email);
        redirectAttributes.addFlashAttribute("id",id);
        return "redirect:/toPersonInfo";
    }

    @RequestMapping("/toPersonInfo")
    public String toPersonInfo(Model model, @ModelAttribute("id") Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        List<Position> positionList = positionService.selectPositionList();
        model.addAttribute("positionList",positionList);
        List<Department> departmentList = departmentService.selectDepartmentList();
        model.addAttribute("departmentList",departmentList);
        return "person";
    }
}
