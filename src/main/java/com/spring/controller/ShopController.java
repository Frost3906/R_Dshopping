package com.spring.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderVO;
import com.spring.domain.BoardPageVO;
import com.spring.domain.CartListVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ReviewPageVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.ShopPageVO;
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
								@Param("pageNum") int pageNum, 
								String categoryKeyword,
								String category1, 
								String category2, 
								String category3, 
								Model model) {
		// 페이지 번호 처리
		model.addAttribute("pageNum", pageNum); // 현재 페이지 번호
		model.addAttribute("amount", amount); // 현재 페이지 당 리스트 개수
		ShopPageVO pageVO = new ShopPageVO(pageNum, amount,service.categoryCount(category1, category2, category3));
		int products = service.categoryCount(category1, category2, category3); // 조회된 상품 수
		model.addAttribute("categoryKeyword", categoryKeyword);
		log.info("categoryKeword" + categoryKeyword);
		List<ProductVO> list = null;
		if(!categoryKeyword.isEmpty()) {
			String[] keyArray = categoryKeyword.split(" "); // 검색어를 공백 기준으로 나누어서 배열 형태로 생성
			List<String> keyList = Arrays.asList(keyArray); // 배열 형태의 검색어를 리스트로 변환
			CategoryKeySearchVO keySearchVO = new
					CategoryKeySearchVO(pageVO, category1, category2, category3, keyList);
			list = service.keySearchCategoryList(keySearchVO);
			pageVO = new ShopPageVO(pageNum, amount, service.keySearchCategoryCount(keySearchVO));
			products = service.keySearchCategoryCount(keySearchVO);
		} else {
			list = service.searchCategoryList(category1, category2, category3,pageNum,amount);
		}
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

		
		model.addAttribute("productAmt", (int)(Math.ceil(products/(double)(amount))));
		int idx = 0;
		if(products%amount==0) {
			idx = (products/amount);
		} else {
			idx = (products/amount+1);
		}
		model.addAttribute("idx", idx);
		model.addAttribute("category1",category1);
		model.addAttribute("product", list);
		model.addAttribute("pageVO", pageVO);
	}
	
	@GetMapping("/cart")
	public String cart(Model model, HttpSession session) {
		log.info("장바구니 호출");
		if(session.getAttribute("auth")!=null) {
			MemberVO vo = (MemberVO) session.getAttribute("auth");
			log.info("email : " + vo.getUsername());
			List<CartListVO> list = service.cartList(vo.getUsername());
			log.info("카트 리스트"+list);
			model.addAttribute("mycart",list);
		}else {
			MemberVO vo = new MemberVO();
			log.info("비회원 접근");
			List<CartListVO> list = new ArrayList<CartListVO>();
			model.addAttribute("mycart",list);
		}
		return "shop/cart";
	}
	

	
	@ResponseBody
	@PostMapping("/addCart")
	public int postCart(CartVO vo) {
		int result = 0;
		log.info("카트 담기 테스트");
		log.info(""+vo);
		log.info(vo.getUsername());
		if(vo.getUsername()!="") {
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
		String email = auth.getUsername();
		int result = 0;
		int cartNum = 0;
		 
		 
		if(auth != null) {
			vo.setUsername(email);
		  
			for(String i : chArr) {   
				cartNum = Integer.parseInt(i);
				vo.setCartNum(cartNum);
				service.removeFromCart(vo);
			}   
			result = 1;
		}  
		return result;  
	}
	
	@ResponseBody
	@PostMapping("/updateCart")
	public int updateCart(HttpSession session, @RequestBody List<Map<String, Object>> Arr, CartVO vo) {
		log.info("카트 물품 변경 "+Arr);
		MemberVO auth = (MemberVO) session.getAttribute("auth");
		String username = auth.getUsername();
		int result = 0;
		
		int cartNum = 0;
		 
		System.out.println(Arr);
		
		if(auth != null) {
			vo.setUsername(username);
		  
			for(Map<String, Object> i : Arr) {   
				cartNum = Integer.parseInt((String) i.get("cartNum"));
				vo.setCartNum(cartNum);
				vo.setCart_Stock(Integer.parseInt((String) i.get("amount")));
				service.updateCart(vo);
			}   
			result = 1;
		}  
		return result;  
	}
	
	
	
	
	
	@GetMapping("/product")
	public void product(int p_code, Model model) {
		log.info("제품 상세페이지 호출" + p_code);
		ProductVO vo = service.getProduct(p_code);
		Criteria cri = new Criteria(1, 10);
		model.addAttribute("vo", vo);
		model.addAttribute("list",service.listReview(cri,p_code));
		log.info("vo = " + vo);
		
	}

	@ResponseBody
	@GetMapping("/review/list")
	public ReviewPageVO listReview(int p_code, int page){
		
		Criteria cri = new Criteria(page, 10);
		
		return service.listReview(cri,p_code);
	}
	
	@ResponseBody
	@GetMapping("/review/get")
	public ReviewVO getReview(int reviewId) {
		return service.getReview(reviewId);
	}
	
	
	@ResponseBody
	@PostMapping("/review/write")
	public int writeReview(ReviewVO vo) {
		log.info("리뷰 작성 요청 "+vo);
		int result = service.writeReview(vo);
		service.updateStar(vo.getP_code());
		return result;
	}
	
	@PostMapping("/review/delete")
	@ResponseBody
	public int delReview(int reviewId) {
		log.info("리뷰 삭제 요청 : "+reviewId);
		
		return service.delReview(reviewId);
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
			ShopPageVO pageVO = new ShopPageVO(pageNum, amount,service.searchCount(keyList));
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
	
	
	@PostMapping("/check")
	public String check(double total, Model model) {
		log.info("배송정보 입력 form 요청 "+total);
		
		model.addAttribute("total",total);
		
		return "/shop/check";
	}
	
	
	// 주문
	@PostMapping("/order")
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) {
		log.info("주문정보 확인 "+order);
	 
		MemberVO member = (MemberVO)session.getAttribute("auth");  
		String username = member.getUsername();
	 
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
	 
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
	 
		String orderId = ymd + "_" + subNum;
	 
		order.setOrderId(orderId);
		order.setUsername(username);
	  
		service.makeOrder(order);
	 
		orderDetail.setOrderId(orderId);   
		service.insertOrderDetail(orderDetail);
		service.stockUpdate(orderDetail);
		service.deleteCart(username);
	 
	 
		return "/shop/complete";  
	}

	
}
