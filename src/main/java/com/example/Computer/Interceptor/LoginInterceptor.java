package com.example.Computer.Interceptor;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.example.Computer.mapper.MemberMapper;
import com.example.Computer.model.member.dto.UserDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter	implements SessionAttr{
	
	@Inject
	MemberMapper memberMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGINUSER) == null) {
			session.removeAttribute(LOGINUSER);
		}
		return true;
		
	}


	@SuppressWarnings("null")
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {

		@SuppressWarnings("unchecked")
		Map<String , Object> map  =  (Map<String , Object>) modelAndView.getModel();
		UserDTO logineduser = (UserDTO) map.get(LOGINUSER);
		if(logineduser != null) {
			System.out.println("로그인검색 성공");
			memberMapper.updateLogin(logineduser.getUid(), request.getRemoteAddr());
			
			HttpSession session = request.getSession();
			session.setAttribute(LOGINUSER, logineduser);
			
			if(StringUtils.isNotEmpty(request.getParameter("logincookie"))){
				Cookie logincookie = new Cookie(LOGINCOOKIE,session.getId());
				logincookie.setPath("/");
				logincookie.setMaxAge(EXPIRE);
				response.addCookie(logincookie);
				
			}
			
			String storedpage = (String)session.getAttribute(STOREDPAGE);
			if(StringUtils.isNotEmpty(storedpage)) {
				
				session.removeAttribute(STOREDPAGE);
				response.sendRedirect(storedpage);
				
			}
			else {
				
				 response.sendRedirect(request.getContextPath());
			}
		}
		
		if(map.get("loginresult") != null) {
			System.out.println("로그인 실패");
		}
		
		
		
		
		
	}
	

}

