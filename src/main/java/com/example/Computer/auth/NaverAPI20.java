package com.example.Computer.auth;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
	
	private static NaverAPI20 instance;

	
	
	private NaverAPI20() {
	}
	
	public static NaverAPI20 instance(){
		if(instance == null) {
			instance = new NaverAPI20();
		}
		return instance;
		
	}
	
	
	
	
	
	
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return NAVER_AUTH;
	}
	

}
