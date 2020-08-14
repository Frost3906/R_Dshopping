package com.spring.service;

import java.util.List;

import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ReviewVO;

public interface ProductService {
	public void addProduct(ProductVO vo);
	public List<ProductVO> getList();
	public ProductVO getProduct(int code);
	public List<String> searchCategory2(String p_category1);
	public List<String> searchCategory3(String p_category2, String p_category1);
	public int addCart(CartVO vo);
	public List<ProductVO> searchCategoryList(String p_category1, String p_category2, String p_category3, int pageNum, int amount);
	public List<ProductVO> searchKeyword(List<String> keywordList, int pageNum, int amount);
	public List<ProductVO> keySearchCategoryList(CategoryKeySearchVO vo);
	public int searchCount(List<String> keywordList);
	public int categoryCount(String p_category1, String p_category2, String p_category3);
	public int keySearchCategoryCount(CategoryKeySearchVO vo);
	public List<CartVO> cartList(String email);
	public void removeFromCart(CartVO vo);
	public int homeCategoryCount();
	public List<String> homeCategoryList();
	public void updateCart(CartVO vo);
	
	public int writeReview(ReviewVO vo);
	public int productModify(ProductVO vo);
	public List<ReviewVO> listReview(int p_code);
	public ReviewVO getReview(int reviewId);
	public void updateStar(int p_code);
}
