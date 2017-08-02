package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Focus on 2017/6/21.
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    public Employee getEmployeeByUsername(String username) {
        return employeeMapper.selectEmployeeByUsername(username);
    }

    public List<Employee> selectEmployeeList(){
        return employeeMapper.selectEmployeeList();
    }

    public void  insertEmployee(Integer departmentId,Integer positionId,String employeeName,String employeeNickname,String employeePassword,String employeeGender,String employeePhone,String employeeMail,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setDeptId(departmentId);
        employee.setPositionId(positionId);
        employee.setName(employeeName);
        employee.setNickname(employeeNickname);
        employee.setPassword(employeePassword);
        employee.setGender(employeeGender);
        employee.setPhone(employeePhone);
        employee.setEmail(employeeMail);
        employeeMapper.insertEmployee(employee);
    }

    public Employee selectEmployeeById(Integer id){
        return employeeMapper.selectEmployeeById(id);
    }

    public void updateEmployee(Integer id,String employeeName,String employeeNickname,String employeePassword,String employeeGender,Integer departmentId,Integer positionId,String employeePhone,String employeeMail,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setName(employeeName);
        employee.setNickname(employeeNickname);
        employee.setPassword(employeePassword);
        employee.setGender(employeeGender);
        employee.setDeptId(departmentId);
        employee.setPositionId(positionId);
        employee.setPhone(employeePhone);
        employee.setEmail(employeeMail);
        employeeMapper.updateEmployee(employee);
    }

    public void delEmployee(Integer id){
        employeeMapper.delEmployee(id);
    }

    public void updateEmployeePassword(Integer id,String password){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setPassword(password);
        employeeMapper.updateEmployeePassword(employee);
    }

    public void updateEmployeeInfo(Integer id,String name,String nickname,String gender,Integer department,Integer position,String phone,String email,HttpServletRequest request){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Employee employee = (Employee) applicationContext.getBean("employee");
        employee.setId(id);
        employee.setName(name);
        employee.setNickname(nickname);
        employee.setGender(gender);
        employee.setDeptId(department);
        employee.setPositionId(position);
        employee.setPhone(phone);
        employee.setEmail(email);
        employeeMapper.updateEmployeeInfo(employee);
    }
}
