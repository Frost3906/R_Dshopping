package com.spring.service;

import java.util.List;

import com.spring.domain.CartVO;
import com.spring.domain.ProductVO;

public interface ProductService {
	public void addProduct(ProductVO vo);
	public List<ProductVO> searchList(String keyword);
	public ProductVO getProduct(String code);
	public List<String> searchCategory2(String p_category1);
	public List<String> searchCategory3(String p_category2, String p_category1);
<<<<<<< HEAD
	public List<ProductVO> searchCategoryList(String p_category1, String p_category2, String p_category3);
	public void addCart(CartVO vo);
=======
	public List<ProductVO> searchCategoryList(String p_category1, String p_category2, String p_category3);
	public List<ProductVO> searchKeyword(List<String> keywordList);
	public void addcart(CartVO vo);
>>>>>>> branch 'master' of https://github.com/Frost3906/R_Dshopping.git
}
