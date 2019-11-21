package com.example.Computer.model.order.dao;

import java.util.List;
import java.util.Map;

import com.example.Computer.model.order.dto.BasketDTO;
import com.example.Computer.model.order.dto.OrderInfoDTO;
import com.example.Computer.model.product.dto.ProductDTO;

public interface OrderDao {
	void insertbasket(Map<String, Object> map);
	List<BasketDTO> basketlsit(String uid);
	//제품번호와 , 수량을 넘기면 주문페이지로 제품의 이름, 총합계 등을 돌려준다 
	List<BasketDTO> order_product_Information(List<Integer> productid, List<Integer> qty);
	//장바구니 상품 선택 삭제
	void deletebasket(int productid, String uid);
	//주문하기
	Map<String, Object> orderinsert(String uid,List<Integer> productid ,List<Integer> qty , String reciever, String phonenumber ,List<String> address, String cardnumber , String paymenttype,String cardtype,  String depositdate,  String depositbank,  String message,  String accountnumber,  String depositor,String cardbuyer,int point,String imp_uid);
	//구매자 포인트검사
	String pointcheck(String uid, int point);
	
	//사용자가 지금까지 주문한 주문정보들 
	List<OrderInfoDTO> orderlist(String uid,int start,int end);
	//레코드의 총갯수 
	int ordercount(String uid);
	//주문상세정보읽기 
	List<OrderInfoDTO> order_read(String uid, String orderid);
	
	//주문삭제
	void order_delete(String orderid);
	
}
