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
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private ProductService service;

	@GetMapping("/add")
	public String addProductForm() {
		log.info("상품 등록 form 호출");
		return "/admin/add_product";
	}
	
	@PostMapping("/add")
	public String addProduct(ProductVO vo) {
		log.info("상품 등록 요청");
		service.addProduct(vo);
		return "/";
	}


	
}
