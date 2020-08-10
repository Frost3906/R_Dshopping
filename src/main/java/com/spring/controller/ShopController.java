package com.spring.controller;

import java.util.Arrays;
import java.util.List;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CartVO;
import com.spring.domain.MemberVO;
import com.spring.domain.PageVO;
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
	public void getCategoryList(@Param("amount") int amount, 
								@Param("amount") int pageNum, 
								String category1, 
								String category2, 
								String category3, 
								Model model) {
		// 페이지 번호 처리
		model.addAttribute("pageNum", pageNum); // 현재 페이지 번호
		model.addAttribute("amount", amount); // 현재 페이지 당 리스트 개수
		PageVO pageVO = new PageVO(pageNum, amount,service.categoryCount(category1, category2, category3));
		model.addAttribute("pageVO", pageVO);
		int products = service.categoryCount(category1, category2, category3); // 조회된 상품 수
		model.addAttribute("productAmt", (int)(Math.ceil(products/(double)(amount))));
		int idx = 0;
		if(products%amount==0) {
			idx = (products/amount);
		} else {
			idx = (products/amount+1);
		}
		model.addAttribute("idx", idx);
		
		List<ProductVO> list = service.searchCategoryList(category1, category2, category3,pageNum,amount);
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
	
	
		
	 
	 
	 
	
	
	
	
	@ResponseBody
	@PostMapping("/removeFromCart")
	public int removeFromCart(HttpSession session, @RequestParam(value="selectbox[]") List<String> chArr, CartVO vo) {
		log.info("카트 물품 삭제 "+vo);
		MemberVO auth = (MemberVO) session.getAttribute("auth");
		String email = auth.getEmail();
		int result = 0;
		int cartNum = 0;
		 
		 
		if(auth != null) {
			vo.setEmail(email);
		  
			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
				vo.setCartNum(cartNum);
				service.removeFromCart(vo);
			}   
			result = 1;
		}  
		return result;  
		
	}
	
	
	@GetMapping("/product")
	public void product(String p_code, Model model) {
		log.info("제품 상세페이지 호출" + p_code);
		ProductVO vo = service.getProduct(p_code);
		model.addAttribute("vo", vo);
		log.info("vo = " + vo);
	}
	
	@GetMapping("/search")
	public String searchGet(String keyword, 
							@Param("pageNum") int pageNum, 
							@Param("amount") int amount,
							Model model) {
		// 검색 키워드 처리
		model.addAttribute("keyword",keyword);
		String[] keyArray = keyword.split(" "); // 검색어를 공백 기준으로 나누어서 배열 형태로 생성
		List<String> keyList = Arrays.asList(keyArray); // 배열 형태의 검색어를 리스트로 변환
		
		// 검색 리스트 처리
		if(keyList.isEmpty()) {
			return "/error/searchError"; // 검색어 미 입력시 에러 페이지 호출
		} else {
			// 페이지 번호 처리
			model.addAttribute("pageNum", pageNum); // 현재 페이지 번호
			model.addAttribute("amount", amount); // 현재 페이지 당 리스트 개수
			PageVO pageVO = new PageVO(pageNum, amount,service.searchCount(keyList));
			model.addAttribute("pageVO", pageVO);
			model.addAttribute("productAmt", (int)(Math.ceil(service.searchCount(keyList)/(double)(amount))));
					
			List<ProductVO> searchList = service.searchKeyword(keyList,pageNum,amount);
			model.addAttribute("product", searchList);
			
			int idx = 0;	
			if(service.searchCount(keyList)%amount==0) {
				idx = (service.searchCount(keyList)/amount);
			} else {
				idx = (service.searchCount(keyList)/amount+1);
			}
			model.addAttribute("idx", idx);
			
			return "/shop/searchList";			
		}
	}
}
