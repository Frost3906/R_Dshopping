package com.spring.domain;

import java.util.Date;

import lombok.Data;


@Data
public class OrderVO {

	
	private String orderId;
	private String fullname;
	private String username;
	private String streetaddress;
	private String detailaddress;
	private String city;
	private String state;
	private String country;
	private String zipcode;
	private double total;
	private Date orderDate;
	
	
}
