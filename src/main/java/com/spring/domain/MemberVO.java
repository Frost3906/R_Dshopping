package com.spring.domain;

import java.util.Date;
import java.util.List;

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
	
	// board
	private String userid;
	private String userpw;
	private String username;
	private Date regdate;
	private Date updatedate;
	private boolean enabled;
	//권한정보
	private List<AuthVO> authList;
}
