package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String email;		//Require
	private String password;	//Require
	private String memLevel;	//Rookie > Normal > Bronze > Silver > Gold > Platinum > Diamond > BlackDiamond
	private String country;		
	private String firstName;	//Require
	private String lastName;	//Require
	private String nickName;	
	private String auth;		//default member
	private String mobile;		//Require
	private String naverID;
	private String googleID;
	
	private int rno;
	
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
