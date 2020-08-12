package com.spring.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewId;
	private int p_code;
	private String title;
	private String content;
	private int p_rating;
	private String email;
	private Date regdate;
	
}