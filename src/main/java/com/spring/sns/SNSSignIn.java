package com.spring.sns;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSSignIn {
	
	private OAuth20Service oauthService;
	private String profileURL;
	
	public SNSSignIn(SNSValue snsValue) {
		this.oauthService = new ServiceBuilder(snsValue.getClientID())
				.apiSecret(snsValue.getClientSecret())
				.callback(snsValue.getRedirectURL())
				.scope("profile")
				.build(snsValue.getApi20Instance());
		this.profileURL=snsValue.getProfileURL();
	}
	
	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public String getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken=oauthService.getAccessToken(code);	
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.profileURL);
		oauthService.signRequest(accessToken, request);
		
		Response response=oauthService.execute(request);
		return response.getBody();
	}
}
