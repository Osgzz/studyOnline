package com.arcsoft.studyOnline.SecurityRealm;

import com.arcsoft.studyOnline.bean.Adminstrator;
import com.arcsoft.studyOnline.service.AdminstratorService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.xml.registry.infomodel.User;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Focus on 2017/5/26.
 */
@Component("securityRealm")
public class SecurityRealm extends AuthenticatingRealm {
    @Resource
    private AdminstratorService adminstratorService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String principal = (String) upToken.getPrincipal();
        Adminstrator adminstrator = adminstratorService.selectAdminstratorByUsername(principal);
        if (adminstrator == null) {
            throw new UnknownAccountException("用户不存在");
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(principal);
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(principal, adminstrator.getPassword(),credentialsSalt, getName());
        return authenticationInfo;
    }

//    @Resource
//    private RoleService roleService;
//
//    @Resource
//    private PermissionService permissionService;


}
