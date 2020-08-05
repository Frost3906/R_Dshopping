package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.domain.ProductVO;
import com.spring.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Autowired
	private ProductService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("홈페이지 호출");
		List<ProductVO> list = service.getList();
		model.addAttribute("product", list);
		log.info("홈 상품 리스트 : " + list);
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
