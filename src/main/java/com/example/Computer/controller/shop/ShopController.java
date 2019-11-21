package com.example.Computer.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//최저가 상품보여주기 
@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@RequestMapping("lowproduct")
	public String lowproduct() {
		System.out.println("aa");
		return "product/lowproduct_list";
	}

}
