package com.spring.sns;


import org.springframework.util.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SNSValue implements SNSUrls {
	private String snsName;
	private String clientID;
	private String clientSecret;
	private String redirectURL;
	private DefaultApi20 api20Instance;
	private String profileURL;
	
	private boolean isNaver;
	private boolean isGoogle;
	
	
	public SNSValue(String snsName, String clientID, String clientSecret, String redirectURL){
		this.snsName=snsName;
		this.clientID=clientID;
		this.clientSecret=clientSecret;
		this.redirectURL=redirectURL;
		
		this.isNaver=StringUtils.pathEquals("naver", this.snsName);
		this.isGoogle=StringUtils.pathEquals("google", this.snsName);		
		
		if(isNaver) {
			this.api20Instance=NaverAPI20.instance();
			this.profileURL=NAVER_PROFILE_URL;
			
		}else if(isGoogle) {
			this.api20Instance=GoogleApi20.instance();
			this.profileURL=GOOGLE_PROFILE_URL;
			
		}else if(StringUtils.pathEquals(snsName, "insta")) {
			
			
		}else if(StringUtils.pathEquals(snsName, "facebook")) {
			
			
		}else if(StringUtils.pathEquals(snsName, "twitter")) {
			
			
		}
	}	
}
