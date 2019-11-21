package com.example.Computer.model.order.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.Computer.model.order.dto.BasketDTO;
import com.example.Computer.model.order.dto.OrderInfoDTO;

@Repository
public class OrderDaoImpl implements OrderDao {
	private static final String NAMESPACE = "order";
	private static final String INSERTCART = NAMESPACE + ".insertcart"; // 장바구니담기
	private static final String BASKETLIST = NAMESPACE + ".basketlist"; // 장바구니리스트 
	private static final String ORDERPRODUCTINFORMATION = NAMESPACE + ".orderproductinformation"; // 주문페이지에 총합계 보여주기 
	private static final String DELETEBASKET = NAMESPACE + ".deletebasket"; // 장바구니삭제
	private static final String SELECTORD = NAMESPACE + ".selectorderid"; // 주문번호 조회
	private static final String ORDERINFOLIST = NAMESPACE + ".orderinfolist"; // 주문내역정보들
	private static final String ORDERCOUNT = NAMESPACE + ".ordercount"; // 주문내역의 레코드 총갯수
	private static final String ORDERREAD = NAMESPACE + ".orderread"; // 상세주문내역 읽기
	private static final String ORDDEL = NAMESPACE + ".orderdelete"; // 주문취소 
	
	
	
	
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void insertbasket(Map<String, Object> map) {
		List<String> productid = (List<String>) map.get("productid");
		List<String> qty = (List<String>) map.get("qty");
		String uid = (String) map.get("uid");
		for (int i = 0; i < productid.size(); i++) {
			int productid1 = Integer.parseInt(productid.get(i));
			int qty1 = Integer.parseInt(qty.get(i));

			System.out.println(productid1);
			System.out.println(qty1);

			Map<String, Object> cart = new HashMap<String, Object>();
			cart.put("productid", productid1);
			cart.put("qty", qty1);
			cart.put("uid", uid);
			sqlSession.insert(INSERTCART, cart);

		}

	}

	@Override
	public List<BasketDTO> basketlsit(String uid) {
		List<BasketDTO> basketlist= sqlSession.selectList(BASKETLIST, uid);
		
		return basketlist;
	}

	@Override
	public List<BasketDTO> order_product_Information(List<Integer> productid, List<Integer> qty) {
		List<BasketDTO> ord_prd_info = new ArrayList<>();
		for(int i=0; i<productid.size(); i++) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("productid",productid.get(i));
			map.put("qty",qty.get(i));
			ord_prd_info.add(sqlSession.selectOne(ORDERPRODUCTINFORMATION,map));
		}
		
		return ord_prd_info;
	}

	@Override
	public void deletebasket(int productid, String uid) {
		System.out.println("aaaa>>>>>>>>>>>>");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("productid",productid);
		map.put("uid",uid);
		
		sqlSession.delete(DELETEBASKET,map);
		
	}

	
	//주문번호 조회
	public String orderid() {
	
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		Date time = new Date();
		String time1 = format1.format(time);
		int order = sqlSession.selectOne(SELECTORD);
		
		return time1 += order;
		
		
		
	}
	//주문넣기
	@Override
	public Map<String, Object> orderinsert(String uid, List<Integer> productid, List<Integer> qty, String reciever, String phonenumber,
			List<String> address, String cardnumber, String paymenttype, String cardtype, String depositdate,
			String depositbank, String message, String accountnumber, String depositor,String cardbuyer,int point,String imp_uid) {
		Map<String, Object> ordinfo = new HashMap<String,Object>();  //총카드결제금액, 포인트,주문번호를 주문완료페이지에 전송
		
		String orderid = orderid();
		int sumprice = sumprice(productid,qty);
		for(int i=0; i<productid.size(); i++) {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("productid",productid.get(i));  //상품번호
			map.put("qty",qty.get(i));  //수량
			map.put("reciever",reciever); //받는사람
			map.put("phonenumber",phonenumber);  //전홥너호
			map.put("uid",uid);  //사용자 아이디 
			map.put("cardnumber",cardnumber); // 결제한 카드번호
			map.put("paymenttype",paymenttype);  //결제방식(카드,무통장)
			map.put("orderid",orderid);  //주문번호
			map.put("zipcode",address.get(0)); //우편번호
			map.put("address1",address.get(1));//주소 
			map.put("address2",address.get(2));//상세주소 
			map.put("cardtype",cardtype);  // 카드종류 (국민, 하나)
			map.put("depositdate",depositdate);  //입금날짜 
			map.put("depositbank",depositbank);  //입금은행
			map.put("message",message);  //배송메시지 
			map.put("accountnumber",accountnumber); //계좌번호
			map.put("depositor",depositor);  //입금자 
			map.put("cardbuyer",cardbuyer);  //카드로 구매한  구매자명
			map.put("sumprice",sumprice-point+2500);  //결제금액 
			map.put("point",point);  //포인트
			map.put("impuid",imp_uid);  //아임포트 결제시스템의 식별 번호 imp_uid 
			map.put("price",productprice(productid.get(i)));  //각 상품가격 
			sqlSession.insert("orderinsert",map);  
			
			
		}
		ordinfo.put("orderid",orderid);
		ordinfo.put("sumprice",sumprice-point+2500);
		ordinfo.put("point",point);
		ordinfo.put("depositbank",depositbank);
		return ordinfo;
		
	}
	//총구매금액계산
	public int sumprice(List<Integer> productid, List<Integer> qty) {
		int sumprice = 0; //수량 * 가격 , 총금액계산 
		for(int i=0; i<productid.size(); i++) {
			int price = productprice(productid.get(i)); //상품가격
			sumprice += price * qty.get(i); 
			
		}
		return sumprice;
		
	}
	//상품별 가격 (파라미터변조 공격대비)
	public int productprice(int productid) {
		int price = sqlSession.selectOne("Product.productprice",productid); //상품가격
		return price;
		
	}
	
	
	//포인트 사용할경우 해당 포인트가 존재하는 체크
	@Override
	public String pointcheck(String uid, int point) {
		
		System.out.println("point :#################" +point);
		int pointcheck = sqlSession.selectOne("Member.pointcheck",uid);
		String check_result = pointcheck >= point ? "ok" : "no";
		
		System.out.println("point2 :#################" +point);
		System.out.println("pointcheck실행");
		return check_result;
		
	}
	// 지금까지 사용자가 주문한 정보 
	@Override
	public List<OrderInfoDTO> orderlist(String uid,int start,int end) {
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("uid",uid);
			map.put("start",start);
			map.put("end",end);
			List<OrderInfoDTO> orderinfo = sqlSession.selectList(ORDERINFOLIST,map);
			
		
		
		return orderinfo;
	}
	//레코드 총갯수
	@Override
	public int ordercount(String uid) {

		return sqlSession.selectOne(ORDERCOUNT, uid);
	}

	@Override
	public List<OrderInfoDTO> order_read(String uid, String orderid) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("uid",uid);
		map.put("orderid",orderid);
		List<OrderInfoDTO> orderread = sqlSession.selectList(ORDERREAD,map);
		return orderread;
	}

	@Override
	public void order_delete(String orderid) {
		 sqlSession.delete(ORDDEL,orderid);
		
	}
	
	
	
}
