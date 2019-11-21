package com.example.Computer.controller.lowsearch;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Computer.Service.product.ProductService;
import com.example.Computer.model.product.dto.ProductDTO;
import com.example.Computer.shopapi.OpenApi11st;
import com.example.Computer.shopapi.OpenApiDTO;

@Controller
@RequestMapping("/lowsearch/*")
public class LowSearchController {
	
	
	
	
	@Inject 
	ProductService productservice;
	@Inject
	OpenApi11st shopopenapi; 
	
	@RequestMapping("lowsearchlist")
	public void lowsearchlist(@RequestParam(defaultValue = "%") String prdname , Model model) {
		List<ProductDTO> lowsearach = productservice.lowsearchlist(prdname);
		model.addAttribute("lowsearch", lowsearach);
		OpenApiDTO[] list = shopopenapi.getApi11stdtolist();
		System.out.println("20000000000000000000000000000000000000000000000000000000000000000");
		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i].getPrice());
		}
		
	}

}
