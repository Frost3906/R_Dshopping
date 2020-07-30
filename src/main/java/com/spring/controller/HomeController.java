package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		log.info("홈페이지 호출");
		
		return "shop/home";
	}
	
	@RequestMapping("/board/list")
	public String board() {
		log.info("게시판 호출");
		return "/board/list";
	}
	@RequestMapping("/board/modify")
	public String modify() {
		log.info("게시판 호출");
		return "/board/modify";
	}
	@RequestMapping("/board/read")
	public String read() {
		log.info("게시판 호출");
		return "/board/read";
	}
	@RequestMapping("/board/register")
	public String register() {
		log.info("게시판 호출");
		return "/board/register";
	}
	
	
	
}
