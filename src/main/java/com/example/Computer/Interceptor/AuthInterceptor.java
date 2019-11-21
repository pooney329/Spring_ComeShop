package com.example.Computer.Interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.example.Computer.Service.member.MemberService;
import com.example.Computer.model.member.dto.UserDTO;

public class AuthInterceptor extends HandlerInterceptorAdapter implements SessionAttr {
	
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler)
			throws Exception {
		
		System.out.println("LoginInterceptor.pre>>");
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGINUSER) == null) {
			Cookie loginCookie = WebUtils.getCookie(request, SessionAttr.LOGINCOOKIE);
			if (loginCookie != null) {
				UserDTO loginedUser = memberService.checkLoginBefore(loginCookie.getValue());
				if (loginedUser != null) {
					session.setAttribute(LOGINUSER, loginedUser);
					return true;
				}
			}
			
			
			
			saveAttemptedLocation(request, session);
			
			response.sendRedirect(request.getContextPath()+"/"+"member/login.do");
			return false;
			
		}

		return true;
	}

	private void saveAttemptedLocation(HttpServletRequest request, HttpSession session) {
		
		String uri = request.getRequestURI(); //board/register
		String query = request.getQueryString(); //dfd=121
		if (StringUtils.isNotEmpty(query)) {
			uri += "?" + query;
		}
		if(uri.contains("order/order_information")) {  //productid 와 qty를 세션에 저장 후 orderController에서 productid와 qty의 값이 null인경우 session을 통해 값을 가져온다 
			
			String [] pro = request.getParameterValues("productid"); //배열로받기 
			String [] qt = request.getParameterValues("qty");
			
			List<Integer> productid = new ArrayList<Integer>();
			List<Integer> qty = new ArrayList<Integer>();
			for(int i=0; i<pro.length; i++) {
				productid.add(Integer.parseInt(pro[i]));
				qty.add(Integer.parseInt(qt[i]));
			}
			session.setAttribute("productid",productid );
			session.setAttribute("qty", qty);
		}
			
		
		session.setAttribute(STOREDPAGE, uri);
	}
	
}