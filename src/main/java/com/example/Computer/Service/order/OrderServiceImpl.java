package com.example.Computer.Service.order;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.example.Computer.model.order.dao.OrderDao;
import com.example.Computer.model.order.dto.BasketDTO;
import com.example.Computer.model.order.dto.OrderInfoDTO;
import com.example.Computer.model.product.dto.ProductDTO;
import com.example.Computer.util.ImportAcessToken;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	OrderDao orderDao;
	@Override
	public void insertbasket(Map<String, Object> map) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>map");
		orderDao.insertbasket(map);

	}
	@Override
	public List<BasketDTO> basketlsit(String uid) {
		
		return orderDao.basketlsit(uid);
	}
	@Override
	public List<BasketDTO> order_product_Information(List<Integer> productid, List<Integer> qty) {
		// TODO Auto-generated method stub
		return orderDao.order_product_Information(productid, qty);
	}
	@Override
	public void deletebasket(int productid, String uid) {
		orderDao.deletebasket(productid, uid);
		
	}
	@Override
	public Map<String, Object> orderinsert(String uid, List<Integer> productid, List<Integer> qty, String reciever, String phonenumber,
			List<String> address, String cardnumber, String paymenttype, String cardtype, String depositdate,
			String depositbank, String message, String accountnumber, String depositor,String cardbuyer,int point,String imp_uid) {
			return orderDao.orderinsert(uid, productid, qty, reciever, phonenumber, address, cardnumber, paymenttype, cardtype, depositdate, depositbank, message, accountnumber, depositor,cardbuyer,point,imp_uid);
		
	}
	@Override
	public String pointcheck(String uid, int point) {
			
		return orderDao.pointcheck(uid, point);
	}
	@Override
	public List<OrderInfoDTO> orderlist(String uid,int start,int end) {
		
		return orderDao.orderlist(uid,start,end);
	}
	@Override
	public int ordercount(String uid) {
		
		return orderDao.ordercount(uid);
	}
	@Override
	public List<OrderInfoDTO> order_read(String uid, String orderid) {
		
		return orderDao.order_read(uid, orderid);
	}
	
	
	
	public String searhpayment(String imp_uid) throws Exception {
		
		
		
		return "aa";
		
		
		
	}
	@Override
	public void order_delete(String orderid) {
		orderDao.order_delete(orderid);
		
	}
	
	

}
