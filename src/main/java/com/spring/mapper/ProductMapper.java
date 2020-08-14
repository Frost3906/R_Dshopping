package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ReviewVO;

public interface ProductMapper {
	
	public void addProduct(ProductVO vo);
	
	public List<ProductVO> getList();
	public ProductVO getProduct(String code);
	public List<String> searchCategory2(String category1);
	public List<String> searchCategory3(@Param ("category2") String category2, 
										@Param("category1") String category1);
	public List<ProductVO> searchCategoryList(@Param("category1") String category1,
											  @Param("category2") String category2,
											  @Param("category3") String category3, 
											  @Param("pageNum") int pageNum, 
											  @Param("amount") int amount);
	public List<ProductVO> keySearchCategoryList(CategoryKeySearchVO vo);
	public List<ProductVO> searchKeyword(@Param("keywordList") List<String> keywordList, 
										 @Param("pageNum") int pageNum, 
										 @Param("amount") int amount);
	public int searchCount(@Param("keywordList") List<String> keywordList);
	public int categoryCount(@Param("category1") String category1,
							 @Param("category2") String category2,
							 @Param("category3") String category3);
	public int keySearchCategoryCount(CategoryKeySearchVO vo);
	public int homeCategoryCount();
	public List<String> homeCategoryList();
	
	
	public int addCart(CartVO vo);
	public List<CartVO> cartList(String email);
	
	public void removeFromCart(CartVO vo);
	public void updateCart(CartVO vo);
	
	public int writeReview(ReviewVO vo);
	public List<ReviewVO> listReview();
	public int productModify(ProductVO vo);
}
