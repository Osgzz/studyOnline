package com.arcsoft.studyOnline.SecurityRealm;

import com.arcsoft.studyOnline.bean.Adminstrator;
import com.arcsoft.studyOnline.service.AdminstratorService;
import org.apache.shiro.authc.AuthenticationException;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;


import javax.annotation.Resource;

/**
 * Created by Focus on 2017/5/26.
 */
public class AdminRealm extends AuthorizingRealm {
    @Resource
    private AdminstratorService adminstratorService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        CustomizedToken  upToken = (CustomizedToken) token;
        String principal = (String) upToken.getPrincipal();
        Adminstrator adminstrator = adminstratorService.selectAdminstratorByUsername(principal);
        if (adminstrator == null) {
            throw new UnknownAccountException("用户不存在");
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(principal);
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(principal, adminstrator.getPassword(),credentialsSalt, getName());
        return authenticationInfo;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        return null;
    }

//    @Resource
//    private RoleService roleService;
//
//    @Resource
//    private PermissionService permissionService;


}
