package com.example.Computer.model.product.dto;

public class ProductDTO {
	private int productid;  //제품번호
	private String img; //이미지
	private String productname; //이름
	private int price; //가격 
	private String information; //정보
	private String kinds;//종류
	private int shippingfee; // 배송료 2500
	private int standard; // 25000이상
	private String shipping;  
	private int box;// 1박스당 
	
	
	
	public int getProductid() {
		return productid;
	}
	
	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	
	public int getShippingfee() {
		return shippingfee;
	}
	public void setShippingfee(int shippingfee) {
		this.shippingfee = shippingfee;
	}
	public int getStandard() {
		return standard;
	}
	public void setStandard(int standard) {
		this.standard = standard;
	}
	public String getShipping() {
		return shipping;
	}
	public void setShipping(String shipping) {
		this.shipping = shipping;
	}
	public int getBox() {
		return box;
	}
	public void setBox(int box) {
		this.box = box;
	}
	@Override
	public String toString() {
		return "ProductDTO [productid=" + productid + ", img=" + img + ", productname=" + productname + ", price="
				+ price + ", information=" + information + ", shippingfee=" + shippingfee + ", standard=" + standard
				+ ", shipping=" + shipping + ", box=" + box + "]";
	}
	
		
	
	
	
	
}
