package com.bit.lib.admin.intercepter;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {

		HttpSession session = request.getSession(false);

		if (session != null) {
			Object obj = session.getAttribute("adminLogin");
			if (obj != null) {
				return true;
			}
		}

		response.sendRedirect(request.getContextPath() + "/admin/login");

		return false;
	}

}
