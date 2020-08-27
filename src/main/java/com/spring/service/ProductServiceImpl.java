package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ProductVO getProduct(int code) {
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
	public List<ProductVO> searchCategoryList(String p_category1, String p_category2, String p_category3,int pageNum, int amount) {
		return product.searchCategoryList(p_category1, p_category2, p_category3, pageNum, amount);
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
	public List<CartListVO> cartList(String username) {
		return product.cartList(username);
	}
	
	@Override
	public int categoryCount(String p_category1, String p_category2, String p_category3) {
		return product.categoryCount(p_category1, p_category2, p_category3);
	}
	@Override
	public void removeFromCart(CartVO vo) {
		product.removeFromCart(vo);
	}
	@Override
	public int homeCategoryCount() {
		return product.homeCategoryCount();
	}
	@Override
	public List<String> homeCategoryList() {
		return product.homeCategoryList();
	}
	@Override
	public void updateCart(CartVO vo) {
		product.updateCart(vo);
	}
	@Override
	public List<ProductVO> keySearchCategoryList(CategoryKeySearchVO vo) {
		return product.keySearchCategoryList(vo);
	}
	@Override
	public int keySearchCategoryCount(CategoryKeySearchVO vo) {
		return product.keySearchCategoryCount(vo);
	}
	@Override
	public int writeReview(ReviewVO vo) {
		return product.writeReview(vo);
	}
	@Override
	public ReviewPageVO listReview(Criteria cri, int p_code) {
		return new ReviewPageVO(product.getCountByPcode(p_code),product.listReview(cri, p_code));
	}
	@Override
	public ReviewVO getReview(int reviewId) {
		return product.getReview(reviewId);
	}
	
	@Override
	public int delReview(int reviewId) {
		return product.delReview(reviewId);
	}
	
	@Override
	public void updateStar(int p_code) {
		product.updateStar(p_code);

	}
	@Override
	public int productModify(ProductVO vo) {
		return product.productModify(vo);
	}
	@Override
	public int listCount() {
		return product.listCount();
	}
	@Override
	public List<ProductVO> manageList(int pageNum, int amount) {
		return product.manageList(pageNum, amount);
	}
	@Override
	public int deleteProduct(int p_code) {
		return product.deleteProduct(p_code);
	}
	@Override
	public List<ProductVO> keySearchManageList(ManageKeySearchVO vo) {
		return product.keySearchManageList(vo);
	}
	@Override
	public int searchManageCount(ManageKeySearchVO vo) {
		return product.searchManageCount(vo);
		
	}
	@Override
	public void makeOrder(OrderVO vo) {
		product.makeOrder(vo);
	}
	@Override
	public void insertOrderDetail(OrderDetailVO vo) {
		product.insertOrderDetail(vo);
	}
	
	@Override
	public List<OrderDetailVO> selectod(String orderId) {
		return product.selectod(orderId);
	}
	
	@Override
	public void deleteCart(String username) {
		product.deleteCart(username);
	}
	@Override
	public List<MyPageOrderVO> orderList_admin() {
		return product.orderList_admin();
	}
	@Override
	public void stockUpdate(OrderDetailVO vo) {
		product.stockUpdate(vo);
	}
	@Override
	public List<CategoryVO> categoryList() {
		return product.categoryList();
	}
	@Override
	public List<BannerVO> BannerList() {
		return product.bannerList();
	}
	@Override
	public int addCategory(CategoryVO vo) {
		return product.addCategory(vo);
	}
}
