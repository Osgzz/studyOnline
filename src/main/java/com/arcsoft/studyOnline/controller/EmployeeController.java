package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.Department;
import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.bean.EmployeeWithDeptNameAndPositon;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
        List<EmployeeWithDeptNameAndPositon> employeeList = employeeService.selectEmployeeWithDeptAndPositon();
        System.out.println(employeeList);
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
    public String toPersonMessage(Model model,@ModelAttribute("id") Integer id){
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
    public String modifyPassword(Model model,@RequestParam("id") Integer id, @RequestParam("originalPassword") String originalPassword,@RequestParam("newPassword") String newPassword,@RequestParam("newPasswordAgain") String newPasswordAgain,RedirectAttributes redirectAttributes){

        Employee employee = employeeService.selectEmployeeById(id);
        redirectAttributes.addFlashAttribute("id",id);

        if(originalPassword.equals(employee.getPassword())){
            if(newPassword.equals(newPasswordAgain)){
                employeeService.updateEmployeePassword(id,newPassword);
                redirectAttributes.addFlashAttribute("message3","修改密码成功");
                return "redirect:/toAgainPassword";
            }else {
                redirectAttributes.addFlashAttribute("message2","两次新密码不同，请重新输入！");
                return "redirect:/toAgainPassword";
            }
        }else{
            redirectAttributes.addFlashAttribute("message1","旧密码错误");
            return "redirect:/toAgainPassword";
        }
    }

    @RequestMapping("/toAgainPassword")
    public String toAgainPassword(Model model,@ModelAttribute("message") String message,@ModelAttribute("id") Integer id){
        Employee employee = employeeService.selectEmployeeById(id);
        model.addAttribute("employee",employee);
        switch (message){
            case "message1":
                model.addAttribute("message1","旧密码错误");
            case "message2":
                model.addAttribute("message2","两次新密码不同，请重新输入！");
            case "message3":
                model.addAttribute("message3","修改密码成功");
        }
        return "modifyPassword";
    }

    @RequestMapping("/modifyPersonInfo")
    public String modifyPersonInfo(@RequestParam("id") Integer id,@RequestParam("name") String name,@RequestParam("nickname") String nickname,@RequestParam("gender") String gender,@RequestParam("department") Integer department,@RequestParam("position") Integer position,@RequestParam("phone") String phone,@RequestParam("email") String email,HttpServletRequest request,RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("id",id);
        employeeService.updateEmployeeInfo(id,name,nickname,gender,department,position,phone,email,request);
        return "redirect:/toPersonMessage";
    }


    /**
     * @param excel 上传的员工信息Excel表格
     * @return 跳转回原页面
     */
    @RequestMapping("/listByExcel")
    public String listByExcel(Model model, @RequestParam("excel") MultipartFile excel, HttpServletRequest request){
        employeeService.employeeListByExcel(excel,request);
        List<Employee> employeeList = employeeService.selectEmployeeList();
        model.addAttribute("employeeList",employeeList);
        return "addEmployee";
    }

}
