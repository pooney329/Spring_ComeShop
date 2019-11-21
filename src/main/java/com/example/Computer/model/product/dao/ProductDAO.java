package com.example.Computer.model.product.dao;

import java.util.List;
import java.util.Map;

import com.example.Computer.model.product.dto.ProductDTO;

public interface ProductDAO {
	List<Object> selectlist(Map<String, Object> selectlist);
	
	ProductDTO product_detail(int productid);
	
	void insertbasket(Map<String, Object> map);
	
	//호환성여부검사 
	List<String> checkcompatibility(int [] proids);
	
	//상품의 레코드 개수구하기
	int productcount(Map<String, Object> selectlist);
	
	//상품검색 레코드 개수구하기 
	int product_search_count(String keyword);
	//상품검색
	List<Object> product_search(Map<String, Object> search);
	//최저가쇼핑물검색리스트보여주기  검색한것 보여주기 
	List<ProductDTO> lowsearchlist(String prdname);
}
