package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.CartVO;
import com.spring.domain.CategoryKeySearchVO;
import com.spring.domain.ProductVO;
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
	public List<ReviewVO> listReview(int p_code) {
		return product.listReview(p_code);
	}
	@Override
	public ReviewVO getReview(int reviewId) {
		return product.getReview(reviewId);
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
	
	
}
