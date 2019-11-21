package com.example.Computer.model.usedboard.dto;

import java.util.Arrays;
import java.util.Date;

public class UsedboardDTO {
	private int ubno;  //게시물번호
	private String content;  //제목
	private String title; //내용
	private String writer;  //작성자 아이디 
	private Date regdate; //날짜
	private int viewcnt; //조회수 
	private String uname;  //작성자이름 (member 테이블과 조인)
	private String kind;//하드웨어종류 
	private int price;// 상품가격
	private String trade;//거래방법 ex)직거래 , 택배거래
	private String productname; //상품명
	private int cnt; //댓굴갯수
	private String show; //화면 표시 여부
	private String img; //이미지
	private String leftposition; //왼쪽좌표
	private String rightposition; //오른쪽좌표
	private String[] file; //첨부파일
	private String phonenumber; //전화번호
	
	
	
	
	
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getLeftposition() {
		return leftposition;
	}
	public void setLeftposition(String leftposition) {
		this.leftposition = leftposition;
	}
	public String getRightposition() {
		return rightposition;
	}
	public void setRightposition(String rightposition) {
		this.rightposition = rightposition;
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
	public int getUbno() {
		return ubno;
	}
	public void setUbno(int ubno) {
		this.ubno = ubno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTrade() {
		return trade;
	}
	public void setTrade(String trade) {
		this.trade = trade;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	public String[] getFile() {
		return file;
	}
	public void setFile(String[] file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "UsedboardDTO [ubno=" + ubno + ", content=" + content + ", title=" + title + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", uname=" + uname + ", kind=" + kind + ", price="
				+ price + ", trade=" + trade + ", productname=" + productname + ", cnt=" + cnt + ", show=" + show
				+ ", img=" + img + ", leftposition=" + leftposition + ", rightposition=" + rightposition + ", file="
				+ Arrays.toString(file) + "]";
	}
	
	
	
	
}
