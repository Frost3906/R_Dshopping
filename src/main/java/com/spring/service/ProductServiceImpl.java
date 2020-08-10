package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.domain.ProductVO;
import com.spring.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper product;
	
	
	@Override
	public void addProduct(ProductVO vo) {
		product.addProduct(vo);
	}
	@Override
	public List<ProductVO> getList() {
		return product.getList();
	}

	@Override
	public ProductVO getProduct(String code) {
		return product.getProduct(code);
	}

	@Override
	public List<String> searchCategory2(String p_category1) {
		return product.searchCategory2(p_category1);
	}

	@Override
	public List<String> searchCategory3(String p_category2, String p_category1) {
		return product.searchCategory3(p_category2, p_category1);
	}

	@Override
	public List<ProductVO> searchCategoryList(String p_category1, String p_category2, String p_category3) {
		return product.searchCategoryList(p_category1, p_category2, p_category3);
	}

	@Override
	public int addCart(CartVO vo) {
		return product.addCart(vo);
	}
	@Override
	public List<ProductVO> searchKeyword(List<String> keywordList,int pageNum, int amount) {
		return product.searchKeyword(keywordList,pageNum,amount);
	}
	@Override
	public int searchCount(List<String> keywordList) {
		return product.searchCount(keywordList);
	}
	
	@Override
	public List<CartVO> cartList(String email) {
		return product.cartList(email);
	}
	
	@Override
	public int categoryCount(String p_category1, String p_category2, String p_category3) {
		return product.categoryCount(p_category1, p_category2, p_category3);
	}
	@Override
	public void removeFromCart(CartVO vo) {
		product.removeFromCart(vo);
	}
	
	
}
