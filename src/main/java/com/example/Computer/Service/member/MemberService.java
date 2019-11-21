package com.example.Computer.Service.member;

import java.util.Date;

import com.example.Computer.model.member.dto.UserDTO;

public interface MemberService {
	//회원로그인 체크 
	public UserDTO login(UserDTO user);
	//회원가입
	public String join();
	//로그아웃
	public void logout();
	
	//자동저장할경우 쿠키의 만료시간을 데베에 기록해야한다.
	public void keepLogin(String uid, String sessionid, Date expire);
	
	//유저쿠기확인
	UserDTO checkLoginBefore(String loginCookie);
	
	//sns로그인유저가 회원인지 확인
	UserDTO getBySns(UserDTO snsuser);
	
	//아이디 중복확인
	public String uidcheck(String uid);
	
	//유저등록
	public void memberinsert(UserDTO dto);
	
	
	
}
