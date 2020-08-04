package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CartVO;
import com.spring.domain.ProductVO;

public interface ProductMapper {
	
	public void addProduct(ProductVO vo);
	
	public List<ProductVO> searchList(String keyword);
	public ProductVO getProduct(String code);
	public List<String> searchCategory2(String category1);
	public List<String> searchCategory3(@Param ("category2") String category2, 
										@Param("category1") String category1);
	public List<ProductVO> searchCategoryList(@Param("category1") String category1,
											  @Param("category2") String category2,
											  @Param("category3") String category3);
	
	public void addCart(CartVO vo);
}
