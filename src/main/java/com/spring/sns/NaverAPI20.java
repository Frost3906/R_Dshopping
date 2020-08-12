package com.spring.sns;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SNSUrls {
	private NaverAPI20() {}
	private static class InstanceHolder {
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	public static NaverAPI20 instance() {
		return InstanceHolder.INSTANCE;			
	}
	
	public String denyToken() {
		return NAVER_DENY_TOKEN;
	}
	
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_ACCESS_TOKEN;
	}
	
	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
}
