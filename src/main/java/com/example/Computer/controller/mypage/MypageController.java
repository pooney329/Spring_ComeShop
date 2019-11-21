package com.example.Computer.controller.mypage;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Computer.Interceptor.SessionAttr;
import com.example.Computer.Service.order.OrderService;
import com.example.Computer.model.member.dto.UserDTO;
import com.example.Computer.model.order.dto.OrderInfoDTO;
import com.example.Computer.model.order.dto.OrderListPage;

@Controller
@RequestMapping("/mypage/*")
public class MypageController implements SessionAttr{
	@Inject
	OrderService orderservice;
	
	@RequestMapping("mypage_main")
	public void mypage_main(HttpSession session, Model model,@RequestParam(defaultValue="1") int curPage) {
		UserDTO user = (UserDTO)session.getAttribute(LOGINUSER);
		String uid = user.getUid();
		System.out.println("uid: ->>>>>>>>>"+uid);
		System.out.println("curPage: ->>>>>>>>>"+curPage);
		
		int count=orderservice.ordercount(uid); //레코드 개수
		
		OrderListPage page =new OrderListPage(count,curPage);
		int start = page.getPageBegin();
		int end =page.getPageEnd();
		
		List<OrderInfoDTO> orderlist = orderservice.orderlist(uid,start,end);  //주문내역 뽑아오기
		
		model.addAttribute("orderlist",orderlist);
		model.addAttribute("page",page);
	}
	@RequestMapping("order_read")
	public void order_read(@RequestParam String orderid,Model model, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute(LOGINUSER);
		List<OrderInfoDTO> order_read = orderservice.order_read(user.getUid(), orderid);
		model.addAttribute("order_read",order_read);
	}
	

}
