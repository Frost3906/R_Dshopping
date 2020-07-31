package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
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

	@GetMapping("/searchList")
	public void getSearchList(Model model) {
		log.info("검색 리스트 호출");
		List<ProductVO> list = service.selectProduct();
		log.info("리스트 요청"+list);
		model.addAttribute("product", list);
	}

	@GetMapping("/categoryList")
	public void getCategoryList() {
		log.info("카테고리 리스트 호출");
	}
	
	@GetMapping("/cart")
	public void cart() {
		log.info("장바구니 호출");
	}
	
	@GetMapping("/product")
	public void product() {
		log.info("제품 상세페이지 호출");
		
	}
	
	@PostMapping("/search")
	public void search(String search) {
		log.info("검색 테스트" + search);
		
	}
	
}
