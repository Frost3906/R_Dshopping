package com.spring.mapper;

import java.util.List;

import com.spring.domain.ProductVO;

public interface ProductMapper {
	public List<ProductVO> searchList(String keyword);
	public ProductVO getProduct(String code);
	public List<String> searchCategory2(String category1);
	public List<String> searchCategory3(String category2);
}
