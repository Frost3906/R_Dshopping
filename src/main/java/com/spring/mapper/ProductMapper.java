package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring.domain.BannerVO;
import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.CategoryVO;
import com.spring.domain.Criteria;
import com.spring.domain.ManageKeySearchVO;
import com.spring.domain.MyPageOrderVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ReviewVO;

@Repository
public interface ProductMapper {
	
	public void addProduct(ProductVO vo);
	
	public List<ProductVO> getList();
	public ProductVO getProduct(int code);
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
	public List<CartVO> cartList(String username);
	
	public void removeFromCart(CartVO vo);
	public void updateCart(CartVO vo);
	public void deleteCart(String username);
	
	public int writeReview(ReviewVO vo);
	public int delReview(int reviewId);
	
	
	public int productModify(ProductVO vo);
	public List<ReviewVO> listReview(@Param("cri") Criteria cri, @Param("p_code") int p_code);
	int getCountByPcode(int p_code);
	
	
	public ReviewVO getReview(int reviewId);
	
	public void updateStar(int p_code);

	public int listCount();
	public List<ProductVO> manageList(@Param("pageNum") int pageNum, 
									  @Param("amount") int amount);
	public int deleteProduct(int p_code);
	public List<ProductVO> keySearchManageList(ManageKeySearchVO vo);
	public int searchManageCount(ManageKeySearchVO vo);
	
	
	public void makeOrder(OrderVO vo);
	public void insertOrderDetail(OrderDetailVO vo);
	public void stockUpdate(OrderDetailVO vo);
	
	public List<MyPageOrderVO> orderList_admin();
	
	public List<CategoryVO> categoryList();
	public List<BannerVO> bannerList();
	
}
