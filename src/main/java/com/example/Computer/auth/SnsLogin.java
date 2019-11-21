package com.example.Computer.auth;

import java.io.IOException;
import java.util.Iterator;
import java.util.concurrent.ExecutionException;

import org.apache.commons.lang3.StringUtils;

import com.example.Computer.model.member.dto.UserDTO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SnsLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;

	public SnsLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl()).build(sns.getApi20Instance());
		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public UserDTO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		System.out.println(response.getBody());
		return parseJson(response.getBody());

	}

	private UserDTO parseJson(String body) throws Exception {
		UserDTO user = new UserDTO();
		ObjectMapper mapper = new ObjectMapper(); // 객체랑 json이랑 맵핑
		JsonNode root = mapper.readTree(body);
		
		if(this.sns.isNaver()) {
			JsonNode resNode  = root.get("response");
			user.setUid(resNode.get("id").asText());
			
			user.setEmail(resNode.get("email").asText());
			user.setUname(resNode.get("name").asText());
			user.setNaverid(resNode.get("email").asText());

		}
		else if(this.sns.isGoogle()){
			user.setUid(root.get("id").asText());
			user.setUname(root.get("displayName").asText());
			
			System.out.println("111111111"+root.get("displayName").asText());
			Iterator<JsonNode> iterEmails = root.path("emails").elements();
			while(iterEmails.hasNext()) {
				JsonNode emailNode = iterEmails.next();
				String type = emailNode.get("type").asText();
				System.out.println("2222222222222");
				if (StringUtils.equals(type, "ACCOUNT")) {
					user.setEmail(emailNode.get("value").asText());
					System.out.println(emailNode.get("value").asText()+">>>>>>>>>>>>>>>>>>>>>>>>");
					user.setGoogleid(emailNode.get("value").asText());
					break;
				}
			}
			
		}
		return user;
		
		
		

	}

}
