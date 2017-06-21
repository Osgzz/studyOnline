package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
