package com.swpu.uchain.openexperiment.security;


import com.alibaba.fastjson.JSON;
import com.swpu.uchain.openexperiment.domain.User;
import com.swpu.uchain.openexperiment.enums.CodeMsg;
import com.swpu.uchain.openexperiment.result.Result;
import com.swpu.uchain.openexperiment.service.AclService;
import com.swpu.uchain.openexperiment.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;

/**
 * @Author: clf
 * @Date: 19-1-17
 * @Description:
 * 权限拦截
 */
@Slf4j
@Service
public class AuthRoleInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private UserService userService;
    @Autowired
    private AclService aclService;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        String json = JSON.toJSONString(Result.error(CodeMsg.AUTHENTICATION_ERROR));
        User user = userService.getCurrentUser();
        //若当前用户为未认证用户则跳过权限验证,交给security做身份认证
        if (user == null) {
            return true;
        }
        log.info("...........执行权限验证........");
        String uri = request.getRequestURI();
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        log.info("当前用户的权限是: {}; 需要访问的权限是: {}", authorities.toString(), uri);
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals(uri)) {
                return true;
            }
        }
        json = JSON.toJSONString(Result.error(CodeMsg.PERMISSION_DENNY));
        log.error("............权限不足...........");
        response.getWriter().append(json);
        return false;
    }

}
