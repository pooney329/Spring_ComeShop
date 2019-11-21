package com.example.Computer.model.product.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.Computer.model.product.dto.ProductDTO;
	
	


@Repository
public class ProductDAOImpl implements ProductDAO{
	private static final String NAMESPACE = "Product";
	private static final String SELECTLIST = NAMESPACE+".selectlist";
	private static final String PRODUCTDETAIL = NAMESPACE+".product_detail";  //상품상세정보
	private static final String INSERTCART = NAMESPACE+".insertcart";  //장바구니담기
	private static final String CHECKCOM = NAMESPACE+".checkcompatibility";  //호환성검사
	private static final String NOTCHECKNAME = NAMESPACE+".notcheckcompatibilityname";  //호환성에 안맞는 제품의 이름 가져오기
	private static final String PRODUCTCOUNT = NAMESPACE+".productcount";  //상품의 총 레코드 수 구하기 
	private static final String PRDSELCONUNT = NAMESPACE+".product_select_count";  //상품검색 총 레코드 수 구하기
	private static final String PRODUCTSEARCH = NAMESPACE+".product_search";  //상품검색하기
	private static final String LOWSERACHLIST = NAMESPACE+".lowsearch_list";  //최저가상품검색하기
	
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<Object> selectlist(Map<String, Object> selectlist) {
		
		return sqlSession.selectList(SELECTLIST, selectlist);
	}

	@Override
	public ProductDTO product_detail(int productid) {

		return sqlSession.selectOne(PRODUCTDETAIL,productid);
	}

	

	@Override
	public void insertbasket(Map<String, Object> map) {
		List<String> productid = (List<String>) map.get("productid");
		List<String> qty = (List<String>) map.get("qty");
		String uid = (String)map.get("uid");
		for(int i=0; i<productid.size(); i++) {
			int productid1 = Integer.parseInt(productid.get(i));
			int qty1 = Integer.parseInt(qty.get(i));
			
			System.out.println(productid1);
			System.out.println(qty1);
			
			 Map<String,Object> cart = new HashMap<String,Object>();
			 cart.put("productid",productid1); 
			 cart.put("qty",qty1);
			 cart.put("uid",uid);
			 sqlSession.insert(INSERTCART,cart);
			  
			
			
		}
		
	}

	@Override
	public List<String> checkcompatibility(int [] proids){
		List<String> notchecknum =new ArrayList<String>();
			for(int i=proids.length-1; i>=0; i--) {
			for(int j=proids.length-1; j>=0; j--) {
				if(i==j) continue;
				else {
					Map<String,Integer> map = new HashMap<String,Integer>();
					map.put("mainnum",proids[i]);
					map.put("comparenum",proids[j]);
					
					Integer	result = sqlSession.selectOne(CHECKCOM, map);
					if(result ==null) {
						notchecknum.add(sqlSession.selectOne(NOTCHECKNAME,proids[j]));
					}
				}
			}
			if(notchecknum != null) {
				break;
			}
			
		}
			if(notchecknum.size()==0) {
				notchecknum =null;
		}
			return notchecknum;
	}

	@Override
	public int productcount(Map<String, Object> selectlist) {
		
		return sqlSession.selectOne(PRODUCTCOUNT, selectlist);
	}

	@Override
	public int product_search_count(String keyword) {
		
		return sqlSession.selectOne(PRDSELCONUNT,keyword);
	}

	@Override
	public List<Object> product_search(Map<String, Object> search) {
		System.out.println(search+">>>>>>>>>>>>>>>>>>>>>>>>");
		
		return sqlSession.selectList(PRODUCTSEARCH,search);
	}

	@Override
	public List<ProductDTO> lowsearchlist(String prdname) {
		
		return sqlSession.selectList(LOWSERACHLIST,prdname);
	}
	
	

}
