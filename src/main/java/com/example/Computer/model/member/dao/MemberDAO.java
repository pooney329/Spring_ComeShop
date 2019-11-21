package com.example.Computer.model.member.dao;

import java.util.Date;

import com.example.Computer.model.member.dto.UserDTO;

public interface MemberDAO {

	// 회원로그인 체크
	public UserDTO login(UserDTO uid);

	// 회원가입
	public String join();

	// 로그아웃
	public void logout();
	// 쿠키의 값으로 세션id를 넣어두었는데 그것을  데베에 기록해서 만료시간을 체크한다.
	public void keepLogin(String uid, String sessionid, Date expire);
	//유저쿠키확인
	UserDTO checkLoginBefore(String loginCookie);
	//sns로그인유저 회원여부확인
	UserDTO getBySns(UserDTO snsuser);
	//아이디 중복확인
	public String uidcheck(String uid);
	//유저등록
	public void memberinsert(UserDTO dto);
}
