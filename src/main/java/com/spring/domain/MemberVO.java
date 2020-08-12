package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String nickName;
	private String role;
	private String mobile;
	private String naverid;
	private String googleid;
	
}
