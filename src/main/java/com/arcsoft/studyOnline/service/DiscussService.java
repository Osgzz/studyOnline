package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Discuss;
import com.arcsoft.studyOnline.bean.DiscussWithEmpName;
import com.arcsoft.studyOnline.dao.DiscussMapper;
import com.arcsoft.studyOnline.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DiscussService {
    @Autowired
    DiscussMapper discussMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    public void insertDiscuss(String content, Integer videoId, Integer empId, Date date, Integer preId) {
        discussMapper.insertDiscuss(videoId, empId, content, date, preId);
    }


    public List<DiscussWithEmpName> selectDiscussListByVideoId(Integer videoId) {
        return discussMapper.selectDiscussListByVideoId(videoId);
    }
}
