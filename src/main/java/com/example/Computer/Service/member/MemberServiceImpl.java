package com.example.Computer.Service.member;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.Computer.model.member.dao.MemberDAO;
import com.example.Computer.model.member.dto.UserDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO memberDao;
	
	
	
	@Override
	public UserDTO login(UserDTO user) {
		
		
		return memberDao.login(user);
	}

	@Override
	public String join() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void logout() {
		// TODO Auto-generated method stub

	}

	@Override
	public void keepLogin(String uid, String sessionid, Date expire) {
		memberDao.keepLogin(uid,sessionid,expire);
		
	}

	@Override
	public UserDTO checkLoginBefore(String loginCookie) {

		return memberDao.checkLoginBefore(loginCookie);
	}

	@Override
	public UserDTO getBySns(UserDTO snsuser) {
		
		return memberDao.getBySns(snsuser);
	}

	@Override
	public String uidcheck(String uid) {
		
		return memberDao.uidcheck(uid);
	}

	@Override
	public void memberinsert(UserDTO dto) {
		memberDao.memberinsert(dto);
		
	}

}
