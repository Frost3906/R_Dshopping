package com.spring.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void getCategoryList(String category1, String category2, String category3, Model model) {
		log.info("카테고리 리스트 호출" + category1 + category2 + category3);
		List<ProductVO> list = service.searchCategoryList(category1, category2, category3);
		List<String> categoryList = null;
		if(category3!=null) {
			categoryList = service.searchCategory3(category3, category2);
			model.addAttribute("category3List", categoryList);
			model.addAttribute("category2",category2);
			model.addAttribute("category3",category3);
		} else if(category2!=null) {
			categoryList = service.searchCategory3(category2, category1);
			model.addAttribute("category3List", categoryList);
			model.addAttribute("category2",category2);
		} else {
			categoryList = service.searchCategory2(category1);
			model.addAttribute("category2List", categoryList);
		}
		model.addAttribute("category1",category1);
		log.info("카테고리 리스트 = " + categoryList);
		log.info("카테고리1 = " + category1);
		log.info("카테고리2 = " + category2);
		log.info("카테고리3 = " + category3);
		log.info("검색 리스트 호출");
		log.info("리스트 요청");
		model.addAttribute("product", list);
	}
	
	@GetMapping("/cart")
	public void cart() {
		log.info("장바구니 호출");
	}
	@PostMapping("/cart")
	public void postCart() {
		log.info("카트 담기 테스트");
		
		
	}
	
	@GetMapping("/product")
	public void product(String p_code, Model model) {
		log.info("제품 상세페이지 호출" + p_code);
		ProductVO vo = service.getProduct(p_code);
		model.addAttribute("vo", vo);
		log.info("vo = " + vo);
	}
	
	@PostMapping("/search")
	public String search(String keyword, Model model) {
		String[] keyArray = keyword.split(" ");
		List<String> keyList = Arrays.asList(keyArray);
		model.addAttribute("keyword",keyword);
		log.info("키워드 리스트 출력 : " + keyList);
		if(keyList.isEmpty()) {
			return "/error/searchError";
		} else {
			model.addAttribute("keyword",keyword);
			List<ProductVO> searchList = service.searchKeyword(keyList);
			model.addAttribute("product", searchList);
			
			return "/shop/searchList";			
		}
	}
	
}
