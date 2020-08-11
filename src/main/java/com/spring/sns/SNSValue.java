package com.spring.sns;

import lombok.Data;

@Data
public class SNSValue implements SNSUrls {
	private String service;
	private String clientID;
	private String clientSecret;
	private String redirectURL;
	
	
	public SNSValue(String service, String clientID, String clientSecret, String redirectURL){
		this.service=service;
		this.clientID=clientID;
		this.clientSecret=clientSecret;
		this.redirectURL=redirectURL;
	}
}
