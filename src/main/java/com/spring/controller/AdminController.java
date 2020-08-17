package com.spring.controller;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.ManageKeySearchVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ShopPageVO;
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
	public void productManage(Model model,
							  @Param("amount") int amount, 
							  @Param("pageNum") int pageNum,
							  String manageKeyword) {
		model.addAttribute("pageNum", pageNum); // 현재 페이지 번호
		model.addAttribute("amount", amount); // 현재 페이지 당 리스트 개수
		ShopPageVO pageVO = new ShopPageVO(pageNum, amount,service.listCount());
		int products = service.listCount();
		log.info("상품 관리 form 호출");
		List<ProductVO> vo = null;
		log.info("키워드 : " + manageKeyword);
		if(!manageKeyword.isEmpty()) {
			String[] keyArray = manageKeyword.split(" "); // 검색어를 공백 기준으로 나누어서 배열 형태로 생성
			List<String> keyList = Arrays.asList(keyArray); // 배열 형태의 검색어를 리스트로 변환
			ManageKeySearchVO keySearchVO = new
					ManageKeySearchVO(pageNum, amount, keyList);
			vo = service.keySearchManageList(keySearchVO);
			pageVO = new ShopPageVO(pageNum, amount, service.searchManageCount(keySearchVO));
			products = service.searchManageCount(keySearchVO);
			model.addAttribute("manageKeyword", manageKeyword);
		} else {
			vo = service.manageList(pageNum, amount);
		}

		model.addAttribute("productAmt", (int)(Math.ceil(products/(double)(amount))));
		int idx = 0;
		if(products%amount==0) {
			idx = (products/amount);
		} else {
			idx = (products/amount+1);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("idx", idx);
		model.addAttribute("pageVO", pageVO);
	}
	
	@GetMapping("/product_modify")
	public void productModify(Model model, 
							  @Param("p_code") int p_code, 
							  @Param("pageNum") int pageNum, 
							  @Param("amount") int amount,
							  String manageKeyword) {
		log.info("상품 관리 form 호출");
		ProductVO vo = service.getProduct(p_code);
		model.addAttribute("vo", vo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("amount", amount);
		model.addAttribute("manageKeyword", manageKeyword);
	}
	
	@PostMapping("/product_modify")
	public String productModify(Model model, ProductVO vo,@Param("p_code") int p_code, @Param("pageNum") int pageNum, @Param("amount") int amount, String manageKeyword) {
		log.info("상품 관리 form 호출" + vo);
		if(service.productModify(vo)>0) {
			log.info("수정 성공");
		} else {
			log.info("수정 실패");
		}
		ProductVO list = service.getProduct(vo.getP_code());
		model.addAttribute("vo", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("amount", amount);
		model.addAttribute("p_code", p_code);
		model.addAttribute("manageKeyword", manageKeyword);
		return "redirect:/admin/product_modify";
	}
	
	@GetMapping("/product_delete")
	public String productDelete(Model model, @Param("p_code") int p_code, @Param("pageNum") int pageNum, @Param("amount") int amount, String manageKeyword) {
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("amount", amount);
		model.addAttribute("manageKeyword", manageKeyword);
		if(service.deleteProduct(p_code)>0) {
			log.info("삭제 성공====================");
		} else {
			log.info("삭제 실패=================");
		}
		return "redirect:/admin/product_manage";
	}
	
	
	@PostMapping("/add")
	public String addProduct(ProductVO vo) {
		log.info("상품 등록 요청");
		service.addProduct(vo);
		return "redirect:/";
	}

	@ResponseBody
	@GetMapping("/deleteInfo")
	public ProductVO deleteInfo(int p_code){
		log.info("삭제 정보 조회");
		return service.getProduct(p_code);
	}


	
}
