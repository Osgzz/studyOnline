package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Department;
import com.arcsoft.studyOnline.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 59309 on 2017/7/19.
 */

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> selectDepartmentList(){
        return departmentMapper.selectDepartmentList();
    }
}
