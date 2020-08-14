package com.spring.controller;

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
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	private ProductService service;
	
	
	@GetMapping("/admin")
	public String admin() {
		log.info("관리자 페이지 호출");
		return "/admin/admin";
	}

	@GetMapping("/add")
	public String addProductForm() {
		log.info("상품 등록 form 호출");
		return "/admin/add_product";
	}

	@GetMapping("/product_manage")
	public void productManage(Model model) {
		log.info("상품 관리 form 호출");
		List<ProductVO> vo = service.getList();
		model.addAttribute("vo", vo);		
	}
	
	@GetMapping("/product_modify")
	public void productModify(Model model, @Param("p_code") int p_code) {
		log.info("상품 관리 form 호출");
		ProductVO vo = service.getProduct(p_code);
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/product_modify")
	public void productModify(Model model, ProductVO vo) {
		log.info("상품 관리 form 호출" + vo);
		if(service.productModify(vo)>0) {
			log.info("수정 성공");
		} else {
			log.info("수정 실패");
		}
		ProductVO list = service.getProduct(vo.getP_code());
		model.addAttribute("vo", list);
	}
	
	
	@PostMapping("/add")
	public String addProduct(ProductVO vo) {
		log.info("상품 등록 요청");
		service.addProduct(vo);
		return "redirect:/";
	}


	
}
