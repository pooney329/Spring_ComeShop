package com.example.Computer.model.member.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.Computer.model.member.dto.UserDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	private static final String NAMESPACE ="Member";
	private static final String LOGIN = NAMESPACE+".login";
	private static final String KEEPLOGIN= NAMESPACE+".keeplogin";
	private static final String CHECK_LOGIN_BEFORE = NAMESPACE + ".checkLoginBefore";
	private static final String SNSNAVER = NAMESPACE + ".getBySnsNaver";
	private static final String SNSGOOGLE = NAMESPACE + ".getBySnsGoogle";
	private static final String UIDCHECK = NAMESPACE + ".uidcheck";
	private static final String MEMBERINSERT = NAMESPACE + ".memberinsert";
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public UserDTO login(UserDTO user) {
		 UserDTO selectduser = sqlSession.selectOne(LOGIN,user);
		return selectduser;
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid",uid);
		map.put("sessionid",sessionid);
		map.put("expire",expire);
		sqlSession.update(KEEPLOGIN,map);
		
	}

	@Override
	public UserDTO checkLoginBefore(String loginCookie) {

		return sqlSession.selectOne(CHECK_LOGIN_BEFORE,loginCookie);
	}

	@Override
	public UserDTO getBySns(UserDTO snsuser) {
		if(snsuser.getNaverid()!=null) {
			return sqlSession.selectOne(SNSNAVER,snsuser.getNaverid());
		}else {
			return sqlSession.selectOne(SNSGOOGLE,snsuser.getGoogleid());
		}
		
	}

	@Override
	public String uidcheck(String uid) {
			String uid_check =  sqlSession.selectOne(UIDCHECK,uid);
		return uid_check;
	}

	@Override
	public void memberinsert(UserDTO dto) {
		sqlSession.insert(MEMBERINSERT,dto);
		
		
	}
	

}
