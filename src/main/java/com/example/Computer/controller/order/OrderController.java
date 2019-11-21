package com.example.Computer.controller.order;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.Computer.Interceptor.SessionAttr;
import com.example.Computer.Service.order.OrderService;
import com.example.Computer.Service.order.OrderServiceImpl;
import com.example.Computer.model.member.dto.UserDTO;
import com.example.Computer.model.order.dto.BasketDTO;
import com.example.Computer.util.ImportAcessToken;

@Controller
@RequestMapping("/order/*")
public class OrderController implements SessionAttr {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Inject
	OrderService orderService;

	// 장바구니담기
	@ResponseBody
	@RequestMapping("insertbasket")

	public ResponseEntity<String> insertbasket(HttpSession session, @RequestBody Map<String, Object> selectlist,
			Model model) {

		UserDTO user = (UserDTO) session.getAttribute(LOGINUSER);
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> productid;
		List<String> qty;
		if (selectlist.get("productid") instanceof String) {
			productid = new ArrayList<String>();
			qty = new ArrayList<String>();

			productid.add((String) selectlist.get("productid"));
			qty.add((String) selectlist.get("qty"));

		} else {
			productid = (List<String>) selectlist.get("productid");
			qty = (List<String>) selectlist.get("qty");
		}

		map.put("productid", productid);
		map.put("qty", qty);
		map.put("uid", user.getUid());

		orderService.insertbasket(map);// 장바구니담기

		return new ResponseEntity<String>("success", HttpStatus.OK);

	}

	// 주문페이지
	// @Nullable은 requestparam의 값이 널을 허용하는 어노테이션이다
	@RequestMapping("order_information")
	public void order_information(@RequestParam @Nullable List<Integer> productid,
			@Nullable @RequestParam List<Integer> qty, Model model, HttpSession session, RedirectAttributes redirect) {
		if (productid == null) { // 로그인이 안되어있는경우 auth()
			productid = (List<Integer>) session.getAttribute("productid"); // authinterceptor에서 생성
			qty = (List<Integer>) session.getAttribute("qty");
		}
		List<BasketDTO> ord_prd_info = orderService.order_product_Information(productid, qty);

		// redirect.addFlashAttribute("ord_prd_info", ord_prd_info);

		model.addAttribute("ord_prd_info", ord_prd_info);

	}

	// 장바구니 선택삭제
	@RequestMapping("deletebasket")
	public String deletebasket(int productid, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute(LOGINUSER);
		orderService.deletebasket(productid, user.getUid());
		return "redirect:basket";

	}

	// 장바구니 보여주기

	@RequestMapping("basket")
	public void basket(HttpSession session, Model model) {
		UserDTO user = (UserDTO) session.getAttribute(LOGINUSER);
		List<BasketDTO> basketlist = orderService.basketlsit(user.getUid());

		model.addAttribute("basketlist", basketlist);

	}

	/*
	 * @RequestMapping("basket")
	 * 
	 * public String basket(HttpSession session, @RequestParam List<Integer>
	 * productid,
	 * 
	 * @RequestParam List<String> productimg, @RequestParam List<String>
	 * productname,
	 * 
	 * @RequestParam List<Integer> qty, @RequestParam int sum, Model model) {
	 * 
	 * UserDTO user = (UserDTO) session.getAttribute(LOGINUSER); Map<String, Object>
	 * map = new HashMap<String, Object>(); String uid = user.getUid();
	 * map.put("qty", qty); map.put("productid", productid); map.put("uid", uid);
	 * productService.insertbasket(map);// 장바구니담기
	 * model.addAttribute("basket_insert_ok","true");
	 * 
	 * 
	 * 
	 * model.addAttribute("productid", productid);
	 * model.addAttribute("productimg",productimg); model.addAttribute("qty", qty);
	 * model.addAttribute("sum", sum); model.addAttribute("productname",
	 * productname);
	 * 
	 * return "product/product_list";
	 * 
	 * }
	 */
 
	// 주문결제하기
	@RequestMapping("order_payment")
	public String order_payment(@RequestParam List<Integer> productid, @RequestParam List<Integer> qty,
			@RequestParam List<String> phonenumber, String reciever, String zipcode, String address1, String address2,
			@Nullable String cardnumber, String paymenttype,String imp_uid , HttpSession session, @Nullable String cardtype, @Nullable String depositdate, @Nullable String depositbank, @Nullable String message, @Nullable String accountnumber, @Nullable String depositor, @Nullable String cardbuyer, @Nullable int point,Model model) throws Exception {
		
		
		
		UserDTO user = (UserDTO) session.getAttribute(LOGINUSER);
		
		List<String> address = new ArrayList<String>(); // 주소통합
		address.add(zipcode);
		address.add(address1);
		address.add(address2);
		String phone_number = phonenumber.get(0) + "-" + phonenumber.get(1) + "-" + phonenumber.get(2); // 연락처통합
		System.out.println("아이디: "+user.getUid());
		System.out.println("상품명 "+productid);
		System.out.println("수령 : "+qty);
		System.out.println("받는이 "+reciever);
		System.out.println("폰번호 "+phone_number);
		System.out.println("주소 : "+address);
		System.out.println("카드번호  "+cardnumber);
		System.out.println("결제방법 "+paymenttype);
		System.out.println("메시지"+message);
		System.out.println("포인트"+ point);
		
		String requestURL ="https://api.iamport.kr/users/getToken";
		String imp_key 	=URLEncoder.encode("3672306606404294", "UTF-8");

		String imp_secret	=	URLEncoder.encode("JSYBWcsiO9w9b7PhMijhviLE3jAG9QDTJBuGOXYD6uMiCCApUTGqbs4fLEVVvyOeajUZgTCnopG01gpW", "UTF-8");

		JSONObject json = new JSONObject();

		json.put("imp_key", imp_key);

		json.put("imp_secret", imp_secret);

		String import_token = ImportAcessToken.instance().getToken(json); 
		
		System.out.println("import 토큰 : " + import_token);
		
		
		String [] cardinfo = ImportAcessToken.instance().paymentsearch(import_token, imp_uid);
		
		System.out.println("결제카드 : " +cardinfo[0]);
		System.out.println("구매자 : " +cardinfo[1]);
		System.out.println("카드번호 : " + cardnumber);
		
		
		

		
		String check_result = orderService.pointcheck(user.getUid(),point); //포인트검사
		if(check_result=="ok") {
			Map<String, Object> ordinfo = orderService.orderinsert(user.getUid(), productid, qty, reciever, phone_number, address, cardnumber, paymenttype, cardinfo[0], depositdate, depositbank, message, accountnumber, depositor,cardinfo[1],point,imp_uid);
			model.addAttribute("ordinfo",ordinfo);
			model.addAttribute("paymenttype",paymenttype);
			
		}
		else {
			System.out.println("주문에러발생");
		}
		
		return "order/ord_result";

		

	}
	
	//주문사게
	@RequestMapping("orderremove")
	public String orderremove(String orderid, String impuid, Model model) throws Exception {
		
		System.out.println(orderid);
		System.out.println(impuid);
		if(impuid != null) {
			String requestURL ="https://api.iamport.kr/users/getToken";
			String imp_key 	=URLEncoder.encode("3672306606404294", "UTF-8");
	
			String imp_secret	=	URLEncoder.encode("JSYBWcsiO9w9b7PhMijhviLE3jAG9QDTJBuGOXYD6uMiCCApUTGqbs4fLEVVvyOeajUZgTCnopG01gpW", "UTF-8");
	
			JSONObject json = new JSONObject();
	
			json.put("imp_key", imp_key);
	
			json.put("imp_secret", imp_secret);
	
			String import_token = ImportAcessToken.instance().getToken(json); 
			
			System.out.println("import 토큰 : " + import_token);
			
			JSONObject json2 = new JSONObject();
			json2.put("imp_uid", impuid);
			ImportAcessToken.instance().paymentscancel(import_token, json2);
		
		}
		orderService.order_delete(orderid);
		
		return "redirect:/mypage/mypage_main";
	}
	
	

}
