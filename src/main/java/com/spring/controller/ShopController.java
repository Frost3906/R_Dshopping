package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.ProductVO;
import com.spring.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Autowired
	private ProductService service;

	@GetMapping("/categoryList")
	public void getCategoryList() {
		log.info("카테고리 리스트 호출");
	}
	
	@GetMapping("/cart")
	public void cart() {
		log.info("장바구니 호출");
	}
	
	@PostMapping("/search")
	public String search(String keyword, Model model) {
		log.info("검색 테스트 키워드 : " + keyword);
		model.addAttribute("keyword",keyword);
		log.info("검색 리스트 호출");
		log.info("리스트 요청");
		List<ProductVO> list = service.selectProduct(keyword);
		model.addAttribute("product", list);
		return "/shop/searchList";
	}
	
}
