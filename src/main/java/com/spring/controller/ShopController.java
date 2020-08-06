package com.spring.controller;

import java.util.Arrays;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CartVO;
import com.spring.domain.MemberVO;
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
	public void cart(Model model, HttpSession session) {
		log.info("장바구니 호출");
		MemberVO vo = (MemberVO) session.getAttribute("auth");

		log.info("email : " + vo.getEmail());
		List<CartVO> list = service.cartList(vo.getEmail());
		model.addAttribute("mycart",list);
		
		
	}
	
	@ResponseBody
	@PostMapping("/addCart")
	public int postCart(CartVO vo) {
		int result = 0;
		log.info("카트 담기 테스트");
		log.info(""+vo);
		log.info(vo.getEmail());
		if(vo.getEmail()!="") {
			result = service.addCart(vo);
			return result;
		}else {
			return result;
		}
		
	}
	
	@GetMapping("/product")
	public void product(String p_code, Model model) {
		log.info("제품 상세페이지 호출" + p_code);
		ProductVO vo = service.getProduct(p_code);
		model.addAttribute("vo", vo);
		log.info("vo = " + vo);
	}
	
	@GetMapping("/search")
	public String searchGet(String keyword, String pageNum, Model model, String amount) {
		// 검색 키워드 처리
		log.info("GET 키워드 : " + keyword);
		model.addAttribute("keyword",keyword);
		String[] keyArray = keyword.split(" "); // 검색어를 공백 기준으로 나누어서 배열 형태로 생성
		List<String> keyList = Arrays.asList(keyArray); // 배열 형태의 검색어를 리스트로 변환
		
		// 페이지 번호 처리
		log.info("Get 페이지 넘버 : " + pageNum);
		model.addAttribute("pageNum", pageNum);
		log.info("amount : " + amount);
		model.addAttribute("amount", amount);
		// 검색 리스트 처리
		if(keyList.isEmpty()) {
			return "/error/searchError"; // 검색어 미 입력시 에러 페이지 호출
		} else {
			List<ProductVO> searchList = service.searchKeyword(keyList,Integer.parseInt(pageNum),Integer.parseInt(amount));
			model.addAttribute("product", searchList);
			log.info("검색 갯수 : " + service.searchCount(keyList));
			int idx = (service.searchCount(keyList)/Integer.parseInt(amount))+1;
			model.addAttribute("idx", idx);
			log.info("idx : " + idx);
			return "/shop/searchList";			
		}
	}
}
