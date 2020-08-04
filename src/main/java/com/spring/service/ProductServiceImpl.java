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
	public List<ProductVO> searchList(String keyword) {
		return product.searchList(keyword);
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
	public void addCart(CartVO vo) {
		product.addCart(vo);
	}
	@Override
	public List<ProductVO> searchKeyword(List<String> keywordList) {
		return product.searchKeyword(keywordList);
	}

	


}
