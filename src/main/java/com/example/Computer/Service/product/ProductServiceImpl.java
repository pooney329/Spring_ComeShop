package com.example.Computer.Service.product;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.Computer.model.product.dao.ProductDAO;
import com.example.Computer.model.product.dto.ProductDTO;



@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	ProductDAO productdao;
	
	@Override
	public List<Object>  selectlist(Map<String, Object> selectlist) {
		
		return productdao.selectlist(selectlist);
	}

	@Override
	public ProductDTO product_detail(int productid) {
		
		return productdao.product_detail(productid);
	}

	@Override
	public void insertbasket(Map<String, Object> map) {
		productdao.insertbasket(map);
		
	}

	@Override
	public List<String> checkcompatibility(int [] proids) {
		
		return productdao.checkcompatibility(proids);
	}

	@Override
	public int productcount(Map<String, Object> selectlist) {
		
		return productdao.productcount(selectlist);
	}

	@Override
	public int product_search_count(String keyword) {
		
		return productdao.product_search_count(keyword);
	}

	@Override
	public List<Object> product_search(Map<String, Object> search) {
		
		return productdao.product_search(search);
	}

	@Override
	public List<ProductDTO> lowsearchlist(String prdname) {

		return productdao.lowsearchlist(prdname);
	}

}
