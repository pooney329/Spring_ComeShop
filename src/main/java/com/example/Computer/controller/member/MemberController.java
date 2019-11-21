package com.example.Computer.controller.member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.WebUtils;

import com.example.Computer.Interceptor.SessionAttr;
import com.example.Computer.Service.member.MemberService;
import com.example.Computer.auth.SnsLogin;
import com.example.Computer.auth.SnsValue;
import com.example.Computer.model.member.dto.UserDTO;
import com.itextpdf.text.log.SysoCounter;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	SnsValue naverSns;

	@Inject
	SnsValue googleSns;

	@Inject
	GoogleConnectionFactory googleConnectionFactory;

	@Inject
	OAuth2Parameters googleOAuth2Parameters;

	@Inject
	MemberService memberService;

	// OAUTH로그인 콜백
	@RequestMapping(value = "auth/{snsService}/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(@PathVariable String snsService, String code, HttpSession session, Model model,RedirectAttributes redirect)
			throws Exception {

		SnsValue sns = null;
		if (StringUtils.equalsIgnoreCase("naver", snsService)) {
			sns = naverSns;
		} else if (StringUtils.equalsIgnoreCase("google", snsService)) {
			sns = googleSns;
		}
		SnsLogin snslogin = new SnsLogin(sns);
		UserDTO snsuser = snslogin.getUserProfile(code);
		System.out.println(snsuser);
		
		UserDTO user = memberService.getBySns(snsuser);
		if(user != null) {  //sns로그인시 회원인경우
			model.addAttribute(SessionAttr.LOGINUSER, user);
			return "index";
		}
		else {
			

			String uname = URLEncoder.encode(snsuser.getUname(), "UTF-8");

			//redirect.addFlashAttribute("user", snsuser);
			return "redirect:/member/snsjoin?uname="+uname+"&email="+snsuser.getEmail(); 
			
			
		}
		
		
		
	}

	// 자체 사이트 로그인
	@RequestMapping(value = "loginpost", method = RequestMethod.POST)
	public String loginpost(@ModelAttribute UserDTO user, Model model, HttpSession session,
			HttpServletRequest request) {

		UserDTO selecteduser = memberService.login(user);
		
		if (selecteduser != null) {
			Date expire = new Date(System.currentTimeMillis() + SessionAttr.EXPIRE * 1000);
			memberService.keepLogin(selecteduser.getUid(), session.getId(), expire);

			model.addAttribute(SessionAttr.LOGINUSER, selecteduser);

		} else {
			model.addAttribute("loginresult", "loginfail");
		}
		//return "member/login_ok";
		return "index";

	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		

		UserDTO user = (UserDTO) session.getAttribute(SessionAttr.LOGINUSER);

		// request에 있는 웹브라우저로 부터온 쿠키를 가져와서 서버에있는 쿠키이름과 같은지 확인 하여 있으면 해당 쿠키의 만료시간을 0으로
		// 만들어버린다. 그러면 쿠키를 삭제하는것과 같은효과이다 브라우저에있는 쿠키를 삭제할수없으니 쿠키값을 변경시키는것이다.
		Cookie cookie = WebUtils.getCookie(request, SessionAttr.LOGINCOOKIE);
		if (cookie != null) {
			cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		memberService.keepLogin(user.getUid(), session.getId(), new Date());
		}
		
		//세션삭제
		if (user != null) {
			session.invalidate();
		}

		return "redirect:/";

	}

	// 로그인페이지 이동
	@RequestMapping("login.do")
	public String login(Model model) throws IOException {

		SnsLogin snslogin = new SnsLogin(naverSns);

		model.addAttribute("naverurl", snslogin.getNaverAuthURL());

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String googleurl = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("googleurl", googleurl);
		return "member/login";
	}

	@RequestMapping("join.do")
	public String join(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
		Map<String,?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		if(redirectMap != null) {
			UserDTO user = (UserDTO)redirectMap.get("user");
			System.out.println(user);
		}
		
			
		return "member/join";
	}
	
	
	@RequestMapping("uidcheck")
	@ResponseBody
	public String uidcheck(String uid) {
			String uid_check = memberService.uidcheck(uid);
		return uid_check ;
	}
	
	
	@RequestMapping(value = "memberinsert", method = RequestMethod.POST)
	public String memberinsert(@ModelAttribute UserDTO dto) {
		memberService.memberinsert(dto);
		
		return  "member/login";
		
	}
	
	//회원가입 초입화면 (일반가입, sns가입)
	  @RequestMapping("joinmenu") 
	  public void joinmenu(Model model) {
		  
		  	SnsLogin snslogin = new SnsLogin(naverSns);

			model.addAttribute("naverurl", snslogin.getNaverAuthURL());

			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
			String googleurl = oauthOperations.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
			model.addAttribute("googleurl", googleurl);

		  
	  }
	  
	  @RequestMapping("snsjoin")
	  
	  public String snsjoin(String uname, String email ,Model model) {
		  model.addAttribute("email",email);
		  model.addAttribute("uname",uname);
		  
		  return "member/snsjoin";
		
	  }
	 
	
	
	
	

}
