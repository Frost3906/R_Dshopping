package com.spring.service;

import java.util.List;

import com.spring.domain.ProductVO;

public interface ProductService {
	public List<ProductVO> searchList(String keyword);
	public ProductVO getProduct(String code);
}
