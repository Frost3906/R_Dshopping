package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String mobile;
	private String role;
}
