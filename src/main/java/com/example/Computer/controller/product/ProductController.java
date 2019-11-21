package com.example.Computer.controller.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Computer.Service.product.ProductService;
import com.example.Computer.model.order.dto.OrderListPage;
import com.example.Computer.model.product.dto.ProductDTO;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@Inject
	ProductService productService;

	// 상품목록페이지
	@RequestMapping("product_list.do")
	public String productlist() {
		return "product/product_list";
	}

	@ResponseBody
	@RequestMapping("product_list_selset")

	public Map<String,Object> product_list_selset(@RequestBody Map<String, Object> selectlist) {

		for (String key : selectlist.keySet()) {
			System.out.println(selectlist.get(key));
			if (selectlist.get(key) == "") {
				selectlist.put(key, "%");
			}
		}

		int count = productService.productcount(selectlist); // 레코드 개수 OrderListPage
		int curpage = (int) selectlist.get("curPage");
		OrderListPage page = new OrderListPage(count, curpage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		
		selectlist.put("start",start);
		selectlist.put("end",end);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Object> selectdlist = productService.selectlist(selectlist);
		map.put("selectdlist",selectdlist);
		map.put("page",page);
		

		return map;
	}

	/*
	 * 1.무료 2.조건부 무료 ex)배송비 3000원 인데 200000만원 이상 구매시 무료 3.1개당 배송비 3000원
	 */

	@RequestMapping("product_detail")
	public String product_detail(@RequestParam int productid, Model model) {

		ProductDTO productdetail = productService.product_detail(productid);

		/*
		 * if(productdetail.getShippingfee()==0) { productdetail.setShipping("무료배송");
		 * 
		 * } else if(productdetail.getBox()==0) {
		 * 
		 * if(productdetail.getShippingfee()>0 && productdetail.getStandard()==0 ) {
		 * productdetail.setShipping(productdetail.getShippingfee()+"원"); } else {
		 * productdetail.setShipping(productdetail.getShippingfee()+"원  "+productdetail.
		 * getStandard()+"원 이상 구매시 무료"); }
		 * 
		 * 
		 * 
		 * }
		 */

		/*
		 * if (productdetail.getShippingfee() == 0) { productdetail.setShipping("무료배송");
		 * 
		 * } else { if (productdetail.getBox() == 0) {
		 * 
		 * if (productdetail.getShippingfee() > 0 && productdetail.getStandard() == 0) {
		 * productdetail.setShipping(productdetail.getShippingfee() + "원"); } else {
		 * productdetail.setShipping( productdetail.getShippingfee() + "원  " +
		 * productdetail.getStandard() + "원 이상 구매시 무료"); }
		 * 
		 * } else { productdetail.setShipping(productdetail.getBox() + "박스당" +
		 * productdetail.getShippingfee()); }
		 * 
		 * }
		 */

		model.addAttribute("productdetail", productdetail);

		return "order/product_detail";
	}

	@ResponseBody
	@RequestMapping("checkcompatibility")
	public Map<String, Object> checkcompatibility(@RequestBody Map<String, Object> check) {
		int temp = 0;
		int temp2 = 0;
		List<String> checkresult = null;
		List<String> productid;
		List<String> ordernum = null;
		List<Integer> pro = new ArrayList<Integer>();
		List<Integer> ordn = new ArrayList<Integer>();
		int proids[];
		int num[];
		if (check.get("productid") instanceof String) {
			proids = new int[1];
			proids[0] = Integer.parseInt((String) check.get("productid"));
		} else {
			productid = (List<String>) check.get("productid");
			ordernum = (List<String>) check.get("ordernum");
			proids = new int[productid.size()];
			num = new int[productid.size()];
			for (int i = 0; i < productid.size(); i++) {
				num[i] = Integer.parseInt(ordernum.get(i));
				proids[i] = Integer.parseInt(productid.get(i));
			}
			for (int i = 0; i <= num.length - 1; i++) { // 선택 순서정렬
				for (int j = 0; j <= num.length - 2; j++) {
					if (num[j] > num[j + 1]) {
						temp = num[j]; // ordnum 순서 정렬
						num[j] = num[j + 1];
						num[j + 1] = temp;
						temp2 = proids[j]; // ordnum을 기준으로 선택한 순서별로 productid 순서정렬
						proids[j] = proids[j + 1];
						proids[j + 1] = temp2;
					}
				}
			}

			for (int a : num) {
				System.out.println(a + ">>>");
			}

			for (int a : proids) {
				System.out.println(a + ">>>");
			}
			checkresult = productService.checkcompatibility(proids);
			System.out.println(checkresult);

		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("check", checkresult);

		return map;

	}
	//상품검색
	@RequestMapping("product_search")
	@ResponseBody
	public Map<String,Object> product_search(@RequestBody Map<String, Object> search) {
		String keyword = (String) search.get("keyword"); 
		int count = productService.product_search_count(keyword); 
		int curpage = (int) search.get("curPage");
		OrderListPage page = new OrderListPage(count, curpage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		
		search.put("start",start);
		search.put("end",end);
		List<Object> searchlist = productService.product_search(search);
		
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		map.put("selectdlist",searchlist);
		map.put("page",page);
		
		return map;
		
		
	}

}
