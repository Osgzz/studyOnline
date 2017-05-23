package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Adminstrator;
import com.arcsoft.studyOnline.dao.AdminstratorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Focus on 2017/5/23.
 */
@Service
public class AdminstratorService {

    @Autowired
    AdminstratorMapper adminstratorMapper;


    /**
     * 查询传入用户名是否为空，非零则不为空
     */
    public long userNameIfNull(String username) {
        return adminstratorMapper.countByUsername(username);
    }

    /**
     * 检查用户名与密码是否匹配
     */
    public boolean checkLogin(String username, String password) {

        long count = adminstratorMapper.countByUsernameAndPassword(username, password);
        boolean result = false;
        if (count == 1) {
            result = true;
        } else {
            result = false;
        }
        return result;
    }

    public boolean checkPassword(String username, String password) {
        Adminstrator adminstrator = adminstratorMapper.selectPasswordByUsername(username);
        return adminstrator.getPassword().equals(password);
    }

    @Transactional
    public void updatePassword(String username, String password) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Adminstrator adminstrator = (Adminstrator) applicationContext.getBean("adminstrator");
        adminstrator.setUsername(username);
        adminstrator.setPassword(password);
        adminstratorMapper.updatePassword(adminstrator);
    }
}
