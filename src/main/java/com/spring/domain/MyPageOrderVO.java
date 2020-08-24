package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyPageOrderVO {
	//memberVO
	private String username;	//Require email-PK
//	private String password;	//Require
//	private String new_password;	
//	private String confirm_password;
//	private String mobile;		//Require
//	private String memLevel;	//Rookie > Normal > Bronze > Silver > Gold > Platinum > Diamond > BlackDiamond
//	private String firstName;	//Require
//	private String lastName;	//Require
//	private String country;		
//	private String street;		
//	private String address;		
//	private String postcode;		
//	private String nickName;	
//	private String auth;		//default member
//	private String googleID;
	
	//orderVO
	private String orderId;
//	private String fullname;
//	private String username;
//	private String streetaddress;
//	private String detailaddress;
//	private String city;
//	private String state;
//	private String country;
//	private String zipcode;
	private double total;
	private Date orderDate;
	
	//orderDetailVO
	private int ordersDetailNum;
//	private String orderId;
	private String p_code;
	private int cart_Stock;
	
	//productVO
//	private int p_code;
	private String p_name;
	private double p_price;
//	private int p_stock;
//	private int p_rating;
//	private String p_content;
//	private String p_category1;
//	private String p_category2;
//	private String p_category3;
//	private String property;
	private String image;
//	private String detailImage;
	private int rno;
}
