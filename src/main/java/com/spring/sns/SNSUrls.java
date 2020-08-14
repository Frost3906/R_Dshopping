package com.spring.sns;

public interface SNSUrls {
	static final String NAVER_ACCESS_TOKEN="https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	static final String NAVER_DENY_TOKEN="https://nid.naver.com/oauth2.0/token?grant_type=delete";
	static final String NAVER_AUTH="https://nid.naver.com/oauth2.0/authorize";
	
//	static final String GOOGLE_PROFILE_URL="https://www.googleapis.com/discovery/v1/apis";
	static final String GOOGLE_PROFILE_URL="https://www.googleapis.com/oauth2/v1/userinfo?alt=json";
//	static final String GOOGLE_PROFILE_URL="https://accounts.google.com/o/oauth2/v2/auth";
	static final String NAVER_PROFILE_URL="https://openapi.naver.com/v1/nid/me";
}
