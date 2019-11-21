package com.example.Computer.model.usedboard.dto;

import java.util.Date;

public class UsedReplyDTO {
	
	
	private Integer urno; 
	private Integer ubno;
	private String replytext;
	private String replyer;
	private String uname;
	private Date regdate;
	private Date updatedate;
	private String secret_reply;
	private String writer; //작성자 
	private int ugroup; //어느 부모 그룹인지 
	private int ustep; //부모로 부터얼만큼 떨어져 있는지
	private int uindent; //들여쓰기
	private int udel; //댓글삭제여부
	
	
	
	
	public int getUdel() {
		return udel;
	}
	public void setUdel(int udel) {
		this.udel = udel;
	}
	public int getUgroup() {
		return ugroup;
	}
	public void setUgroup(int ugroup) {
		this.ugroup = ugroup;
	}
	public int getUstep() {
		return ustep;
	}
	public void setUstep(int ustep) {
		this.ustep = ustep;
	}
	public int getUindent() {
		return uindent;
	}
	public void setUindent(int uindent) {
		this.uindent = uindent;
	}
	public Integer getUrno() {
		return urno;
	}
	public void setUrno(Integer urno) {
		this.urno = urno;
	}
	public Integer getUbno() {
		return ubno;
	}
	public void setUbno(Integer ubno) {
		this.ubno = ubno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getSecret_reply() {
		return secret_reply;
	}
	public void setSecret_reply(String secret_reply) {
		this.secret_reply = secret_reply;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	

}
