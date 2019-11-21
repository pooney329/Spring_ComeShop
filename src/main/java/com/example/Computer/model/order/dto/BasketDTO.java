package com.example.Computer.model.order.dto;

public class BasketDTO {
	int productid;
	String productname;
	String img;
	int qty;
	int price;
	int sum;
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	@Override
	public String toString() {
		return "BasketDTO [productid=" + productid + ", productname=" + productname + ", img=" + img + ", qty=" + qty
				+ ", sum=" + sum + "]";
	}
	
}
