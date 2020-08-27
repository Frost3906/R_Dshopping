package com.spring.service;

import java.util.List;

import com.spring.domain.BannerVO;
import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.CategoryVO;
import com.spring.domain.Criteria;
import com.spring.domain.ManageKeySearchVO;
import com.spring.domain.MyPageOrderVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderVO;
import com.spring.domain.ProductVO;
import com.spring.domain.ReviewPageVO;
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
	public List<CartListVO> cartList(String username);
	public void removeFromCart(CartVO vo);
	public void deleteCart(String username);
	
	public int homeCategoryCount();
	public List<String> homeCategoryList();
	public void updateCart(CartVO vo);
	
	public int writeReview(ReviewVO vo);
	public int delReview(int reviewId);
	public int productModify(ProductVO vo);
	public ReviewPageVO listReview(Criteria cri, int p_code);
	public ReviewVO getReview(int reviewId);
	public void updateStar(int p_code);
	public int listCount();
	public List<ProductVO> manageList(int pageNum, int amount);
	public int deleteProduct(int p_code);
	public List<ProductVO> keySearchManageList(ManageKeySearchVO vo);
	public int searchManageCount(ManageKeySearchVO vo);
	
	public void makeOrder(OrderVO vo);
	public void insertOrderDetail(OrderDetailVO vo);
	public List<OrderDetailVO> selectod(String orderId);
	public void stockUpdate(OrderDetailVO vo);
	public List<MyPageOrderVO> orderList_admin();
	public List<CategoryVO> categoryList();
	public List<BannerVO> BannerList();
	public int addCategory(CategoryVO vo);
}
