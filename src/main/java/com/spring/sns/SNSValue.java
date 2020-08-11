package com.spring.sns;

import org.springframework.util.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

import lombok.Data;

@Data
public class SNSValue implements SNSUrls {
	private String service;
	private String clientID;
	private String clientSecret;
	private String redirectURL;
	private DefaultApi20 api20Instance;
	private String profileURL;
	
	public SNSValue(String service, String clientID, String clientSecret, String redirectURL){
		this.service=service;
		this.clientID=clientID;
		this.clientSecret=clientSecret;
		this.redirectURL=redirectURL;
		
		
		if(StringUtils.pathEquals(service, "naver")) {
			this.api20Instance=NaverAPI20.instance();
			this.profileURL=NAVER_PROFILE_URL;
			
		}else if(StringUtils.pathEquals(service, "google")) {
			this.api20Instance=GoogleApi20.instance();
			this.profileURL=GOOGLE_PROFILE_URL;
			
		}else if(StringUtils.pathEquals(service, "insta")) {
			
			
		}else if(StringUtils.pathEquals(service, "facebook")) {
			
			
		}else if(StringUtils.pathEquals(service, "twitter")) {
			
			
		}
	}	
}
