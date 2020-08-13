package com.spring.sns;

import java.util.Iterator;

import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.spring.domain.MemberVO;

public class SNSSignIn {
	
	private OAuth20Service oauthService;
	private SNSValue snsValue;
	
	public SNSSignIn(SNSValue snsValue) {
		this.oauthService = new ServiceBuilder(snsValue.getClientID())
				.apiSecret(snsValue.getClientSecret())
				.callback(snsValue.getRedirectURL())
				.scope("profile")
				.build(snsValue.getApi20Instance());
		this.snsValue=snsValue;
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken=oauthService.getAccessToken(code);	
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.snsValue.getProfileURL());
		oauthService.signRequest(accessToken, request);
		
		Response response=oauthService.execute(request);
		return parseJson(response.getBody());		
	}
	
	private MemberVO parseJson(String body) throws Exception {
		MemberVO member = new MemberVO();
		
		
		
		//JSON을 OBJECT로 매핑해주는 객체
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode=mapper.readTree(body);
		if(this.snsValue.isGoogle()) {	//에러 처리 필요 error{code:403} 미확인 => 정상 
//			if(snsValue.isGoogle()) {
//				member.setGoogleid(rootNode.get("id").asText());
//			}		
			member.setGoogleid(rootNode.get("id").asText());
			member.setNickName(rootNode.get("displayName").asText());
			JsonNode nameNode=rootNode.path("name");
			member.setFirstName(nameNode.get("givenName").asText());
			member.setLastName(nameNode.get("familyName").asText());
			
			Iterator<JsonNode> iterEmails=rootNode.path("emails").elements();
			while(iterEmails.hasNext()) {
				JsonNode emailNode=iterEmails.next();
				String type=emailNode.get("type").asText();
				if(StringUtils.pathEquals(type, "account")) {
					member.setEmail(emailNode.get("value").asText());
					break;
				}
			}	
			
		}else if(this.snsValue.isNaver()) {	//에러 처리 필요 resultcode:00 => 정상
			JsonNode resNode = rootNode.get("response");
			member.setNaverid(resNode.get("id").asText());
			member.setNickName(resNode.get("nickname").asText());
			member.setEmail(resNode.get("email").asText());
		}
		
		System.out.println(member);
		return member;		
	}
}
