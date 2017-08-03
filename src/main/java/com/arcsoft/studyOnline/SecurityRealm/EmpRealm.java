package com.arcsoft.studyOnline.SecurityRealm;

import com.arcsoft.studyOnline.bean.Employee;
import com.arcsoft.studyOnline.service.EmployeeService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

public class EmpRealm extends AuthorizingRealm {
    @Resource
    private EmployeeService employeeService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        CustomizedToken  upToken = (CustomizedToken) token;
        String principal = (String) upToken.getPrincipal();
        Employee employee = employeeService.selectEmployeeByName(principal);
        if (employee == null) {
            throw new UnknownAccountException("用户不存在");
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(principal);
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(principal, employee.getPassword(),credentialsSalt, getName());
        return authenticationInfo;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }
}
