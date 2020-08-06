package com.spring.domain;

import lombok.Data;

@Data
public class ModifyMemberVO {
	private String email;
	private String password;
	private String new_password;
	private String confirm_password;
	private String mobile;
	private String street;
	private String address;
	private String city;
	private String postcode;
}
